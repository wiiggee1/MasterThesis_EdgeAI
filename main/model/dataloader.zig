//! Here contain code and functionality for loading a dataset to be used in your model. 
//! The `Dataset` can read batch of data, and map array data to `Matrix` type data. 
//! ------------------------------------

const std = @import("std");
const layers = @import("layers.zig"); 
const model = @import("model_builder.zig");
const optimizer = @import("optimizer.zig");
const Matrix = layers.Matrix; 
const InputShapeConvention = layers.InputShapeConvention; 

pub const AnomalyType = enum(u8) {
    err = 0b0000,
    traffic = 0b0001,
    exception = 0b0010,
    latency = 0b0011,
    information = 0b0100,
    resource = 0b0101,
};

pub const ParsingStatusCode = enum{
    Successful, 
    Failed, 
    Skipping, 
};

/// Log severity level, where a lower valued level is more severe, 
pub const PriorityLevel = enum(u8) {
    emergency = 0b0000, 
    alert = 0b0001,
    critical = 0b0010,
    err = 0b0011,
    warning = 0b0100,
    notice = 0b0101,
    information = 0b0110,
    debug = 0b0111,

    pub fn from(any: anytype) !PriorityLevel {
        if (@TypeOf(any) == u8) {
            const any_u8 = @as(u8, any);
            switch (any_u8) {
                0b0000...0b0111 => return @enumFromInt(any_u8),
                else => return error.PriorityLevelNotValidForU8,  
            }
        }
        if (@TypeOf(any) == []const u8 or @TypeOf(any) == []u8) {
            const any_buf = @as([]const u8, any);
            const enum_val = try std.fmt.parseInt(u8, any_buf, 0b0); 
            if (enum_val <= 0b0111) {
                return @enumFromInt(enum_val);
            }else {
                return error.StringIsNotValidPriorityLevel; 
            }
        }
        return error.TypePassedNotSupported; 
    }
};

/// A 'ParseType' is more of a helper, that dictates what type of parsing proceedure,
/// that should be executed during runtime. It is mainly used when we need to parse 
/// based on various punctuations variants. 
pub const ParseType = enum {
    /// 'Default' parse type, is tokens that have punctuations
    /// wrapped on both the left-hand-side (LHS) and right-hand-side (RHS).
    /// Tags (<>) or AngledBracket punctuations, are also of a wrapped kind. 
    /// It also handles cases when only a single punctuation is found. 
    Default, 

    /// In special occurences, the parsing logic need to 
    /// emphazise domain specific log data. 
    DomainSpecific, 

    /// When the parse type is 'Missing', its missing an opening-
    /// punctuation or a closing-punctuation. Often this is the case when two tokens, 
    /// are separated with a whitespace. Which the tokenizer, would treat as two distinct 
    /// parts. 
    Missing, 
    
};

/// 
pub const PunctuationToken = struct {
    kind: PunctuationKind, 
    // inner: ?TokenTags = null,
    /// Represent the raw token value.
    value: []const u8,
    iteration_started: bool = false,  
    // parsing_type: ParseType = .Default,  
    metadata: ?Metadata = null, 

    ///Separators = help break the input apart (parsing "glue").
    ///Punctuation tokens = have semantic meaning inside the fields (parsing "grammar")
    pub const PunctuationKind = enum {
        Period, 
        Comma, 
        Colon, 
        Semicolon, 
        Apostrophe,
        Quotation,
        SingleQuote,
        Parenthesis,
        ParenthesisOpen,
        ParenthesisClose,
        Dash, 
        Ellipsis,
        SquareBracket,
        SquareBracketOpen,
        SquareBracketClose,
        BackSlash,
        AngledBracket,
        /// ASCII → bin: 0b0011_1110, dec: 62, symbol = ">"
        AngledBracketClosed,
        /// ASCII → bin: 0b0011_1100, dec: 60, symbol = "<"
        AngledBracketOpened,
        /// The tokens that can either be: "->", "→" or "=>". 
        ArrowIndicator, 
        // Grouped,
        Unknown,
        // None,

        /// Same as returning a str, or array of const bytes(u8). 
        /// This is mostly used, for getting the separator, 
        /// when using std.mem.* functionality when parsing strings. 
        pub fn as_bytes(self: PunctuationKind) []const u8 {
            const kind_str: []const u8 = switch (self) {
                PunctuationKind.Period => return ".", 
                PunctuationKind.Comma => return ",", 
                PunctuationKind.Colon => return ":", 
                PunctuationKind.Semicolon => return ";", 
                PunctuationKind.Apostrophe => return "’",
                PunctuationKind.Quotation => return &.{0b00100010}, 
                PunctuationKind.SingleQuote => return "'", 
                PunctuationKind.Parenthesis => return "()", 
                PunctuationKind.ParenthesisOpen => return "(", 
                PunctuationKind.ParenthesisClose => return ")", 
                PunctuationKind.Dash => return "-", 
                PunctuationKind.Ellipsis => return "...", 
                PunctuationKind.SquareBracket => return "[]", 
                PunctuationKind.SquareBracketOpen => return "[", 
                PunctuationKind.SquareBracketClose => return "]", 
                PunctuationKind.BackSlash => return "/", 
                PunctuationKind.AngledBracket => return "<>", 
                PunctuationKind.AngledBracketClosed => return "<", 
                PunctuationKind.AngledBracketOpened => return ">", 
                PunctuationKind.ArrowIndicator => return "->", 
                PunctuationKind.Unknown => return "<Unknown>",
            };
            return kind_str; 
        }
    };


    pub const Metadata = struct {
        freq_count: usize,
        endsWith: bool, 
    }; 
   
    /// This is a condition for continuing parsing inner token strings within a punctuation. 
    fn is_wrapped(inner_str: []const u8) bool {
    return (inner_str[0] == '[' and inner_str[inner_str.len - 1] == ']') or
           (inner_str[0] == '(' and inner_str[inner_str.len - 1] == ')') or
           (inner_str[0] == 0x27 and inner_str[inner_str.len - 1] == 0x27) or

           // (inner_str[inner_str.len - 1] == ':') or
           (inner_str[0] == '(' and inner_str[inner_str.len - 1] == ':') or
           (inner_str[inner_str.len - 1] == ')') or
           (inner_str[0] == '<' and inner_str[inner_str.len - 1] == '>');
    }

    fn still_contain(inner_str: []const u8) bool {
        const contains = (std.mem.count(u8, inner_str, "[") > 0) or 
            (std.mem.count(u8, inner_str, "]") > 0) or 
            (std.mem.count(u8, inner_str, "(") > 0) or 
            (std.mem.count(u8, inner_str, ")") > 0) or 
            (std.mem.count(u8, inner_str, "'") > 0) or 
            (std.mem.count(u8, inner_str, ":") > 0); 
        return contains; 
    }

    pub fn try_into(self: PunctuationToken, comptime T: type) ?T{
        // std.debug.assert();
        if (std.meta.eql(AssociationToken, T)){
            switch (self.kind) {
                PunctuationKind.Colon => {},
                PunctuationKind.ArrowIndicator => {},
                else => return null,
            }
        }
        return null;
    }

    fn contains_punctuation(token: []const u8, kind: PunctuationKind) bool {
        if(std.mem.count(u8, token, kind.as_bytes()) > 0){
            return true;
        }else {
            return false; 
        }
    }

    pub fn tryFrom(token: []const u8) ?PunctuationToken {
        // if (@TypeOf(any) == []const u8 or @TypeOf(any) == []u8) {
        const parsable: bool = parse_flag: {
            const fields = @typeInfo(PunctuationKind).@"enum".fields; 
            inline for (fields) |kind| {
                const punct_kind = std.meta.stringToEnum(PunctuationKind, kind.name);
                if (punct_kind) |pkind| {
                    if(contains_punctuation(token, pkind)){
                        break :parse_flag true; 
                    }
                }
            }
            break :parse_flag false; 
        }; 

        if (parsable){
            std.debug.print("   Trying to Parse Punctuations...\n", .{});
            if (PunctuationToken.tryParseWrappedCases(token)) |wrapped| {
                return wrapped; 
            }
            else if (PunctuationToken.tryParseAngledVariants(token)) |angled| {
                return angled; 
            }
            else if (PunctuationToken.tryParseSinglePunctuation(token)) |single_punct| {
                return single_punct; 
            }
        } 
        return null; 
    }

    fn tryParseWrappedCases(token: []const u8) ?PunctuationToken{
        if (token.len >= 2 and token[0] == '"' and token[token.len - 1] == '"'){
            std.debug.print("       → Found Quotation, From: {s}\n", .{token});
            // return PunctuationToken{.kind = .Quotation, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .Quotation, .value = token}; 
        }
        else if (std.mem.startsWith(u8, token, "'") and std.mem.endsWith(u8, token, "'")){
            std.debug.print("       → Found Single-Quotations, From: {s}\n", .{token});
            // return PunctuationToken{.kind = .SingleQuote, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .SingleQuote, .value = token}; 
        }
        else if (token.len >= 2 and token[0] == '[' and token[token.len - 1] == ']'){
            std.debug.print("       → Found SquareBrackets, From: {s}\n", .{token});
            // return PunctuationToken{.kind = .SquareBracket, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .SquareBracket, .value = token}; 
        }
        else if (token.len >= 2 and token[0] == '(' and token[token.len - 1] == ')'){
            std.debug.print("       → Found Parenthesis, From: {s}\n", .{token});
            // return PunctuationToken{.kind = .Parenthesis, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .Parenthesis, .value = token}; 
        } 
        else if(std.mem.startsWith(u8, token, "(") and std.mem.endsWith(u8, token, ":")){
            std.debug.print("       → Found ParenthesisOpen + Colon, From: {s}\n", .{token});
            return PunctuationToken{.kind = .Unknown, .value = token};
        }

        return null; 
    }

    fn tryParseAngledVariants(token: []const u8) ?PunctuationToken {
        if (token.len >= 2 and token[0] == '<' and token[token.len - 1] == '>'){
            // return PunctuationToken{.kind = .AngledBracket, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .AngledBracket, .value = token}; 
        }
        else if (token.len >= 2 and token[0] == '<'){
            // return PunctuationToken{.kind = .AngledBracketOpened, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .AngledBracketOpened, .value = token}; 
        }
        else if (token.len >= 2 and token[0] == '>'){
            // return PunctuationToken{.kind = .AngledBracketClosed, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .AngledBracketClosed, .value = token}; 
        }
        else if (token.len == 2 and (token[0] == '-' or token[0] == '=') and token[1] == '>'){
            // return PunctuationToken{.kind = .ArrowIndicator, .inner = null, .value = token}; 
            return PunctuationToken{.kind = .ArrowIndicator, .value = token}; 
        }
        return null;
    }

    fn tryParseSinglePunctuation(token: []const u8) ?PunctuationToken{
        // if (std.mem.endsWith(u8, token, ":") and std.mem.count(u8, token, ":") == 1){
        if(std.mem.endsWith(u8, token, ":") or std.mem.count(u8, token, ":") == 1 and token[0] != '('){
            const punct_count = std.mem.count(u8, token, ":");
            const info = PunctuationToken.Metadata{.endsWith = std.mem.endsWith(u8, token, ":"), .freq_count = punct_count};
            std.debug.print("       → Found: Colon, From: {s}\n", .{token});
            return PunctuationToken{.kind = .Colon, .value = token, .metadata = info}; 
        }
        else if (token.len >= 3 and std.mem.endsWith(u8, token, ".")){
            if (token.len >= 3 and token[token.len - 1] == '.' and token[token.len - 2] == '.'){
                std.debug.print("       → Found: Ellipsis, From: {s}\n", .{token});
                // return PunctuationToken{.kind = .Ellipsis, .inner = null, .value = token}; 
                return PunctuationToken{.kind = .Ellipsis, .value = token}; 
            }
        }
        else if(token.len >= 2 and std.mem.startsWith(u8, token, "-")){
            if(std.mem.indexOfScalar(u8, token, '-')) |dash_idx|{
                if (std.ascii.isAlphabetic(token[dash_idx + 1])){
                    std.debug.print("       → Found: Dash From: {s}\n", .{token});
                    // return PunctuationToken{.kind = .Dash, .inner = .ALPHABETIC, .value = token};
                    return PunctuationToken{.kind = .Dash, .value = token};
                }
                if (std.ascii.isDigit(token[dash_idx + 1])){
                    std.debug.print("       → Found: Dash From: {s}\n", .{token});
                    // return PunctuationToken{.kind = .Dash, .inner = .NUMERIC, .value = token};
                    return PunctuationToken{.kind = .Dash, .value = token};
                } 
            }
            // return PunctuationToken{.kind = .Dash, .inner = null, .value = token};
            return PunctuationToken{.kind = .Dash, .value = token};
        }

        if (std.mem.startsWith(u8, token, "(") and !std.mem.endsWith(u8, token, ")")){
            std.debug.print("       → Found: ParenthesisOpen, From: {s}\n", .{token});
            // return PunctuationToken{.kind = .ParenthesisOpen, .inner = null, .value = token};
            return PunctuationToken{.kind = .ParenthesisOpen, .value = token};
        }
        else if (!std.mem.startsWith(u8, token, "(") and std.mem.endsWith(u8, token, ")")){
            std.debug.print("       → Found: ParenthesisClose, From: {s}\n", .{token});
            // return PunctuationToken{.kind = .ParenthesisClose, .inner = null, .value = token};
            return PunctuationToken{.kind = .ParenthesisClose, .value = token};
        }
        return null; 
    }

    pub fn getMissingPunctuation(self: PunctuationToken) !PunctuationKind {
        switch(self.kind){
            .ParenthesisOpen => blk_p: {
                if (!std.mem.endsWith(u8, self.value, ")")){
                    break :blk_p PunctuationKind.ParenthesisClose;  
                }else{
                    const punct_str: []const u8 = self.value[self.value[self.value.len - 1]]; 
                    break :blk_p std.meta.stringToEnum(PunctuationKind, punct_str);
                }
            },
            .SquareBracketOpen => {},
            .AngledBracketOpened => {},

            .ParenthesisClose => {},
            .SquareBracketClose => {},
            .AngledBracketClosed => {},

            else => return error.NoMissingPunctuationFound,  
        }
    }
   
    /// This essentially fetch or gets the inner slice value and its token type. 
    /// By splitting or trimming away the punctuations. 
    fn getParseSlice(self: PunctuationToken) []const u8{
        const slice = self.value; 
        switch(self.parsing_type){
            .Wrapped => return slice[1..slice.len - 1],
            .Single => {
                const token_slice: []const u8 = strip_blk: {
                    if (self.kind == .Ellipsis) {
                        break :strip_blk slice[0..slice.len - 3]; 
                    }
                    else if(self.kind == .Colon and std.mem.count(u8, slice, ":") == 1 and std.mem.endsWith(u8, slice, ":")){
                        if(std.mem.startsWith(u8, slice, "(")){
                            break :strip_blk slice[1..slice.len - 1]; 
                        }else{
                            break :strip_blk slice[0..slice.len - 1]; 
                        }
                    }
                    else if(slice[slice.len - 1] == ')' and slice[0] != '('){
                        break :strip_blk slice[0..slice.len - 1]; 
                    }
                    else if(slice[0] == '(' and slice[slice.len - 1] != ')'){
                        break :strip_blk slice[1..]; 
                    }
                    break :strip_blk slice; 
                }; 
                return token_slice; 
            }
        }
    }

    fn getInnerSlice(self: PunctuationToken) []const u8{
        const token_part: []const u8 = slice_blk: { 
            const token = self.value; 
            const scalar_idx = if(std.mem.indexOfScalar(u8, token, '(')) |index| index else 0;
            if(self.kind == .Colon and std.mem.count(u8, token, ":") == 1 and std.mem.endsWith(u8, token, ":")){
                if(std.mem.startsWith(u8, token, "(")){
                    break :slice_blk token[1..token.len - 1]; 
                }else{
                    break :slice_blk token[0..token.len - 1]; 
                }
            }
            switch (self.kind) {
                .ParenthesisOpen => break :slice_blk token[scalar_idx + 1..token.len],
                .ParenthesisClose => break :slice_blk token[scalar_idx..token.len - 1],
                // Case when a token is wrapped between an opening- and closing parenthesis. 
                .Parenthesis => break :slice_blk token[1..token.len - 1],
                .SquareBracketOpen => break :slice_blk token[1..token.len],
                .SquareBracketClose => break :slice_blk token[0..token.len - 1],
                .SquareBracket => break :slice_blk token[1..token.len - 1],
                .SingleQuote => break :slice_blk token[1..token.len - 1],
                .Quotation => break :slice_blk token[1..token.len - 1],
                .Ellipsis => {
                    if(std.mem.indexOfScalar(u8, token, '.')) |idx| {
                        // break :slice_blk token[0..token.len - 3]; 
                        break :slice_blk token[0..idx];
                    }
                },
                else => break :slice_blk token,
            }
            break :slice_blk token; 
        };
        return token_part; 
    }

    /// Check if last char is either ':' or ')' and first char is not '('
    /// Parsing inner can be done either by moving from outer indices to inner.
    /// By continously check if the smaller slice contains a punctuation. Or
    /// the parsing could be one directional, if it is not wrapped. Meaning it
    /// will check indices from left-to-right for opening punctuations. And
    /// right-to-left for closing punctuations. 
    pub fn parse_inner(self: *PunctuationToken) ?TokenTags {
        self.iteration_started = true; 
        var slice = self.value; 

        while (slice.len >= 2 and is_wrapped(slice)) {
            const inner_value: []const u8 = self.getParseSlice(); 
                
            const inner_tokentype = TokenType.from(inner_value);
            if (inner_tokentype) |inner|{
                if (@as(TokenTags, inner) != TokenTags.PUNCTUATION){
                    if (AssociationToken.try_from(inner_value)) |assoc| {
                        const pair_val = assoc.get_values(); 
                        std.debug.print("   → Found Inner ASSOCIATION Token: {s} with Values({s}, {s})\n", .{@tagName(assoc), pair_val.lhs, pair_val.rhs});
                    }
                    switch (inner) {
                        .ASSOCIATION => |val| {
                            const final_str = val.into_str();
                            std.debug.print("       The Inner Token Tag Is <{s}>, Value: {s}\n", .{@tagName(@as(TokenTags, inner)), final_str});
                        },
                        else => std.debug.print("       The Inner Token Tag Is: <{s}>\n", .{@tagName(@as(TokenTags, inner))}),
                    }
                    return @as(TokenTags, inner); 
                }else if(@as(TokenTags, inner) == TokenTags.PUNCTUATION and (inner.PUNCTUATION.kind == .Colon)){
                    slice = slice[0..slice.len - 1]; 
                }
                slice = inner_value; 
            }else {
                return null;
            }
            
        }
        // return std.meta.stringToEnum(TokenTags, @tagName(self.*)); 
        // return self.*.inner; 
        return null; 
    }
   
    /// Should obtain the inner token type of  a punctuation token. 
    pub fn into_inner_token(self: PunctuationToken) ?TokenTags {
        // const inner_tokentype = TokenType.from(inner_value);
        // self.iteration_started = true; 
        var new_self = self;         
        if (new_self.parse_inner()) |inner| {
            return inner; 
            // return inner; 
        } 
        //NOTE: - Both methods seems to work, below also: 

        // const inner_tokentype = TokenType.from(self.value[1..self.value.len - 1]);
        // if (inner_tokentype) |inner| {
        //     std.debug.print("inner_token(), found inner token type: {s}\n", .{@tagName(inner)}); 
        //     const inner_tag = @as(TokenTags, inner);
        //     return inner_tag; 
        // }
        return null;              
    }

   
    //FIX: - Fix the 'to_str', and if it  should belong to the PunctuationToken type or not...

    // fn to_str(self: PunctuationToken) []const u8{
    fn to_str(self: PunctuationToken, token_type: TokenType) []const u8{
        // if (self.inner) |inner_type|{
            const inner_tag: []const u8 = switch (token_type.into_tag()) {
                TokenTags.PATH => "<PATH>",
                TokenTags.NETWORKINTERFACE => "<INET>",
                TokenTags.ADDRESS => addr_blk: {
                    if (TokenType.is_ip_addr(self.value[1..self.value.len - 1])) break :addr_blk "<IP>";
                    if (TokenType.is_mac_addr(self.value[1..self.value.len - 1])) break :addr_blk "<MAC>";
                    if (true) @panic("to_str, attempting to get ADDRESS TAG!");
                }, 
            
                TokenTags.DYNAMIC => "<DYN>", 
                TokenTags.DEVICE => "<DEVICE_PATH>", 
                TokenTags.FILE => file_blk: {
                    if (TokenType.is_filetype(self.value[1..self.value.len - 1])) |filetype| {
                       const file_tag = switch (filetype) {
                            .Config => "<CONFIG>",
                            .Service => "<SERVICE>",
                            .Default => "<FILE>",
                       }; 
                       break :file_blk file_tag; 
                    }else break :file_blk "<FILE>";
                }, 
                TokenTags.NUMERIC => outer: {
                    const num_str: []const u8 = blk: {
                        const numeric_type = TokenType.into_numeric(self.value[1..self.value.len - 1]);
                        if (numeric_type) |num_type| {
                            const num_val = switch (num_type) {
                                .RawDigit => "<NUM>",
                                .VersionNumber => "<VERSION>",
                                .Time => "<TIME>",
                                .DeviceID => "<DEVICEID>"
                            };
                            break :blk num_val; 
                        }
                        break :blk self.value; 
                    }; 
                    break :outer num_str; 
                },
                else => return self.value,
            };

            const replace_str: []const u8 = switch (self.kind) {
                .SquareBracket => {
                    if(std.mem.eql(u8, inner_tag, "<PATH>") == true){return "[<PATH>]";}
                    else if(std.mem.eql(u8, inner_tag, "<INET>") == true){return "[<INET>]";}
                    else if(std.mem.eql(u8, inner_tag, "<IP>") == true){return "[<IP>]";}
                    else if(std.mem.eql(u8, inner_tag, "<MAC>") == true){return "[<MAC>]";}
                    else if(std.mem.eql(u8, inner_tag, "<DYN>") == true){return "[<DYN>]";}
                    else if(std.mem.eql(u8, inner_tag, "<DEVICE_PATH>") == true){return "[<DEVICE_PATH>]";}
                    else {
                        if(std.mem.eql(u8, inner_tag, "<CONFIG>") == true){return "[<CONFIG>]";}
                        if(std.mem.eql(u8, inner_tag, "<SERVICE>") == true){return "[<SERVICE>]";}
                        if(std.mem.eql(u8, inner_tag, "<FILE>") == true){return "[<FILE>]";}

                        if(std.mem.eql(u8, inner_tag, "<NUM>") == true){return "[<NUM>]";}
                        if(std.mem.eql(u8, inner_tag, "<VERSION>") == true){return "[<VERSION>]";}
                        if(std.mem.eql(u8, inner_tag, "<TIME>") == true){return "[<TIME>]";}
                        if(std.mem.eql(u8, inner_tag, "<DEVICEID>") == true){return "[<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>]";}
                    }
                    return self.value;
                },
                .Parenthesis => {
                    if(std.mem.eql(u8, inner_tag, "<PATH>") == true){return "(<PATH>)";}
                    else if(std.mem.eql(u8, inner_tag, "<INET>") == true){return "(<INET>)";}
                    else if(std.mem.eql(u8, inner_tag, "<IP>") == true){return "(<IP>)";}
                    else if(std.mem.eql(u8, inner_tag, "<MAC>") == true){return "(<MAC>)";}
                    else if(std.mem.eql(u8, inner_tag, "<DYN>") == true){return "(<DYN>)";}
                    else if(std.mem.eql(u8, inner_tag, "<DEVICE_PATH>") == true){return "(<DEVICE_PATH>)";}
                    else {
                        if(std.mem.eql(u8, inner_tag, "<CONFIG>") == true){return "(<CONFIG>)";}
                        if(std.mem.eql(u8, inner_tag, "<SERVICE>") == true){return "(<SERVICE>)";}
                        if(std.mem.eql(u8, inner_tag, "<FILE>") == true){return "(<FILE>)";}

                        if(std.mem.eql(u8, inner_tag, "<NUM>") == true){return "(<NUM>)";}
                        if(std.mem.eql(u8, inner_tag, "<VERSION>") == true){return "(<VERSION>)";}
                        if(std.mem.eql(u8, inner_tag, "<TIME>") == true){return "(<TIME>)";}
                        if(std.mem.eql(u8, inner_tag, "<DEVICEID") == true){return "(<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>)";}
                    }
                    return self.value; 
                },
                .ParenthesisOpen => {
                    if(std.mem.eql(u8, inner_tag, "<PATH>") == true){return "(<PATH>";}
                    else if(std.mem.eql(u8, inner_tag, "<INET>") == true){return "(<INET>";}
                    else if(std.mem.eql(u8, inner_tag, "<IP>") == true){return "(<IP>";}
                    else if(std.mem.eql(u8, inner_tag, "<MAC>") == true){return "(<MAC>";}
                    else if(std.mem.eql(u8, inner_tag, "<DYN>") == true){return "(<DYN>";}
                    else if(std.mem.eql(u8, inner_tag, "<DEVICE_PATH>") == true){return "(<DEVICE_PATH>";}
                    else {
                        if(std.mem.eql(u8, inner_tag, "<CONFIG>") == true){return "(<CONFIG>";}
                        if(std.mem.eql(u8, inner_tag, "<SERVICE>") == true){return "(<SERVICE>";}
                        if(std.mem.eql(u8, inner_tag, "<FILE>") == true){return "(<FILE>";}

                        if(std.mem.eql(u8, inner_tag, "<NUM>") == true){return "(<NUM>";}
                        if(std.mem.eql(u8, inner_tag, "<VERSION>") == true){return "(<VERSION>";}
                        if(std.mem.eql(u8, inner_tag, "<TIME>") == true){return "(<TIME>";}
                        if(std.mem.eql(u8, inner_tag, "<DEVICEID") == true){return "(<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>";}
                    }
                    return self.value; 
                },
                .ParenthesisClose => {
                    if(std.mem.eql(u8, inner_tag, "<PATH>") == true){return "<PATH>)";}
                    else if(std.mem.eql(u8, inner_tag, "<INET>") == true){return "<INET>)";}
                    else if(std.mem.eql(u8, inner_tag, "<IP>") == true){return "<IP>)";}
                    else if(std.mem.eql(u8, inner_tag, "<MAC>") == true){return "<MAC>)";}
                    else if(std.mem.eql(u8, inner_tag, "<DYN>") == true){return "<DYN>)";}
                    else if(std.mem.eql(u8, inner_tag, "<DEVICE_PATH>") == true){return "<DEVICE_PATH>)";}
                    else {
                        if(std.mem.eql(u8, inner_tag, "<CONFIG>") == true){return "<CONFIG>)";}
                        if(std.mem.eql(u8, inner_tag, "<SERVICE>") == true){return "<SERVICE>)";}
                        if(std.mem.eql(u8, inner_tag, "<FILE>") == true){return "<FILE>)";}

                        if(std.mem.eql(u8, inner_tag, "<NUM>") == true){return "<NUM>)";}
                        if(std.mem.eql(u8, inner_tag, "<VERSION>") == true){return "<VERSION>)";}
                        if(std.mem.eql(u8, inner_tag, "<TIME>") == true){return "<TIME>)";}
                        if(std.mem.eql(u8, inner_tag, "<DEVICEID") == true){return "<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>)";}
                    }
                    return self.value; 
                },
                .Colon => {
                    if(std.mem.eql(u8, inner_tag, "<PATH>") == true){return "<PATH>:";}
                    else if(std.mem.eql(u8, inner_tag, "<INET>") == true){return "<INET>:";}
                    else if(std.mem.eql(u8, inner_tag, "<IP>") == true){return "<IP>:";}
                    else if(std.mem.eql(u8, inner_tag, "<MAC>") == true){return "<MAC>:";}
                    else if(std.mem.eql(u8, inner_tag, "<DYN>") == true){return "<DYN>:";}
                    else if(std.mem.eql(u8, inner_tag, "<DEVICE_PATH>") == true){return "<DEVICE_PATH>:";}
                    else {
                        if(std.mem.eql(u8, inner_tag, "<CONFIG>") == true){return "<CONFIG>:";}
                        if(std.mem.eql(u8, inner_tag, "<SERVICE>") == true){return "<SERVICE>:";}
                        if(std.mem.eql(u8, inner_tag, "<FILE>") == true){return "<FILE>:";}

                        if(std.mem.eql(u8, inner_tag, "<NUM>") == true){return "<NUM>:";}
                        if(std.mem.eql(u8, inner_tag, "<VERSION>") == true){return "<VERSION>:";}
                        if(std.mem.eql(u8, inner_tag, "<TIME>") == true){return "<TIME>:";}
                        if(std.mem.eql(u8, inner_tag, "<DEVICEID>") == true){return "<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>:";}
                        //"<BUS>:<VENDOR> <PRODUCT>.<INSTANCE>",
                    }
                    return self.value; 
                },
                .SingleQuote => {
                    if(std.mem.eql(u8, inner_tag, "<PATH>") == true){return "'<PATH>'";}
                    else if(std.mem.eql(u8, inner_tag, "<INET>") == true){return "'<INET>'";}
                    else if(std.mem.eql(u8, inner_tag, "<IP>") == true){return "'<IP>'";}
                    else if(std.mem.eql(u8, inner_tag, "<MAC>") == true){return "'<MAC>'";}
                    else if(std.mem.eql(u8, inner_tag, "<DYN>") == true){return "'<DYN>'";}
                    else if(std.mem.eql(u8, inner_tag, "<DEVICE_PATH>") == true){return "'<DEVICE_PATH>'";}
                    else {
                        if(std.mem.eql(u8, inner_tag, "<CONFIG>") == true){return "'<CONFIG>'";}
                        if(std.mem.eql(u8, inner_tag, "<SERVICE>") == true){return "'<SERVICE>'";}
                        if(std.mem.eql(u8, inner_tag, "<FILE>") == true){return "'<FILE>'";}

                        if(std.mem.eql(u8, inner_tag, "<NUM>") == true){return "'<NUM>'";}
                        if(std.mem.eql(u8, inner_tag, "<VERSION>") == true){return "'<VERSION>'";}
                        if(std.mem.eql(u8, inner_tag, "<TIME>") == true){return "'<TIME>'";}
                        if(std.mem.eql(u8, inner_tag, "<DEVICEID>") == true){return "'<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>'";}
                    }
                    return self.value; 
                },
                else => inner_tag, // angle brackets are already included in `middle`
            };
            return replace_str; 
        // }
        // return self.value; 
    }

};

/// The numeric (digit) token variants. 
/// A numeric token ca also be wrapped within punctuations as inner value. 
/// E.g., [<DIGIT>], (<DIGIT>). 
pub const NumericToken = enum {
    RawDigit, 
    /// Example of a version token could be: 1.0.3. 
    VersionNumber, 
    Time, 
    /// If token has format: [bus]:[vendor_id]:[product_id].[instance]
    DeviceID,

    pub fn to_str(self: NumericToken) []const u8{
        switch (self) {
            NumericToken.RawDigit => return "<NUM>",
            NumericToken.VersionNumber => return "<VERSION>",
            NumericToken.Time => return "<TIME>",
            NumericToken.DeviceID => return "<BUS>:<VENDOR>:<PRODUCT>.<INSTANCE>",
        }
    }
};

pub const FileToken = enum {
    Config,
    Service,
    Default,
};

/// Represent nested and grouped tokens. E.g., when 
/// we have many punctuations, or that is wrapped within
/// parenthesis and contains whitespace...
pub const PairedToken = struct {
    // kind: TokenTags,
    kind: PunctuationToken.PunctuationKind,
    /// The inner sequence
    tokens: []TokenType, 
    // replacement_str: ?[]u8 = null,
    is_partial_grouped: bool = false,

    pub fn deinit(self: PairedToken, allocator: std.mem.Allocator) void{
        const many_item_slice_ptr = self.tokens.ptr[0..];
        //return self.items.ptr[0..self.capacity]; // Would return the slice 
        //const t = self.tokens.ptr[0..]; // This would create a "Many-Item-Pointer"
        // if(self.replacement_str != null) allocator.free(self.replacement_str.?); 

        for (many_item_slice_ptr) |token_ptr| {
            allocator.free(token_ptr);
        }
    }

    pub fn new(kind: PunctuationToken.PunctuationKind, partial_grouped: bool) PairedToken{
        return PairedToken{.kind = kind, .tokens = undefined, .is_partial_grouped = partial_grouped}; 
    }

    pub fn getOwnedReplacement(self: *PairedToken, allocator: std.mem.Allocator) ![]u8 {
        var local_arr = std.ArrayList(u8).init(allocator);
        defer local_arr.deinit(); 

        for(self.tokens) |token| {
            if(token.try_get_punctuation()) |punct|{
                try local_arr.appendSlice(punct.kind.as_bytes()); 
            }else {
                try local_arr.appendSlice(token.toReplacementStr());
            }
        }
        return try local_arr.toOwnedSlice(); 
    }

    /// This would merge two associated PairedToken. 
    /// Meaning it would, concat or extend the current self.tokens with the other_pair.tokens. 
    /// Then returning the updated TokenType. 
    /// This logic works similar to how `toOwnedSlice` and `appendSlice` would work: 
    /// // const new_memory = try allocator.alloc(TokenType, new_len); 
    /// // @memcpy(new_memory, src_items);
    /// // self.clearAndFree(allocator);
    /// // return new_memory;
    pub fn merge(self: *PairedToken, other_pair: *PairedToken, allocator: std.mem.Allocator) PairedToken{
        // const merged_slice = std.mem.concat(allocator, TokenType, &[_][]const TokenType{
        //     self.tokens, 
        //     other_pair.tokens
        // });

        // Append to current slice in self:  
        const new_len = self.tokens.len + other_pair.tokens.len;
        const is_opening: bool = condition_blk: {
            break :condition_blk (
                other_pair.tokens[0].PUNCTUATION.kind == PunctuationToken.PunctuationKind.ParenthesisOpen or
                other_pair.tokens[0].PUNCTUATION.kind == PunctuationToken.PunctuationKind.AngledBracketOpened or
                other_pair.tokens[0].PUNCTUATION.kind == PunctuationToken.PunctuationKind.SquareBracketOpen
            );
        };
        const new_kind: PunctuationToken.PunctuationKind = kind_blk: {
            const PunctuationKind = PunctuationToken.PunctuationKind; 
            for(self.tokens) |tok| {
                const self_kind = tok.PUNCTUATION.kind; 
                if(is_opening and self_kind == .ParenthesisClose){
                    break :kind_blk PunctuationKind.Parenthesis; 
                }
                else if(is_opening and self_kind == .AngledBracketClosed){
                    break :kind_blk PunctuationKind.AngledBracket; 
                }
                else if(is_opening and self_kind == .SquareBracketClose){
                    break :kind_blk PunctuationKind.SquareBracket; 
                }else {
                    break :kind_blk PunctuationKind.Unknown; 
                }
            }
             
        };

        const new_memory = try allocator.alloc(TokenType, new_len); 
        defer self.deinit(allocator);
        defer other_pair.deinit(allocator);

        if (is_opening){
            const old_len = other_pair.len; 
            self.other_pair.len = new_len;
            // @memcpy(other_pair[old_len..][0..self.tokens.len], self.tokens.ptr[0..]);
            @memcpy(new_memory[0..old_len], other_pair.tokens.ptr[0..]);
            @memcpy(new_memory[old_len..][0..self.tokens.len], self.tokens.ptr[0..]);
            
        }else {
            const old_len = self.tokens.len; 
            self.tokens.len = new_len;
            // @memcpy(self.tokens[old_len..][0..other_pair.tokens.len], other_pair.tokens.ptr[0..]);
            @memcpy(new_memory[0..old_len], self.tokens.ptr[0..]);
            @memcpy(new_memory[old_len..][0..other_pair.tokens.len], other_pair.tokens.ptr[0..]);
        }

        return PairedToken{
            .kind = new_kind,
            .tokens = new_memory,
            .is_partial_grouped = false, 
        }; 
    }

};

pub const AssociationTagType = enum {
    DirectedAssociation, 
    AssigmentPair, 
    ConditionalOperator,
};

/// A token could have context-based properties. 
/// Certain indications, such as punctuation tokens, might infer a token has 
/// association or a relationship with another token. 
/// - Directed Association, e.g., a State Transition (cause ➔ effect) with a temporal property. 
/// - Assignment pair, e.g., "my_var = value" as lhs = rhs or as "COMMAND=EXE_PATH"
pub const AssociationToken = union(AssociationTagType) {
    DirectedAssociation: struct {head: ?[]const u8, tail: ?[]const u8 }, 
    AssigmentPair: struct{token_type: AssignmentPairType, token: []const u8, lhs: []const u8, rhs: []const u8},
    ConditionalOperator: struct{conditional_type: ConditionalType, token: []const u8, lhs: []const u8, rhs: []const u8},

    pub const ConditionalType = enum {
        /// Represent token: '!=' and "Not Equal To"
        Inequality,
        /// Represent token: '=='
        EqualTo,
        /// Token: '>'
        GreaterThan,
        /// Token: '<'
        LessThan,
        /// Token: '>='
        GreaterOrEqual,
        /// Token: '<='
        LessOrEqual,

        pub fn try_from(token: []const u8) ?ConditionalType{
            const conditional: ?ConditionalType = cond_blk: {
                var greater_than: bool = false;
                var less_than: bool = false;  
                var exclamation: bool = false; 
                var equal_sign: bool = false; 
                for(token) |char| {
                    if (char == '>') {
                        greater_than = true; 
                    }else if(char == '<'){
                        less_than = true; 
                    }else if(char == '!'){
                        exclamation = true; 
                    }else if(char == '='){
                        equal_sign = true; 
                    }
                }

                if(exclamation and equal_sign) break :cond_blk ConditionalType.Inequality; 
                if(equal_sign and std.mem.containsAtLeast(u8, token, 2, "=")) break :cond_blk ConditionalType.EqualTo; 

                if(greater_than and equal_sign) break :cond_blk ConditionalType.GreaterOrEqual; 
                if(less_than and equal_sign) break :cond_blk ConditionalType.LessOrEqual; 
           
                // (inner_str[0] == '<' and inner_str[inner_str.len - 1] == '>');

                if(token[0] != '<' and token[token.len - 1] != '>') {
                    if (greater_than){
                        if(std.mem.indexOfScalar(u8, token, '>')) |greater_idx| {
                            if(std.ascii.isAlphanumeric(token[greater_idx - 1]) and std.ascii.isAlphanumeric(token[greater_idx + 1])){
                                break :cond_blk ConditionalType.GreaterThan; 
                            }
                        }
                    }else if(less_than) {
                        if(std.mem.indexOfScalar(u8, token, '<')) |lessthan_idx| {
                            if(std.ascii.isAlphanumeric(token[lessthan_idx - 1]) and std.ascii.isAlphanumeric(token[lessthan_idx + 1])){
                                break :cond_blk ConditionalType.LessThan; 
                            }
                        }
                    }
                }
                break :cond_blk null; 
            };
            return conditional; 
        }

        /// Returns the starting position index of the conditional operator found in the token slice. 
        pub fn index_of(self: ConditionalType, token: []const u8) ?usize {
            switch (self) {
                .Inequality => {
                    const start_pos: ?usize = pos_blk: {
                        const exclamation_pos: usize = std.mem.indexOfScalar(u8, token, '!').?;
                        const equal_pos: usize = std.mem.indexOfScalar(u8, token, '=').?; 
                        std.debug.print("Index Of (!): {d}\n", .{exclamation_pos}); 
                        std.debug.print("Index Of (=): {d}\n", .{equal_pos}); 
                        if(equal_pos < exclamation_pos and token[equal_pos + 1] == '!') {
                            break :pos_blk equal_pos;  
                        }else if(exclamation_pos < equal_pos and token[exclamation_pos + 1] == '='){
                            break :pos_blk exclamation_pos; 
                        }
                        break :pos_blk null; 
                    };
                    return start_pos; 
                },
                .EqualTo => {
                    if(std.mem.indexOfScalar(u8, token, '=')) |equal_pos|{
                        if(token[equal_pos + 1] == '=') return equal_pos; 
                    }
                    return null; 
                },
                .GreaterThan => {
                    if(std.mem.indexOfScalar(u8, token, '>')) |greater_pos|{
                        if(std.ascii.isAlphanumeric(token[greater_pos + 1])) return greater_pos; 
                    }
                    return null; 
                },
                .LessThan => {
                    if(std.mem.indexOfScalar(u8, token, '<')) |lessthan_pos|{
                        if(std.ascii.isAlphanumeric(token[lessthan_pos + 1])) return lessthan_pos; 
                    }
                    return null; 
                },
                .GreaterOrEqual => {
                    if(std.mem.indexOfScalar(u8, token, '>')) |greater_pos|{
                        if(token[greater_pos + 1] == '=') return greater_pos; 
                    }
                    return null; 
                },
                .LessOrEqual => {
                    if(std.mem.indexOfScalar(u8, token, '<')) |lessthan_pos|{
                        if(token[lessthan_pos + 1] == '=') return lessthan_pos; 
                    }
                    return null; 
                },
            }
        }
    };

    pub const AssignmentPairType = enum {
        USER, 
        TTY,
        PWD,
        COMMAND,
        
        /// The `OTHER` Pair Type, is for every other case. 
        OTHER,

        pub fn try_from(token: []const u8) ?AssignmentPairType {
            const token_fields = @typeInfo(AssignmentPairType).@"enum".fields; 
            inline for (token_fields) |token_type| {
                if (std.mem.startsWith(u8, token, token_type.name) and (std.mem.containsAtLeast(u8, token, 1, "="))){
                    return std.meta.stringToEnum(AssignmentPairType, token_type.name);
                }
            }
            //TODO: - How do I handle the general and OTHER cases. 
            if (std.mem.containsAtLeast(u8, token, 1, "=") and ConditionalType.try_from(token) == null){
                return std.meta.stringToEnum(AssignmentPairType, "OTHER"); 
            }
            // systemd-hostnamed.service: PrivateNetwork=yes
            // Token 1: systemd-hostnamed.service: → KeyValue Pair 
            // Token 2: PrivateNetwork=yes → AssigmentPair (need to split into two unique tokens).

            return null; 
        } 

        pub fn to_str(self: AssignmentPairType ) []const u8{
            switch (self) {
                AssignmentPairType.USER => return "=<USER>",
                AssignmentPairType.TTY => return "=<TTY>",
                AssignmentPairType.PWD => return "=<PATH>",
                AssignmentPairType.COMMAND => return "=<CMD>",
                AssignmentPairType.OTHER => return "<OTHER>",
            }
        }
    };

    pub fn try_from(token: []const u8) ?AssociationToken{
        if (token.len == 2 and (token[0] == '=' or token[0] == '-') and token[1] == '>'){
            return AssociationToken{.DirectedAssociation = .{.head = null, .tail = null}}; 
        }

        const conditional = ConditionalType.try_from(token); 
        if (conditional) |conditional_type| {
            std.debug.print("Conditional token found: {s}\n", .{@tagName(conditional_type)});
            if(conditional_type.index_of(token)) |op_idx| {
                const lhs_part = token[0..op_idx];
                const rhs_part = token[op_idx+1..token.len];
                return AssociationToken{.ConditionalOperator = .{.conditional_type = conditional_type, .token = token, .lhs = lhs_part, .rhs = rhs_part}}; 
            }else{
                std.debug.print("Token before crash: {s}\n", .{token});
                @panic("Something went wrong!"); 
            }
        }

        const association_token = AssociationToken.AssignmentPairType.try_from(token);
        if (association_token) |token_value| {
            switch (token_value) {
                // For the general cases, which needs to be split and handled. 
                AssignmentPairType.OTHER => {
                    var iter = std.mem.splitAny(u8, token, "=");
                    const first_tok = iter.first();
                    const rhs = iter.peek();
                    if (rhs) |rhs_tok| {
                        std.debug.print("Splitted pair with delimiter('='): {s} and {s}\n", .{first_tok, rhs_tok}); 
                        return AssociationToken{
                            .AssigmentPair = .{
                                .token_type = AssignmentPairType.OTHER, 
                                .token = token,
                                .lhs = first_tok, 
                                .rhs = rhs_tok,
                            }
                        };
                    }
                },
                // For the hardcoded cases...
                else => return AssociationToken{
                    .AssigmentPair = .{
                        .token_type = token_value, 
                        .token = token,
                        .lhs = @tagName(token_value), 
                        .rhs = token_value.to_str()
                    }
                },
            }
        }
        return null;
    }

    pub fn generic_from(comptime T: type, type_val: T) AssociationToken{
        _ = type_val;  
    }

    pub fn get_values(self: AssociationToken) struct {lhs: []const u8, rhs: []const u8}{
        switch (self) {
            // string format as: "head → tail"
            .DirectedAssociation => |da| {
                const head = if (da.head) |head| head else "<VALUE>"; 
                const tail = if (da.tail) |tail| tail else "<VALUE>"; 
                return .{.lhs = head, .rhs = tail}; 
            },
            .ConditionalOperator => |cond| {
                return .{.lhs = cond.lhs, .rhs = cond.rhs}; 
            },
            .AssigmentPair => |assignpair| {
                return .{.lhs = assignpair.lhs, .rhs = assignpair.rhs}; 
            }
        }
    }

    pub fn into_str(self: AssociationToken) []const u8{
        switch (self) {
            // string format as: "head → tail"
            .DirectedAssociation => |da| {
                if (da.head) |head_str| {
                    return head_str; 
                }
                return "->"; 
                // return "head -> tail";
            },
            .ConditionalOperator => |cond| {
                return cond.token; 
            },
            .AssigmentPair => |assignpair| {
                switch (assignpair.token_type) {
                    AssignmentPairType.USER => return "USER=<USER>",
                    AssignmentPairType.TTY => return "TTY=<TTY>",
                    AssignmentPairType.PWD => return "PWD=<PATH>",
                    AssignmentPairType.COMMAND => return "COMMAND=<CMD>",
                    // AssignmentPairType.OTHER => return "<LHS>=<RHS>",
                    
                    // If we find an assignment pair, that is not one of the above. 
                    // Then check what it is, and change it manually or keep as is. 
                    AssignmentPairType.OTHER => {
                        return assignpair.token;  
                        // return "<FIX>";
                    },
                }
            }
        }
    }
};

pub const TokenTags = enum {
    HOST, 
    PATH,
    SRC,
    DEST,
    ADDRESS,
    STOPWORD,
    NETWORKINTERFACE,
    ASSOCIATION,
    PUNCTUATION,
    NUMERIC,
    ALPHABETIC,
    /// A Dynamic token tag, is whenever a token is non-static.
    /// E.g., when a token is a parameter that is runtime-known. 
    DYNAMIC,
    FILE,
    DEVICE,
    PAIRED,
};

pub const TokenType = union(TokenTags) {
    HOST: []const u8,
    PATH: []const u8, 
    SRC: []const u8,
    DEST: []const u8,
    ADDRESS: []const u8, 
    STOPWORD: []const u8, 
    NETWORKINTERFACE: []const u8, 
    /// ASSOCIATION, represent if token has associative properties 
    /// with other token. 
    ASSOCIATION: AssociationToken, 
    PUNCTUATION: PunctuationToken, 
    NUMERIC: NumericToken, 
    ALPHABETIC: []const u8, 
    DYNAMIC: []const u8, 
    FILE: FileToken,
    DEVICE: []const u8,
    PAIRED: PairedToken, 

    pub const OperatorToken = enum(u8) {
        const is_relational: bool = true; 
        equal = '=',
        right_imply = '>', 
        left_imply = '>', 
        addition = '+',
        subtract = '-', 
    }; 

    //TODO: - Can I use TokenTypeError as event types, that we 
    // handle during runtime? Or should I define a new enum with 
    // different parsing events? 
    pub const TokenTypeError = error {
        UnexpectedPunctuationKind,
        TokenIsNotAPairedToken,
        TokenTypeIsNotPunctuation,
        FailedParsingGroupedToken, 
        ParsingInnerRequireSliceLengthOfAtleastThree,
        NoInnerPunctuationFound,
        FailedParsingSinglePunctuationToken,
        TokenMissingClosingPunctuation,
        TokenMissingOpeningPunctuation,
        RequireDomainSpecificParsing,
        OnlyPunctuationTypesMapsToPairedToken,
        ProvidedTypeNotSupported, 
    } || std.mem.Allocator.Error;

    pub fn into_tag(self: TokenType) TokenTags{
        // const tag_type = std.meta.stringToEnum(TokenTags, @tagName(self));
        const tag_type = @as(TokenTags, self); 
        return tag_type; 
    }

    /// Maps from a token string based on a pattern, into a valid TokenType.
    /// This tries to create a new TokenType union type. 
    pub fn from(token: []const u8) ?TokenType{
        // Checks if token association was found, check for both outer and inner tokens.
        if (AssociationToken.try_from(token)) |assoc| {
            std.debug.print("   → Found ASSOCIATION Token: {s} with Value({s})\n", .{@tagName(assoc), assoc.into_str()});
            return TokenType{.ASSOCIATION = assoc}; 
        }
        if(PunctuationToken.tryFrom(token)) |punct| {
            // parse the inner token, if it is null. 
            if (punct.iteration_started == false){
                // std.debug.print("   Found Punctuation Kind: {s} with inner value: {s}\n", .{@tagName(punct.kind), punct.value}); 
            } 
            return TokenType{.PUNCTUATION = punct}; 
            
        }else if(is_path(token)){
            return TokenType{.PATH = "<PATH>"}; 
        }else if(is_network_interface(token)){
            return TokenType{.NETWORKINTERFACE = "<INET>"};
        }else if(is_device_path(token)){
            return TokenType{.DEVICE = "<DEVICE_PATH>"};
        }else if(is_ip_addr(token)){
            return TokenType{.ADDRESS = "<IP>"};
        }else if(is_mac_addr(token)){
            return TokenType{.ADDRESS = "<MAC>"};
        }else if(is_stopword(token)){
            std.debug.print("   → Found STOPWORD Token!\n", .{});
            //TODO: - How do we handle stopwords, should be remove them? 
            return TokenType{.STOPWORD = token}; 
        }else if(token.len == 1 and std.ascii.isAlphabetic(token[0])){
            std.debug.print("Found a token of length 1 [CHARACTER = {s}]\n", .{token});
            @panic("Found a Single character!");
        }else if((is_alphabetic_only(token)) or (std.mem.endsWith(u8, token, ".") and is_alphabetic_only(token[0..token.len - 1]))){
            if(std.mem.endsWith(u8, token, ".")){
                std.debug.print("   → Found ALPHABETIC Token With Ending Dot!\n", .{});
            }else {
                std.debug.print("   → Found ALPHABETIC Token!\n", .{});
            }
            std.debug.print("   ----------------------------------------\n", .{});
            return TokenType{.ALPHABETIC = token}; 
        }else if(is_numeric(token)){
            const numeric_type = into_numeric(token);
            // std.debug.print("   → Found NUMERIC Token: \n", .{});
            return TokenType{.NUMERIC = numeric_type.?};
        }else if (is_filetype(token)) |filetype|{
            std.debug.print("   → Found {s} Token: {s}\n", .{@tagName(filetype), token});
            std.debug.print("   ----------------------------------------\n", .{});
            return TokenType{.FILE = filetype};
        }else if(is_dynamic_token(token)){
            std.debug.print("   → Token is Non-Static, Dynamic Token!\n", .{});
            std.debug.print("   ----------------------------------------\n", .{});
            // TODO: - Handle Dynamic Log Tokens, maybe add a new tag: <DYN>, <STRING>, <NAME>, <*>, ...
            return TokenType{.DYNAMIC = token};
        }
        return null; 
    }

    fn tryGetReplacement(self: TokenType, original_token: []const u8) ?[]const u8 {
        const replacement_tok = self.toReplacementStr(); 
        if(std.mem.eql(u8, replacement_tok, original_token) != true){
            return replacement_tok; 
        }
        return null; 
    }
                
    /// Return the replacement values, for the specific TokenType.
    /// The returner owns the memory!
    pub fn toReplacementStr(self: TokenType) []const u8{
        switch (self) {
            .HOST => |host| return host, 
            .PATH => |path| return path, 
            .SRC => |src| return src, 
            .DEST => |dest| return dest, 
            .ADDRESS => |addr| return addr, 
            .NETWORKINTERFACE => |inet| return inet, 
            .ASSOCIATION => |assoc| {
                // const str = assoc.get_values(); 
                const assoc_tag: AssociationTagType = @as(AssociationTagType, assoc); 
                switch (assoc_tag) {
                    .DirectedAssociation => return assoc.into_str(),
                    .ConditionalOperator => return assoc.into_str(),
                    .AssigmentPair => return assoc.into_str(),
                }
                return "<IGNORE>";
            },
            .PUNCTUATION => |punct| {
                // var pair_str: []u8 = &[_]u8{};  
                const result = punct.to_str(self); 
                // std.debug.print("\ntoReplacementStr, punct.to_str(): {s}\n", .{result});
                return result;
            },
            .NUMERIC => |num| {
                // Check if token contains single opening or single closing punctuations...
                return num.to_str();
            },
            .STOPWORD => |sw| return sw, 
            .ALPHABETIC => |alphabetic| return alphabetic,
            .DYNAMIC => |dynamic| return dynamic,
            .FILE => |file| {
                if (file == .Config){return "<CONFIG>";}
                else if (file == .Service) {return "<SERVICE>";}
                else {return "<FILE>";}
            },
            .DEVICE => |device| return device, 
            .PAIRED => |pair| {
                if(pair.replacement_str) |replacement| {
                    const pair_str: []const u8 = replacement; 
                    return pair_str; 
                }else {
                    return  "<PAIR>";
                }
            }
        }
    }

    fn generic_into(self: anytype) void {
        if (@TypeOf(self) == PunctuationToken) {
            const punctuation = @as(PunctuationToken, self);
            _ = punctuation; 
        }
        if (@TypeOf(self) == TokenType) {
            const token_type = @as(TokenType, self);
            const token_tag = token_type.into_tag(); 
            const FieldTokenType = @FieldType(TokenType, @tagName(token_tag)); 
            _ = FieldTokenType; 
        }
    }

    /// Wrapper functionality for trying to map or casting anytype into PairedToken type.
    fn tryIntoPairedToken(self: TokenType, allocator: std.mem.Allocator) TokenTypeError!PairedToken {
        switch (self) {
            .PUNCTUATION => |punct| {
                const inner_slice = punct.getParseSlice(); 
                if (parseInnerToken(inner_slice, allocator)) |inner_tokens| {
                    return TokenType{.PAIRED = PairedToken{.kind = punct.kind, .tokens = inner_tokens}}; 
                } else |err| {
                    std.debug.print("Failed parsing into PairedToken, from: {s}\n", .{punct.value}); 
                    return err; 
                }
                
            },
            else => return TokenTypeError.OnlyPunctuationTypesMapsToPairedToken,
            
        }
        return TokenTypeError.ProvidedTypeNotSupported; 
    }

    /// This would return a mutable slice, so caller owns the memory. 
    fn parseInnerToken(inner_slice: []const u8, allocator: std.mem.Allocator) ![]TokenType{
        // Iterate over the individual given slice, and successivelly remove the punctuations. 
        var distinct_tokens = std.ArrayList(TokenType).init(allocator);
        defer distinct_tokens.deinit();
        const PunctuationKind = PunctuationToken.PunctuationKind; 
        const fields = @typeInfo(PunctuationKind).@"enum".fields; 
        // for (inner_slice, 0..) |token_byte, tok_idx| {
        //     if(std.mem.indexOfScalar(u8, slice: []const T, value: T))    
        // }

        inline for (fields) |kind| {
            const punct_kind = std.meta.stringToEnum(PunctuationKind, kind.name);
            if (punct_kind) |pkind| {
                // Check if we find the index of the punctuation else null:
                if(std.mem.indexOf(u8, inner_slice, pkind.as_bytes())) |punct_idx| {
                    var iter = std.mem.splitScalar(u8, inner_slice, inner_slice[punct_idx]);
                    const first_str = iter.first();
                    const tok_type = if(TokenType.from(first_str) != null) TokenType.from(first_str).?; 

                    try distinct_tokens.append(tok_type); 
                    try distinct_tokens.append(TokenType{.PUNCTUATION = .{.kind = pkind, .value = pkind.as_bytes()}});

                    // We are done here, reached end of string, 
                    if(iter.peek() == null){}
                    
                    while(iter.next()) |tok_str| {
                        if(TokenType.from(tok_str)) |next_tok| {
                            try distinct_tokens.append(next_tok); 
                        }
                    }
                }
            }
        }
        return try distinct_tokens.toOwnedSlice();
    }
                    

    /// Should handle and execute different proceedure depending on the 
    /// current TokenType. If the TokenType is a PunctuationToken, 
    /// then it will check what `parsing_type` → parsing logic to run. 
    pub fn parsePunctuationToken(self: TokenType, allocator: std.mem.Allocator) TokenTypeError!TokenType {
        if(self.try_get_punctuation()) |punctuation| {
            const parsing_type = self.getPunctuationParsingType(allocator) catch |err| {
                switch (err) {
                    error.TokenMissingClosingPunctuation => ParseType.Missing,
                    error.TokenMissingOpeningPunctuation => ParseType.Missing,
                    else => return err, 
                }
            }; 
            switch(parsing_type){
                .Default => {
                    const paired_token = try self.tryIntoPairedToken(allocator);
                    return TokenType{.PAIRED = paired_token}; 
                    // try group_token.PAIRED.getOwnedReplacement(allocator); 
                },
                .DomainSpecific => return TokenTypeError.RequireDomainSpecificParsing,
                .Missing => {
                    // Handle Missing logic below: 
                    const token_slice = punctuation.getParseSlice();
                    const raw_token = punctuation.value; 
                    if(TokenType.from(token_slice)) |parsed_token| {
                        if(PunctuationToken.still_contain(token_slice)){
                            std.debug.print("       (!): Inner Sub-Slice still have punctuations: {s}, compared to raw slice: {s}\n", .{token_slice, raw_token});
                            @panic("Inner slice still contain Punctuations!"); 
                        }
                        return parsed_token; 
                    }else {
                        return TokenTypeError.FailedParsingSinglePunctuationToken; 
                    }
                },
            }
        }
        return TokenTypeError.TokenTypeIsNotPunctuation;
    }

    /// The current self same as the TokenType instance, lives in the scope where TokenType.from() is called. 
    /// If the TokenType union is of PairedToken type, the PairedToken owns an allocated slice of TokenType's. 
    /// Meaning it owns that memory (slice). 
    /// ---------------------------------
    /// (!) Remember: 
    /// Structs, unions, and arrays can sometimes be more efficiently passed as a reference, 
    /// since a copy could be arbitrarily expensive depending on the size
    pub fn mergePairedTokens(self: *TokenType, prev_token: ?*TokenType, allocator: std.mem.Allocator) TokenType {
        if (self.into_tag() == TokenTags.PAIRED){
            if (prev_token != null and prev_token.?.* == TokenTags.PAIRED){
                const other_pair = prev_token.?.PAIRED; 
                const merged_pair = self.PAIRED.merge(&other_pair, allocator); 
                prev_token = null; 
                return TokenType{.PAIRED = merged_pair}; 
            }
        }
        return self; 
    }
   
    /// We want to split by the punctuation mark, 
    /// and run 'TokenType.from()' on the two distinct token values. 
    /// -------------
    /// --------- PARSE BY INNER PUNCTUATION:
    /// Start by checking if the token has both opening and closing punctuations. 
    /// → Split by the punctuation: 
    ///    1. Take first(). 
    ///    2. Take peak().
    /// 3. Perform TokenType.from() on both (1) and (2)
    /// ... Which should result in the desired tokens: "Result(1)", "Punctuation Symbol", "Result(2)"
    /// ... Or result in: "Result(2)", "Punctuation Symbol", "NULL" where NULL indicate its missing. 
    pub fn getPunctuationParsingType(self: TokenType) TokenTypeError!ParseType {
    // pub fn getPunctuationParsingType(self: TokenType, allocator: std.mem.Allocator) TokenTypeError!ParseType {
        const PunctuationKind = PunctuationToken.PunctuationKind; 

        const parse_type: ParseType = kind_blk: {
            if(self.try_get_punctuation()) |punct| {
                const raw_token = punct.value; 
                const cond = std.mem.startsWith(u8, raw_token, "(") and std.mem.endsWith(u8, raw_token, ":"); 
                if (punct.kind == .Unknown and cond == true){
                    return TokenTypeError.TokenMissingClosingPunctuation;
                }
                else if(punct.kind == .ParenthesisClose and raw_token[0] != '('){
                    return TokenTypeError.TokenMissingOpeningPunctuation;  
                }
                else if (punct.kind == .ParenthesisOpen and raw_token[raw_token.len - 1] != ')'){
                    return TokenTypeError.TokenMissingClosingPunctuation;
                }
                const acceptable_kind: ?PunctuationKind = switch (punct.kind) {
                    .Parenthesis => PunctuationKind.Parenthesis,
                    .Colon => PunctuationKind.Colon,
                    .Ellipsis => PunctuationKind.Ellipsis, 
                    .SquareBracket => PunctuationKind.SquareBracket,
                    .Quotation => PunctuationKind.Quotation,
                    .SingleQuote => PunctuationKind.SingleQuote,
                    .Unknown => PunctuationKind.Unknown,
                    else => null,
                };

                if (acceptable_kind != null) {
                    break :kind_blk ParseType.Default; 
                    // break :kind_blk punct; 
                }
                return TokenTypeError.UnexpectedPunctuationKind; 
            }
            return TokenTypeError.TokenTypeIsNotPunctuation; 
        };
        return parse_type;  

        // const inner_slice = raw_token[1 .. raw_token.len - 1];
        // const inner_slice = punctuation.getParseSlice();
        // std.debug.print("   Wrapped Punctuation Kind found: {s}, Checking Inner Now...\n", .{@tagName(punctuation.kind)});
        // const parsed_pair = try parseInnerToken(inner_slice, allocator);
        // return TokenType{.PAIRED = PairedToken{.kind = punctuation.kind, .tokens = parsed_pair}}; 

        // if (tryParseInner(inner_slice, allocator)) |inner_tokens| {
        //     return TokenType{.PAIRED = PairedToken{.kind = punctuation.kind, .tokens = inner_tokens}}; 
        // } else |err| {
        //     // This is whenever, "NoInnerPunctuationFound" error was encountered. 
        //     std.debug.print("Error: {}\n", .{err});
        //     const inner_token = TokenType.from(inner_slice); 
        //     if (inner_token) |result_tok| {
        //         const tok_arr = try allocator.alloc(TokenType, 1);
        //         tok_arr[0] = result_tok; 
        //         return TokenType{.PAIRED = PairedToken{
        //             .kind = punctuation.kind, 
        //             .tokens = tok_arr,
        //         }}; 
        //         // return result_tok; 
        //     }
        //     return err;
        // }

        // return TokenTypeError.FailedParsingGroupedToken;  
    }

    fn is_path(token: []const u8) bool {
        const has_backslash = std.mem.containsAtLeast(u8, token, 2, "/"); 
        const startsWithBackslash = std.mem.startsWith(u8, token, "/");
        const startsWithSingleQuote = std.mem.startsWith(u8, token, "'/"); 
        if (has_backslash and (startsWithSingleQuote or startsWithBackslash)){
            return true; 
        }else {
            return false; 
        }
    }

    fn contain_digits_only(token: []const u8) bool {
        const only_digits: bool = blk: {
            for (token) |char|{
                if(std.ascii.isDigit(char) == false){
                    break :blk false;                 
                }
            }
            break :blk true; 
        };
        return only_digits;
    }
    
    fn is_alphabetic_only(token: []const u8) bool {
        const only_alphabetic: bool = blk: {
            for (token) |char|{
                if(!std.ascii.isAlphabetic(char)){
                    break :blk false;                 
                }
            }
            break :blk true; 
        };
        return only_alphabetic;
    }

    /// This try to check if a given token is a domain specific log keyword.
    /// The purpose of this, is to identify context pairs (semantically)
    /// in a log message. This would dictate if we need to parse group of 
    /// tokens as n-grams using a window size > 1. 
    pub fn try_domain_keyword(token: []const u8) bool {
        const domain_specific_map: []const []const u8 = &.{
            "COMMAND", "command", "STATE", "state",
            "PID", "PID:", "UID", "UID:", "CPU", "CPU:"
        };
        for (domain_specific_map) |domain| {
            if (std.mem.eql(u8, domain, token)){
                return true; 
            }
        }

    }

    /// This function would return an appropriate replacement tag string,
    /// for a dynamic token. This is mainly to capture semantic token parsing.
    /// An example could be a log message of a command. Which might include 
    /// additional optional values such as <CLI_FLAGS> and <USER_INPUT> or <USER_KEY>.
    /// E.g., "COMMAND=<BIN_PATH> <CLI_FLAG> <USER_KEY>". 
    /// This tries to identify context pair (semantically) in a log message. 
    fn get_context_tag(self: TokenType, token: []const u8, ctx_option: FilterOptions) []const u8{
        if(try_domain_keyword()) {}

        // const association_token = AssociationToken.AssignmentPairType.try_from(token);

        switch (self) {
            .ASSOCIATION => |val|{
                val.try_from(token);
            },
            .PUNCTUATION => |punct| {
                if(punct.kind == .ArrowIndicator){
                    // This branch indicate that we have a temporal or order-based 
                    // context between tokens. 
                }
            },
            .PAIRED => |paired| {
                // PunctuationToken.tryParseGroupedTokens(token: TokenType)
                _ = paired;  
            }
        }

        _ = ctx_option; 
    }

    fn is_dynamic_token(token: []const u8) bool {
        const is_dynamic: bool = dyn_blk: {
            var non_alphabetic: bool = false;  
            var non_alphabetic_count: usize = 0;  
            var digit_count: usize = 0;  
            var alphabetic_count: usize = 0;  
            const is_wrapped = if (std.mem.startsWith(u8, token, "'") and std.mem.endsWith(u8, token, "'")) true else false; 
            for (token) |char|{
                if(!std.ascii.isAlphabetic(char)){
                    // std.debug.print("Not all chars in tokens are alphabetic, found: {c}\n", .{char});
                    non_alphabetic_count += 1; 
                    non_alphabetic = true;
                }
                if(std.ascii.isAlphabetic(char)){
                    alphabetic_count += 1; 
                }

                if(std.ascii.isDigit(char)){
                    digit_count += 1; 
                }
            }
            const other_token_count = non_alphabetic_count - digit_count; 
            std.debug.print("   Evaluating if Token is <DYNAMIC>:\n", .{});
            std.debug.print("       Non-Alphanumeric Count: {d}, Digit Count: {d}, Alphabetic Count: {d}\n", .{other_token_count, digit_count, alphabetic_count});

            // For the case when the token is wrapped around single quotes 
            // and the inner value contains at least one dash 
            if (is_wrapped and non_alphabetic and std.mem.containsAtLeast(u8, token, 1, "-")) {
                // std.debug.print("Token wrapped in single quotes and contain '-': {s}", .{token});
                if (true) @panic("Inside 'is_dynamic_token' check!");
                break :dyn_blk true; 
            }
            // Checks if a token has a non static name, e.g., a "<USER_KEY>" or "<USER_INPUT>".
            // One example could be: "passwd_watch"
            if (!std.mem.containsAtLeast(u8, token, 1, "/") and other_token_count >= 1){
                if (std.mem.indexOfScalar(u8, token, '_')) |underscore_idx| {
                    if (token.len > 2 and std.ascii.isAlphanumeric(token[underscore_idx - 1]) and std.ascii.isAlphanumeric(token[underscore_idx + 1])){
                        // std.debug.print("Found token that use name with underscore: {s}\n", .{token});
                        // if (true) @panic("Inside 'is_dynamic_token' check underscore!");
                        break :dyn_blk true; 
                    }
                }else if (std.mem.indexOfScalar(u8, token, '-')) |dash_idx| {
                    if (token.len > 2 and std.ascii.isAlphanumeric(token[dash_idx - 1]) and std.ascii.isAlphanumeric(token[dash_idx + 1])){
                        // std.debug.print("Found token that is separated with dash('-'): {s}\n", .{token});
                        break :dyn_blk true; 
                    }
                }
            }
            if (other_token_count > 1 and digit_count > 1) {
                break :dyn_blk true; 
            }
            break :dyn_blk false; 
        };
        return is_dynamic;
    }

    /// This checks if a log message is a stackframe log type. 
    fn is_stackframe(log_message: []const u8) bool {
        // var tokens = std.mem.tokenizeAny(u8, log_message, "\n\n \n");

        const is_stackline = (log_message.len > 0 and log_message[0] == '#' and std.ascii.isDigit(log_message[1]));
        // const stack_trace_msg = std.mem.containsAtLeast(u8, token, 1, "Stack trace of thread");
        const have_multiple_newline = std.mem.containsAtLeast(u8, log_message, 1, "\n");
        // const have_symbol = std.mem.eql(u8, log_message, "n/a");

        if(std.mem.containsAtLeast(u8, log_message, 4, "\n") and std.mem.containsAtLeast(u8, log_message, 4, "#")){
            return true; 
        }

        if (is_stackline and have_multiple_newline){
            return true; 
        }

        return false; 
    }

    fn is_mac_addr(token: []const u8) bool {
        var parts = std.mem.splitAny(u8, token, ":");
        var part_count: usize = 0;
        var hex_count: usize = 0; 
        while (parts.next()) |part| {
            if (part.len != 2) return false;
            if (std.ascii.isHex(part[0]) or std.ascii.isHex(part[1])){
                hex_count += 1; 
            }
            part_count += 1; 
        }
        // if (part_count == 6 or part_count == 12){
        if (part_count == 6 or part_count == 12 and hex_count > 0){
            return true; 
        }
        return false; 
        
    }

    /// In most cases, UUIDs are represented as hexadecimal values. The most used
    /// format is the 8-4-4-4-12 format, xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, where
    /// every x represents 4 bits. 
    /// - Example format: `00112233-4455-6677-8899-aabbccddeeff`
    /// UUIDs are sequentially encoded using `big-endian` starting with the bytes: 
    /// `00, 11, 22, 33` - `44, 55` - `...`
    /// --------------------------------
    fn is_uuid(token: []const u8) bool {
        // var uuid_part: ?[]const u8 = null; 
        var subpart_len: [5]usize = undefined; 
           
        //FIX: - When we parse the punctuations, always check for wrapped cases first. 
        // So check if the token has both opening and closing punctuations. 
        // --------- PARSE BY INNER PUNCTUATION:
        // 1. Check if "is_wrapped()" → slice[1..slice.len - 1]. 
        // 2. Else if not wrapped but punctuation was found Then: 
        //    → Split by the punctuation: 
        //    2.1. Take first(). 
        //    2.2. Take peak().
        // 3. Perform TokenType.from() on both (2.1) and (2.2)
        // ... Which should result in the desired tokens: "Result(2.1)", "Punctuation Symbol", "Result(2.2)"
        // ... Or result in: "Result(2.1)", "Punctuation Symbol", "NULL" where NULL indicate its missing. 

        // Another approach: "(boot:37e23cab-a2ef-4fbd-9904-b68acea03eda)"
        // 1. First we check if it is wrapped (opening and closing punctuation).
        // 2. Split by the inner PunctuationKind.Colon, which yields: 
        //    → "boot" , "37e23cab-a2ef-4fbd-9904-b68acea03eda"
        // 3. Then perform TokenType check via "from()" on the two splitted tokens.   
        // Which should result in the desired tokens: "boot", ":", "<UUID>"
         
        // if(std.mem.indexOf(u8, token, ":") != null and std.mem.endsWith(u8, token, ":") == false){
        //     // Assuming test example: "(boot:37e23cab-a2ef-4fbd-9904-b68acea03eda)"
        //     // parts.first() = "boot" and parts.peak() = 37e23cab-a2ef-4fbd-9904-b68acea03eda
        //     var parts = std.mem.splitAny(u8, token, ":"); 
        //     const object_name = parts.first(); 
        //     const numeric_part = parts.peek(); 
        // }

        var hex_parts = std.mem.splitAny(u8, token, "-"); 
        var i: usize = 0; 
        if(hex_parts.buffer.len != 5) return false; 
        while(hex_parts.next()) |hex| {
            subpart_len[i] = hex.len; 
            i += 1; 
        }
        // Expected format is the 8-4-4-4-12 format, xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
        const expected_format: bool = ((
            subpart_len[0] == 8 and 
            subpart_len[1] == 4 and 
            subpart_len[2] == 4 and 
            subpart_len[3] == 4 and 
            subpart_len[4] == 12
            ));

        if (expected_format == true){
            return true; 
        }
        return false; 
    }

    /// IPv4 Address without port: "192.168.1.1"
    /// IPv4 with port "10.0.0.1:8080"
    fn is_ip_addr(token: []const u8) bool {
        var v4_parts = std.mem.splitAny(u8, token, "."); 
        var block_count: usize = 0; 
        while (v4_parts.next()) |part| {
            // std.debug.print("Part: {s} and length of part: {d}\n", .{part, part.len});
            if (part.len > 3) {
                // When the length exceed the length limit. We need to handle the following:  
                // E.g., the last part would parse into: "1:8080" with a length of 6. 
                // Meaning when it split by the last '.' dot-decimal, 
                // we would get the str "1:8080" with the included port.
                if (std.mem.indexOf(u8, part, ":") != null){
                    var port_part = std.mem.splitAny(u8, part, ":"); 
                    const last_octet = port_part.first(); // Last dot-decimal in the IPv4 address.
                    const port = port_part.peek(); 
                    if (last_octet.len > 3 and port == null) return false;
                    block_count += 1; 
                    // std.debug.print("Last dot-decimal and port part: {s} and {s}\n", .{last_octet, port.?});
                }else {
                    return false; 
                }
            }else {
                const block_value = std.fmt.parseInt(u32, part, 0b0) catch |err|{
                    std.debug.print("Received Error: {s} - is_ip_addr() = false\n", .{@errorName(err)});
                    return false; 
                };
                if (block_value >= 0 and block_value <= 255){
                    block_count += 1; 
                }else {
                    return false; 
                }
            }
        }

        if (block_count == 4){
            return true; 
        }
        return false; 
    }

    //TODO: - Look over this bloated code, for how to assing the pairs to 'lhs' and 'rhs' respectively.
    pub fn setAssociationProperty(self: *TokenType, token: []const u8, token_iter_ref: *const std.mem.TokenIterator(u8, .any)) void {
        // std.debug.assert(@as(AssociationTagType, self.*) == self.ASSOCIATION)
        const get_pair = struct {
            pub fn call(tok: []const u8, token_iter: *const std.mem.TokenIterator(u8, .any)) ?struct{lhs: []const u8, rhs: []const u8} {
                var iter = token_iter.*; 
                if (tok.len == 2 and (tok[0] == '=' or tok[0] == '-') and tok[1] == '>'){
                    var backward = std.mem.splitBackwardsAny(u8, token_iter.buffer[0..token_iter.index], token_iter.delimiter);
                    _ = backward.next(); 
                    const lhs_token = backward.next(); 
                    const rhs_token = iter.peek(); 
                    return .{.lhs = lhs_token.?, .rhs = rhs_token.?}; 
                }else if(tok.len > 1 and std.mem.containsAtLeast(u8, tok, 1, ":")){
                    const key_index = std.mem.indexOfScalar(u8, tok, ':').?;
                    const key_val = tok[0..key_index - 1]; 
                    const next_value = iter.peek();
                    return .{.lhs = key_val, .rhs = next_value.?}; 
                }
                const association_token = AssociationToken.AssignmentPairType.try_from(tok);
                if (association_token) |token_value| {
                    return .{.lhs = @tagName(token_value), .rhs = token_value.to_str()};
                }
                // return null or error below if it fails...
                return null; 
            }
        }.call; 

        const pair_data = get_pair(token, token_iter_ref); 
        switch (self.*) {
            .ASSOCIATION => |*val|{
                const tag_val = @as(AssociationTagType, val.*); 
                switch (tag_val) {
                    AssociationTagType.DirectedAssociation => {
                        if (pair_data) |pair|{
                            val.*.DirectedAssociation.tail = pair.lhs;
                            val.*.DirectedAssociation.head = pair.rhs;
                        }
                    },
                    AssociationTagType.ConditionalOperator => {
                        // todo...
                    },
                    AssociationTagType.AssigmentPair => {
                        if (pair_data) |pair|{
                            // const association_token = AssociationToken.AssignmentPairType.try_from(token);
                            // val.*.AssigmentPair.token_type = if (association_token != null) association_token.?;  
                            val.*.AssigmentPair.lhs = pair.lhs;
                            val.*.AssigmentPair.rhs = pair.rhs;
                        }
                    },
                }
            },
            else => {},
        }
    }

    // pub fn get_punctuation(self: TokenType) ?PunctuationToken{
    pub fn try_get_punctuation(self: TokenType) ?PunctuationToken{
        switch (self) {
            .PUNCTUATION => |punct| {
                return punct;  
            },
            else => return null, 
        }
    }

    fn is_network_interface(token: []const u8) bool {
        const punctuation_tokens: []const u8 = "[]():;";
        const trimmed_token = std.mem.trim(u8, token, punctuation_tokens);
        const interface_map: []const []const u8 = &.{
            "wlan0", 
            "nl80211", 
        }; 
        for (interface_map) |interface| {
            if (std.mem.eql(u8, trimmed_token, interface)){
                return true; 
            }
        }
        return false; 
    }

    fn is_stopword(token: []const u8) bool {
        // 'gq' motion in neovim for formatting. 
        const stopword_map: []const []const u8 = &.{
            "me", "my", "myself", "we", "our", "ours", "ourselves", "you",
            "your", "yours", "yourself", "yourselves", "he", "him", "his",
            "himself", "she", "her", "hers", "herself", "it", "its", "itself",
            "they", "them", "their", "theirs", "themselves", "what", "which",
            "who", "whom", "this", "that", "these", "those", "am", "is", "are",
            "was", "were", "be", "been", "being", "have", "has", "had",
            "having", "do", "does", "did", "doing", "a", "an", "the", "and",
            "but", "if", "or", "because", "as", "until", "while", "of",
            "by", "for", "with", "about", "against", "between", "into",
            "through", "during", "before", "after", "above", "below", "to",
            "over", "under", "again", "further", "then", "once", "here",
            "there", "when", "where", "why", "how", "any", "both",
            "each", "few", "more", "most", "other", "some", "such", "no",
            "nor", "only", "own", "same", "so", "than", "too", "very",
            "can", "will", "just", "dont", "should", "now",
        };
        for (stopword_map) |stopword| {
            if (std.mem.eql(u8, stopword, token)){
                return true; 
            }
        }
        return false; 
    }

    /// When it ends in e.g., .conf or .service
    fn is_filetype(token: []const u8) ?FileToken {
        if(std.mem.endsWith(u8, token, ".conf")){
            return FileToken.Config;
        }
        if(std.mem.endsWith(u8, token, ".service")){
            return FileToken.Service;
        }
        if (std.mem.endsWith(u8, token, ".c")) return FileToken.Default;
        if (std.mem.endsWith(u8, token, ".txt")) return FileToken.Default;
        if (std.mem.endsWith(u8, token, ".log")) return FileToken.Default;
        if (std.mem.endsWith(u8, token, ".json")) return FileToken.Default;
        if (std.mem.endsWith(u8, token, ".zig")) return FileToken.Default;
        return null; 
    }

    fn is_version(token: []const u8) bool {
        if(std.mem.containsAtLeast(u8, token, 2, ".")) {
            if (std.mem.containsAtLeast(u8, token, 1, "-") and std.mem.indexOfScalar(u8, token, ':') == null){
                return true; 
            }
            const dot_index = std.mem.indexOfScalar(u8, token, '.');
            if (dot_index)  |i| {
                if (std.ascii.isDigit(token[i - 1]) and std.ascii.isDigit(token[i + 1])){
                    return true;
                }
            }
        }
        return false;
    }

    fn is_time(token: []const u8) bool {
        if (token.len >= 2){
            if (std.ascii.isDigit(token[1])){
                if (std.mem.containsAtLeast(u8, token, 1, ".") and std.ascii.isDigit(token[token.len - 2])) {
                    // std.debug.print("   → Found Bracket [<TIME>] token pattern\n", .{});
                    if (std.mem.count(u8, token, ":") < 2){
                        return true;
                    }
                }                    
            }
        }
        return false; 
    }

    /// Example format that could represent a device path: 6-0:1.0:
    /// Versus (version 1.50.1-2) → is_version...
    fn is_device_path(token: []const u8) bool {
        const bus_port: bool = bus_blk: {
            if(token.len > 5 and std.ascii.isDigit(token[0]) and std.mem.indexOfScalar(u8, token, '-') != null){
                const dash_idx = std.mem.indexOfScalar(u8, token, '-').?; 
                if (std.ascii.isDigit(token[dash_idx - 1]) and std.ascii.isDigit(token[dash_idx + 1])){
                    break :bus_blk true;  
                }
            }
            break :bus_blk false; 
        };
        const interface_version: bool = interface_blk: {
            if(token.len > 5 and std.mem.indexOfScalar(u8, token, '.') != null){
                const dot_idx = std.mem.indexOfScalar(u8, token, '.').?;
                if (std.ascii.isDigit(token[dot_idx - 1]) and std.ascii.isDigit(token[dot_idx + 1])){
                    break :interface_blk true; 
                }
            }
            break :interface_blk false; 
        };
        if (bus_port == true and interface_version == true and std.mem.containsAtLeast(u8, token, 1, ":")){
            return true; 
        }
        return false; 
    }

    /// If token has format: [bus]:[vendor_id]:[product_id].[instance]
    fn is_device_id(token: []const u8) bool {
        if (std.mem.containsAtLeast(u8, token, 2, ":") and std.mem.containsAtLeast(u8, token, 1, ".")){
            var dot_split = std.mem.splitScalar(u8, token, '.');
            // if (dot_split.len != 2) return error.InvalidFormat;
            const prefix = dot_split.first();  // "0003:0B05:19B6"
            const instance = dot_split.peek(); // "0002"
            var colon_split = std.mem.splitScalar(u8, prefix, ':'); 
            const bus_part = colon_split.first();
            const vendor_id_part = colon_split.next();
            const product_id_part = colon_split.next();
            std.debug.print("Found DeviceID: [bus = {s}]:[vendor_id = {s}]:[product_id = {s}].[instance = {s}]\n", .{bus_part, vendor_id_part.?, product_id_part.?, instance.?});

            if (instance != null and vendor_id_part != null and product_id_part != null){
                return true; 
            }else {
                return false; 
            }
        }
        return false; 
    }

    fn is_duration(token: []const u8) bool {
        const duration_map: []const []const u8 = &.{
            "ms", "Ms", "MS", "µs", "us", "ns", "Ns", 
            "s", "sec", "msec",
        };
        
        if (std.ascii.isDigit(token[0]) and std.mem.indexOfScalar(u8, token, '.') != null){

        }

        for (duration_map) |time_metric| {
            if (std.mem.endsWith(u8, token, time_metric)){
                std.debug.print("Found Time duraction metric: {s}\n", .{token});
                return true; 
            }
        }
    }
    
    /// Parse and check if tokens are digits and ends either: 'm', 'MB', 'mb', 'kB' or 'KB'.
    /// Which would map into the following tag: <SIZE>. 
    /// -----------------------------------------------
    /// Decimal (Base-10) prefixes — SI standard
    /// GB (Gigabyte) = 10⁹ bytes = 1,000,000,000 bytes
    /// MB (Megabyte) = 10⁶ bytes = 1,000,000 bytes
    /// kB (Kilobyte) = 10³ bytes = 1,000 bytes
    /// -----------------------------------------------
    /// Binary (Base-2) prefixes — IEC standard
    /// GiB (Gibibyte) = 2³⁰ bytes = 1,073,741,824 bytes
    /// MiB (Mebibyte) = 2²⁰ bytes = 1,048,576 bytes
    /// KiB (Kibibyte) = 2¹⁰ bytes = 1,024 bytes
    fn is_size(token: []const u8) bool {
        const metric_map: []const []const u8 = &.{
            "m", "M", "MB", "mb", "kB", "KB", 
            "GB", "gB", "gb",
            "GiB", "KiB", "MiB", "bit"
        };

        const alphabetic_part: ?[]const u8 = alphabetic_blk: {
            var count: usize = 0; 
            var alphabetic_found: bool = false; 
            var indexof_alphabetic: usize = 0; 
            for (token, 0..) |char, char_pos| {
                if (std.ascii.isAlphabetic(char)){
                    count += 1; 
                    if(alphabetic_found == false){
                        indexof_alphabetic = char_pos;
                        alphabetic_found = true; 
                    }
                }
            }
            if (count > 1 and std.ascii.isAlphabetic(token[token.len - 2]) and std.ascii.isAlphabetic(token[token.len - 1])){
                break :alphabetic_blk token[indexof_alphabetic..]; 
            }else if(count == 1 and std.ascii.isAlphabetic(token[token.len - 1])){
                break :alphabetic_blk token[indexof_alphabetic..]; 
            }
            break :alphabetic_blk null; 
        };
        
        if (std.ascii.isDigit(token[0]) and std.ascii.isAlphabetic(token[token.len - 1])){
            if(alphabetic_part) |alphabetic_token| {
                for (metric_map) |metric| {
                    // std.ascii.indexOfIgnoreCasePos(token, start_index: usize, needle: []const u8)        
                    if(std.ascii.eqlIgnoreCase(alphabetic_token, metric)){
                        std.debug.print("Found a metric <SIZE> token: {s}\n", .{token}); 
                        return true; 
                    }
                }
                return false; 
            }
        }
    }

    /// A token can be one of the following numeric types: 
    /// - Raw Digit, 
    /// - Inner Digit, wrapped inside punctuation tokens.
    /// - Time, 
    /// - Version Number, that has characteristic of using dots. E.g., 1.0.2. 
    fn is_numeric(token: []const u8) bool {
        const have_dots = std.mem.containsAtLeast(u8, token, 2, ".");
        const have_bracket = std.mem.containsAtLeast(u8, token, 1, "[");
        const have_end_parenthesis = std.mem.containsAtLeast(u8, token, 1, ")");

        // const have_colon = std.mem.endsWith(u8, token, ":"); 
        if (is_time(token)){
            std.debug.print("\n       → Found <TIME> token: {s}\n", .{token});
            return true;  
        }else if (is_device_id(token)){
            return true;  
        }else if (is_version(token)){
            std.debug.print("\n       → Found <VERSION> number token: {s}\n", .{token});
            return true; 
        } else if (token.len > 0 and std.ascii.isDigit(token[0]) and contain_digits_only(token) and !have_dots and !have_bracket and !have_end_parenthesis){
            //20-connectivity.conf
            // std.debug.print("contain_digits_only = {any}\n", .{contain_digits_only(token)});
            if (std.mem.count(u8, token, ":") < 2){
                std.debug.print("\n       → Found RAW DIGIT token: {s}\n", .{token});
                return true;
            }
            // std.debug.print("NOT RAW DIGIT GOT: {s}\n", .{token});
            // return true; 
        }
        return false; 
    }

    pub fn into_numeric(token: []const u8) ?NumericToken{
        if (PunctuationToken.tryFrom(token)) |punctuation| {
            // When inner value of a punctuation is a digit. 
            var punct = punctuation; 
            // var inner_tag = punct.inner_token(); 
            var inner_tag = punct.into_inner_token(); 
            _ = &inner_tag; 
            const inner_value = punct.value[0..punct.value.len - 1]; // Strip the punctuations 
            const punct_type = punct.kind;
            // std.debug.print("into_numeric() → punct.inner_token(): {any}\n", .{inner_tag.?});
            if (inner_tag != null and inner_tag.? == .NUMERIC){
                if (is_time(inner_value)){
                    // std.debug.print("       → Found punctuation: {s} + {s} token\n", .{@tagName(punct_type), "TIME"});
                    return NumericToken.Time; 
                }else if(is_device_id(inner_value)){
                    // [bus]:[vendor_id]:[product_id].[instance]
                    return NumericToken.DeviceID;
                }else if (is_version(inner_value)){
                    // std.debug.print("       → Found punctuation: {s} + {s} token\n", .{@tagName(punct_type), "VersionNumber"});
                    return NumericToken.VersionNumber;
                }else if (inner_value.len > 0 and std.ascii.isDigit(inner_value[0]) and std.ascii.isDigit(inner_value[inner_value.len - 1]) and contain_digits_only(inner_value)){
                    std.debug.print("       → Found punctuation: {s} + {s} token\n", .{@tagName(punct_type), "RAW DIGIT"});
                    return NumericToken.RawDigit; 
                }
            }
        }
        // std.debug.print("No Punctuation Token found inside (into_numeric): {s}\n", .{token});
        // When no punctuation was found. 
        if (is_time(token)){
            return NumericToken.Time; 
        }else if(is_device_id(token)){
            // [bus]:[vendor_id]:[product_id].[instance]
            return NumericToken.DeviceID;
        }else if(is_version(token)){
            return NumericToken.VersionNumber;
        }else if (token.len > 0 and std.ascii.isDigit(token[0]) and contain_digits_only(token)){
        // }else if (token.len > 0 and std.ascii.isDigit(token[0]) and std.mem.count(u8, token, ":") < 2){
            return NumericToken.RawDigit; 
        }
        
        // }else if (token.len > 0 and std.ascii.isDigit(token[0])){
        
        return null; 
    }

};


/// JSON format of a data log: 
/// {
///   "time": "1737130183015824",
///   "systemd_unit": "NetworkManager.service",
///   "code_file": "../NetworkManager/src/libnm-platform/nm-linux-platform.c",
///   "code_line": "6175",
///   "cmd_line": "/usr/bin/NetworkManager --no-daemon",
///   "priority": "3",
///   "pid": "66",
///   "log_level": "ERR",
///   "machine_id": "62a331abe1a14db989514df61a9f5ed1",
///   "log_id": "NetworkManager",
///   "message": "<error> [1737130183.0157] platform-linux: sysctl: failed to open '/proc/sys/net/ipv6/conf/wlan0/temp_valid_lft': (30) Read-only file system"
/// }
/// ---------------
/// The `time` field is the monotonic time, and is the point in time the entry was received by the journal in microseconds, formatted as a decimal string. 
/// Using the monotonic timer for logs, allow measuring durations between events. 
/// Monotonic time is useful for measuring elapsed times since boot (in microseconds).
pub const DataLog = struct {
    time: []const u8, 
    // time: i32, 
    systemd_unit: ?[]const u8,
    code_file: ?[]const u8,
    code_line: ?[]const u8,
    cmd_line: ?[]const u8,
    priority: []const u8, 
    pid: ?[]const u8, 
    log_level: ?[]const u8,  //@tagName(priority)
    machine_id: []const u8, 
    log_id: []const u8, 
    uuid_service: ?[]const u8, 
    transport: []const u8, 
    message: []const u8, 

    pub fn deinit(self: *DataLog, allocator: std.mem.Allocator) void {
        if (self.time.len > 0) allocator.free(self.time);
        if (self.systemd_unit) |systemd_unit| {
            if (systemd_unit.len > 0) allocator.free(self.systemd_unit.?);
        }
        if (self.code_file) |code_file| {
            if (code_file.len > 0) allocator.free(self.code_file.?);
        }
        if (self.code_line) |code_line| {
            if (code_line.len > 0) allocator.free(self.code_line.?);
        }
        if (self.cmd_line) |cmd_line| {
            if (cmd_line.len > 0) allocator.free(self.cmd_line.?);
        }
        if (self.priority.len > 0) allocator.free(self.priority);
        if (self.pid.len > 0) allocator.free(self.pid);
        if (self.pid) |pid| {
            if (pid.len > 0) allocator.free(self.pid.?);
        }
        if (self.log_level) |log_level| {
            if (log_level.len > 0) allocator.free(self.log_level.?);
        }
        if (self.machine_id.len > 0) allocator.free(self.machine_id);
        if (self.log_id.len > 0) allocator.free(self.log_id);
        if (self.uuid_service) |uuid| {
            if (uuid.len > 0) allocator.free(self.uuid_service.?);
        }
        if (self.transport.len > 0) allocator.free(self.transport);
        if (self.message.len > 0) allocator.free(self.message);

        // … free the rest of your []u8 (or other) fields here …
        // Finally zero them so double-free is impossible:
        self.time = &[_]u8{};
        self.systemd_unit = &[_]u8{};
        self.code_file = &[_]u8{};
        self.code_line = &[_]u8{};
        self.cmd_line = &[_]u8{};
        self.priority = &[_]u8{};
        self.pid = &[_]u8{};
        self.log_level = &[_]u8{};
        self.machine_id = &[_]u8{};
        self.log_id = &[_]u8{};
        self.uuid_service = &[_]u8{};
        self.transport = &[_]u8{};
        self.message = &[_]u8{};
    }
}; 

pub const AdjacentPair = struct {event: []const u8, response: []const u8};

/// This struct contains preprocessed log data. 
/// Containing the most important log data features. 
pub const ProcessedLog = struct {
    /// Monotonic time for measuring elapsed times since boot (µ-seconds).
    /// Its a feature that represent a Time-based encoding.
    /// E.g., Δt = timestamp[n] - timestamp[n-1], to extract temporal feature. 
    monotonic_time: u64, 
    // monotonic_time: f32, 
    message: []const u8, //TODO: - Change to []u8, for mutability!
    // message: []u8,
    priority: PriorityLevel, 
    syslog_id: []const u8, 
    /// The uuid, is a unique ID, for a certain service of the targeted log. 
    /// This is needed to identify a log, if further debugging is needed. 
    uuid: ?[]const u8, 

    /// The `transport` represent how the data was received to the logging journal. 
    /// syslog
    /// kernel
    /// journal
    /// stdout
    /// driver
    transport: []const u8, 

    /// Bigram Token pair of adjacent tokens (["authenticating", "->"], ["->", "associating"]). 
    /// Where e.g., a pair, could be a relationship of state events. In other words, 
    /// encoded event pair in a log message sequence. 
    adjacent_pair: ?AdjacentPair = null,

    /// Saved dynamic log parameters that have been replaced with a tag. 
    log_params: ?[]const u8 = null,

    pub fn into_matrix(self: ProcessedLog) void {
        _ = self; 
    }

    pub fn print(self: ProcessedLog, header: []const u8) void {
    // pub fn print(self: ProcessedLog, comptime header: []const u8) void {
        var writer = std.io.getStdOut().writer();
        
        writer.print("      {s}\n", .{header}) catch unreachable;
        writer.print("  Monotonic time: {d: <3}\n", .{self.monotonic_time}) catch unreachable;
        writer.print("  Priority: {s: <3}\n", .{@tagName(self.priority)}) catch unreachable;
        writer.print("  Syslog Id: {s: <3}\n", .{self.syslog_id}) catch unreachable;
        writer.print("  Transport Id: {s: <3}\n", .{self.transport}) catch unreachable;
        if (self.uuid != null){
            writer.print("  UUID: {s: <3}\n", .{self.uuid.?}) catch unreachable;
        }else {
            writer.print("  UUID: {s: <3}\n", .{"null"}) catch unreachable;
        }
        if (self.adjacent_pair != null){
            writer.print("  Adjacent Pair: {s: <3} -> {s: <3}\n", .{self.adjacent_pair.?.event, self.adjacent_pair.?.response}) catch unreachable;
        }else {
            writer.print("  Adjacent Pair: {s: <3}\n", .{"null"}) catch unreachable;
        }
        writer.print("  Message: {s: <3}\n", .{self.message}) catch unreachable;
        if (self.log_params) |params|{ 
            writer.print("  Saved Params: {s: <3}\n", .{params}) catch unreachable;
        }else {
            writer.print("  Saved Params: {s: <3}\n", .{"null"}) catch unreachable;
        }
        writer.print("      ------------\n", .{}) catch unreachable;
    }

    pub fn deinit(self: *ProcessedLog, allocator: std.mem.Allocator) void {
        if (self.message.len > 0) allocator.free(self.message);
        if (self.transport.len > 0) allocator.free(self.transport);
        if (self.syslog_id.len > 0) allocator.free(self.syslog_id);
        if (self.uuid) |uuid|{
            if (uuid.len > 0) allocator.free(self.uuid.?);
        } 
        if (self.adjacent_pair) |pair|{
            if (pair.event.len > 0) allocator.free(self.adjacent_pair.?.event);
            if (pair.response.len > 0) allocator.free(self.adjacent_pair.?.response);
        } 
        if (self.log_params) |params|{
            if (params.len > 0) allocator.free(self.log_params.?);
        }

        self.message   = &[_]u8{};
        self.uuid      = &[_]u8{};
        self.syslog_id = &[_]u8{};
        self.transport = &[_]u8{};
        self.adjacent_pair = null;
        self.log_params = null;
    }
};

pub const FilterOptions = struct {
    time_window: u8, 
    /// The window size, is a sliding window along the text sequence.
    /// Its how many word that is used based on the context of the surrounding words in a sentence.
    /// Another way to look at it, is in terms of `n-grams`: 
    /// E.g., bigrams (pair of words), trigrams(group of three words), etc...
    window_size: usize, 
    event_type: ?[]const u8, 
    /// Uniform and same lengt size for every log sentence. 
    sentence_length: usize, 

    /// `SortBy` - SortingOptions, how you want to filter the data. 
    pub const SortingOption = enum {
        EventType, 
        TimeStamp,
        Ascending,
        Descending, 
        Uniques,
    };
}; 

/// The `DataLoader`, is a generic type, that handle the logic of loading and preprocessing a dataset. 
/// When creating a new `DataLoader` type, you need to specify some comptime-known values such as: 
/// The data type of the numerical features, total number of samples, feature size of samples, number of ground truth labels, 
/// and the expected convention used (row-major or column-major). 
/// -----------------------------------------------------------------
/// An example of the data format for a system-log dataset would be: 
/// ```const input_logdata = [NumSamples][NumWordsPerSample][WordEmbeddingSize]f16{...};```
/// Which in mathematical terms would be a tensor with shape (B × N × D). 
/// Where each Samples ∈ ℝᴮˣᴺˣᴰ, B = Number of samples (B = Batches), N = Words per sample, D = Embedding Size. 
pub fn DataLoader(comptime T: type, comptime NumSample: usize, comptime FeatureSize: usize, comptime NumClasses: usize, comptime Convention: InputShapeConvention) type {
    return struct {
        // Represent the raw data before cleaned and pre-processed. 
        input_data: std.ArrayList(ProcessedLog),
        // input_data: std.json.Parsed([]DataLog),
        sample_count: usize = 0, 
        vocabulary: std.AutoHashMap(u16, []const T),
        
        const Self = @This();
        const DatasetMatrix = if (Convention == .RowSampleOrdering) Matrix(T, NumSample, FeatureSize) else Matrix(T, FeatureSize, NumSample); 

        pub const Metadata = struct {
            num_samples: usize = NumSample,
            /// input_dim = feature size for one sample. 
            input_dim: usize = FeatureSize, 
            /// Same as the number of unique output classes. E.g., One-hot encoding with 
            /// a column size of 2, have two unique classes. 
            output_dim: usize = NumClasses, 
            num_batches: ?usize = null,
        };

        /// Example format for the ground truth (true labels): 
        /// const true_labels = [_][2]f16{
        /// One-hot encoded target for 2 classes
        /// [2]f16{ 1.0, 0.0 }, // Class 0
        /// [2]f16{ 0.0, 1.0 }, // Class 1
        /// [2]f16{ 1.0, 0.0 }, // Class 0
        /// [2]f16{ 0.0, 1.0 }, // Class 1
        /// }; 
        pub const Dataset = struct {
            data: if (Convention == .RowSampleOrdering) [NumSample][FeatureSize]T else [FeatureSize][NumSample]T, 
            true_labels: if (Convention == .RowSampleOrdering) [NumSample][NumClasses]T else [NumClasses][NumSample]T, 
            iter_index: usize = 0, // Same as the next batch index.  
            batch_counter: usize = 0, 
            metadata: Metadata, 

            pub fn as_matrix(self: Dataset) DatasetMatrix {
                return DatasetMatrix.create(self.data); 
            }

            /// This will fetch the next batch from the internal dataset. 
            /// When it reaches the last batch, it will return null. 
            /// As an indicator that it is done processing the batch. 
            /// Hence will reset internal counter and indices to its initial values. 
            /// Recall that the size of the batch is the same as a sub-sample of the total number of samples. 
            pub fn next_batch(self: *Dataset, comptime SizeOfBatch: usize) 
                if (Convention == .RowSampleOrdering) ?struct{data: Matrix(T, SizeOfBatch, FeatureSize), y_true: Matrix(T, SizeOfBatch, NumClasses)}
                else ?struct{data: Matrix(T, FeatureSize, SizeOfBatch), y_true: Matrix(T, NumClasses, SizeOfBatch)}
            {

                // iter 0: 0 >= 2, iter 1: 1 >= 2, iter 2: 2 >= 2 → NULL.
                if (self.metadata.num_batches == null) {
                    self.metadata.num_batches = self.metadata.num_samples / SizeOfBatch;
                }   
                
                const num_batches = self.metadata.num_batches orelse {
                    return null;
                }; 

                // if (self.batch_counter % SizeOfBatch == 0) {
                if (self.iter_index >= num_batches - 1) {
                    self.iter_index = 0; 
                    // self.batch_counter = 0; 
                    return null;
                }

                const Dimension: struct{usize, usize} = if (Convention == .RowSampleOrdering) .{SizeOfBatch, FeatureSize} else .{FeatureSize, SizeOfBatch}; 
                const YDimension: struct{usize, usize} = if (Convention == .RowSampleOrdering) .{SizeOfBatch, NumClasses} else .{NumClasses, SizeOfBatch}; 

                var batch_sample = Matrix(T, Dimension[0], Dimension[1]){
                    .mat = undefined, 
                }; 
                var y_sample = Matrix(T, YDimension[0], YDimension[1]){
                    .mat = undefined, 
                }; 

                const batch_index: usize = self.iter_index * SizeOfBatch;  
                const stop_index: usize  = batch_index + SizeOfBatch; // Stop index: batch_index + SizeOfBatch, e.g., iter: 0 → 0 + 2, iter 1 → 2 + 2, iter 2 → 4 + 2. 
                std.debug.assert(stop_index <= self.data.len);
                std.debug.assert(stop_index <= self.true_labels.len);

                for (batch_index..stop_index) |i| {
                    batch_sample.mat[i] = self.data[i]; 
                    y_sample.mat[i] = self.true_labels[i];
                }
                self.iter_index += 1; 
                self.batch_counter += SizeOfBatch; 

                return .{.data = batch_sample, .y_true = y_sample};
            }

        };

        /// Loads a dataset file based on its path. 
        /// The file type, should be a json file, that we parse. 
        /// So we need to split based on the opening and closing brackets ({<CONTENT>...}). 
        pub fn init(allocator: std.mem.Allocator, data_path: []const u8, samples_to_read: ?usize) !Self {
            
            // const log_file = try std.fs.cwd().openFile(data_path, .{});
            // defer log_file.close();
            // const log_data = try log_file.readToEndAlloc(allocator, std.math.maxInt(usize));
            // var log_list = std.ArrayList([]const u8).init(allocator);
            _ = samples_to_read; 
            var log_list = std.ArrayList(ProcessedLog).init(allocator); 
            // defer log_list.deinit();

            const raw_logs = try parse_raw_log(allocator, data_path);
             
            defer raw_logs.deinit(); 
            // const parsed_logs = try allocator.alloc(ProcessedLog, raw_logs.value.len); 
             
            std.debug.print("Number of sample logs: {d}\n", .{raw_logs.value.len});
            for (raw_logs.value, 0..) |log, i| {
                const log_ref = &raw_logs.value[i];
                // defer allocator.free(raw_logs.value[i]);
                // const modified_log = try process_log(allocator, &log); 
                std.debug.print("Log ({d}) [\n", .{i});
                inline for (std.meta.fields(@TypeOf(log))) |field| {
                    const field_name = field.name; 
                    // std.debug.print(field.name ++ " {any}", .{@as(field.type, @field(log, field.name))});
                    if (field.type == ?[]const u8){
                        if (@field(log, field.name) == null){
                            std.debug.print("   {s}: {s}\n", .{field_name, "null"}); 
                        }else {
                            std.debug.print("   {s}: {s}\n", .{field_name, @as([]const u8, @field(log, field.name).?)}); 
                        }
                    }else {
                        std.debug.print("   {s}: {s}\n", .{field_name, @as([]const u8, @field(log, field.name))}); 
                    }
                }
                std.debug.print("]\n", .{});
                const modified_log = try process_log(allocator, log_ref); 
                try log_list.insert(i, modified_log); 
                // std.debug.print("Before free: \n", .{});
                // std.debug.dumpHex(log.message);
                // log_ref.deinit(allocator);
            }
            log_list.items[0].print("Log ArrayList[0]: '[");
            log_list.items[1].print("Log ArrayList[1]: '[");

            // const log_seq = try log_list.toOwnedSlice();
            return Self{
                .input_data = log_list, // free using: parsed_logs.deinit()
                .vocabulary = undefined,
            };
        }

        pub fn get_logbatch() void {

        }

        /// This would parse a json sample from a slice, and return the json.Parsed type. 
        /// Freeing the memory is done through the life-time of the return type `std.json.Parsed(T)`. 
        /// In order to prevent memory leaks. 
        /// The returner owns the memory and needs to free it. 
        pub fn parse_raw_log(allocator: std.mem.Allocator, path: []const u8) !std.json.Parsed([]DataLog) {
            //@compileError("Unable to parse into type '" ++ @typeName(T) ++ "'"),
            std.debug.print("Passed allocator arg ptr: {*}\n", .{&allocator}); 
            const log_file = try std.fs.cwd().readFileAlloc(allocator, path, std.math.maxInt(usize)); 
            defer allocator.free(log_file); 
            return std.json.parseFromSlice([]DataLog, allocator, log_file, .{.allocate = .alloc_always}); 
        }

        fn process_log(allocator: std.mem.Allocator, raw_log: *DataLog) !ProcessedLog {
            // const time_str = try allocator.dupe(u8, raw_log.*.time); 
            const raw_message = try allocator.dupe(u8, raw_log.*.message); 
            // const priority_val = try allocator.dupe(u8, raw_log.*.priority); 
            const syslog_id = try allocator.dupe(u8, raw_log.*.log_id); 
            const uuid = if (raw_log.uuid_service != null) try allocator.dupe(u8, raw_log.*.uuid_service.?) else null;
            const transport = try allocator.dupe(u8, raw_log.*.transport);  

            // 1. Lowercasing the log message. 
            // const lowercased_msg = std.ascii.lowerString(raw_message, raw_log.*.message);
            // Below yields: lowercased_msg points to: u8@7ffc3bb3a53a, raw_message points to: u8@7ffc3bb3a53a
            // std.debug.print("lowercased_msg points to: {*}, raw_message dupe points to: {*}\n", .{lowercased_msg.ptr, raw_message.ptr});

            // 2. Perform number replacement (replace numeric values with placeholder): "code 404" → "code <num>".

           
            return ProcessedLog{
                // .monotonic_time = try std.fmt.parseFloat(f32, time_str),
                // .monotonic_time = try std.fmt.parseInt(u64, time_str, 0b0),
                .monotonic_time = try std.fmt.parseInt(u64, raw_log.*.time, 0b0),
                // .message = lowercased_msg,
                .message = raw_message,
                // .priority = try PriorityLevel.from(priority_val),
                .priority = try PriorityLevel.from(raw_log.*.priority),
                .syslog_id = syslog_id, 
                .uuid = uuid, 
                .transport = transport, 
            }; 
        }

        /// E.g., Δt = timestamp[n] - timestamp[n-1], to extract temporal feature. 
        pub fn timeDeltaEncoding(allocator: std.mem.Allocator, timestamps: []u32) []u32 {
            // const len = timestamps.len;
            var deltas = std.ArrayList(u32).init(allocator);
            for (timestamps[1..], 0..) |t, i| {
                const delta = t - timestamps[i];
                _ = deltas.append(delta); // Normalize or bin if needed
            }
            return try deltas.toOwnedSlice();
        }
        
        pub fn input_dimension(self: Self) struct { usize, usize } {
            const nrows = self.input_data[0].len;
            const ncols = self.input_data[0][0..].len;
            return .{ nrows, ncols };
        }

        fn deinit(self: Self) void {
            _ = self;
        }

        fn normalize_format(log_message: []const u8, allocator: std.mem.Allocator) ![]u8{
            const normalization_buf = try std.ascii.allocLowerString(allocator, log_message); 
            defer allocator.free(normalization_buf); // Return owned memory, or free? 
            return normalization_buf; 
        }

        fn parse_process(log_message: []const u8, allocator: std.mem.Allocator) !void{
            var tokens = std.mem.tokenizeAny(u8, log_message, "  \n");
            var buf_modified: bool = false; 
            var temp_buffer: [150]u8 = undefined;
            // @memcpy(new_memory[old_len..][0..other_pair.tokens.len], other_pair.tokens.ptr[0..]);
            // var temp_buf = try allocator.alloc(u8, log_message.len); 

            while(tokens.next()) |token| {
                if(TokenType.from(token)) |token_type| {
                    std.debug.print("Token Received: {s}\n", .{token});
                    const parsed = token_type.parsePunctuationToken(allocator) catch |err| {
                        switch (err) {
                            error.FailedParsingGroupedToken => return err, 
                            error.OutOfMemory => return err, 
                            error.TokenMissingClosingPunctuation => {
                                // Execute handler for when token is missing closing punctuation
                                // merge_tag = token_tag; 
                                std.debug.print("Token Received before error: {s}\n", .{token});
                                return err; 
                            },
                            error.TokenMissingOpeningPunctuation => {
                                // Execute handler for when opening punctuation is missing. 
                                // token_type.mergePairedTokens(merge_tag, allocator); 
                                std.debug.print("Token Received before error: {s}\n", .{token});
                                return err; 
                            },
                            error.TokenTypeIsNotPunctuation => {
                                // Execute handle for Token types that are not punctuation. 
                                if (token_type.tryGetReplacement(token)) |replacement| {
                                    const owned_message = try std.mem.replaceOwned(u8, allocator, log_message, token, replacement);
                                    const new_len = std.mem.replace(u8, log_message, token, replacement, &temp_buffer); 
                                    std.debug.print("Token Before: {s}\n", .{log_message});
                                    std.debug.print("Token After: {s}\n", .{log_message[0..new_len]});
                                    buf_modified = true; 
                                    return owned_message; 
                                } 
                            }, 
                            else => token_type, 
                        }
                    
                    };
                    const replacement = parsed.toReplacementStr();
                    std.debug.print("Token Replacement: {s}\n", .{replacement});
                    
                }
            }
            // return temp_buf; 
        }

        /// During the variable_masking preprocess step, replacement of dynamic variables 
        /// and changing log variables are performed. 
        /// E.g., number replacement, would replace numeric values with placeholder: "code 404" → "code <num>".
        /// The purpose of the variable masking is to reduce the corpus size by representing text log messages 
        /// in a standardized format. Often logs can be grouped into event templates.
        /// Meaning logs that are similar in a textual-semantic sense often share the same tokens / words. 
        pub fn variable_masking(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.input_data.items.len == 0) return error.LogDataIsEmpty;
            
            const user_env = try std.process.getEnvVarOwned(allocator, "USER");
            defer allocator.free(user_env);

            for(self.input_data.items, 0..) |log, i| {
                if (log.message.len == 0) {
                    _ = self.input_data.orderedRemove(i);
                    continue;
                }
                // const log_message = log.message; 
                // var tokens = std.mem.tokenizeAny(u8, log.message, "  \n");


                // ==================================================
                // 1. Normalize message format: 
                // • Wrapped Punctuation should be treated as one token (contain whitespace). 
                //   E.g., splitting on whitespace: "(version 1.50.1-2)" → TokenMissingClosingPunctuation
                // •


                // ==================================================
                // 2. Next step we iterate over the distinct tokens in the normalized message format.
                //    This is done, by using the std.mem.tokenizeAny(u8, log.message, split_delim)

                // ==================================================
                // 3. Obtain the TokenType from the raw message, and execute parse_process.
                const parsed_owned = try parse_process(log.message, allocator); 
                                
                // var tokens = std.mem.tokenizeAny(u8, lowercase_msg, " ![]():;=,'\"");
                var tokens = std.mem.tokenizeAny(u8, lowercase_msg, " !;,'\"");
                // ==================================================

                // 3. Replace the variable with masked value (pre-defined tag). 

                // 4. Replace the ProcessedLog with the updated values for all log messages. 
                
            }
        }

        /// During the replace pre-process step, replacement of common numeric values and log variables are done. 
        /// E.g., number replacement, would replace numeric values with placeholder: "code 404" → "code <num>".
        fn replace_process(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.input_data.items.len == 0) return error.LogDataIsEmpty;

            const user_env = try std.process.getEnvVarOwned(allocator, "USER");
            defer allocator.free(user_env);

            for (self.input_data.items, 0..) |log, i| {
                if (log.message.len == 0) {
                    _ = self.input_data.orderedRemove(i);
                    continue;
                }

                var tokens = std.mem.tokenizeAny(u8, log.message, "  \n");
                var replacement_found = false;
                var manipulation_done = false;
                var merge_tag: ?TokenType = null;
                var msg_builder = std.ArrayList(u8).init(allocator);
                var statePair: ?AdjacentPair = null; 

                // Log parameters are the extracted value associated with a placeholder value.
                // E.g., token: (wlan0) → (<IFACE>), has the parameter value: wlan0. 
                var log_params = std.ArrayList(u8).init(allocator);
                defer msg_builder.deinit();
                defer log_params.deinit();
                var token_idx: usize = 0; 
                
                std.debug.print("\n---Beginning of Log token sequence ({d})---\n", .{i}); 
                std.debug.print("Initial message.log [BEFORE]: {s}\n", .{log.message});
                std.debug.print("Initial message.log len: {d}\n", .{log.message.len}); 
                if (TokenType.is_stackframe(tokens.buffer)){
                    std.debug.print("Log stack frame: {s}\n", .{tokens.buffer});
                    @panic("Found StackFrame Log Type!");
                }

                while (tokens.next()) |token| {
                    std.debug.print("\nToken({d}) - {s}\n", .{token_idx, token});
                    var tag: ?TokenType = null;
               
                    // If stackframe just continue for now! 
                    if (TokenType.is_stackframe(tokens.buffer)){
                        continue; 
                    }

                    //"<USER_NAME> : TTY=<TTY> ; PWD=<PATH> ; USER=<RUNAS> ; COMMAND=<CMD>"
                    if (std.mem.startsWith(u8, token, user_env)) {
                        std.debug.print("FOUND ENV!\n", .{});
                        tag = TokenType{.HOST = "<USERNAME>"};
                    }else if (TokenType.from(token)) |token_tag| {
                        if (@as(TokenTags, token_tag) == TokenTags.ASSOCIATION) {
                            var token_tag_copy = token_tag; 
                            token_tag_copy.setAssociationProperty(token, &tokens);
                            const assoc_val = token_tag_copy.ASSOCIATION.get_values(); 
                            std.debug.print("   → Association Value: ('{s}' → '{s}')\n", .{assoc_val.lhs, assoc_val.rhs});
                            statePair = AdjacentPair{.event = assoc_val.lhs, .response = assoc_val.rhs}; 
                            std.debug.print("AdjacentPair: {s}→{s}\n", .{statePair.?.event, statePair.?.response});
                        }
                        const parsed_token: TokenType = parsing_blk: {
                            // const grouped_token = token_tag.tryParseGroupedTokens(token, allocator) catch |err| {
                            const parsed = token_tag.parsePunctuationToken(allocator) catch |err| {
                                switch (err) {
                                    error.FailedParsingGroupedToken => return err, 
                                    error.OutOfMemory => return err, 
                                    error.TokenTypeIsNotPunctuation => break :parsing_blk token_tag, 
                                    error.TokenMissingClosingPunctuation => {
                                        merge_tag = token_tag; 
                                        // Run merge function → That would take the current token, 
                                        // and merge with the next token. 
                                        // return err; 
                                    },
                                    error.TokenMissingOpeningPunctuation => {
                                        // Run merge function → This time we take the current token
                                        // and merge with the previous token. 
                                        token_tag.mergePairedTokens(merge_tag, allocator); 
                                        // return err; 
                                    },
                                    else => break :parsing_blk token_tag, 
                                }
                                break :parsing_blk token_tag; // Return self as token_tag. 
                            };
                            break :parsing_blk parsed; // Return TokenType as PairedToken.  

                        };
                        tag = parsed_token; 
                        // tag = token_tag; 
                    }

                    // var replacement_str: []u8 = &[_]u8{};  
                    // defer if (replacement_str.len > 0) allocator.free(replacement_str);
                    // const punctuation_tokens: []const u8 = "  []():;<>->...";

                    const punctuation_tokens: []const u8 = ";,";
                    const trimmed_token = std.mem.trim(u8, token, punctuation_tokens);

                    if (tag) |token_type| {
                        // This branch would replace certain tokens based on the parser logic. 
                        const replacement_val = token_type.toReplacementStr(); 
                        if (@as(TokenTags, token_type) == TokenTags.ASSOCIATION) {
                                const assoc_val = token_type.ASSOCIATION.get_values(); 
                                const fmt_replace = try std.fmt.allocPrint(allocator, "{s} {s}", .{assoc_val.lhs, assoc_val.rhs});
                                defer allocator.free(fmt_replace); 
                                std.debug.print("       Mutable Replacement String: {s}\n", .{fmt_replace});
                        }
                        
                        if (!std.mem.eql(u8, replacement_val, "<REMOVE>")){
                            try msg_builder.appendSlice(replacement_val); 
                            try msg_builder.appendSlice(" ");
                            if (std.mem.eql(u8, replacement_val, "<FIX>")){
                                try log_params.appendSlice(token);
                                try log_params.appendSlice(", ");
                            }else {
                                try log_params.appendSlice(trimmed_token);
                                try log_params.appendSlice(", ");
                            }
                            std.debug.print("       Replacement Value: {s}\n", .{replacement_val});
                            // std.debug.print("       Token To Replace: {s}\n", .{token});
                            replacement_found = true;
                        }else {
                            std.debug.print("Found <REMOVE> or <FIX> tag, from token: {s}\n", .{token});
                        }
                        
                    }else {
                        // For token that is not handled by the parser, should be appended to the msg_builder. 
                        // These tokens are later part of the final corpus. 
                        var lower_buf: [100]u8 = undefined; 
                        const lowercased_token = std.ascii.lowerString(lower_buf[0..], trimmed_token);
                        try msg_builder.appendSlice(lowercased_token[0..trimmed_token.len]); 
                        try msg_builder.appendSlice(" ");
                        manipulation_done = true; 
                    }
                    token_idx += 1; 
                }

                if (replacement_found or manipulation_done) {
                    // var modified_buf = try allocator.alloc(u8, acc_length);
                    // @memcpy(modified_buf[0..], output_buffer[0..acc_length]); 
                    // const modified_buf = try msg_builder.toOwnedSlice();

                    const owned_statePair: ?AdjacentPair = adjacent: {
                        if (statePair) |states| {
                            break :adjacent AdjacentPair{
                                .event = try allocator.dupe(u8, states.event),
                                .response = try allocator.dupe(u8, states.response),
                            }; 
                        }
                        break :adjacent null; 
                    }; 
                    const updated_log = ProcessedLog{
                        .monotonic_time = log.monotonic_time,
                        .message = try msg_builder.toOwnedSlice(),
                        .priority = log.priority,
                        .uuid = if(log.uuid) |uuid_val| try allocator.dupe(u8, uuid_val) else null,
                        .syslog_id = try allocator.dupe(u8, log.syslog_id),
                        .transport = try allocator.dupe(u8, log.transport),
                        .adjacent_pair = owned_statePair,  
                        .log_params = try log_params.toOwnedSlice(), 
                    };
                    
                    std.debug.print("\n    Original Log Message → {s}\n", .{log.message});
                    std.debug.print("    New Log Message → {s}\n", .{updated_log.message});
                    std.debug.print("\n    Stored Log Message Params → {s}\n", .{log_params.items[0..]});
                    self.input_data.items[i].deinit(allocator); // Free old log data.
                    // _ = self.input_data.orderedRemove(i); 
                    self.input_data.items[i] = updated_log;
                }
                std.debug.print("---End of Log token sequence ({d})---\n\n", .{i}); 
            }
        }



        /// Here we would tokenize the message part of log samples into individual tokens or words. 
        /// Such as: "connection", "failed", "opened"...💩
        /// The caller own the returned memory, and needs to free it! 
        fn tokenize(_: Self, log_message: []const u8, allocator: std.mem.Allocator) ![][]const u8 {
            var tokens_arr = std.ArrayList([]const u8).init(allocator);
            defer tokens_arr.deinit();
            
            const normalization_buf = try allocator.alloc(u8, log_message.len);
            defer allocator.free(normalization_buf);
            const lowercase_msg = std.ascii.lowerString(normalization_buf, log_message);

            // var tokens = std.mem.tokenizeAny(u8, lowercase_msg, " []():;=,'\"");
            // var tokens = std.mem.tokenizeAny(u8, lowercase_msg, " ![]():;=,'\"");
            var tokens = std.mem.tokenizeAny(u8, lowercase_msg, " !;,'\"");
            if (TokenType.is_stackframe(tokens.buffer)){
                std.debug.print("Log stack frame: {s}\n", .{tokens.buffer});
                @panic("Found StackFrame Log Type!");
            }

            // std.debug.print("Token buffer (tokenizeAny) [BEFORE]: {s}\n\n", .{tokens.buffer});
            std.debug.print("Token buffer (tokenizeAny) [BEFORE]:\n", .{});
            while (tokens.next()) |token| {
                std.debug.print("   token: {s}\n", .{token});
                if (TokenType.is_stopword(token)){
                    std.debug.print("Found Stop-Word: '{s}' - Removing!\n", .{token});
                    continue; 
                }
                if(PunctuationToken.tryFrom(token)) |p| {
                    const token_part = p.getInnerSlice(); 
                    const closing_scalar: ?[]u8 = scalar_blk: {
                        if(p.kind == .ParenthesisClose){
                            break :scalar_blk try allocator.dupe(u8, ")");
                        }else if(p.kind == .Ellipsis){
                            break :scalar_blk try allocator.dupe(u8, "...");
                        }else if(p.kind == .SquareBracketClose){
                            break :scalar_blk try allocator.dupe(u8, "]");
                        }
                        break :scalar_blk null;
                    };
                    const opening_scalar: ?[]u8 = scalar_open: {
                        if (p.kind == .ParenthesisOpen) break :scalar_open try allocator.dupe(u8, "(");
                        if (p.kind == .SquareBracketOpen) break :scalar_open try allocator.dupe(u8, "[");
                        break :scalar_open null;
                    };
                    const wrapped_scalar: ?struct{opening: []u8, closing: []u8} = wrapped_blk: {
                        if (p.kind == .Parenthesis) break :wrapped_blk .{.opening = try allocator.dupe(u8, "("), .closing = try allocator.dupe(u8, ")")};
                        if (p.kind == .SquareBracket) break :wrapped_blk .{.opening = try allocator.dupe(u8, "["), .closing = try allocator.dupe(u8, "]")};
                        if (p.kind == .SingleQuote) break :wrapped_blk .{.opening = try allocator.dupe(u8, "'"), .closing = try allocator.dupe(u8, "'")};
                        break :wrapped_blk null;
                    };

                    if(opening_scalar) |scalar_open| {
                        try tokens_arr.append(scalar_open);
                        const copied = try allocator.dupe(u8, token_part);
                        try tokens_arr.append(copied);
                    }else if(closing_scalar) |scalar_close| {
                        const copied = try allocator.dupe(u8, token_part);
                        try tokens_arr.append(copied);
                        try tokens_arr.append(scalar_close);
                    }else if(wrapped_scalar) |wrapped| {
                        try tokens_arr.append(wrapped.opening);
                        const copied = try allocator.dupe(u8, token_part);
                        try tokens_arr.append(copied);
                        try tokens_arr.append(wrapped.closing);
                    }else if(p.kind == .AngledBracket or p.kind == .AngledBracketOpened or p.kind == .AngledBracketClosed){
                        // When we find a tagged token, we want to keep it as is. 
                        const copied = try allocator.dupe(u8, token_part);
                        try tokens_arr.append(copied);
                    }
                    
                    // if (std.mem.startsWith(u8, token, "(")) {
                    //     const scalar_copy = try allocator.dupe(u8, "(");
                    //     try tokens_arr.append(scalar_copy);
                    // }
                    // const copied = try allocator.dupe(u8, token_part);
                    // try tokens_arr.append(copied);
                    //
                    // if (closing_scalar) |end_scalar| try tokens_arr.append(end_scalar); 

                    // std.debug.print("Appended Token Array is now: {s}\n", .{tokens_arr.items[0..]});
                    // continue; 
                }else {
                    if (std.mem.endsWith(u8, token, ".") and std.mem.count(u8, token, ".") == 1){
                        std.debug.print("Found an ending dot punctuation: {s}\n", .{token});
                        const copied = try allocator.dupe(u8, token[0..token.len - 1]);
                        try tokens_arr.append(copied);
                        try tokens_arr.append(try allocator.dupe(u8, "."));
                    }else {
                        const copied = try allocator.dupe(u8, token);
                        try tokens_arr.append(copied);
                    }
                    // const copied = try allocator.dupe(u8, token);
                    // try tokens_arr.append(copied);
                }
                // const tok = normalize(raw_token);
                // try tokens_arr.append(token);
            }
            std.debug.print("   \n----Log Tokenization [INFO]----\n", .{});
            std.debug.print("Log Sequence Before Tokenization: {s}\n", .{log_message});
            std.debug.print("Tokenized Array: {s}\n", .{tokens_arr.items[0..]});
            std.debug.print("Log Sample Size in bytes: {}\n", .{log_message.len});
            std.debug.print("Log Sample, Number Of Tokens: {}\n", .{tokens_arr.items.len});
            // const owned_tokens = try tokens_arr.toOwnedSlice();
            return try tokens_arr.toOwnedSlice();
            // return tokens_arr; 
            
        }
        pub fn create_corpus(self: Self, allocator: *std.mem.Allocator) !std.AutoHashMap([]const u8, void) {
            var corpus = std.AutoHashMap([]const u8, void).init(allocator.*);
            var placeholder_tags = std.AutoHashMap([]const u8, usize).init(allocator.*); // keep track of the size of each unique tag that starts with <TAG_NAME>.
            defer placeholder_tags.deinit();
            var writer = std.io.getStdOut().writer();

            var stats: struct {log_count: usize, token_count: usize, unique_tokens: usize, avg_log_len: f32} = .{}; 
            writer.print("Number of Log Sequences: {}\n", .{self.input_data.items.len}) catch unreachable;
            if (self.input_data.items.len == 0) {
                return error.ListOfLogsWasEmpty;
            }
        
            for (self.input_data.items) |log_sample| {
                if (log_sample.message.len == 0) {
                    return error.MessageWasEmpty;
                }
                const tokens = try self.tokenize(log_sample, allocator);
                stats.log_count += 1; 
                stats.token_count += tokens.len; // Number of tokens per log. 
                
                for (tokens) |token| {
                    if (std.mem.startsWith(u8, token, "<")) {
                        const count = placeholder_tags.get(token) orelse 0;
                        _ = try placeholder_tags.put(token, count + 1);
                    }
                    const get_put = try corpus.getOrPut(token, {});
                    if (get_put.found_existing == false){
                        writer.print("Added New Token to Corpus: {s}\n", .{token}) catch unreachable;
                    }
                    // _ = try corpus.put(token, {});
                }
            }
            stats.unique_tokens = corpus.count();
            const avg_len: f32 = @as(f32,@floatFromInt(stats.token_count)) / @as(f32, @floatFromInt(self.input_data.items.len)); 
            stats.avg_log_len = avg_len; 
            writer.print("==== Tokenization Stats ====\n", .{}) catch unreachable;
            writer.print("Unique Placeholder Tags: \n", .{}) catch unreachable;
            var iter = placeholder_tags.iterator(); 
            while(iter.next()) |tag| {
                writer.print("  {s} Count: {d} \n", .{tag.key_ptr.*, tag.value_ptr.*}) catch unreachable;
            }
            return corpus;
        }

        pub fn groupby(_: Self, options: anytype) void{
            if(@typeInfo(@TypeOf(options)).@"struct".is_tuple == false){
                @compileError("Passing options to 'groupby' needs to be tuple (anonymous struct) type, found " ++ @typeName(@TypeOf(options))); 
            }
            // const arg_i = comptime std.meta.fieldIndex(@TypeOf(options), arg_name) orelse
            //     @compileError("no option with name '" ++ arg_name ++ "'");
            const arg_fields = @typeInfo(@TypeOf(options)).@"struct".fields; 
            
            inline for (arg_fields) |arg| {
                const arg_type = arg.type;
                const arg_name = arg.name; 
                const arg_value = arg.defaultValue(); 
                if (arg_value) |val| {
                    std.debug.print("Arg Type: {s}, Arg Name: {s}, Arg Value: {any}\n", .{@typeName(arg_type), arg_name, val}); 
                }else {
                    std.debug.print("Arg Type: {s}, Arg Name: {s}\n", .{@typeName(arg_type), arg_name});
                }
            }
        }

        /// This should print dataset information such as: 
        /// - Number of unique words (tokens). 
        /// - Number of NaNs (field with null values). 
        /// - Distribution and log count based on the specific priority level.  
        pub fn dataset_info(self: *Self, sort_filter: FilterOptions.SortingOption) void {
            if (sort_filter == .TimeStamp){
                var min_index: usize = 0; 
                // Sort using two index pointers, 'i' and 'j': 
                // Outer loop: checks the first element arr[i] → 
                // Inner loop checks for all elements j = i+1 with arr[i]. 
                // E.g., min_index = 0 → if (arr[j] < arr[min_index]) → min_index = j 
                // Next we find the second minimum comparing against i = 1, ..., i = n... 
                for (0..self.input_data.items.len - 1) |i|{
                    // std.debug.print("Log(i+1): {any}\n", .{self.input_data.items[self.input_data.items.len - 1]}); // Zero-based indexing take minus 1.  
                    min_index = i;

                    for (i..self.input_data.items.len) |j|{
                        if (self.input_data.items[j].monotonic_time < self.input_data.items[min_index].monotonic_time) {
                            // std.debug.print("New minimum at index({d}) with value({d})\n", .{i, self.input_data.items[j].monotonic_time});
                            min_index = j;  
                        }
                    }
                    const temp_log = self.input_data.items[i]; // log that should be swapped with [i+1]. 
                    self.input_data.items[i] = self.input_data.items[min_index]; 
                    self.input_data.items[min_index] = temp_log; 
                    // swap(arr[i], arr[min_idx]);
                }

                std.debug.print("AFTER ordering by monotonic time: \n", .{});
                for (self.input_data.items, 0..) |ordered_log, i| {
                    std.debug.print("At index: {d}, Time: {d}\n", .{i, ordered_log.monotonic_time});
                    // std.debug.print("At index: {d}, ", .{i});
                    // ordered_log.print("Log:");
                }
            }else if(sort_filter == .EventType){}
            else if (sort_filter == .Ascending){}
            else if (sort_filter == .Descending){}
            else if (sort_filter == .Uniques){}

        }

        /// Word embedding that reflect the importance of a word in a document,
        /// relative to a collection of documents (corpus).
        fn tf_idf_embedding(self: Self, token: []const u8) !void {
            _ = self;
            _ = token;
        }

        /// This should not return void but should return the preprocessed
        /// word embedding data as a matrix containing N number vector of words.
        pub fn get_embedding_matix() void {}

        /// Perform word embedding using techniques such as `Word2Vec`.
        /// Numerical encoding such that words similar are closer to each other,
        /// in a defined vector space.
        fn word_embedding() !void {}

        fn feature_extraction(_: Self, filters: ?FilterOptions) ProcessedLog {
            // Time feature 1: since_last_<event> Duration since a specific prior event
            // Time feature 2: event_rate - Events per unit time
            // std.meta.stringToEnum → parsing.
            // std.fmt.parseFloat → parsing. 
            const log = ProcessedLog{};
            _ = filters; 
            _ = log;              
            // std.mem.replace(comptime T: type, input: []const T, needle: []const T, replacement: []const T, output: []T);
            // std.mem.indexOf(comptime T: type, haystack: []const T, needle: []const T); 
            // std.fmt.parseFloat(f32, parsed_logs.value);
            // std.mem.sort(@TypeOf(parsed_logs.value), parsed_logs.value, std.sort.asc(f32)); 
        }


        /// Involves parsing the log data, by calling comming preprocessing methods such as:
        /// - Back of Words (BoW),
        /// - TF-IDF (Term Frequency Inverse Document Frequency), 
        /// - Tokenization (split logs into tokens),
        /// - Lowercasing,
        /// - Lemmatization,
        /// - Number replacement (replace numeric values with placeholder): "code 404" → "code <num>".
        fn preprocess(self: Self) !void {
            // 1. Lowercasing + punctuation stripping
            // 2. Split each sequence log into substrings (words)
            // 3. Recombine substrings into tokens (ngrams)
            // 4. Indexing tokens (unique int value with each token)
            // 5. Transform each sequence log using the index into vector.
            try self.tokenize();
            try word_embedding();
        }
    };
}
test "dataloader-read-test" {

    const params = model.HyperParameters{
        .input_size = 2,
        .input_shape = .RowSampleOrdering,
        .optimizer = optimizer.OptimizerType.Adam,
        .learning_rate = 0.001,
        .gamma = 0.1,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 100,
        .alpha = 0.01,
    };
    _ = params; 

    const input_data = [_][3]f16{
        // 4 samples with 3 input features each
        [3]f16{ 0.1, 0.2, 0.3 },
        [3]f16{ 0.9, 0.8, 0.7 },
        [3]f16{ 0.4, 0.5, 0.6 },
        [3]f16{ 0.6, 0.5, 0.4 },
    };

    const true_labels = [_][2]f16{
        // One-hot encoded target for 2 classes
        [2]f16{ 1.0, 0.0 }, // Class 0
        [2]f16{ 0.0, 1.0 }, // Class 1
        [2]f16{ 1.0, 0.0 }, // Class 0
        [2]f16{ 0.0, 1.0 }, // Class 1
    }; 
    
    const NumSamples = 2; 
    const NumWordsPerSample = 4; 
    const WordEmbeddingSize = 3; 

    const input_logdata = [NumSamples][NumWordsPerSample][WordEmbeddingSize]f16{
        // 4 samples with 3 input features each
        [_][3]f16{
            [3]f16{ 0.1, 0.2, 0.3 },
            [3]f16{ 0.9, 0.8, 0.7 },
            [3]f16{ 0.4, 0.5, 0.6 },
            [3]f16{ 0.6, 0.5, 0.4 },
        }, 
        [_][3]f16{
            [3]f16{ 0.1, 0.2, 0.3 },
            [3]f16{ 0.9, 0.8, 0.7 },
            [3]f16{ 0.4, 0.5, 0.6 },
            [3]f16{ 0.6, 0.5, 0.4 },
        },
    };

    _ = input_logdata; 
         
    //TODO: - Fix logic to distinguish between number of samples vs batch size. 
    // Where batch size has to be even divisable with number of samples. 

    const num_samples: usize = input_data.len;
    const input_dim = 3; // input_dim = feature size for one sample. 
    const num_classes: usize = true_labels.len; 
    const output_dim = num_classes; // One-hot encoded, for 2 classes. 
    // const batch_size = 2; // Same as a sub-sample of the total num_samples.
    // const num_batches = num_samples / batch_size;
    
    // const manager = try DataLoader(u8).init(alloc, "log_data/log_warn.txt");
    // try manager.tokenize();

    const FixedBufferSize: usize = 20000; 
    var buffer: [FixedBufferSize]u8 = undefined; 
    var fba = std.heap.FixedBufferAllocator.init(&buffer); 
    const allocator = fba.allocator(); 
    _ = allocator; 
    // const test_allocator = std.testing.allocator_instance.allocator();  
    const test_allocator = std.testing.allocator_instance.allocator();  
    var temp_buf = std.ArrayList([][]const u8).init(test_allocator);
    // const fail_allocator = std.testing.failing_allocator;

    var DataLoaderType = try DataLoader(f16, num_samples, input_dim, output_dim, .RowSampleOrdering).init(test_allocator, "log_data/test_data.json", null); 
    // var DataLoaderType = try DataLoader(f16, num_samples, input_dim, output_dim, .RowSampleOrdering).init(test_allocator, "log_data/log_testdata.json", null); 
    defer DataLoaderType.input_data.deinit();

    
    try std.testing.expect(TokenType.is_mac_addr("16:6A:54:F9:6F:9D") == true); 
    // Example: `192.168.0.1 ` or `127.0.0.1:8080` with port. → IPv4
    try std.testing.expect(TokenType.is_ip_addr("192.168.0.1") == true); 
    try std.testing.expect(TokenType.is_ip_addr("127.0.0.1:8080") == true); 

    try DataLoaderType.replace_process(test_allocator);

    // DataLoaderType.dataset_info(.TimeStamp); 
    // DataLoaderType.groupby(.{1.0, "Hello", false, FilterOptions.SortingOption.TimeStamp}); 

    for (DataLoaderType.input_data.items, 0..) |*log, i| {
        std.debug.print("\n======Start of Log({d}) Tokenization======\n", .{i});
        const log_header = try std.fmt.allocPrint(test_allocator, "---Log data({d})---", .{i});
        defer test_allocator.free(log_header); 
        
        log.*.print(log_header); 
        const tokens = try DataLoaderType.tokenize(log.*.message, test_allocator);
        std.debug.print("Number of Tokens in Log: {d}\n", .{tokens.len});
        defer {
            for(tokens) |log_tokens| {
                test_allocator.free(log_tokens);
            }
            test_allocator.free(tokens);
        }

        _ = try temp_buf.append(tokens);
        
        std.debug.print("\n======End of Log({d}) Tokenization======\n", .{i});
        log.deinit(test_allocator);
    }
    temp_buf.deinit();

}


test "parsing-test" {
    // const num_samples: usize = 4;
    // const input_dim = 3; // input_dim = feature size for one sample. 
    // const num_classes: usize = 2;
    // const output_dim = num_classes; // One-hot encoded, for 2 classes. 

    const test_allocator = std.testing.allocator_instance.allocator();  

    // var DataLoaderType = try DataLoader(f16, num_samples, input_dim, output_dim, .RowSampleOrdering).init(test_allocator, "log_data/test_data.json", null); 
    // var DataLoaderType = try DataLoader(f16, num_samples, input_dim, output_dim, .RowSampleOrdering).init(test_allocator, "log_data/log_testdata.json", null); 
    // defer DataLoaderType.input_data.deinit();
    // try DataLoaderType.replace_process(test_allocator);
     
    try std.testing.expect(TokenType.is_mac_addr("16:6A:54:F9:6F:9D") == true); 

    // Example: `192.168.0.1 ` or `127.0.0.1:8080` with port. → IPv4
    try std.testing.expect(TokenType.is_ip_addr("192.168.0.1") == true); 
    try std.testing.expect(TokenType.is_ip_addr("127.0.0.1:8080") == true); 

    //test case: 
    const test_cases: []const []const u8 = &.{
        "(boot:37e23cab-a2ef-4fbd-9904-b68acea03eda)", // Desired: ...? 
        "(lib: 20-connectivity.conf)" // Desired: ...?
    }; 
    // const a = [3]i32{ 1, 2, 3 };
    // const c: [3]i32 = .{ 7, 8, 9 };
    // Use: var arr = [_]T{...}; and arr[0..] to get a mutable slice.

    var expected_tokens = [_][3]TokenType{
        // [_]TokenType{ .{ .x = 3, .y = 3 }, .{ .x = 4, .y = 4 }, .{ .x = 2, .y = 2 } }
        [_]TokenType{ 
            TokenType{.DEVICE = "boot"},
            TokenType{.PUNCTUATION = PunctuationToken{ .kind = .Colon, .value = ":" }},
            TokenType{.DYNAMIC = "37e23cab-a2ef-4fbd-9904-b68acea03eda"},
        },
        [_]TokenType{ 
            TokenType{.ALPHABETIC = "lib"},
            TokenType{.PUNCTUATION = PunctuationToken{ .kind = .Colon, .value = ":" }},
            TokenType{.FILE = .Config},
        }
    };

    const expected_result: [2]TokenType = .{
        TokenType{.PAIRED = .{
            .kind = .Parenthesis,
            .tokens = expected_tokens[0][0..],
        }},
        TokenType{.PAIRED = .{
            .kind = .Parenthesis,
            .tokens = expected_tokens[1][0..],
        }},
    };

    _ = expected_result; 

    for (test_cases, 0..) |token, i| {
        const parsed_token = TokenType.from(token); 
        std.debug.print("Parsing token: {s}\n", .{token}); 
        // const parsed_result = try PunctuationToken.tryParseGroupedTokens(token, .Parenthesis, test_allocator); 
        if (parsed_token) |parsed| {
            const parsed_result = try parsed.tryParseGroupedTokens(token, test_allocator); 
            std.debug.print("\nResulting Parsed Token (tryParseGroupedTokens):\n", .{}); 
            if (@as(TokenTags, parsed_result) == TokenTags.PAIRED){
                const pair_kind = parsed_result.PAIRED.kind; 
                const token_slice = parsed_result.PAIRED.tokens; 
                std.debug.print("Paired Kind: {s}\n", .{@tagName(pair_kind)}); 
                std.debug.print("-----------------\n", .{});
                for (token_slice) |tok| {
                    const output_str = tok.toReplacementStr();     
                    const output_type = @as(TokenTags, tok); 
                    std.debug.print("Replacement String: {s}\n", .{output_str}); 
                    std.debug.print("Tag Type: {s}\n", .{@tagName(output_type)}); 
                }
                std.debug.print("-----------------\n", .{});
            }
            std.debug.print("====END OF TEST CASE({d})====\n\n", .{i});
            // try std.testing.expect(@TypeOf(parsed_result) == @TypeOf(expected_result[i])); 
            test_allocator.free(parsed_result.PAIRED.tokens); 
        }

    }

}



