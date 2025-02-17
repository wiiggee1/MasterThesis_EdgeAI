pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const wchar_t = c_int;
pub const ptrdiff_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8) = @import("std").mem.zeroes(c_longlong),
    __clang_max_align_nonce2: c_longdouble align(8) = @import("std").mem.zeroes(c_longdouble),
};
pub const wint_t = c_uint;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __int_least8_t = i8;
pub const __uint_least8_t = u8;
pub const __int_least16_t = c_short;
pub const __uint_least16_t = c_ushort;
pub const __int_least32_t = c_int;
pub const __uint_least32_t = c_uint;
pub const __int_least64_t = c_longlong;
pub const __uint_least64_t = c_ulonglong;
pub const __intmax_t = c_longlong;
pub const __uintmax_t = c_ulonglong;
pub const __intptr_t = c_int;
pub const __uintptr_t = c_uint;
pub const __blkcnt_t = c_long;
pub const __blksize_t = c_long;
pub const __fsblkcnt_t = __uint64_t;
pub const __fsfilcnt_t = __uint32_t;
pub const _off_t = c_long;
pub const __pid_t = c_int;
pub const __dev_t = c_short;
pub const __uid_t = c_ushort;
pub const __gid_t = c_ushort;
pub const __id_t = __uint32_t;
pub const __ino_t = c_ushort;
pub const __mode_t = __uint32_t;
pub const _off64_t = c_longlong;
pub const __off_t = _off_t;
pub const __loff_t = _off64_t;
pub const __key_t = c_long;
pub const _fpos_t = c_long;
pub const __size_t = c_uint;
pub const _ssize_t = c_int;
pub const __ssize_t = _ssize_t;
const union_unnamed_1 = extern union {
    __wch: wint_t,
    __wchb: [4]u8,
};
pub const _mbstate_t = extern struct {
    __count: c_int = @import("std").mem.zeroes(c_int),
    __value: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
};
pub const _iconv_t = ?*anyopaque;
pub const __clock_t = c_ulong;
pub const __time_t = __int_least64_t;
pub const __clockid_t = c_ulong;
pub const __daddr_t = c_long;
pub const __timer_t = c_ulong;
pub const __sa_family_t = __uint8_t;
pub const __socklen_t = __uint32_t;
pub const __nl_item = c_int;
pub const __nlink_t = c_ushort;
pub const __suseconds_t = c_long;
pub const __useconds_t = c_ulong;
pub const struct___va_list_tag_2 = extern struct {
    __va_stk: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    __va_reg: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    __va_ndx: c_int = @import("std").mem.zeroes(c_int),
};
pub const __builtin_va_list = struct___va_list_tag_2;
pub const __va_list = __builtin_va_list;
pub const __ULong = c_ulong;
pub const struct___lock = opaque {};
pub const _LOCK_T = ?*struct___lock;
pub extern fn __retarget_lock_init(lock: [*c]_LOCK_T) void;
pub extern fn __retarget_lock_init_recursive(lock: [*c]_LOCK_T) void;
pub extern fn __retarget_lock_close(lock: _LOCK_T) void;
pub extern fn __retarget_lock_close_recursive(lock: _LOCK_T) void;
pub extern fn __retarget_lock_acquire(lock: _LOCK_T) void;
pub extern fn __retarget_lock_acquire_recursive(lock: _LOCK_T) void;
pub extern fn __retarget_lock_try_acquire(lock: _LOCK_T) c_int;
pub extern fn __retarget_lock_try_acquire_recursive(lock: _LOCK_T) c_int;
pub extern fn __retarget_lock_release(lock: _LOCK_T) void;
pub extern fn __retarget_lock_release_recursive(lock: _LOCK_T) void;
pub const _flock_t = _LOCK_T;
pub const struct___sbuf = extern struct {
    _base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _size: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct___sFILE = extern struct {
    _p: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _r: c_int = @import("std").mem.zeroes(c_int),
    _w: c_int = @import("std").mem.zeroes(c_int),
    _flags: c_short = @import("std").mem.zeroes(c_short),
    _file: c_short = @import("std").mem.zeroes(c_short),
    _bf: struct___sbuf = @import("std").mem.zeroes(struct___sbuf),
    _lbfsize: c_int = @import("std").mem.zeroes(c_int),
    _data: [*c]struct__reent = @import("std").mem.zeroes([*c]struct__reent),
    _cookie: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _read: ?*const fn ([*c]struct__reent, ?*anyopaque, [*c]u8, c_int) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct__reent, ?*anyopaque, [*c]u8, c_int) callconv(.c) c_int),
    _write: ?*const fn ([*c]struct__reent, ?*anyopaque, [*c]const u8, c_int) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct__reent, ?*anyopaque, [*c]const u8, c_int) callconv(.c) c_int),
    _seek: ?*const fn ([*c]struct__reent, ?*anyopaque, _fpos_t, c_int) callconv(.c) _fpos_t = @import("std").mem.zeroes(?*const fn ([*c]struct__reent, ?*anyopaque, _fpos_t, c_int) callconv(.c) _fpos_t),
    _close: ?*const fn ([*c]struct__reent, ?*anyopaque) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct__reent, ?*anyopaque) callconv(.c) c_int),
    _ub: struct___sbuf = @import("std").mem.zeroes(struct___sbuf),
    _up: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _ur: c_int = @import("std").mem.zeroes(c_int),
    _ubuf: [3]u8 = @import("std").mem.zeroes([3]u8),
    _nbuf: [1]u8 = @import("std").mem.zeroes([1]u8),
    _lb: struct___sbuf = @import("std").mem.zeroes(struct___sbuf),
    _blksize: c_int = @import("std").mem.zeroes(c_int),
    _offset: _off_t = @import("std").mem.zeroes(_off_t),
    _lock: _flock_t = @import("std").mem.zeroes(_flock_t),
    _mbstate: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _flags2: c_int = @import("std").mem.zeroes(c_int),
};
pub const __FILE = struct___sFILE;
pub const struct___locale_t = opaque {};
pub const struct__Bigint = extern struct {
    _next: [*c]struct__Bigint = @import("std").mem.zeroes([*c]struct__Bigint),
    _k: c_int = @import("std").mem.zeroes(c_int),
    _maxwds: c_int = @import("std").mem.zeroes(c_int),
    _sign: c_int = @import("std").mem.zeroes(c_int),
    _wds: c_int = @import("std").mem.zeroes(c_int),
    _x: [1]__ULong = @import("std").mem.zeroes([1]__ULong),
};
pub const struct__mprec = extern struct {
    _result: [*c]struct__Bigint = @import("std").mem.zeroes([*c]struct__Bigint),
    _result_k: c_int = @import("std").mem.zeroes(c_int),
    _p5s: [*c]struct__Bigint = @import("std").mem.zeroes([*c]struct__Bigint),
    _freelist: [*c][*c]struct__Bigint = @import("std").mem.zeroes([*c][*c]struct__Bigint),
};
pub const struct__rand48 = extern struct {
    _seed: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    _mult: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    _add: c_ushort = @import("std").mem.zeroes(c_ushort),
    _rand_next: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub const struct___tm = extern struct {
    __tm_sec: c_int = @import("std").mem.zeroes(c_int),
    __tm_min: c_int = @import("std").mem.zeroes(c_int),
    __tm_hour: c_int = @import("std").mem.zeroes(c_int),
    __tm_mday: c_int = @import("std").mem.zeroes(c_int),
    __tm_mon: c_int = @import("std").mem.zeroes(c_int),
    __tm_year: c_int = @import("std").mem.zeroes(c_int),
    __tm_wday: c_int = @import("std").mem.zeroes(c_int),
    __tm_yday: c_int = @import("std").mem.zeroes(c_int),
    __tm_isdst: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct__on_exit_args = extern struct {
    _fnargs: [32]?*anyopaque = @import("std").mem.zeroes([32]?*anyopaque),
    _dso_handle: [32]?*anyopaque = @import("std").mem.zeroes([32]?*anyopaque),
    _fntypes: __ULong = @import("std").mem.zeroes(__ULong),
    _is_cxa: __ULong = @import("std").mem.zeroes(__ULong),
};
pub const struct__atexit = extern struct {
    _next: [*c]struct__atexit = @import("std").mem.zeroes([*c]struct__atexit),
    _ind: c_int = @import("std").mem.zeroes(c_int),
    _fns: [32]?*const fn () callconv(.c) void = @import("std").mem.zeroes([32]?*const fn () callconv(.c) void),
    _on_exit_args_ptr: [*c]struct__on_exit_args = @import("std").mem.zeroes([*c]struct__on_exit_args),
};
pub const struct__glue = extern struct {
    _next: [*c]struct__glue = @import("std").mem.zeroes([*c]struct__glue),
    _niobs: c_int = @import("std").mem.zeroes(c_int),
    _iobs: [*c]__FILE = @import("std").mem.zeroes([*c]__FILE),
};
pub const struct__misc_reent = extern struct {
    _strtok_last: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _mblen_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _wctomb_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _mbtowc_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _l64a_buf: [8]u8 = @import("std").mem.zeroes([8]u8),
    _getdate_err: c_int = @import("std").mem.zeroes(c_int),
    _mbrlen_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _mbrtowc_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _mbsrtowcs_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _wcrtomb_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
    _wcsrtombs_state: _mbstate_t = @import("std").mem.zeroes(_mbstate_t),
};
pub const struct__reent = extern struct {
    _errno: c_int = @import("std").mem.zeroes(c_int),
    _stdin: [*c]__FILE = @import("std").mem.zeroes([*c]__FILE),
    _stdout: [*c]__FILE = @import("std").mem.zeroes([*c]__FILE),
    _stderr: [*c]__FILE = @import("std").mem.zeroes([*c]__FILE),
    _inc: c_int = @import("std").mem.zeroes(c_int),
    _emergency: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _reserved_0: c_int = @import("std").mem.zeroes(c_int),
    _reserved_1: c_int = @import("std").mem.zeroes(c_int),
    _locale: ?*struct___locale_t = @import("std").mem.zeroes(?*struct___locale_t),
    _mp: [*c]struct__mprec = @import("std").mem.zeroes([*c]struct__mprec),
    __cleanup: ?*const fn ([*c]struct__reent) callconv(.c) void = @import("std").mem.zeroes(?*const fn ([*c]struct__reent) callconv(.c) void),
    _gamma_signgam: c_int = @import("std").mem.zeroes(c_int),
    _cvtlen: c_int = @import("std").mem.zeroes(c_int),
    _cvtbuf: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _r48: [*c]struct__rand48 = @import("std").mem.zeroes([*c]struct__rand48),
    _localtime_buf: [*c]struct___tm = @import("std").mem.zeroes([*c]struct___tm),
    _asctime_buf: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _sig_func: [*c]?*const fn (c_int) callconv(.c) void = @import("std").mem.zeroes([*c]?*const fn (c_int) callconv(.c) void),
    _reserved_6: [*c]struct__atexit = @import("std").mem.zeroes([*c]struct__atexit),
    _reserved_7: struct__atexit = @import("std").mem.zeroes(struct__atexit),
    _reserved_8: struct__glue = @import("std").mem.zeroes(struct__glue),
    __sf: [*c]__FILE = @import("std").mem.zeroes([*c]__FILE),
    _misc: [*c]struct__misc_reent = @import("std").mem.zeroes([*c]struct__misc_reent),
    _signal_buf: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub extern var __sf: [3]__FILE;
pub extern var __sglue: struct__glue;
pub extern fn __assert([*c]const u8, c_int, [*c]const u8) noreturn;
pub extern fn __assert_func([*c]const u8, c_int, [*c]const u8, [*c]const u8) noreturn;
pub extern var _impure_ptr: [*c]struct__reent;
pub extern var _impure_data: struct__reent;
pub extern fn __getreent() [*c]struct__reent;
pub extern var __atexit: [*c]struct__atexit;
pub extern var __atexit0: struct__atexit;
pub extern var __stdio_exit_handler: ?*const fn () callconv(.c) void;
pub extern fn _reclaim_reent([*c]struct__reent) void;
pub extern fn _fwalk_sglue([*c]struct__reent, ?*const fn ([*c]struct__reent, [*c]__FILE) callconv(.c) c_int, [*c]struct__glue) c_int;
pub const div_t = extern struct {
    quot: c_int = @import("std").mem.zeroes(c_int),
    rem: c_int = @import("std").mem.zeroes(c_int),
};
pub const ldiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub const lldiv_t = extern struct {
    quot: c_longlong = @import("std").mem.zeroes(c_longlong),
    rem: c_longlong = @import("std").mem.zeroes(c_longlong),
};
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn __locale_mb_cur_max() c_int;
pub extern fn abort() noreturn;
pub extern fn abs(c_int) c_int;
pub extern fn arc4random() __uint32_t;
pub extern fn arc4random_uniform(__uint32_t) __uint32_t;
pub extern fn arc4random_buf(?*anyopaque, usize) void;
pub extern fn atexit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoff(__nptr: [*c]const u8) f32;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn _atoi_r([*c]struct__reent, __nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn _atol_r([*c]struct__reent, __nptr: [*c]const u8) c_long;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, _compar: __compar_fn_t) ?*anyopaque;
pub extern fn calloc(usize, usize) ?*anyopaque;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn free(?*anyopaque) void;
pub extern fn getenv(__string: [*c]const u8) [*c]u8;
pub extern fn _getenv_r([*c]struct__reent, __string: [*c]const u8) [*c]u8;
pub extern fn _findenv([*c]const u8, [*c]c_int) [*c]u8;
pub extern fn _findenv_r([*c]struct__reent, [*c]const u8, [*c]c_int) [*c]u8;
pub extern var suboptarg: [*c]u8;
pub extern fn getsubopt([*c][*c]u8, [*c]const [*c]u8, [*c][*c]u8) c_int;
pub extern fn labs(c_long) c_long;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn malloc(usize) ?*anyopaque;
pub extern fn mblen([*c]const u8, usize) c_int;
pub extern fn _mblen_r([*c]struct__reent, [*c]const u8, usize, [*c]_mbstate_t) c_int;
pub extern fn mbtowc(noalias [*c]wchar_t, noalias [*c]const u8, usize) c_int;
pub extern fn _mbtowc_r([*c]struct__reent, noalias [*c]wchar_t, noalias [*c]const u8, usize, [*c]_mbstate_t) c_int;
pub extern fn wctomb([*c]u8, wchar_t) c_int;
pub extern fn _wctomb_r([*c]struct__reent, [*c]u8, wchar_t, [*c]_mbstate_t) c_int;
pub extern fn mbstowcs(noalias [*c]wchar_t, noalias [*c]const u8, usize) usize;
pub extern fn _mbstowcs_r([*c]struct__reent, noalias [*c]wchar_t, noalias [*c]const u8, usize, [*c]_mbstate_t) usize;
pub extern fn wcstombs(noalias [*c]u8, noalias [*c]const wchar_t, usize) usize;
pub extern fn _wcstombs_r([*c]struct__reent, noalias [*c]u8, noalias [*c]const wchar_t, usize, [*c]_mbstate_t) usize;
pub extern fn mkdtemp([*c]u8) [*c]u8;
pub extern fn mkstemp([*c]u8) c_int;
pub extern fn mkstemps([*c]u8, c_int) c_int;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn _mkdtemp_r([*c]struct__reent, [*c]u8) [*c]u8;
pub extern fn _mkostemp_r([*c]struct__reent, [*c]u8, c_int) c_int;
pub extern fn _mkostemps_r([*c]struct__reent, [*c]u8, c_int, c_int) c_int;
pub extern fn _mkstemp_r([*c]struct__reent, [*c]u8) c_int;
pub extern fn _mkstemps_r([*c]struct__reent, [*c]u8, c_int) c_int;
pub extern fn _mktemp_r([*c]struct__reent, [*c]u8) [*c]u8;
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, _compar: __compar_fn_t) void;
pub extern fn rand() c_int;
pub extern fn realloc(?*anyopaque, usize) ?*anyopaque;
pub extern fn reallocarray(?*anyopaque, usize, usize) ?*anyopaque;
pub extern fn reallocf(?*anyopaque, usize) ?*anyopaque;
pub extern fn realpath(noalias path: [*c]const u8, noalias resolved_path: [*c]u8) [*c]u8;
pub extern fn rpmatch(response: [*c]const u8) c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn strtod(noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8) f64;
pub extern fn _strtod_r([*c]struct__reent, noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8) f64;
pub extern fn strtof(noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8) f32;
pub extern fn strtol(noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_long;
pub extern fn _strtol_r([*c]struct__reent, noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn _strtoul_r([*c]struct__reent, noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn system(__string: [*c]const u8) c_int;
pub extern fn a64l(__input: [*c]const u8) c_long;
pub extern fn l64a(__input: c_long) [*c]u8;
pub extern fn _l64a_r([*c]struct__reent, __input: c_long) [*c]u8;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.c) void, __arg: ?*anyopaque) c_int;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn _putenv_r([*c]struct__reent, __string: [*c]u8) c_int;
pub extern fn _reallocf_r([*c]struct__reent, ?*anyopaque, usize) ?*anyopaque;
pub extern fn setenv(__string: [*c]const u8, __value: [*c]const u8, __overwrite: c_int) c_int;
pub extern fn _setenv_r([*c]struct__reent, __string: [*c]const u8, __value: [*c]const u8, __overwrite: c_int) c_int;
pub extern fn __itoa(c_int, [*c]u8, c_int) [*c]u8;
pub extern fn __utoa(c_uint, [*c]u8, c_int) [*c]u8;
pub extern fn itoa(c_int, [*c]u8, c_int) [*c]u8;
pub extern fn utoa(c_uint, [*c]u8, c_int) [*c]u8;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn _drand48_r([*c]struct__reent) f64;
pub extern fn erand48([*c]c_ushort) f64;
pub extern fn _erand48_r([*c]struct__reent, [*c]c_ushort) f64;
pub extern fn jrand48([*c]c_ushort) c_long;
pub extern fn _jrand48_r([*c]struct__reent, [*c]c_ushort) c_long;
pub extern fn lcong48([*c]c_ushort) void;
pub extern fn _lcong48_r([*c]struct__reent, [*c]c_ushort) void;
pub extern fn lrand48() c_long;
pub extern fn _lrand48_r([*c]struct__reent) c_long;
pub extern fn mrand48() c_long;
pub extern fn _mrand48_r([*c]struct__reent) c_long;
pub extern fn nrand48([*c]c_ushort) c_long;
pub extern fn _nrand48_r([*c]struct__reent, [*c]c_ushort) c_long;
pub extern fn seed48([*c]c_ushort) [*c]c_ushort;
pub extern fn _seed48_r([*c]struct__reent, [*c]c_ushort) [*c]c_ushort;
pub extern fn srand48(c_long) void;
pub extern fn _srand48_r([*c]struct__reent, c_long) void;
pub extern fn initstate(c_uint, [*c]u8, usize) [*c]u8;
pub extern fn random() c_long;
pub extern fn setstate([*c]u8) [*c]u8;
pub extern fn srandom(c_uint) void;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn _atoll_r([*c]struct__reent, __nptr: [*c]const u8) c_longlong;
pub extern fn llabs(c_longlong) c_longlong;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn strtoll(noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn _strtoll_r([*c]struct__reent, noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn _strtoull_r([*c]struct__reent, noalias __n: [*c]const u8, noalias __end_PTR: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn cfree(?*anyopaque) void;
pub extern fn unsetenv(__string: [*c]const u8) c_int;
pub extern fn _unsetenv_r([*c]struct__reent, __string: [*c]const u8) c_int;
pub extern fn posix_memalign([*c]?*anyopaque, usize, usize) c_int;
pub extern fn _dtoa_r([*c]struct__reent, f64, c_int, c_int, [*c]c_int, [*c]c_int, [*c][*c]u8) [*c]u8;
pub extern fn _malloc_r([*c]struct__reent, usize) ?*anyopaque;
pub extern fn _calloc_r([*c]struct__reent, usize, usize) ?*anyopaque;
pub extern fn _free_r([*c]struct__reent, ?*anyopaque) void;
pub extern fn _realloc_r([*c]struct__reent, ?*anyopaque, usize) ?*anyopaque;
pub extern fn _mstats_r([*c]struct__reent, [*c]u8) void;
pub extern fn _system_r([*c]struct__reent, [*c]const u8) c_int;
pub extern fn __eprintf([*c]const u8, [*c]const u8, c_uint, [*c]const u8) void;
pub extern fn qsort_r(__base: ?*anyopaque, __nmemb: usize, __size: usize, __thunk: ?*anyopaque, _compar: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) void;
pub extern fn _strtold_r([*c]struct__reent, noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn aligned_alloc(usize, usize) ?*anyopaque;
pub extern fn at_quick_exit(?*const fn () callconv(.c) void) c_int;
pub extern fn quick_exit(c_int) void;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __gnuc_va_list;
pub const FILE = __FILE;
pub const fpos_t = _fpos_t;
pub const off_t = __off_t;
pub extern fn ctermid([*c]u8) [*c]u8;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tempnam([*c]const u8, [*c]const u8) [*c]u8;
pub extern fn fclose([*c]FILE) c_int;
pub extern fn fflush([*c]FILE) c_int;
pub extern fn freopen(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]FILE) [*c]FILE;
pub extern fn setbuf(noalias [*c]FILE, noalias [*c]u8) void;
pub extern fn setvbuf(noalias [*c]FILE, noalias [*c]u8, c_int, usize) c_int;
pub extern fn fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn printf(noalias [*c]const u8, ...) c_int;
pub extern fn scanf(noalias [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias [*c]const u8, noalias [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias [*c]FILE, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vprintf([*c]const u8, __gnuc_va_list) c_int;
pub extern fn vsprintf(noalias [*c]u8, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn fgetc([*c]FILE) c_int;
pub extern fn fgets(noalias [*c]u8, c_int, noalias [*c]FILE) [*c]u8;
pub extern fn fputc(c_int, [*c]FILE) c_int;
pub extern fn fputs(noalias [*c]const u8, noalias [*c]FILE) c_int;
pub extern fn getc([*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn gets([*c]u8) [*c]u8;
pub extern fn putc(c_int, [*c]FILE) c_int;
pub extern fn putchar(c_int) c_int;
pub extern fn puts([*c]const u8) c_int;
pub extern fn ungetc(c_int, [*c]FILE) c_int;
pub extern fn fread(noalias ?*anyopaque, _size: usize, _n: usize, noalias [*c]FILE) usize;
pub extern fn fwrite(noalias ?*const anyopaque, _size: usize, _n: usize, [*c]FILE) usize;
pub extern fn fgetpos(noalias [*c]FILE, noalias [*c]fpos_t) c_int;
pub extern fn fseek([*c]FILE, c_long, c_int) c_int;
pub extern fn fsetpos([*c]FILE, [*c]const fpos_t) c_int;
pub extern fn ftell([*c]FILE) c_long;
pub extern fn rewind([*c]FILE) void;
pub extern fn clearerr([*c]FILE) void;
pub extern fn feof([*c]FILE) c_int;
pub extern fn ferror([*c]FILE) c_int;
pub extern fn perror([*c]const u8) void;
pub extern fn fopen(noalias _name: [*c]const u8, noalias _type: [*c]const u8) [*c]FILE;
pub extern fn sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn remove([*c]const u8) c_int;
pub extern fn rename([*c]const u8, [*c]const u8) c_int;
pub extern fn fseeko([*c]FILE, off_t, c_int) c_int;
pub extern fn ftello([*c]FILE) off_t;
pub extern fn snprintf(noalias [*c]u8, usize, noalias [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias [*c]u8, usize, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vfscanf(noalias [*c]FILE, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vscanf([*c]const u8, __gnuc_va_list) c_int;
pub extern fn vsscanf(noalias [*c]const u8, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn asiprintf([*c][*c]u8, [*c]const u8, ...) c_int;
pub extern fn asniprintf([*c]u8, [*c]usize, [*c]const u8, ...) [*c]u8;
pub extern fn asnprintf(noalias [*c]u8, noalias [*c]usize, noalias [*c]const u8, ...) [*c]u8;
pub extern fn diprintf(c_int, [*c]const u8, ...) c_int;
pub extern fn fiprintf([*c]FILE, [*c]const u8, ...) c_int;
pub extern fn fiscanf([*c]FILE, [*c]const u8, ...) c_int;
pub extern fn iprintf([*c]const u8, ...) c_int;
pub extern fn iscanf([*c]const u8, ...) c_int;
pub extern fn siprintf([*c]u8, [*c]const u8, ...) c_int;
pub extern fn siscanf([*c]const u8, [*c]const u8, ...) c_int;
pub extern fn sniprintf([*c]u8, usize, [*c]const u8, ...) c_int;
pub extern fn vasiprintf([*c][*c]u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vasniprintf([*c]u8, [*c]usize, [*c]const u8, __gnuc_va_list) [*c]u8;
pub extern fn vasnprintf([*c]u8, [*c]usize, [*c]const u8, __gnuc_va_list) [*c]u8;
pub extern fn vdiprintf(c_int, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vfiprintf([*c]FILE, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vfiscanf([*c]FILE, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn viprintf([*c]const u8, __gnuc_va_list) c_int;
pub extern fn viscanf([*c]const u8, __gnuc_va_list) c_int;
pub extern fn vsiprintf([*c]u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vsiscanf([*c]const u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn vsniprintf([*c]u8, usize, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn fdopen(c_int, [*c]const u8) [*c]FILE;
pub extern fn fileno([*c]FILE) c_int;
pub extern fn pclose([*c]FILE) c_int;
pub extern fn popen([*c]const u8, [*c]const u8) [*c]FILE;
pub extern fn setbuffer([*c]FILE, [*c]u8, c_int) void;
pub extern fn setlinebuf([*c]FILE) c_int;
pub extern fn getw([*c]FILE) c_int;
pub extern fn putw(c_int, [*c]FILE) c_int;
pub extern fn getc_unlocked([*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn flockfile([*c]FILE) void;
pub extern fn ftrylockfile([*c]FILE) c_int;
pub extern fn funlockfile([*c]FILE) void;
pub extern fn putc_unlocked(c_int, [*c]FILE) c_int;
pub extern fn putchar_unlocked(c_int) c_int;
pub extern fn dprintf(c_int, noalias [*c]const u8, ...) c_int;
pub extern fn fmemopen(noalias ?*anyopaque, usize, noalias [*c]const u8) [*c]FILE;
pub extern fn open_memstream([*c][*c]u8, [*c]usize) [*c]FILE;
pub extern fn vdprintf(c_int, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn renameat(c_int, [*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn _asiprintf_r([*c]struct__reent, [*c][*c]u8, [*c]const u8, ...) c_int;
pub extern fn _asniprintf_r([*c]struct__reent, [*c]u8, [*c]usize, [*c]const u8, ...) [*c]u8;
pub extern fn _asnprintf_r([*c]struct__reent, noalias [*c]u8, noalias [*c]usize, noalias [*c]const u8, ...) [*c]u8;
pub extern fn _asprintf_r([*c]struct__reent, noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn _diprintf_r([*c]struct__reent, c_int, [*c]const u8, ...) c_int;
pub extern fn _dprintf_r([*c]struct__reent, c_int, noalias [*c]const u8, ...) c_int;
pub extern fn _fclose_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _fcloseall_r([*c]struct__reent) c_int;
pub extern fn _fdopen_r([*c]struct__reent, c_int, [*c]const u8) [*c]FILE;
pub extern fn _fflush_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _fgetc_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _fgetc_unlocked_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _fgets_r([*c]struct__reent, noalias [*c]u8, c_int, noalias [*c]FILE) [*c]u8;
pub extern fn _fgets_unlocked_r([*c]struct__reent, noalias [*c]u8, c_int, noalias [*c]FILE) [*c]u8;
pub extern fn _fgetpos_r([*c]struct__reent, [*c]FILE, [*c]fpos_t) c_int;
pub extern fn _fsetpos_r([*c]struct__reent, [*c]FILE, [*c]const fpos_t) c_int;
pub extern fn _fiprintf_r([*c]struct__reent, [*c]FILE, [*c]const u8, ...) c_int;
pub extern fn _fiscanf_r([*c]struct__reent, [*c]FILE, [*c]const u8, ...) c_int;
pub extern fn _fmemopen_r([*c]struct__reent, noalias ?*anyopaque, usize, noalias [*c]const u8) [*c]FILE;
pub extern fn _fopen_r([*c]struct__reent, noalias [*c]const u8, noalias [*c]const u8) [*c]FILE;
pub extern fn _freopen_r([*c]struct__reent, noalias [*c]const u8, noalias [*c]const u8, noalias [*c]FILE) [*c]FILE;
pub extern fn _fprintf_r([*c]struct__reent, noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn _fpurge_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _fputc_r([*c]struct__reent, c_int, [*c]FILE) c_int;
pub extern fn _fputc_unlocked_r([*c]struct__reent, c_int, [*c]FILE) c_int;
pub extern fn _fputs_r([*c]struct__reent, noalias [*c]const u8, noalias [*c]FILE) c_int;
pub extern fn _fputs_unlocked_r([*c]struct__reent, noalias [*c]const u8, noalias [*c]FILE) c_int;
pub extern fn _fread_r([*c]struct__reent, noalias ?*anyopaque, _size: usize, _n: usize, noalias [*c]FILE) usize;
pub extern fn _fread_unlocked_r([*c]struct__reent, noalias ?*anyopaque, _size: usize, _n: usize, noalias [*c]FILE) usize;
pub extern fn _fscanf_r([*c]struct__reent, noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn _fseek_r([*c]struct__reent, [*c]FILE, c_long, c_int) c_int;
pub extern fn _fseeko_r([*c]struct__reent, [*c]FILE, _off_t, c_int) c_int;
pub extern fn _ftell_r([*c]struct__reent, [*c]FILE) c_long;
pub extern fn _ftello_r([*c]struct__reent, [*c]FILE) _off_t;
pub extern fn _rewind_r([*c]struct__reent, [*c]FILE) void;
pub extern fn _fwrite_r([*c]struct__reent, noalias ?*const anyopaque, _size: usize, _n: usize, noalias [*c]FILE) usize;
pub extern fn _fwrite_unlocked_r([*c]struct__reent, noalias ?*const anyopaque, _size: usize, _n: usize, noalias [*c]FILE) usize;
pub extern fn _getc_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _getc_unlocked_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn _getchar_r([*c]struct__reent) c_int;
pub extern fn _getchar_unlocked_r([*c]struct__reent) c_int;
pub extern fn _gets_r([*c]struct__reent, [*c]u8) [*c]u8;
pub extern fn _iprintf_r([*c]struct__reent, [*c]const u8, ...) c_int;
pub extern fn _iscanf_r([*c]struct__reent, [*c]const u8, ...) c_int;
pub extern fn _open_memstream_r([*c]struct__reent, [*c][*c]u8, [*c]usize) [*c]FILE;
pub extern fn _perror_r([*c]struct__reent, [*c]const u8) void;
pub extern fn _printf_r([*c]struct__reent, noalias [*c]const u8, ...) c_int;
pub extern fn _putc_r([*c]struct__reent, c_int, [*c]FILE) c_int;
pub extern fn _putc_unlocked_r([*c]struct__reent, c_int, [*c]FILE) c_int;
pub extern fn _putchar_unlocked_r([*c]struct__reent, c_int) c_int;
pub extern fn _putchar_r([*c]struct__reent, c_int) c_int;
pub extern fn _puts_r([*c]struct__reent, [*c]const u8) c_int;
pub extern fn _remove_r([*c]struct__reent, [*c]const u8) c_int;
pub extern fn _rename_r([*c]struct__reent, _old: [*c]const u8, _new: [*c]const u8) c_int;
pub extern fn _scanf_r([*c]struct__reent, noalias [*c]const u8, ...) c_int;
pub extern fn _siprintf_r([*c]struct__reent, [*c]u8, [*c]const u8, ...) c_int;
pub extern fn _siscanf_r([*c]struct__reent, [*c]const u8, [*c]const u8, ...) c_int;
pub extern fn _sniprintf_r([*c]struct__reent, [*c]u8, usize, [*c]const u8, ...) c_int;
pub extern fn _snprintf_r([*c]struct__reent, noalias [*c]u8, usize, noalias [*c]const u8, ...) c_int;
pub extern fn _sprintf_r([*c]struct__reent, noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn _sscanf_r([*c]struct__reent, noalias [*c]const u8, noalias [*c]const u8, ...) c_int;
pub extern fn _tempnam_r([*c]struct__reent, [*c]const u8, [*c]const u8) [*c]u8;
pub extern fn _tmpfile_r([*c]struct__reent) [*c]FILE;
pub extern fn _tmpnam_r([*c]struct__reent, [*c]u8) [*c]u8;
pub extern fn _ungetc_r([*c]struct__reent, c_int, [*c]FILE) c_int;
pub extern fn _vasiprintf_r([*c]struct__reent, [*c][*c]u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vasniprintf_r([*c]struct__reent, [*c]u8, [*c]usize, [*c]const u8, __gnuc_va_list) [*c]u8;
pub extern fn _vasnprintf_r([*c]struct__reent, [*c]u8, [*c]usize, [*c]const u8, __gnuc_va_list) [*c]u8;
pub extern fn _vasprintf_r([*c]struct__reent, [*c][*c]u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vdiprintf_r([*c]struct__reent, c_int, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vdprintf_r([*c]struct__reent, c_int, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vfiprintf_r([*c]struct__reent, [*c]FILE, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vfiscanf_r([*c]struct__reent, [*c]FILE, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vfprintf_r([*c]struct__reent, noalias [*c]FILE, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vfscanf_r([*c]struct__reent, noalias [*c]FILE, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _viprintf_r([*c]struct__reent, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _viscanf_r([*c]struct__reent, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vprintf_r([*c]struct__reent, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vscanf_r([*c]struct__reent, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vsiprintf_r([*c]struct__reent, [*c]u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vsiscanf_r([*c]struct__reent, [*c]const u8, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vsniprintf_r([*c]struct__reent, [*c]u8, usize, [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vsnprintf_r([*c]struct__reent, noalias [*c]u8, usize, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vsprintf_r([*c]struct__reent, noalias [*c]u8, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn _vsscanf_r([*c]struct__reent, noalias [*c]const u8, noalias [*c]const u8, __gnuc_va_list) c_int;
pub extern fn fpurge([*c]FILE) c_int;
pub extern fn __getdelim([*c][*c]u8, [*c]usize, c_int, [*c]FILE) isize;
pub extern fn __getline([*c][*c]u8, [*c]usize, [*c]FILE) isize;
pub extern fn clearerr_unlocked([*c]FILE) void;
pub extern fn feof_unlocked([*c]FILE) c_int;
pub extern fn ferror_unlocked([*c]FILE) c_int;
pub extern fn fileno_unlocked([*c]FILE) c_int;
pub extern fn fflush_unlocked([*c]FILE) c_int;
pub extern fn fgetc_unlocked([*c]FILE) c_int;
pub extern fn fputc_unlocked(c_int, [*c]FILE) c_int;
pub extern fn fread_unlocked(noalias ?*anyopaque, _size: usize, _n: usize, noalias [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias ?*const anyopaque, _size: usize, _n: usize, [*c]FILE) usize;
pub extern fn __srget_r([*c]struct__reent, [*c]FILE) c_int;
pub extern fn __swbuf_r([*c]struct__reent, c_int, [*c]FILE) c_int;
pub extern fn funopen(__cookie: ?*const anyopaque, __readfn: ?*const fn (?*anyopaque, [*c]u8, c_int) callconv(.c) c_int, __writefn: ?*const fn (?*anyopaque, [*c]const u8, c_int) callconv(.c) c_int, __seekfn: ?*const fn (?*anyopaque, fpos_t, c_int) callconv(.c) fpos_t, __closefn: ?*const fn (?*anyopaque) callconv(.c) c_int) [*c]FILE;
pub extern fn _funopen_r([*c]struct__reent, __cookie: ?*const anyopaque, __readfn: ?*const fn (?*anyopaque, [*c]u8, c_int) callconv(.c) c_int, __writefn: ?*const fn (?*anyopaque, [*c]const u8, c_int) callconv(.c) c_int, __seekfn: ?*const fn (?*anyopaque, fpos_t, c_int) callconv(.c) fpos_t, __closefn: ?*const fn (?*anyopaque) callconv(.c) c_int) [*c]FILE;
pub fn __sputc_r(arg__ptr: [*c]struct__reent, arg__c: c_int, arg__p: [*c]FILE) callconv(.c) c_int {
    var _ptr = arg__ptr;
    _ = &_ptr;
    var _c = arg__c;
    _ = &_c;
    var _p = arg__p;
    _ = &_p;
    if (((blk: {
        const ref = &_p.*._w;
        ref.* -= 1;
        break :blk ref.*;
    }) >= @as(c_int, 0)) or ((_p.*._w >= _p.*._lbfsize) and (@as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(_c))))))) != @as(c_int, '\n')))) return @as(c_int, @bitCast(@as(c_uint, blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(_c))));
        (blk_1: {
            const ref = &_p.*._p;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    }))) else return __swbuf_r(_ptr, _c, _p);
    return 0;
}
pub fn _getchar_unlocked() callconv(.c) c_int {
    var _ptr: [*c]struct__reent = undefined;
    _ = &_ptr;
    _ptr = __getreent();
    return if ((blk: {
        const ref = &_ptr.*._stdin.*._r;
        ref.* -= 1;
        break :blk ref.*;
    }) < @as(c_int, 0)) __srget_r(_ptr, _ptr.*._stdin) else @as(c_int, @bitCast(@as(c_uint, (blk: {
        const ref = &_ptr.*._stdin.*._p;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).*)));
}
pub fn _putchar_unlocked(arg__c: c_int) callconv(.c) c_int {
    var _c = arg__c;
    _ = &_c;
    var _ptr: [*c]struct__reent = undefined;
    _ = &_ptr;
    _ptr = __getreent();
    return __sputc_r(_ptr, _c, _ptr.*._stdout);
}
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const int_least8_t = __int_least8_t;
pub const uint_least8_t = __uint_least8_t;
pub const int_least16_t = __int_least16_t;
pub const uint_least16_t = __uint_least16_t;
pub const int_least32_t = __int_least32_t;
pub const uint_least32_t = __uint_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const uint_fast8_t = u8;
pub const int_fast16_t = c_short;
pub const uint_fast16_t = c_ushort;
pub const int_fast32_t = c_int;
pub const uint_fast32_t = c_uint;
pub const int_fast64_t = c_longlong;
pub const uint_fast64_t = c_ulonglong;
pub extern const Xthal_rev_no: c_uint;
pub extern fn xthal_save_extra(base: ?*anyopaque) void;
pub extern fn xthal_restore_extra(base: ?*anyopaque) void;
pub extern fn xthal_save_cpregs(base: ?*anyopaque, c_int) void;
pub extern fn xthal_restore_cpregs(base: ?*anyopaque, c_int) void;
pub extern fn xthal_save_cp0(base: ?*anyopaque) void;
pub extern fn xthal_save_cp1(base: ?*anyopaque) void;
pub extern fn xthal_save_cp2(base: ?*anyopaque) void;
pub extern fn xthal_save_cp3(base: ?*anyopaque) void;
pub extern fn xthal_save_cp4(base: ?*anyopaque) void;
pub extern fn xthal_save_cp5(base: ?*anyopaque) void;
pub extern fn xthal_save_cp6(base: ?*anyopaque) void;
pub extern fn xthal_save_cp7(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp0(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp1(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp2(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp3(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp4(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp5(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp6(base: ?*anyopaque) void;
pub extern fn xthal_restore_cp7(base: ?*anyopaque) void;
pub extern var Xthal_cpregs_save_fn: [8]?*anyopaque;
pub extern var Xthal_cpregs_restore_fn: [8]?*anyopaque;
pub extern var Xthal_cpregs_save_nw_fn: [8]?*anyopaque;
pub extern var Xthal_cpregs_restore_nw_fn: [8]?*anyopaque;
pub extern const Xthal_extra_size: c_uint;
pub extern const Xthal_extra_align: c_uint;
pub extern const Xthal_cpregs_size: [8]c_uint;
pub extern const Xthal_cpregs_align: [8]c_uint;
pub extern const Xthal_all_extra_size: c_uint;
pub extern const Xthal_all_extra_align: c_uint;
pub extern const Xthal_cp_names: [8][*c]const u8;
pub extern fn xthal_init_mem_extra(?*anyopaque) void;
pub extern fn xthal_init_mem_cp(?*anyopaque, c_int) void;
pub extern const Xthal_num_coprocessors: c_uint;
pub extern const Xthal_cp_num: u8;
pub extern const Xthal_cp_max: u8;
pub extern const Xthal_cp_mask: c_uint;
pub extern const Xthal_num_aregs: c_uint;
pub extern const Xthal_num_aregs_log2: u8;
pub extern const Xthal_icache_linewidth: u8;
pub extern const Xthal_dcache_linewidth: u8;
pub extern const Xthal_icache_linesize: c_ushort;
pub extern const Xthal_dcache_linesize: c_ushort;
pub extern const Xthal_icache_size: c_uint;
pub extern const Xthal_dcache_size: c_uint;
pub extern const Xthal_dcache_is_writeback: u8;
pub extern fn xthal_icache_region_invalidate(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_region_invalidate(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_region_writeback(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_region_writeback_inv(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_icache_line_invalidate(addr: ?*anyopaque) void;
pub extern fn xthal_dcache_line_invalidate(addr: ?*anyopaque) void;
pub extern fn xthal_dcache_line_writeback(addr: ?*anyopaque) void;
pub extern fn xthal_dcache_line_writeback_inv(addr: ?*anyopaque) void;
pub extern fn xthal_icache_sync() void;
pub extern fn xthal_dcache_sync() void;
pub extern fn xthal_icache_get_ways() c_uint;
pub extern fn xthal_icache_set_ways(ways: c_uint) void;
pub extern fn xthal_dcache_get_ways() c_uint;
pub extern fn xthal_dcache_set_ways(ways: c_uint) void;
pub extern fn xthal_cache_coherence_on() void;
pub extern fn xthal_cache_coherence_off() void;
pub extern fn xthal_cache_coherence_optin() void;
pub extern fn xthal_cache_coherence_optout() void;
pub extern fn xthal_get_cache_prefetch() c_int;
pub extern fn xthal_set_cache_prefetch(c_int) c_int;
pub extern fn xthal_set_cache_prefetch_long(c_ulonglong) c_int;
pub extern const Xthal_debug_configured: c_int;
pub extern fn xthal_set_soft_break(addr: ?*anyopaque) c_uint;
pub extern fn xthal_remove_soft_break(addr: ?*anyopaque, c_uint) void;
pub extern fn xthal_disassemble(instr_buf: [*c]u8, tgt_addr: ?*anyopaque, buffer: [*c]u8, buflen: c_uint, options: c_uint) c_int;
pub extern fn xthal_disassemble_size(instr_buf: [*c]u8) c_int;
pub extern fn xthal_memcpy(dst: ?*anyopaque, src: ?*const anyopaque, len: c_uint) ?*anyopaque;
pub extern fn xthal_bcopy(src: ?*const anyopaque, dst: ?*anyopaque, len: c_uint) ?*anyopaque;
pub extern fn xthal_compare_and_set(addr: [*c]c_int, test_val: c_int, compare_val: c_int) c_int;
pub extern const Xthal_release_major: c_uint;
pub extern const Xthal_release_minor: c_uint;
pub extern const Xthal_release_name: [*c]const u8;
pub extern const Xthal_release_internal: [*c]const u8;
pub extern const Xthal_memory_order: u8;
pub extern const Xthal_have_windowed: u8;
pub extern const Xthal_have_density: u8;
pub extern const Xthal_have_booleans: u8;
pub extern const Xthal_have_loops: u8;
pub extern const Xthal_have_nsa: u8;
pub extern const Xthal_have_minmax: u8;
pub extern const Xthal_have_sext: u8;
pub extern const Xthal_have_clamps: u8;
pub extern const Xthal_have_mac16: u8;
pub extern const Xthal_have_mul16: u8;
pub extern const Xthal_have_fp: u8;
pub extern const Xthal_have_speculation: u8;
pub extern const Xthal_have_threadptr: u8;
pub extern const Xthal_have_pif: u8;
pub extern const Xthal_num_writebuffer_entries: c_ushort;
pub extern const Xthal_build_unique_id: c_uint;
pub extern const Xthal_hw_configid0: c_uint;
pub extern const Xthal_hw_configid1: c_uint;
pub extern const Xthal_hw_release_major: c_uint;
pub extern const Xthal_hw_release_minor: c_uint;
pub extern const Xthal_hw_release_name: [*c]const u8;
pub extern const Xthal_hw_release_internal: [*c]const u8;
pub extern fn xthal_clear_regcached_code() void;
pub extern fn xthal_window_spill() void;
pub extern fn xthal_validate_cp(c_int) void;
pub extern fn xthal_invalidate_cp(c_int) void;
pub extern fn xthal_set_cpenable(c_uint) void;
pub extern fn xthal_get_cpenable() c_uint;
pub extern const Xthal_num_intlevels: u8;
pub extern const Xthal_num_interrupts: u8;
pub extern const Xthal_excm_level: u8;
pub extern const Xthal_intlevel_mask: [16]c_uint;
pub extern const Xthal_intlevel_andbelow_mask: [16]c_uint;
pub extern const Xthal_intlevel: [32]u8;
pub extern const Xthal_inttype: [32]u8;
pub extern const Xthal_inttype_mask: [11]c_uint;
pub extern const Xthal_timer_interrupt: [4]c_int;
pub extern fn xthal_get_intenable() c_uint;
pub extern fn xthal_set_intenable(c_uint) void;
pub extern fn xthal_get_interrupt() c_uint;
pub extern fn xthal_set_intset(c_uint) void;
pub extern fn xthal_set_intclear(c_uint) void;
pub extern const Xthal_num_ibreak: c_int;
pub extern const Xthal_num_dbreak: c_int;
pub extern const Xthal_have_ccount: u8;
pub extern const Xthal_num_ccompare: u8;
pub extern fn xthal_get_ccount() c_uint;
pub extern fn xthal_set_ccompare(c_int, c_uint) void;
pub extern fn xthal_get_ccompare(c_int) c_uint;
pub extern const Xthal_have_prid: u8;
pub extern const Xthal_have_exceptions: u8;
pub extern const Xthal_xea_version: u8;
pub extern const Xthal_have_interrupts: u8;
pub extern const Xthal_have_highlevel_interrupts: u8;
pub extern const Xthal_have_nmi: u8;
pub extern fn xthal_get_prid() c_uint;
pub extern fn xthal_vpri_to_intlevel(vpri: c_uint) c_uint;
pub extern fn xthal_intlevel_to_vpri(intlevel: c_uint) c_uint;
pub extern fn xthal_int_enable(c_uint) c_uint;
pub extern fn xthal_int_disable(c_uint) c_uint;
pub extern fn xthal_set_int_vpri(intnum: c_int, vpri: c_int) c_int;
pub extern fn xthal_get_int_vpri(intnum: c_int) c_int;
pub extern fn xthal_set_vpri_locklevel(intlevel: c_uint) void;
pub extern fn xthal_get_vpri_locklevel() c_uint;
pub extern fn xthal_set_vpri(vpri: c_uint) c_uint;
pub extern fn xthal_get_vpri() c_uint;
pub extern fn xthal_set_vpri_intlevel(intlevel: c_uint) c_uint;
pub extern fn xthal_set_vpri_lock() c_uint;
pub const XtHalVoidFunc = fn () callconv(.c) void;
pub extern var Xthal_tram_pending: c_uint;
pub extern var Xthal_tram_enabled: c_uint;
pub extern var Xthal_tram_sync: c_uint;
pub extern fn xthal_tram_pending_to_service() c_uint;
pub extern fn xthal_tram_done(serviced_mask: c_uint) void;
pub extern fn xthal_tram_set_sync(intnum: c_int, sync: c_int) c_int;
pub extern fn xthal_set_tram_trigger_func(trigger_fn: ?*const XtHalVoidFunc) ?*const XtHalVoidFunc;
pub extern const Xthal_num_instrom: u8;
pub extern const Xthal_num_instram: u8;
pub extern const Xthal_num_datarom: u8;
pub extern const Xthal_num_dataram: u8;
pub extern const Xthal_num_xlmi: u8;
pub const Xthal_instrom_vaddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_instrom_vaddr",
});
pub const Xthal_instrom_paddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_instrom_paddr",
});
pub const Xthal_instrom_size: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_instrom_size",
});
pub const Xthal_instram_vaddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_instram_vaddr",
});
pub const Xthal_instram_paddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_instram_paddr",
});
pub const Xthal_instram_size: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_instram_size",
});
pub const Xthal_datarom_vaddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_datarom_vaddr",
});
pub const Xthal_datarom_paddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_datarom_paddr",
});
pub const Xthal_datarom_size: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_datarom_size",
});
pub const Xthal_dataram_vaddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_dataram_vaddr",
});
pub const Xthal_dataram_paddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_dataram_paddr",
});
pub const Xthal_dataram_size: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_dataram_size",
});
pub const Xthal_xlmi_vaddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_xlmi_vaddr",
});
pub const Xthal_xlmi_paddr: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_xlmi_paddr",
});
pub const Xthal_xlmi_size: [*c]const c_uint = @extern([*c]const c_uint, .{
    .name = "Xthal_xlmi_size",
});
pub extern const Xthal_icache_setwidth: u8;
pub extern const Xthal_dcache_setwidth: u8;
pub extern const Xthal_icache_ways: c_uint;
pub extern const Xthal_dcache_ways: c_uint;
pub extern const Xthal_icache_line_lockable: u8;
pub extern const Xthal_dcache_line_lockable: u8;
pub extern fn xthal_get_cacheattr() c_uint;
pub extern fn xthal_get_icacheattr() c_uint;
pub extern fn xthal_get_dcacheattr() c_uint;
pub extern fn xthal_set_cacheattr(c_uint) void;
pub extern fn xthal_set_icacheattr(c_uint) void;
pub extern fn xthal_set_dcacheattr(c_uint) void;
pub extern fn xthal_set_region_attribute(addr: ?*anyopaque, size: c_uint, cattr: c_uint, flags: c_uint) c_int;
pub extern fn xthal_icache_enable() void;
pub extern fn xthal_dcache_enable() void;
pub extern fn xthal_icache_disable() void;
pub extern fn xthal_dcache_disable() void;
pub extern fn xthal_icache_all_invalidate() void;
pub extern fn xthal_dcache_all_invalidate() void;
pub extern fn xthal_dcache_all_writeback() void;
pub extern fn xthal_dcache_all_writeback_inv() void;
pub extern fn xthal_icache_all_unlock() void;
pub extern fn xthal_dcache_all_unlock() void;
pub extern fn xthal_icache_region_lock(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_region_lock(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_icache_region_unlock(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_region_unlock(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_icache_hugerange_invalidate(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_icache_hugerange_unlock(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_hugerange_invalidate(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_hugerange_unlock(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_hugerange_writeback(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_dcache_hugerange_writeback_inv(addr: ?*anyopaque, size: c_uint) void;
pub extern fn xthal_icache_line_lock(addr: ?*anyopaque) void;
pub extern fn xthal_dcache_line_lock(addr: ?*anyopaque) void;
pub extern fn xthal_icache_line_unlock(addr: ?*anyopaque) void;
pub extern fn xthal_dcache_line_unlock(addr: ?*anyopaque) void;
pub extern fn xthal_memep_inject_error(addr: ?*anyopaque, size: c_int, flags: c_int) void;
pub extern const Xthal_have_spanning_way: u8;
pub extern const Xthal_have_identity_map: u8;
pub extern const Xthal_have_mimic_cacheattr: u8;
pub extern const Xthal_have_xlt_cacheattr: u8;
pub extern const Xthal_have_cacheattr: u8;
pub extern const Xthal_have_tlbs: u8;
pub extern const Xthal_mmu_asid_bits: u8;
pub extern const Xthal_mmu_asid_kernel: u8;
pub extern const Xthal_mmu_rings: u8;
pub extern const Xthal_mmu_ring_bits: u8;
pub extern const Xthal_mmu_sr_bits: u8;
pub extern const Xthal_mmu_ca_bits: u8;
pub extern const Xthal_mmu_max_pte_page_size: c_uint;
pub extern const Xthal_mmu_min_pte_page_size: c_uint;
pub extern const Xthal_itlb_way_bits: u8;
pub extern const Xthal_itlb_ways: u8;
pub extern const Xthal_itlb_arf_ways: u8;
pub extern const Xthal_dtlb_way_bits: u8;
pub extern const Xthal_dtlb_ways: u8;
pub extern const Xthal_dtlb_arf_ways: u8;
pub extern fn xthal_static_v2p(vaddr: c_uint, paddrp: [*c]c_uint) c_int;
pub extern fn xthal_static_p2v(paddr: c_uint, vaddrp: [*c]c_uint, cached: c_uint) c_int;
pub extern fn xthal_set_region_translation(vaddr: ?*anyopaque, paddr: ?*anyopaque, size: c_uint, cache_atr: c_uint, flags: c_uint) c_int;
pub extern fn xthal_v2p(?*anyopaque, [*c]?*anyopaque, [*c]c_uint, [*c]c_uint) c_int;
pub extern fn xthal_invalidate_region(addr: ?*anyopaque) c_int;
pub extern fn xthal_set_region_translation_raw(vaddr: ?*anyopaque, paddr: ?*anyopaque, cattr: c_uint) c_int;
pub const struct_xthal_MPU_entry = extern struct {
    as: u32 = @import("std").mem.zeroes(u32),
    at: u32 = @import("std").mem.zeroes(u32),
};
pub const xthal_MPU_entry = struct_xthal_MPU_entry;
pub const Xthal_mpu_bgmap: [*c]const xthal_MPU_entry = @extern([*c]const xthal_MPU_entry, .{
    .name = "Xthal_mpu_bgmap",
});
pub extern fn xthal_is_kernel_readable(accessRights: u32) i32;
pub extern fn xthal_is_kernel_writeable(accessRights: u32) i32;
pub extern fn xthal_is_kernel_executable(accessRights: u32) i32;
pub extern fn xthal_is_user_readable(accessRights: u32) i32;
pub extern fn xthal_is_user_writeable(accessRights: u32) i32;
pub extern fn xthal_is_user_executable(accessRights: u32) i32;
pub extern fn xthal_encode_memory_type(x: u32) c_int;
pub extern fn xthal_is_cacheable(memoryType: u32) i32;
pub extern fn xthal_is_writeback(memoryType: u32) i32;
pub extern fn xthal_is_device(memoryType: u32) i32;
pub extern fn xthal_read_map(entries: [*c]struct_xthal_MPU_entry) i32;
pub extern fn xthal_write_map(entries: [*c]const struct_xthal_MPU_entry, n: u32) void;
pub extern fn xthal_check_map(entries: [*c]const struct_xthal_MPU_entry, n: u32) c_int;
pub extern fn xthal_get_entry_for_address(vaddr: ?*anyopaque, infgmap: [*c]i32) struct_xthal_MPU_entry;
pub extern fn xthal_calc_cacheadrdis(e: [*c]const struct_xthal_MPU_entry, n: u32) u32;
pub extern fn xthal_mpu_set_region_attribute(vaddr: ?*anyopaque, size: usize, accessRights: i32, memoryType: i32, flags: u32) c_int;
pub extern fn xthal_read_background_map(entries: [*c]struct_xthal_MPU_entry) i32;
pub extern const Xthal_cp_id_FPU: u8;
pub extern const Xthal_cp_mask_FPU: c_uint;
pub extern const Xthal_cp_id_XCHAL_CP1_IDENT: u8;
pub extern const Xthal_cp_mask_XCHAL_CP1_IDENT: c_uint;
pub extern const Xthal_cp_id_XCHAL_CP2_IDENT: u8;
pub extern const Xthal_cp_mask_XCHAL_CP2_IDENT: c_uint;
pub extern const Xthal_cp_id_cop_ai: u8;
pub extern const Xthal_cp_mask_cop_ai: c_uint;
pub extern const Xthal_cp_id_XCHAL_CP4_IDENT: u8;
pub extern const Xthal_cp_mask_XCHAL_CP4_IDENT: c_uint;
pub extern const Xthal_cp_id_XCHAL_CP5_IDENT: u8;
pub extern const Xthal_cp_mask_XCHAL_CP5_IDENT: c_uint;
pub extern const Xthal_cp_id_XCHAL_CP6_IDENT: u8;
pub extern const Xthal_cp_mask_XCHAL_CP6_IDENT: c_uint;
pub extern const Xthal_cp_id_XCHAL_CP7_IDENT: u8;
pub extern const Xthal_cp_mask_XCHAL_CP7_IDENT: c_uint;
pub const KernelFrame = extern struct {
    pc: c_long = @import("std").mem.zeroes(c_long),
    ps: c_long = @import("std").mem.zeroes(c_long),
    areg: [4]c_long = @import("std").mem.zeroes([4]c_long),
    sar: c_long = @import("std").mem.zeroes(c_long),
};
pub const UserFrame = extern struct {
    pc: c_long = @import("std").mem.zeroes(c_long),
    ps: c_long = @import("std").mem.zeroes(c_long),
    sar: c_long = @import("std").mem.zeroes(c_long),
    vpri: c_long = @import("std").mem.zeroes(c_long),
    a0: c_long = @import("std").mem.zeroes(c_long),
    a2: c_long = @import("std").mem.zeroes(c_long),
    a3: c_long = @import("std").mem.zeroes(c_long),
    a4: c_long = @import("std").mem.zeroes(c_long),
    a5: c_long = @import("std").mem.zeroes(c_long),
    a6: c_long = @import("std").mem.zeroes(c_long),
    a7: c_long = @import("std").mem.zeroes(c_long),
    a8: c_long = @import("std").mem.zeroes(c_long),
    a9: c_long = @import("std").mem.zeroes(c_long),
    a10: c_long = @import("std").mem.zeroes(c_long),
    a11: c_long = @import("std").mem.zeroes(c_long),
    a12: c_long = @import("std").mem.zeroes(c_long),
    a13: c_long = @import("std").mem.zeroes(c_long),
    a14: c_long = @import("std").mem.zeroes(c_long),
    a15: c_long = @import("std").mem.zeroes(c_long),
    exccause: c_long = @import("std").mem.zeroes(c_long),
};
pub const XtExcFrame = extern struct {
    exit: c_long = @import("std").mem.zeroes(c_long),
    pc: c_long = @import("std").mem.zeroes(c_long),
    ps: c_long = @import("std").mem.zeroes(c_long),
    a0: c_long = @import("std").mem.zeroes(c_long),
    a1: c_long = @import("std").mem.zeroes(c_long),
    a2: c_long = @import("std").mem.zeroes(c_long),
    a3: c_long = @import("std").mem.zeroes(c_long),
    a4: c_long = @import("std").mem.zeroes(c_long),
    a5: c_long = @import("std").mem.zeroes(c_long),
    a6: c_long = @import("std").mem.zeroes(c_long),
    a7: c_long = @import("std").mem.zeroes(c_long),
    a8: c_long = @import("std").mem.zeroes(c_long),
    a9: c_long = @import("std").mem.zeroes(c_long),
    a10: c_long = @import("std").mem.zeroes(c_long),
    a11: c_long = @import("std").mem.zeroes(c_long),
    a12: c_long = @import("std").mem.zeroes(c_long),
    a13: c_long = @import("std").mem.zeroes(c_long),
    a14: c_long = @import("std").mem.zeroes(c_long),
    a15: c_long = @import("std").mem.zeroes(c_long),
    sar: c_long = @import("std").mem.zeroes(c_long),
    exccause: c_long = @import("std").mem.zeroes(c_long),
    excvaddr: c_long = @import("std").mem.zeroes(c_long),
};
pub const XtSolFrame = extern struct {
    exit: c_long = @import("std").mem.zeroes(c_long),
    pc: c_long = @import("std").mem.zeroes(c_long),
    ps: c_long = @import("std").mem.zeroes(c_long),
    next: c_long = @import("std").mem.zeroes(c_long),
    a12: c_long = @import("std").mem.zeroes(c_long),
    a13: c_long = @import("std").mem.zeroes(c_long),
    a14: c_long = @import("std").mem.zeroes(c_long),
    a15: c_long = @import("std").mem.zeroes(c_long),
};
pub const TaskFunction_t = ?*const fn (?*anyopaque) callconv(.c) void;
pub const xt_handler = ?*const fn (?*anyopaque) callconv(.c) void;
pub const xt_exc_handler = ?*const fn ([*c]XtExcFrame) callconv(.c) void;
pub extern fn xt_set_exception_handler(n: c_int, f: xt_exc_handler) xt_exc_handler;
pub extern fn xt_set_interrupt_handler(n: c_int, f: xt_handler, arg: ?*anyopaque) xt_handler;
pub extern fn xt_ints_on(mask: c_uint) void;
pub extern fn xt_ints_off(mask: c_uint) void;
pub fn xt_set_intset(arg_arg: c_uint) callconv(.c) void {
    var arg = arg_arg;
    _ = &arg;
    xthal_set_intset(arg);
}
pub fn xt_set_intclear(arg_arg: c_uint) callconv(.c) void {
    var arg = arg_arg;
    _ = &arg;
    xthal_set_intclear(arg);
}
pub extern fn xt_get_interrupt_handler_arg(n: c_int) ?*anyopaque;
pub extern fn xt_int_has_handler(intr: c_int, cpu: c_int) bool;
pub const XtosCoreState = extern struct {
    signature: c_long = @import("std").mem.zeroes(c_long),
    restore_label: c_long = @import("std").mem.zeroes(c_long),
    aftersave_label: c_long = @import("std").mem.zeroes(c_long),
    areg: [64]c_long = @import("std").mem.zeroes([64]c_long),
    sar: c_long = @import("std").mem.zeroes(c_long),
    ncp: [36]u8 align(16) = @import("std").mem.zeroes([36]u8),
};
pub const _xtos_handler_func = fn () callconv(.c) void;
pub const _xtos_handler = ?*const _xtos_handler_func;
pub extern fn _xtos_ints_off(mask: c_uint) c_uint;
pub extern fn _xtos_ints_on(mask: c_uint) c_uint;
pub fn _xtos_interrupt_enable(arg_intnum: c_uint) callconv(.c) void {
    var intnum = arg_intnum;
    _ = &intnum;
    _ = _xtos_ints_on(@as(c_uint, 1) << @intCast(intnum));
}
pub fn _xtos_interrupt_disable(arg_intnum: c_uint) callconv(.c) void {
    var intnum = arg_intnum;
    _ = &intnum;
    _ = _xtos_ints_off(@as(c_uint, 1) << @intCast(intnum));
}
pub extern fn _xtos_set_intlevel(intlevel: c_int) c_uint;
pub extern fn _xtos_set_min_intlevel(intlevel: c_int) c_uint;
pub extern fn _xtos_restore_intlevel(restoreval: c_uint) c_uint;
pub extern fn _xtos_restore_just_intlevel(restoreval: c_uint) c_uint;
pub extern fn _xtos_set_interrupt_handler(n: c_int, f: _xtos_handler) _xtos_handler;
pub extern fn _xtos_set_interrupt_handler_arg(n: c_int, f: _xtos_handler, arg: ?*anyopaque) _xtos_handler;
pub extern fn _xtos_set_exception_handler(n: c_int, f: _xtos_handler) _xtos_handler;
pub extern fn _xtos_memep_initrams() void;
pub extern fn _xtos_memep_enable(flags: c_int) void;
pub extern fn _xtos_read_ints() c_uint;
pub extern fn _xtos_clear_ints(mask: c_uint) void;
pub extern fn _xtos_core_shutoff(flags: c_uint) c_int;
pub extern fn _xtos_core_save(flags: c_uint, savearea: [*c]XtosCoreState, code: ?*anyopaque) c_int;
pub extern fn _xtos_core_restore(retvalue: c_uint, savearea: [*c]XtosCoreState) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:37:5: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:28:50: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_get_core_id() u32;
pub inline fn xt_utils_get_raw_core_id() u32 {
    return 0;
}
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:64:5: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:61:25: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_get_sp() ?*anyopaque;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:11:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:68:28: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_get_cycle_count() u32;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:12:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:75:20: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_set_cycle_count(arg_ccount: u32) callconv(.c) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:82:5: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:80:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_wait_for_intr() void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:95:5: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:93:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_set_vecbase(arg_vecbase: u32) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:11:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:100:28: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_intr_get_enabled_mask() u32;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:12:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:117:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_set_breakpoint(arg_bp_num: c_int, arg_bp_addr: u32) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:11:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:132:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_clear_breakpoint(arg_bp_num: c_int) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:156:35: warning: TODO implement function '__builtin_ffsll' in std.zig.c_builtins

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:148:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_set_watchpoint(arg_wp_num: c_int, arg_wp_addr: u32, arg_size: usize, arg_on_read: bool, arg_on_write: bool) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:12:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:174:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_clear_watchpoint(arg_wp_num: c_int) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:15:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:188:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_dbgr_is_attached() bool;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:198:5: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:196:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_dbgr_break() void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:227:5: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/xtensa/include/xt_utils.h:205:24: warning: unable to translate function, demoted to extern
pub extern fn xt_utils_compare_and_set(arg_addr: [*c]volatile u32, arg_compare_value: u32, arg_new_value: u32) bool;
pub const esp_err_t = c_int;
pub extern fn esp_err_to_name(code: esp_err_t) [*c]const u8;
pub extern fn esp_err_to_name_r(code: esp_err_t, buf: [*c]u8, buflen: usize) [*c]const u8;
pub extern fn _esp_error_check_failed(rc: esp_err_t, file: [*c]const u8, line: c_int, function: [*c]const u8, expression: [*c]const u8) noreturn;
pub extern fn _esp_error_check_failed_without_abort(rc: esp_err_t, file: [*c]const u8, line: c_int, function: [*c]const u8, expression: [*c]const u8) void;
pub const intr_handler_t = ?*const fn (?*anyopaque) callconv(.c) void;
pub const struct_intr_handle_data_t = opaque {};
pub const intr_handle_t = ?*struct_intr_handle_data_t;
pub const ESP_INTR_CPU_AFFINITY_AUTO: c_int = 0;
pub const ESP_INTR_CPU_AFFINITY_0: c_int = 1;
pub const ESP_INTR_CPU_AFFINITY_1: c_int = 2;
pub const esp_intr_cpu_affinity_t = c_uint;
pub extern fn esp_intr_mark_shared(intno: c_int, cpu: c_int, is_in_iram: bool) esp_err_t;
pub extern fn esp_intr_reserve(intno: c_int, cpu: c_int) esp_err_t;
pub extern fn esp_intr_alloc(source: c_int, flags: c_int, handler: intr_handler_t, arg: ?*anyopaque, ret_handle: [*c]intr_handle_t) esp_err_t;
pub extern fn esp_intr_alloc_intrstatus(source: c_int, flags: c_int, intrstatusreg: u32, intrstatusmask: u32, handler: intr_handler_t, arg: ?*anyopaque, ret_handle: [*c]intr_handle_t) esp_err_t;
pub extern fn esp_intr_free(handle: intr_handle_t) esp_err_t;
pub extern fn esp_intr_get_cpu(handle: intr_handle_t) c_int;
pub extern fn esp_intr_get_intno(handle: intr_handle_t) c_int;
pub extern fn esp_intr_disable(handle: intr_handle_t) esp_err_t;
pub extern fn esp_intr_enable(handle: intr_handle_t) esp_err_t;
pub extern fn esp_intr_set_in_iram(handle: intr_handle_t, is_in_iram: bool) esp_err_t;
pub extern fn esp_intr_noniram_disable() void;
pub extern fn esp_intr_noniram_enable() void;
pub extern fn esp_intr_enable_source(inum: c_int) void;
pub extern fn esp_intr_disable_source(inum: c_int) void;
// /home/wiiggee1/esp-idf/components/esp_hw_support/include/esp_intr_alloc.h:301:12: warning: TODO implement function '__builtin_ffs' in std.zig.c_builtins

// /home/wiiggee1/esp-idf/components/esp_hw_support/include/esp_intr_alloc.h:299:19: warning: unable to translate function, demoted to extern
pub extern fn esp_intr_flags_to_level(arg_flags: c_int) callconv(.c) c_int;
pub fn esp_intr_level_to_flags(arg_level: c_int) callconv(.c) c_int {
    var level = arg_level;
    _ = &level;
    return if (level > @as(c_int, 0)) (@as(c_int, 1) << @intCast(level)) & (((((((@as(c_int, 1) << @intCast(1)) | (@as(c_int, 1) << @intCast(2))) | (@as(c_int, 1) << @intCast(3))) | (@as(c_int, 1) << @intCast(4))) | (@as(c_int, 1) << @intCast(5))) | (@as(c_int, 1) << @intCast(6))) | (@as(c_int, 1) << @intCast(7))) else @as(c_int, 0);
}
pub extern fn esp_intr_dump(stream: [*c]FILE) esp_err_t;
pub const esp_cpu_cycle_count_t = u32;
pub const ESP_CPU_INTR_TYPE_LEVEL: c_int = 0;
pub const ESP_CPU_INTR_TYPE_EDGE: c_int = 1;
pub const ESP_CPU_INTR_TYPE_NA: c_int = 2;
pub const esp_cpu_intr_type_t = c_uint;
pub const esp_cpu_intr_desc_t = extern struct {
    priority: c_int = @import("std").mem.zeroes(c_int),
    type: esp_cpu_intr_type_t = @import("std").mem.zeroes(esp_cpu_intr_type_t),
    flags: u32 = @import("std").mem.zeroes(u32),
};
pub const esp_cpu_intr_handler_t = ?*const fn (?*anyopaque) callconv(.c) void;
pub const ESP_CPU_WATCHPOINT_LOAD: c_int = 0;
pub const ESP_CPU_WATCHPOINT_STORE: c_int = 1;
pub const ESP_CPU_WATCHPOINT_ACCESS: c_int = 2;
pub const esp_cpu_watchpoint_trigger_t = c_uint;
pub extern fn esp_cpu_stall(core_id: c_int) void;
pub extern fn esp_cpu_unstall(core_id: c_int) void;
pub extern fn esp_cpu_reset(core_id: c_int) void;
pub extern fn esp_cpu_wait_for_intr() void;
pub inline fn esp_cpu_get_core_id() c_int {
    return @as(c_int, @bitCast(xt_utils_get_core_id()));
}
pub inline fn esp_cpu_get_sp() ?*anyopaque {
    return xt_utils_get_sp();
}
pub inline fn esp_cpu_get_cycle_count() esp_cpu_cycle_count_t {
    return @as(esp_cpu_cycle_count_t, @bitCast(xt_utils_get_cycle_count()));
}
pub inline fn esp_cpu_set_cycle_count(arg_cycle_count: esp_cpu_cycle_count_t) void {
    var cycle_count = arg_cycle_count;
    _ = &cycle_count;
    xt_utils_set_cycle_count(@as(u32, @bitCast(cycle_count)));
}
pub inline fn esp_cpu_pc_to_addr(arg_pc: u32) ?*anyopaque {
    var pc = arg_pc;
    _ = &pc;
    return @as(?*anyopaque, @ptrFromInt((pc & @as(c_uint, 1073741823)) | @as(c_uint, 1073741824)));
}
pub extern fn esp_cpu_intr_get_desc(core_id: c_int, intr_num: c_int, intr_desc_ret: [*c]esp_cpu_intr_desc_t) void;
pub inline fn esp_cpu_intr_set_ivt_addr(arg_ivt_addr: ?*const anyopaque) void {
    var ivt_addr = arg_ivt_addr;
    _ = &ivt_addr;
    xt_utils_set_vecbase(@as(u32, @intCast(@intFromPtr(ivt_addr))));
}
pub inline fn esp_cpu_intr_has_handler(arg_intr_num: c_int) bool {
    var intr_num = arg_intr_num;
    _ = &intr_num;
    _ = if ((intr_num >= @as(c_int, 0)) and (intr_num < @as(c_int, 32))) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/esp_cpu.h", @as(c_int, 326), "esp_cpu_intr_has_handler", "intr_num >= 0 && intr_num < SOC_CPU_INTR_NUM");
    var has_handler: bool = undefined;
    _ = &has_handler;
    has_handler = xt_int_has_handler(intr_num, esp_cpu_get_core_id());
    return has_handler;
}
pub inline fn esp_cpu_intr_set_handler(arg_intr_num: c_int, arg_handler: esp_cpu_intr_handler_t, arg_handler_arg: ?*anyopaque) void {
    var intr_num = arg_intr_num;
    _ = &intr_num;
    var handler = arg_handler;
    _ = &handler;
    var handler_arg = arg_handler_arg;
    _ = &handler_arg;
    _ = if ((intr_num >= @as(c_int, 0)) and (intr_num < @as(c_int, 32))) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/esp_cpu.h", @as(c_int, 350), "esp_cpu_intr_set_handler", "intr_num >= 0 && intr_num < SOC_CPU_INTR_NUM");
    _ = xt_set_interrupt_handler(intr_num, @as(xt_handler, @ptrCast(@alignCast(handler))), handler_arg);
}
pub inline fn esp_cpu_intr_get_handler_arg(arg_intr_num: c_int) ?*anyopaque {
    var intr_num = arg_intr_num;
    _ = &intr_num;
    _ = if ((intr_num >= @as(c_int, 0)) and (intr_num < @as(c_int, 32))) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/esp_cpu.h", @as(c_int, 368), "esp_cpu_intr_get_handler_arg", "intr_num >= 0 && intr_num < SOC_CPU_INTR_NUM");
    var handler_arg: ?*anyopaque = undefined;
    _ = &handler_arg;
    handler_arg = xt_get_interrupt_handler_arg(intr_num);
    return handler_arg;
}
pub inline fn esp_cpu_intr_enable(arg_intr_mask: u32) void {
    var intr_mask = arg_intr_mask;
    _ = &intr_mask;
    xt_ints_on(intr_mask);
}
pub inline fn esp_cpu_intr_disable(arg_intr_mask: u32) void {
    var intr_mask = arg_intr_mask;
    _ = &intr_mask;
    xt_ints_off(intr_mask);
}
pub inline fn esp_cpu_intr_get_enabled_mask() u32 {
    return xt_utils_intr_get_enabled_mask();
}
pub inline fn esp_cpu_intr_edge_ack(arg_intr_num: c_int) void {
    var intr_num = arg_intr_num;
    _ = &intr_num;
    _ = if ((intr_num >= @as(c_int, 0)) and (intr_num < @as(c_int, 32))) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/esp_cpu.h", @as(c_int, 429), "esp_cpu_intr_edge_ack", "intr_num >= 0 && intr_num < SOC_CPU_INTR_NUM");
    xthal_set_intclear(@as(c_uint, @bitCast(@as(c_int, 1) << @intCast(intr_num))));
}
pub extern fn esp_cpu_configure_region_protection() void;
pub extern fn esp_cpu_set_breakpoint(bp_num: c_int, bp_addr: ?*const anyopaque) esp_err_t;
pub extern fn esp_cpu_clear_breakpoint(bp_num: c_int) esp_err_t;
pub extern fn esp_cpu_set_watchpoint(wp_num: c_int, wp_addr: ?*const anyopaque, size: usize, trigger: esp_cpu_watchpoint_trigger_t) esp_err_t;
pub extern fn esp_cpu_clear_watchpoint(wp_num: c_int) esp_err_t;
pub inline fn esp_cpu_dbgr_is_attached() bool {
    return xt_utils_dbgr_is_attached();
}
pub inline fn esp_cpu_dbgr_break() void {
    xt_utils_dbgr_break();
}
pub inline fn esp_cpu_get_call_addr(arg_return_address: isize) isize {
    var return_address = arg_return_address;
    _ = &return_address;
    return return_address - @as(c_int, 3);
}
pub extern fn esp_cpu_compare_and_set(addr: [*c]volatile u32, compare_value: u32, new_value: u32) bool;
pub const spinlock_t = extern struct {
    owner: u32 = @import("std").mem.zeroes(u32),
    count: u32 = @import("std").mem.zeroes(u32),
};
pub inline fn spinlock_initialize(arg_lock: [*c]spinlock_t) void {
    var lock = arg_lock;
    _ = &lock;
    _ = if (lock != null) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h", @as(c_int, 53), "spinlock_initialize", "lock");
    lock.*.owner = 3007315967;
    lock.*.count = 0;
}
// /home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h:124:9: warning: TODO implement translation of stmt class GotoStmtClass

// /home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h:74:51: warning: unable to translate function, demoted to extern
pub extern fn spinlock_acquire(arg_lock: [*c]spinlock_t, arg_timeout: i32) bool;
pub inline fn spinlock_release(arg_lock: [*c]spinlock_t) void {
    var lock = arg_lock;
    _ = &lock;
    var irq_status: u32 = undefined;
    _ = &irq_status;
    var core_owner_id: u32 = undefined;
    _ = &core_owner_id;
    _ = if (lock != null) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h", @as(c_int, 178), "spinlock_release", "lock");
    irq_status = 0;
    core_owner_id = xt_utils_get_raw_core_id();
    _ = if (core_owner_id == lock.*.owner) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h", @as(c_int, 187), "spinlock_release", "core_owner_id == lock->owner");
    lock.*.count -%= 1;
    if (!(lock.*.count != 0)) {
        lock.*.owner = 3007315967;
    } else {
        _ = if (lock.*.count < @as(u32, @bitCast(@as(c_int, 256)))) @as(c_int, 0) else __assert_func("/home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h", @as(c_int, 193), "spinlock_release", "lock->count < 0x100");
    }
}
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/assert.h:45:24: warning: ignoring StaticAssert declaration

// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/assert.h:45:24: warning: ignoring StaticAssert declaration
pub extern fn esp_crosscore_int_init() void;
pub extern fn esp_crosscore_int_send_yield(core_id: c_int) void;
pub extern fn esp_crosscore_int_send_freq_switch(core_id: c_int) void;
pub extern fn esp_crosscore_int_send_gdb_call(core_id: c_int) void;
pub extern fn esp_crosscore_int_send_print_backtrace(core_id: c_int) void;
pub extern fn esp_crosscore_int_send_twdt_abort(core_id: c_int) void;
pub inline fn esp_dram_match_iram() bool {
    return (@as(c_int, 1070104576) == @as(c_int, 1077346304)) and (@as(c_int, 1070596096) == @as(c_int, 1077805056));
}
pub inline fn esp_ptr_in_iram(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1077346304)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1077805056));
}
pub inline fn esp_ptr_in_dram(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1070104576)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1070596096));
}
pub inline fn esp_ptr_in_diram_dram(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1070104576)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1070530560));
}
pub inline fn esp_ptr_in_diram_iram(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1077379072)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1077805056));
}
pub inline fn esp_ptr_in_rtc_iram_fast(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1611653120)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1611661312));
}
pub inline fn esp_ptr_in_rtc_dram_fast(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1611653120)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1611661312));
}
pub inline fn esp_ptr_in_rtc_slow(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1342177280)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1342185472));
}
pub inline fn esp_ptr_diram_dram_to_iram(arg_p: ?*const anyopaque) ?*anyopaque {
    var p = arg_p;
    _ = &p;
    return @as(?*anyopaque, @ptrFromInt(@as(c_int, 1077379072) + (@as(isize, @intCast(@intFromPtr(p))) - @as(c_int, 1070104576))));
}
pub inline fn esp_ptr_diram_iram_to_dram(arg_p: ?*const anyopaque) ?*anyopaque {
    var p = arg_p;
    _ = &p;
    return @as(?*anyopaque, @ptrFromInt(@as(c_int, 1070104576) + (@as(isize, @intCast(@intFromPtr(p))) - @as(c_int, 1077379072))));
}
pub inline fn esp_ptr_dma_capable(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1070104576)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1070596096));
}
pub extern fn esp_ptr_dma_ext_capable(p: ?*const anyopaque) bool;
pub inline fn esp_ptr_word_aligned(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    return @import("std").zig.c_translation.signedRemainder(@as(isize, @intCast(@intFromPtr(p))), @as(c_int, 4)) == @as(c_int, 0);
}
pub inline fn esp_ptr_executable(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    var ip: isize = @as(isize, @intCast(@intFromPtr(p)));
    _ = &ip;
    return ((((ip >= @as(c_int, 1107296256)) and (ip < @as(c_int, 1140850688))) or ((ip >= @as(c_int, 1077346304)) and (ip < @as(c_int, 1077805056)))) or ((ip >= @as(c_int, 1073741824)) and (ip < @as(c_int, 1074135040)))) or ((ip >= @as(c_int, 1611653120)) and (ip < @as(c_int, 1611661312)));
}
pub extern fn esp_ptr_byte_accessible(p: ?*const anyopaque) bool;
pub inline fn esp_ptr_internal(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    var r: bool = undefined;
    _ = &r;
    r = (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1070104576)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1077805056));
    r |= @as(bool, (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1342177280)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1342185472)));
    r |= @as(bool, (@as(isize, @intCast(@intFromPtr(p))) >= @as(c_int, 1611653120)) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1611661312)));
    return r;
}
pub extern fn esp_ptr_external_ram(p: ?*const anyopaque) bool;
pub inline fn esp_ptr_in_drom(arg_p: ?*const anyopaque) bool {
    var p = arg_p;
    _ = &p;
    var drom_start_addr: i32 = 1006632960;
    _ = &drom_start_addr;
    return (@as(isize, @intCast(@intFromPtr(p))) >= drom_start_addr) and (@as(isize, @intCast(@intFromPtr(p))) < @as(c_int, 1040187392));
}
pub inline fn esp_stack_ptr_in_dram(arg_sp: u32) bool {
    var sp = arg_sp;
    _ = &sp;
    return !(((sp < @as(u32, @bitCast(@as(c_int, 1070104576) + @as(c_int, 16)))) or (sp > @as(u32, @bitCast(@as(c_int, 1070596096) - @as(c_int, 16))))) or ((sp & @as(u32, @bitCast(@as(c_int, 15)))) != @as(u32, @bitCast(@as(c_int, 0)))));
}
pub inline fn esp_stack_ptr_is_sane(arg_sp: u32) bool {
    var sp = arg_sp;
    _ = &sp;
    return (@as(c_int, @intFromBool(esp_stack_ptr_in_dram(sp))) != 0) or (@as(c_int, @intFromBool(esp_ptr_in_rtc_dram_fast(@as(?*anyopaque, @ptrFromInt(sp))))) != 0);
}
pub const StackType_t = u8;
pub const BaseType_t = c_int;
pub const UBaseType_t = c_uint;
pub const TickType_t = u32;
pub const portMUX_TYPE = spinlock_t;
pub extern fn xPortCheckIfInISR() BaseType_t;
pub extern fn vPortAssertIfInISR() void;
pub extern fn uxPortEnterCriticalFromISR() UBaseType_t;
pub extern fn vPortExitCriticalFromISR(level: UBaseType_t) void;
pub extern var port_xTaskLock: portMUX_TYPE;
pub extern var port_xISRLock: portMUX_TYPE;
pub extern fn vPortTakeLock(lock: [*c]portMUX_TYPE) void;
pub extern fn vPortReleaseLock(lock: [*c]portMUX_TYPE) void;
pub extern fn vPortYield() void;
pub inline fn vPortYieldCore(arg_xCoreID: BaseType_t) void {
    var xCoreID = arg_xCoreID;
    _ = &xCoreID;
    esp_crosscore_int_send_yield(xCoreID);
}
pub inline fn vPortYieldFromISR() void {
    _frxt_setup_switch();
}
pub inline fn xPortGetCoreID() BaseType_t {
    return @as(BaseType_t, @bitCast(esp_cpu_get_core_id()));
}
pub extern fn vPortTCBPreDeleteHook(pxTCB: ?*anyopaque) void;
pub extern fn vTaskEnterCritical() void;
pub extern fn vTaskExitCritical() void;
pub extern fn vTaskEnterCriticalFromISR() UBaseType_t;
pub extern fn vTaskExitCriticalFromISR(uxSavedInterruptStatus: UBaseType_t) void;
pub extern fn _frxt_setup_switch() void;
pub fn xPortInIsrContext() callconv(.c) BaseType_t {
    return xPortCheckIfInISR();
}
pub extern fn xPortInterruptedFromISRContext() BaseType_t;
pub fn xPortSetInterruptMaskFromISR() callconv(.c) UBaseType_t {
    var prev_int_level: UBaseType_t = 0;
    _ = &prev_int_level;
    return prev_int_level;
}
pub fn vPortClearInterruptMaskFromISR(arg_prev_level: UBaseType_t) callconv(.c) void {
    var prev_level = arg_prev_level;
    _ = &prev_level;
}
pub inline fn vPortCPUAcquireMutexTimeout(arg_mux: [*c]portMUX_TYPE, arg_timeout: c_int) bool {
    var mux = arg_mux;
    _ = &mux;
    var timeout = arg_timeout;
    _ = &timeout;
    return spinlock_acquire(mux, timeout);
}
pub inline fn vPortCPUReleaseMutex(arg_mux: [*c]portMUX_TYPE) void {
    var mux = arg_mux;
    _ = &mux;
    spinlock_release(mux);
}
pub extern fn xPortEnterCriticalTimeout(lock: [*c]portMUX_TYPE, timeout: BaseType_t) BaseType_t;
pub inline fn vPortEnterCriticalIDF(arg_lock: [*c]portMUX_TYPE) void {
    var lock = arg_lock;
    _ = &lock;
    _ = xPortEnterCriticalTimeout(lock, -@as(c_int, 1));
}
pub extern fn vPortExitCriticalIDF(lock: [*c]portMUX_TYPE) void;
pub extern fn vPortEnterCritical(lock: [*c]portMUX_TYPE) void;
pub extern fn vPortExitCritical(lock: [*c]portMUX_TYPE) void;
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:11:30: warning: TODO implement translation of stmt class GCCAsmStmtClass

// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:358:30: warning: unable to translate function, demoted to extern
pub extern fn xPortCanYield() linksection(".iram1.0") callconv(.c) bool;
pub extern fn vPortSetStackWatchpoint(pxStackStart: ?*anyopaque) void;
pub extern fn xPortCheckValidListMem(ptr: ?*const anyopaque) bool;
pub extern fn xPortCheckValidTCBMem(ptr: ?*const anyopaque) bool;
pub extern fn xPortcheckValidStackMem(ptr: ?*const anyopaque) bool;
pub extern fn esp_newlib_time_init() void;
pub extern fn esp_reent_init(r: [*c]struct__reent) void;
pub extern fn esp_newlib_init_global_stdio(stdio_dev: [*c]const u8) void;
pub extern fn esp_reent_cleanup() void;
pub extern fn esp_newlib_init() void;
pub extern fn esp_setup_syscall_table() void;
pub extern fn esp_set_time_from_rtc() void;
pub extern fn esp_sync_timekeeping_timers() void;
pub extern fn esp_newlib_locks_init() void;
pub const struct_multi_heap_info = opaque {};
pub const multi_heap_handle_t = ?*struct_multi_heap_info;
pub extern fn multi_heap_aligned_alloc(heap: multi_heap_handle_t, size: usize, alignment: usize) ?*anyopaque;
pub extern fn multi_heap_malloc(heap: multi_heap_handle_t, size: usize) ?*anyopaque;
pub extern fn multi_heap_aligned_free(heap: multi_heap_handle_t, p: ?*anyopaque) void;
pub extern fn multi_heap_free(heap: multi_heap_handle_t, p: ?*anyopaque) void;
pub extern fn multi_heap_realloc(heap: multi_heap_handle_t, p: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn multi_heap_get_allocated_size(heap: multi_heap_handle_t, p: ?*anyopaque) usize;
pub extern fn multi_heap_register(start: ?*anyopaque, size: usize) multi_heap_handle_t;
pub extern fn multi_heap_set_lock(heap: multi_heap_handle_t, lock: ?*anyopaque) void;
pub extern fn multi_heap_dump(heap: multi_heap_handle_t) void;
pub extern fn multi_heap_check(heap: multi_heap_handle_t, print_errors: bool) bool;
pub extern fn multi_heap_free_size(heap: multi_heap_handle_t) usize;
pub extern fn multi_heap_minimum_free_size(heap: multi_heap_handle_t) usize;
pub const multi_heap_info_t = extern struct {
    total_free_bytes: usize = @import("std").mem.zeroes(usize),
    total_allocated_bytes: usize = @import("std").mem.zeroes(usize),
    largest_free_block: usize = @import("std").mem.zeroes(usize),
    minimum_free_bytes: usize = @import("std").mem.zeroes(usize),
    allocated_blocks: usize = @import("std").mem.zeroes(usize),
    free_blocks: usize = @import("std").mem.zeroes(usize),
    total_blocks: usize = @import("std").mem.zeroes(usize),
};
pub extern fn multi_heap_get_info(heap: multi_heap_handle_t, info: [*c]multi_heap_info_t) void;
pub extern fn multi_heap_aligned_alloc_offs(heap: multi_heap_handle_t, size: usize, alignment: usize, offset: usize) ?*anyopaque;
pub extern fn multi_heap_reset_minimum_free_bytes(heap: multi_heap_handle_t) usize;
pub extern fn multi_heap_restore_minimum_free_bytes(heap: multi_heap_handle_t, new_minimum_free_bytes_value: usize) void;
pub const multi_heap_walker_cb_t = ?*const fn (?*anyopaque, usize, c_int, ?*anyopaque) callconv(.c) bool;
pub extern fn multi_heap_walk(heap: multi_heap_handle_t, walker_func: multi_heap_walker_cb_t, user_data: ?*anyopaque) void;
pub const esp_alloc_failed_hook_t = ?*const fn (usize, u32, [*c]const u8) callconv(.c) void;
pub extern fn heap_caps_register_failed_alloc_callback(callback: esp_alloc_failed_hook_t) esp_err_t;
pub extern fn heap_caps_malloc(size: usize, caps: u32) ?*anyopaque;
pub extern fn heap_caps_free(ptr: ?*anyopaque) void;
pub extern fn heap_caps_realloc(ptr: ?*anyopaque, size: usize, caps: u32) ?*anyopaque;
pub extern fn heap_caps_aligned_alloc(alignment: usize, size: usize, caps: u32) ?*anyopaque;
pub extern fn heap_caps_aligned_free(ptr: ?*anyopaque) void;
pub extern fn heap_caps_aligned_calloc(alignment: usize, n: usize, size: usize, caps: u32) ?*anyopaque;
pub extern fn heap_caps_calloc(n: usize, size: usize, caps: u32) ?*anyopaque;
pub extern fn heap_caps_get_total_size(caps: u32) usize;
pub extern fn heap_caps_get_free_size(caps: u32) usize;
pub extern fn heap_caps_get_minimum_free_size(caps: u32) usize;
pub extern fn heap_caps_get_largest_free_block(caps: u32) usize;
pub extern fn heap_caps_monitor_local_minimum_free_size_start() esp_err_t;
pub extern fn heap_caps_monitor_local_minimum_free_size_stop() esp_err_t;
pub extern fn heap_caps_get_info(info: [*c]multi_heap_info_t, caps: u32) void;
pub extern fn heap_caps_print_heap_info(caps: u32) void;
pub extern fn heap_caps_check_integrity_all(print_errors: bool) bool;
pub extern fn heap_caps_check_integrity(caps: u32, print_errors: bool) bool;
pub extern fn heap_caps_check_integrity_addr(addr: isize, print_errors: bool) bool;
pub extern fn heap_caps_malloc_extmem_enable(limit: usize) void;
pub extern fn heap_caps_malloc_prefer(size: usize, num: usize, ...) ?*anyopaque;
pub extern fn heap_caps_realloc_prefer(ptr: ?*anyopaque, size: usize, num: usize, ...) ?*anyopaque;
pub extern fn heap_caps_calloc_prefer(n: usize, size: usize, num: usize, ...) ?*anyopaque;
pub extern fn heap_caps_dump(caps: u32) void;
pub extern fn heap_caps_dump_all() void;
pub extern fn heap_caps_get_allocated_size(ptr: ?*anyopaque) usize;
pub const struct_walker_heap_info = extern struct {
    start: isize = @import("std").mem.zeroes(isize),
    end: isize = @import("std").mem.zeroes(isize),
};
pub const walker_heap_into_t = struct_walker_heap_info;
pub const struct_walker_block_info = extern struct {
    ptr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    size: usize = @import("std").mem.zeroes(usize),
    used: bool = @import("std").mem.zeroes(bool),
};
pub const walker_block_info_t = struct_walker_block_info;
pub const heap_caps_walker_cb_t = ?*const fn (walker_heap_into_t, walker_block_info_t, ?*anyopaque) callconv(.c) bool;
pub extern fn heap_caps_walk(caps: u32, walker_func: heap_caps_walker_cb_t, user_data: ?*anyopaque) void;
pub extern fn heap_caps_walk_all(walker_func: heap_caps_walker_cb_t, user_data: ?*anyopaque) void;
pub const locale_t = ?*struct___locale_t;
pub const imaxdiv_t = extern struct {
    quot: intmax_t = @import("std").mem.zeroes(intmax_t),
    rem: intmax_t = @import("std").mem.zeroes(intmax_t),
};
pub extern fn imaxabs(intmax_t) intmax_t;
pub extern fn imaxdiv(__numer: intmax_t, __denomer: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias [*c]const u8, noalias [*c][*c]u8, c_int) intmax_t;
pub extern fn _strtoimax_r([*c]struct__reent, noalias [*c]const u8, noalias [*c][*c]u8, c_int) intmax_t;
pub extern fn strtoumax(noalias [*c]const u8, noalias [*c][*c]u8, c_int) uintmax_t;
pub extern fn _strtoumax_r([*c]struct__reent, noalias [*c]const u8, noalias [*c][*c]u8, c_int) uintmax_t;
pub extern fn wcstoimax(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t, c_int) intmax_t;
pub extern fn _wcstoimax_r([*c]struct__reent, noalias [*c]const wchar_t, noalias [*c][*c]wchar_t, c_int) intmax_t;
pub extern fn wcstoumax(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t, c_int) uintmax_t;
pub extern fn _wcstoumax_r([*c]struct__reent, noalias [*c]const wchar_t, noalias [*c][*c]wchar_t, c_int) uintmax_t;
pub extern fn strtoimax_l(noalias [*c]const u8, _restrict: [*c][*c]u8, c_int, locale_t) intmax_t;
pub extern fn strtoumax_l(noalias [*c]const u8, _restrict: [*c][*c]u8, c_int, locale_t) uintmax_t;
pub extern fn wcstoimax_l(noalias [*c]const wchar_t, _restrict: [*c][*c]wchar_t, c_int, locale_t) intmax_t;
pub extern fn wcstoumax_l(noalias [*c]const wchar_t, _restrict: [*c][*c]wchar_t, c_int, locale_t) uintmax_t;
pub const RESET_REASON_CHIP_POWER_ON: c_int = 1;
pub const RESET_REASON_CHIP_BROWN_OUT: c_int = 1;
pub const RESET_REASON_CHIP_SUPER_WDT: c_int = 1;
pub const RESET_REASON_CORE_SW: c_int = 3;
pub const RESET_REASON_CORE_DEEP_SLEEP: c_int = 5;
pub const RESET_REASON_CORE_MWDT0: c_int = 7;
pub const RESET_REASON_CORE_MWDT1: c_int = 8;
pub const RESET_REASON_CORE_RTC_WDT: c_int = 9;
pub const RESET_REASON_CPU0_MWDT0: c_int = 11;
pub const RESET_REASON_CPU1_MWDT0: c_int = 11;
pub const RESET_REASON_CPU0_SW: c_int = 12;
pub const RESET_REASON_CPU1_SW: c_int = 12;
pub const RESET_REASON_CPU0_RTC_WDT: c_int = 13;
pub const RESET_REASON_CPU1_RTC_WDT: c_int = 13;
pub const RESET_REASON_SYS_BROWN_OUT: c_int = 15;
pub const RESET_REASON_SYS_RTC_WDT: c_int = 16;
pub const RESET_REASON_CPU0_MWDT1: c_int = 17;
pub const RESET_REASON_CPU1_MWDT1: c_int = 17;
pub const RESET_REASON_SYS_SUPER_WDT: c_int = 18;
pub const RESET_REASON_SYS_CLK_GLITCH: c_int = 19;
pub const RESET_REASON_CORE_EFUSE_CRC: c_int = 20;
pub const RESET_REASON_CORE_USB_UART: c_int = 21;
pub const RESET_REASON_CORE_USB_JTAG: c_int = 22;
pub const RESET_REASON_CORE_PWR_GLITCH: c_int = 23;
pub const soc_reset_reason_t = c_uint;
pub extern fn esp_rom_software_reset_system() void;
pub extern fn esp_rom_software_reset_cpu(cpu_no: c_int) void;
pub extern fn esp_rom_printf(fmt: [*c]const u8, ...) c_int;
pub extern fn esp_rom_delay_us(us: u32) void;
pub extern fn esp_rom_install_channel_putc(channel: c_int, putc: ?*const fn (u8) callconv(.c) void) void;
pub extern fn esp_rom_install_uart_printf() void;
pub extern fn esp_rom_get_reset_reason(cpu_no: c_int) soc_reset_reason_t;
pub extern fn esp_rom_route_intr_matrix(cpu_core: c_int, periph_intr_id: u32, cpu_intr_num: u32) void;
pub extern fn esp_rom_get_cpu_ticks_per_us() u32;
pub extern fn esp_rom_set_cpu_ticks_per_us(ticks_per_us: u32) void;
pub extern fn esp_get_idf_version() [*c]const u8;
pub const ESP_RST_UNKNOWN: c_int = 0;
pub const ESP_RST_POWERON: c_int = 1;
pub const ESP_RST_EXT: c_int = 2;
pub const ESP_RST_SW: c_int = 3;
pub const ESP_RST_PANIC: c_int = 4;
pub const ESP_RST_INT_WDT: c_int = 5;
pub const ESP_RST_TASK_WDT: c_int = 6;
pub const ESP_RST_WDT: c_int = 7;
pub const ESP_RST_DEEPSLEEP: c_int = 8;
pub const ESP_RST_BROWNOUT: c_int = 9;
pub const ESP_RST_SDIO: c_int = 10;
pub const ESP_RST_USB: c_int = 11;
pub const ESP_RST_JTAG: c_int = 12;
pub const ESP_RST_EFUSE: c_int = 13;
pub const ESP_RST_PWR_GLITCH: c_int = 14;
pub const ESP_RST_CPU_LOCKUP: c_int = 15;
pub const esp_reset_reason_t = c_uint;
pub const shutdown_handler_t = ?*const fn () callconv(.c) void;
pub extern fn esp_register_shutdown_handler(handle: shutdown_handler_t) esp_err_t;
pub extern fn esp_unregister_shutdown_handler(handle: shutdown_handler_t) esp_err_t;
pub extern fn esp_restart() noreturn;
pub extern fn esp_reset_reason() esp_reset_reason_t;
pub extern fn esp_get_free_heap_size() u32;
pub extern fn esp_get_free_internal_heap_size() u32;
pub extern fn esp_get_minimum_free_heap_size() u32;
pub extern fn esp_system_abort(details: [*c]const u8) noreturn;
pub extern fn pxPortInitialiseStack(pxTopOfStack: [*c]StackType_t, pxCode: TaskFunction_t, pvParameters: ?*anyopaque) [*c]StackType_t;
pub const struct_HeapRegion = extern struct {
    pucStartAddress: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    xSizeInBytes: usize = @import("std").mem.zeroes(usize),
};
pub const HeapRegion_t = struct_HeapRegion;
pub const struct_xHeapStats = extern struct {
    xAvailableHeapSpaceInBytes: usize = @import("std").mem.zeroes(usize),
    xSizeOfLargestFreeBlockInBytes: usize = @import("std").mem.zeroes(usize),
    xSizeOfSmallestFreeBlockInBytes: usize = @import("std").mem.zeroes(usize),
    xNumberOfFreeBlocks: usize = @import("std").mem.zeroes(usize),
    xMinimumEverFreeBytesRemaining: usize = @import("std").mem.zeroes(usize),
    xNumberOfSuccessfulAllocations: usize = @import("std").mem.zeroes(usize),
    xNumberOfSuccessfulFrees: usize = @import("std").mem.zeroes(usize),
};
pub const HeapStats_t = struct_xHeapStats;
pub extern fn vPortDefineHeapRegions(pxHeapRegions: [*c]const HeapRegion_t) void;
pub extern fn vPortGetHeapStats(pxHeapStats: [*c]HeapStats_t) void;
pub extern fn pvPortMalloc(xSize: usize) ?*anyopaque;
pub extern fn pvPortCalloc(xNum: usize, xSize: usize) ?*anyopaque;
pub extern fn vPortFree(pv: ?*anyopaque) void;
pub extern fn vPortInitialiseBlocks() void;
pub extern fn xPortGetFreeHeapSize() usize;
pub extern fn xPortGetMinimumEverFreeHeapSize() usize;
pub extern fn xPortStartScheduler() BaseType_t;
pub extern fn vPortEndScheduler() void;
pub const dev_t = __dev_t;
pub const ino_t = __ino_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const gid_t = __gid_t;
pub const time_t = __int_least64_t;
pub const struct_timespec = extern struct {
    tv_sec: time_t = @import("std").mem.zeroes(time_t),
    tv_nsec: c_long = @import("std").mem.zeroes(c_long),
};
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const struct_stat = extern struct {
    st_dev: dev_t = @import("std").mem.zeroes(dev_t),
    st_ino: ino_t = @import("std").mem.zeroes(ino_t),
    st_mode: mode_t = @import("std").mem.zeroes(mode_t),
    st_nlink: nlink_t = @import("std").mem.zeroes(nlink_t),
    st_uid: uid_t = @import("std").mem.zeroes(uid_t),
    st_gid: gid_t = @import("std").mem.zeroes(gid_t),
    st_rdev: dev_t = @import("std").mem.zeroes(dev_t),
    st_size: off_t = @import("std").mem.zeroes(off_t),
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_blksize: blksize_t = @import("std").mem.zeroes(blksize_t),
    st_blocks: blkcnt_t = @import("std").mem.zeroes(blkcnt_t),
    st_spare4: [2]c_long = @import("std").mem.zeroes([2]c_long),
};
pub const struct_tms = opaque {};
pub const suseconds_t = __suseconds_t;
pub const struct_timeval = extern struct {
    tv_sec: time_t = @import("std").mem.zeroes(time_t),
    tv_usec: suseconds_t = @import("std").mem.zeroes(suseconds_t),
};
pub const struct_timezone = opaque {};
pub extern fn _close_r([*c]struct__reent, c_int) c_int;
pub extern fn _execve_r([*c]struct__reent, [*c]const u8, [*c]const [*c]u8, [*c]const [*c]u8) c_int;
pub extern fn _fcntl_r([*c]struct__reent, c_int, c_int, c_int) c_int;
pub extern fn _fork_r([*c]struct__reent) c_int;
pub extern fn _fstat_r([*c]struct__reent, c_int, [*c]struct_stat) c_int;
pub extern fn _getpid_r([*c]struct__reent) c_int;
pub extern fn _isatty_r([*c]struct__reent, c_int) c_int;
pub extern fn _kill_r([*c]struct__reent, c_int, c_int) c_int;
pub extern fn _link_r([*c]struct__reent, [*c]const u8, [*c]const u8) c_int;
pub extern fn _lseek_r([*c]struct__reent, c_int, _off_t, c_int) _off_t;
pub extern fn _mkdir_r([*c]struct__reent, [*c]const u8, c_int) c_int;
pub extern fn _open_r([*c]struct__reent, [*c]const u8, c_int, c_int) c_int;
pub extern fn _read_r([*c]struct__reent, c_int, ?*anyopaque, usize) _ssize_t;
pub extern fn _sbrk_r([*c]struct__reent, ptrdiff_t) ?*anyopaque;
pub extern fn _stat_r([*c]struct__reent, [*c]const u8, [*c]struct_stat) c_int;
pub extern fn _times_r([*c]struct__reent, ?*struct_tms) c_ulong;
pub extern fn _unlink_r([*c]struct__reent, [*c]const u8) c_int;
pub extern fn _wait_r([*c]struct__reent, [*c]c_int) c_int;
pub extern fn _write_r([*c]struct__reent, c_int, ?*const anyopaque, usize) _ssize_t;
pub extern fn _getentropy_r([*c]struct__reent, ?*anyopaque, usize) c_int;
pub extern fn _gettimeofday_r([*c]struct__reent, __tp: [*c]struct_timeval, __tzp: ?*anyopaque) c_int;
pub const struct_xSTATIC_LIST_ITEM = extern struct {
    xDummy2: TickType_t = @import("std").mem.zeroes(TickType_t),
    pvDummy3: [4]?*anyopaque = @import("std").mem.zeroes([4]?*anyopaque),
};
pub const StaticListItem_t = struct_xSTATIC_LIST_ITEM;
pub const struct_xSTATIC_MINI_LIST_ITEM = extern struct {
    xDummy2: TickType_t = @import("std").mem.zeroes(TickType_t),
    pvDummy3: [2]?*anyopaque = @import("std").mem.zeroes([2]?*anyopaque),
};
pub const StaticMiniListItem_t = struct_xSTATIC_MINI_LIST_ITEM;
pub const struct_xSTATIC_LIST = extern struct {
    uxDummy2: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    pvDummy3: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    xDummy4: StaticMiniListItem_t = @import("std").mem.zeroes(StaticMiniListItem_t),
};
pub const StaticList_t = struct_xSTATIC_LIST;
pub const struct_xSTATIC_TCB = extern struct {
    pxDummy1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    xDummy3: [2]StaticListItem_t = @import("std").mem.zeroes([2]StaticListItem_t),
    uxDummy5: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    pxDummy6: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ucDummy7: [16]u8 = @import("std").mem.zeroes([16]u8),
    xDummyCoreID: BaseType_t = @import("std").mem.zeroes(BaseType_t),
    pxDummy8: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    uxDummy9: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    uxDummy12: [2]UBaseType_t = @import("std").mem.zeroes([2]UBaseType_t),
    pvDummy15: [2]?*anyopaque = @import("std").mem.zeroes([2]?*anyopaque),
    xDummy17: struct__reent = @import("std").mem.zeroes(struct__reent),
    ulDummy18: [1]u32 = @import("std").mem.zeroes([1]u32),
    ucDummy19: [1]u8 = @import("std").mem.zeroes([1]u8),
    uxDummy20: u8 = @import("std").mem.zeroes(u8),
    ucDummy21: u8 = @import("std").mem.zeroes(u8),
};
pub const StaticTask_t = struct_xSTATIC_TCB;
const union_unnamed_3 = extern union {
    pvDummy2: ?*anyopaque,
    uxDummy2: UBaseType_t,
};
pub const struct_xSTATIC_QUEUE = extern struct {
    pvDummy1: [3]?*anyopaque = @import("std").mem.zeroes([3]?*anyopaque),
    u: union_unnamed_3 = @import("std").mem.zeroes(union_unnamed_3),
    xDummy3: [2]StaticList_t = @import("std").mem.zeroes([2]StaticList_t),
    uxDummy4: [3]UBaseType_t = @import("std").mem.zeroes([3]UBaseType_t),
    ucDummy5: [2]u8 = @import("std").mem.zeroes([2]u8),
    ucDummy6: u8 = @import("std").mem.zeroes(u8),
    pvDummy7: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    xDummyQueueLock: portMUX_TYPE = @import("std").mem.zeroes(portMUX_TYPE),
};
pub const StaticQueue_t = struct_xSTATIC_QUEUE;
pub const StaticSemaphore_t = StaticQueue_t;
pub const struct_xSTATIC_EVENT_GROUP = extern struct {
    xDummy1: TickType_t = @import("std").mem.zeroes(TickType_t),
    xDummy2: StaticList_t = @import("std").mem.zeroes(StaticList_t),
    ucDummy4: u8 = @import("std").mem.zeroes(u8),
    xDummyEventGroupLock: portMUX_TYPE = @import("std").mem.zeroes(portMUX_TYPE),
};
pub const StaticEventGroup_t = struct_xSTATIC_EVENT_GROUP;
pub const struct_xSTATIC_TIMER = extern struct {
    pvDummy1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    xDummy2: StaticListItem_t = @import("std").mem.zeroes(StaticListItem_t),
    xDummy3: TickType_t = @import("std").mem.zeroes(TickType_t),
    pvDummy5: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pvDummy6: TaskFunction_t = @import("std").mem.zeroes(TaskFunction_t),
    ucDummy8: u8 = @import("std").mem.zeroes(u8),
};
pub const StaticTimer_t = struct_xSTATIC_TIMER;
pub const struct_xSTATIC_STREAM_BUFFER = extern struct {
    uxDummy1: [4]usize = @import("std").mem.zeroes([4]usize),
    pvDummy2: [3]?*anyopaque = @import("std").mem.zeroes([3]?*anyopaque),
    ucDummy3: u8 = @import("std").mem.zeroes(u8),
    xDummyStreamBufferLock: portMUX_TYPE = @import("std").mem.zeroes(portMUX_TYPE),
};
pub const StaticStreamBuffer_t = struct_xSTATIC_STREAM_BUFFER;
pub const StaticMessageBuffer_t = StaticStreamBuffer_t;
pub const struct_xLIST_ITEM = extern struct {
    xItemValue: TickType_t = @import("std").mem.zeroes(TickType_t),
    pxNext: [*c]struct_xLIST_ITEM = @import("std").mem.zeroes([*c]struct_xLIST_ITEM),
    pxPrevious: [*c]struct_xLIST_ITEM = @import("std").mem.zeroes([*c]struct_xLIST_ITEM),
    pvOwner: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pxContainer: [*c]struct_xLIST = @import("std").mem.zeroes([*c]struct_xLIST),
};
pub const ListItem_t = struct_xLIST_ITEM;
pub const struct_xMINI_LIST_ITEM = extern struct {
    xItemValue: TickType_t = @import("std").mem.zeroes(TickType_t),
    pxNext: [*c]struct_xLIST_ITEM = @import("std").mem.zeroes([*c]struct_xLIST_ITEM),
    pxPrevious: [*c]struct_xLIST_ITEM = @import("std").mem.zeroes([*c]struct_xLIST_ITEM),
};
pub const MiniListItem_t = struct_xMINI_LIST_ITEM;
pub const struct_xLIST = extern struct {
    uxNumberOfItems: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    pxIndex: [*c]ListItem_t = @import("std").mem.zeroes([*c]ListItem_t),
    xListEnd: MiniListItem_t = @import("std").mem.zeroes(MiniListItem_t),
};
pub const List_t = struct_xLIST;
pub extern fn vListInitialise(pxList: [*c]List_t) void;
pub extern fn vListInitialiseItem(pxItem: [*c]ListItem_t) void;
pub extern fn vListInsert(pxList: [*c]List_t, pxNewListItem: [*c]ListItem_t) void;
pub extern fn vListInsertEnd(pxList: [*c]List_t, pxNewListItem: [*c]ListItem_t) void;
pub extern fn uxListRemove(pxItemToRemove: [*c]ListItem_t) UBaseType_t;
pub const struct_tskTaskControlBlock = opaque {};
pub const TaskHandle_t = ?*struct_tskTaskControlBlock;
pub const TaskHookFunction_t = ?*const fn (?*anyopaque) callconv(.c) BaseType_t;
pub const eRunning: c_int = 0;
pub const eReady: c_int = 1;
pub const eBlocked: c_int = 2;
pub const eSuspended: c_int = 3;
pub const eDeleted: c_int = 4;
pub const eInvalid: c_int = 5;
pub const eTaskState = c_uint;
pub const eNoAction: c_int = 0;
pub const eSetBits: c_int = 1;
pub const eIncrement: c_int = 2;
pub const eSetValueWithOverwrite: c_int = 3;
pub const eSetValueWithoutOverwrite: c_int = 4;
pub const eNotifyAction = c_uint;
pub const struct_xTIME_OUT = extern struct {
    xOverflowCount: BaseType_t = @import("std").mem.zeroes(BaseType_t),
    xTimeOnEntering: TickType_t = @import("std").mem.zeroes(TickType_t),
};
pub const TimeOut_t = struct_xTIME_OUT;
pub const struct_xMEMORY_REGION = extern struct {
    pvBaseAddress: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ulLengthInBytes: u32 = @import("std").mem.zeroes(u32),
    ulParameters: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryRegion_t = struct_xMEMORY_REGION;
pub const struct_xTASK_PARAMETERS = extern struct {
    pvTaskCode: TaskFunction_t = @import("std").mem.zeroes(TaskFunction_t),
    pcName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    usStackDepth: u32 = @import("std").mem.zeroes(u32),
    pvParameters: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    uxPriority: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    puxStackBuffer: [*c]StackType_t = @import("std").mem.zeroes([*c]StackType_t),
    xRegions: [1]MemoryRegion_t = @import("std").mem.zeroes([1]MemoryRegion_t),
};
pub const TaskParameters_t = struct_xTASK_PARAMETERS;
pub const struct_xTASK_STATUS = extern struct {
    xHandle: TaskHandle_t = @import("std").mem.zeroes(TaskHandle_t),
    pcTaskName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    xTaskNumber: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    eCurrentState: eTaskState = @import("std").mem.zeroes(eTaskState),
    uxCurrentPriority: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    uxBasePriority: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    ulRunTimeCounter: u32 = @import("std").mem.zeroes(u32),
    pxStackBase: [*c]StackType_t = @import("std").mem.zeroes([*c]StackType_t),
    usStackHighWaterMark: u32 = @import("std").mem.zeroes(u32),
};
pub const TaskStatus_t = struct_xTASK_STATUS;
pub const eAbortSleep: c_int = 0;
pub const eStandardSleep: c_int = 1;
pub const eNoTasksWaitingTimeout: c_int = 2;
pub const eSleepModeStatus = c_uint;
pub extern fn xTaskCreatePinnedToCore(pxTaskCode: TaskFunction_t, pcName: [*c]const u8, usStackDepth: u32, pvParameters: ?*anyopaque, uxPriority: UBaseType_t, pvCreatedTask: [*c]TaskHandle_t, xCoreID: BaseType_t) BaseType_t;
pub inline fn xTaskCreate(arg_pxTaskCode: TaskFunction_t, pcName: [*c]const u8, usStackDepth: u32, pvParameters: ?*anyopaque, arg_uxPriority: UBaseType_t, pxCreatedTask: [*c]TaskHandle_t) BaseType_t {
    var pxTaskCode = arg_pxTaskCode;
    _ = &pxTaskCode;
    _ = &pcName;
    _ = &usStackDepth;
    _ = &pvParameters;
    var uxPriority = arg_uxPriority;
    _ = &uxPriority;
    _ = &pxCreatedTask;
    return xTaskCreatePinnedToCore(pxTaskCode, pcName, usStackDepth, pvParameters, uxPriority, pxCreatedTask, @as(BaseType_t, @bitCast(@as(c_int, 2147483647))));
}
pub extern fn xTaskCreateStaticPinnedToCore(pxTaskCode: TaskFunction_t, pcName: [*c]const u8, ulStackDepth: u32, pvParameters: ?*anyopaque, uxPriority: UBaseType_t, pxStackBuffer: [*c]StackType_t, pxTaskBuffer: [*c]StaticTask_t, xCoreID: BaseType_t) TaskHandle_t;
pub inline fn xTaskCreateStatic(arg_pxTaskCode: TaskFunction_t, pcName: [*c]const u8, ulStackDepth: u32, pvParameters: ?*anyopaque, arg_uxPriority: UBaseType_t, puxStackBuffer: [*c]StackType_t, pxTaskBuffer: [*c]StaticTask_t) TaskHandle_t {
    var pxTaskCode = arg_pxTaskCode;
    _ = &pxTaskCode;
    _ = &pcName;
    _ = &ulStackDepth;
    _ = &pvParameters;
    var uxPriority = arg_uxPriority;
    _ = &uxPriority;
    _ = &puxStackBuffer;
    _ = &pxTaskBuffer;
    return xTaskCreateStaticPinnedToCore(pxTaskCode, pcName, ulStackDepth, pvParameters, uxPriority, puxStackBuffer, pxTaskBuffer, @as(BaseType_t, @bitCast(@as(c_int, 2147483647))));
}
pub extern fn vTaskAllocateMPURegions(xTask: TaskHandle_t, pxRegions: [*c]const MemoryRegion_t) void;
pub extern fn vTaskDelete(xTaskToDelete: TaskHandle_t) void;
pub extern fn vTaskDelay(xTicksToDelay: TickType_t) void;
pub extern fn xTaskDelayUntil(pxPreviousWakeTime: [*c]TickType_t, xTimeIncrement: TickType_t) BaseType_t;
pub extern fn xTaskAbortDelay(xTask: TaskHandle_t) BaseType_t;
pub extern fn uxTaskPriorityGet(xTask: TaskHandle_t) UBaseType_t;
pub extern fn uxTaskPriorityGetFromISR(xTask: TaskHandle_t) UBaseType_t;
pub extern fn eTaskGetState(xTask: TaskHandle_t) eTaskState;
pub extern fn vTaskGetInfo(xTask: TaskHandle_t, pxTaskStatus: [*c]TaskStatus_t, xGetFreeStackSpace: BaseType_t, eState: eTaskState) void;
pub extern fn vTaskPrioritySet(xTask: TaskHandle_t, uxNewPriority: UBaseType_t) void;
pub extern fn vTaskSuspend(xTaskToSuspend: TaskHandle_t) void;
pub extern fn vTaskResume(xTaskToResume: TaskHandle_t) void;
pub extern fn xTaskResumeFromISR(xTaskToResume: TaskHandle_t) BaseType_t;
pub extern fn vTaskStartScheduler() void;
pub extern fn vTaskEndScheduler() void;
pub extern fn vTaskSuspendAll() void;
pub extern fn xTaskResumeAll() BaseType_t;
pub extern fn xTaskGetTickCount() TickType_t;
pub extern fn xTaskGetTickCountFromISR() TickType_t;
pub extern fn uxTaskGetNumberOfTasks() UBaseType_t;
pub extern fn pcTaskGetName(xTaskToQuery: TaskHandle_t) [*c]u8;
pub extern fn xTaskGetHandle(pcNameToQuery: [*c]const u8) TaskHandle_t;
pub extern fn xTaskGetStaticBuffers(xTask: TaskHandle_t, ppuxStackBuffer: [*c][*c]StackType_t, ppxTaskBuffer: [*c][*c]StaticTask_t) BaseType_t;
pub extern fn uxTaskGetStackHighWaterMark(xTask: TaskHandle_t) UBaseType_t;
pub extern fn uxTaskGetStackHighWaterMark2(xTask: TaskHandle_t) u32;
pub extern fn vTaskSetThreadLocalStoragePointer(xTaskToSet: TaskHandle_t, xIndex: BaseType_t, pvValue: ?*anyopaque) void;
pub extern fn pvTaskGetThreadLocalStoragePointer(xTaskToQuery: TaskHandle_t, xIndex: BaseType_t) ?*anyopaque;
pub extern fn vApplicationStackOverflowHook(xTask: TaskHandle_t, pcTaskName: [*c]u8) void;
pub extern fn vApplicationGetIdleTaskMemory(ppxIdleTaskTCBBuffer: [*c][*c]StaticTask_t, ppxIdleTaskStackBuffer: [*c][*c]StackType_t, pulIdleTaskStackSize: [*c]u32) void;
pub extern fn xTaskCallApplicationTaskHook(xTask: TaskHandle_t, pvParameter: ?*anyopaque) BaseType_t;
pub extern fn xTaskGetIdleTaskHandle() TaskHandle_t;
pub extern fn uxTaskGetSystemState(pxTaskStatusArray: [*c]TaskStatus_t, uxArraySize: UBaseType_t, pulTotalRunTime: [*c]u32) UBaseType_t;
pub extern fn vTaskList(pcWriteBuffer: [*c]u8) void;
pub extern fn vTaskGetRunTimeStats(pcWriteBuffer: [*c]u8) void;
pub extern fn ulTaskGetIdleRunTimeCounter() u32;
pub extern fn ulTaskGetIdleRunTimePercent() u32;
pub extern fn xTaskGenericNotify(xTaskToNotify: TaskHandle_t, uxIndexToNotify: UBaseType_t, ulValue: u32, eAction: eNotifyAction, pulPreviousNotificationValue: [*c]u32) BaseType_t;
pub extern fn xTaskGenericNotifyFromISR(xTaskToNotify: TaskHandle_t, uxIndexToNotify: UBaseType_t, ulValue: u32, eAction: eNotifyAction, pulPreviousNotificationValue: [*c]u32, pxHigherPriorityTaskWoken: [*c]BaseType_t) BaseType_t;
pub extern fn xTaskGenericNotifyWait(uxIndexToWaitOn: UBaseType_t, ulBitsToClearOnEntry: u32, ulBitsToClearOnExit: u32, pulNotificationValue: [*c]u32, xTicksToWait: TickType_t) BaseType_t;
pub extern fn vTaskGenericNotifyGiveFromISR(xTaskToNotify: TaskHandle_t, uxIndexToNotify: UBaseType_t, pxHigherPriorityTaskWoken: [*c]BaseType_t) void;
pub extern fn ulTaskGenericNotifyTake(uxIndexToWaitOn: UBaseType_t, xClearCountOnExit: BaseType_t, xTicksToWait: TickType_t) u32;
pub extern fn xTaskGenericNotifyStateClear(xTask: TaskHandle_t, uxIndexToClear: UBaseType_t) BaseType_t;
pub extern fn ulTaskGenericNotifyValueClear(xTask: TaskHandle_t, uxIndexToClear: UBaseType_t, ulBitsToClear: u32) u32;
pub extern fn vTaskSetTimeOutState(pxTimeOut: [*c]TimeOut_t) void;
pub extern fn xTaskCheckForTimeOut(pxTimeOut: [*c]TimeOut_t, pxTicksToWait: [*c]TickType_t) BaseType_t;
pub extern fn xTaskCatchUpTicks(xTicksToCatchUp: TickType_t) BaseType_t;
pub extern fn xTaskIncrementTick() BaseType_t;
pub extern fn vTaskPlaceOnEventList(pxEventList: [*c]List_t, xTicksToWait: TickType_t) void;
pub extern fn vTaskPlaceOnUnorderedEventList(pxEventList: [*c]List_t, xItemValue: TickType_t, xTicksToWait: TickType_t) void;
pub extern fn vTaskPlaceOnEventListRestricted(pxEventList: [*c]List_t, xTicksToWait: TickType_t, xWaitIndefinitely: BaseType_t) void;
pub extern fn xTaskRemoveFromEventList(pxEventList: [*c]const List_t) BaseType_t;
pub extern fn vTaskRemoveFromUnorderedEventList(pxEventListItem: [*c]ListItem_t, xItemValue: TickType_t) void;
pub extern fn vTaskSwitchContext() void;
pub extern fn uxTaskResetEventItemValue() TickType_t;
pub extern fn xTaskGetCurrentTaskHandle() TaskHandle_t;
pub extern fn vTaskMissedYield() void;
pub extern fn xTaskGetSchedulerState() BaseType_t;
pub extern fn xTaskPriorityInherit(pxMutexHolder: TaskHandle_t) BaseType_t;
pub extern fn xTaskPriorityDisinherit(pxMutexHolder: TaskHandle_t) BaseType_t;
pub extern fn vTaskPriorityDisinheritAfterTimeout(pxMutexHolder: TaskHandle_t, uxHighestPriorityWaitingTask: UBaseType_t) void;
pub extern fn uxTaskGetTaskNumber(xTask: TaskHandle_t) UBaseType_t;
pub extern fn vTaskSetTaskNumber(xTask: TaskHandle_t, uxHandle: UBaseType_t) void;
pub extern fn vTaskStepTick(xTicksToJump: TickType_t) void;
pub extern fn eTaskConfirmSleepModeStatus() eSleepModeStatus;
pub extern fn pvTaskIncrementMutexHeldCount() TaskHandle_t;
pub extern fn vTaskInternalSetTimeOutState(pxTimeOut: [*c]TimeOut_t) void;
pub const struct_QueueDefinition = opaque {};
pub const QueueHandle_t = ?*struct_QueueDefinition;
pub const QueueSetHandle_t = ?*struct_QueueDefinition;
pub const QueueSetMemberHandle_t = ?*struct_QueueDefinition;
pub extern fn xQueueGenericSend(xQueue: QueueHandle_t, pvItemToQueue: ?*const anyopaque, xTicksToWait: TickType_t, xCopyPosition: BaseType_t) BaseType_t;
pub extern fn xQueuePeek(xQueue: QueueHandle_t, pvBuffer: ?*anyopaque, xTicksToWait: TickType_t) BaseType_t;
pub extern fn xQueuePeekFromISR(xQueue: QueueHandle_t, pvBuffer: ?*anyopaque) BaseType_t;
pub extern fn xQueueReceive(xQueue: QueueHandle_t, pvBuffer: ?*anyopaque, xTicksToWait: TickType_t) BaseType_t;
pub extern fn uxQueueMessagesWaiting(xQueue: QueueHandle_t) UBaseType_t;
pub extern fn uxQueueSpacesAvailable(xQueue: QueueHandle_t) UBaseType_t;
pub extern fn vQueueDelete(xQueue: QueueHandle_t) void;
pub extern fn xQueueGenericSendFromISR(xQueue: QueueHandle_t, pvItemToQueue: ?*const anyopaque, pxHigherPriorityTaskWoken: [*c]BaseType_t, xCopyPosition: BaseType_t) BaseType_t;
pub extern fn xQueueGiveFromISR(xQueue: QueueHandle_t, pxHigherPriorityTaskWoken: [*c]BaseType_t) BaseType_t;
pub extern fn xQueueReceiveFromISR(xQueue: QueueHandle_t, pvBuffer: ?*anyopaque, pxHigherPriorityTaskWoken: [*c]BaseType_t) BaseType_t;
pub extern fn xQueueIsQueueEmptyFromISR(xQueue: QueueHandle_t) BaseType_t;
pub extern fn xQueueIsQueueFullFromISR(xQueue: QueueHandle_t) BaseType_t;
pub extern fn uxQueueMessagesWaitingFromISR(xQueue: QueueHandle_t) UBaseType_t;
pub extern fn xQueueCRSendFromISR(xQueue: QueueHandle_t, pvItemToQueue: ?*const anyopaque, xCoRoutinePreviouslyWoken: BaseType_t) BaseType_t;
pub extern fn xQueueCRReceiveFromISR(xQueue: QueueHandle_t, pvBuffer: ?*anyopaque, pxTaskWoken: [*c]BaseType_t) BaseType_t;
pub extern fn xQueueCRSend(xQueue: QueueHandle_t, pvItemToQueue: ?*const anyopaque, xTicksToWait: TickType_t) BaseType_t;
pub extern fn xQueueCRReceive(xQueue: QueueHandle_t, pvBuffer: ?*anyopaque, xTicksToWait: TickType_t) BaseType_t;
pub extern fn xQueueCreateMutex(ucQueueType: u8) QueueHandle_t;
pub extern fn xQueueCreateMutexStatic(ucQueueType: u8, pxStaticQueue: [*c]StaticQueue_t) QueueHandle_t;
pub extern fn xQueueCreateCountingSemaphore(uxMaxCount: UBaseType_t, uxInitialCount: UBaseType_t) QueueHandle_t;
pub extern fn xQueueCreateCountingSemaphoreStatic(uxMaxCount: UBaseType_t, uxInitialCount: UBaseType_t, pxStaticQueue: [*c]StaticQueue_t) QueueHandle_t;
pub extern fn xQueueSemaphoreTake(xQueue: QueueHandle_t, xTicksToWait: TickType_t) BaseType_t;
pub extern fn xQueueGetMutexHolder(xSemaphore: QueueHandle_t) TaskHandle_t;
pub extern fn xQueueGetMutexHolderFromISR(xSemaphore: QueueHandle_t) TaskHandle_t;
pub extern fn xQueueTakeMutexRecursive(xMutex: QueueHandle_t, xTicksToWait: TickType_t) BaseType_t;
pub extern fn xQueueGiveMutexRecursive(xMutex: QueueHandle_t) BaseType_t;
pub extern fn xQueueGenericCreate(uxQueueLength: UBaseType_t, uxItemSize: UBaseType_t, ucQueueType: u8) QueueHandle_t;
pub extern fn xQueueGenericCreateStatic(uxQueueLength: UBaseType_t, uxItemSize: UBaseType_t, pucQueueStorage: [*c]u8, pxStaticQueue: [*c]StaticQueue_t, ucQueueType: u8) QueueHandle_t;
pub extern fn xQueueGenericGetStaticBuffers(xQueue: QueueHandle_t, ppucQueueStorage: [*c][*c]u8, ppxStaticQueue: [*c][*c]StaticQueue_t) BaseType_t;
pub extern fn xQueueCreateSet(uxEventQueueLength: UBaseType_t) QueueSetHandle_t;
pub extern fn xQueueAddToSet(xQueueOrSemaphore: QueueSetMemberHandle_t, xQueueSet: QueueSetHandle_t) BaseType_t;
pub extern fn xQueueRemoveFromSet(xQueueOrSemaphore: QueueSetMemberHandle_t, xQueueSet: QueueSetHandle_t) BaseType_t;
pub extern fn xQueueSelectFromSet(xQueueSet: QueueSetHandle_t, xTicksToWait: TickType_t) QueueSetMemberHandle_t;
pub extern fn xQueueSelectFromSetFromISR(xQueueSet: QueueSetHandle_t) QueueSetMemberHandle_t;
pub extern fn vQueueWaitForMessageRestricted(xQueue: QueueHandle_t, xTicksToWait: TickType_t, xWaitIndefinitely: BaseType_t) void;
pub extern fn xQueueGenericReset(xQueue: QueueHandle_t, xNewQueue: BaseType_t) BaseType_t;
pub extern fn vQueueSetQueueNumber(xQueue: QueueHandle_t, uxQueueNumber: UBaseType_t) void;
pub extern fn uxQueueGetQueueNumber(xQueue: QueueHandle_t) UBaseType_t;
pub extern fn ucQueueGetQueueType(xQueue: QueueHandle_t) u8;
pub const SemaphoreHandle_t = QueueHandle_t;
pub const ESP_LOG_NONE: c_int = 0;
pub const ESP_LOG_ERROR: c_int = 1;
pub const ESP_LOG_WARN: c_int = 2;
pub const ESP_LOG_INFO: c_int = 3;
pub const ESP_LOG_DEBUG: c_int = 4;
pub const ESP_LOG_VERBOSE: c_int = 5;
pub const esp_log_level_t = c_uint;
pub const vprintf_like_t = ?*const fn ([*c]const u8, va_list) callconv(.c) c_int;
pub extern var esp_log_default_level: esp_log_level_t;
pub extern fn esp_log_level_set(tag: [*c]const u8, level: esp_log_level_t) void;
pub extern fn esp_log_level_get(tag: [*c]const u8) esp_log_level_t;
pub extern fn esp_log_set_vprintf(func: vprintf_like_t) vprintf_like_t;
pub extern fn esp_log_timestamp() u32;
pub extern fn esp_log_system_timestamp() [*c]u8;
pub extern fn esp_log_early_timestamp() u32;
pub extern fn esp_log_write(level: esp_log_level_t, tag: [*c]const u8, format: [*c]const u8, ...) void;
pub extern fn esp_log_writev(level: esp_log_level_t, tag: [*c]const u8, format: [*c]const u8, args: va_list) void;
pub extern fn esp_log_buffer_hex_internal(tag: [*c]const u8, buffer: ?*const anyopaque, buff_len: u16, level: esp_log_level_t) void;
pub extern fn esp_log_buffer_char_internal(tag: [*c]const u8, buffer: ?*const anyopaque, buff_len: u16, level: esp_log_level_t) void;
pub extern fn esp_log_buffer_hexdump_internal(tag: [*c]const u8, buffer: ?*const anyopaque, buff_len: u16, log_level: esp_log_level_t) void;
pub const struct_esp_etm_channel_t = opaque {};
pub const esp_etm_channel_handle_t = ?*struct_esp_etm_channel_t;
pub const struct_esp_etm_event_t = opaque {};
pub const esp_etm_event_handle_t = ?*struct_esp_etm_event_t;
pub const struct_esp_etm_task_t = opaque {};
pub const esp_etm_task_handle_t = ?*struct_esp_etm_task_t;
pub const esp_etm_channel_config_t = extern struct {};
pub extern fn esp_etm_new_channel(config: [*c]const esp_etm_channel_config_t, ret_chan: [*c]esp_etm_channel_handle_t) esp_err_t;
pub extern fn esp_etm_del_channel(chan: esp_etm_channel_handle_t) esp_err_t;
pub extern fn esp_etm_channel_enable(chan: esp_etm_channel_handle_t) esp_err_t;
pub extern fn esp_etm_channel_disable(chan: esp_etm_channel_handle_t) esp_err_t;
pub extern fn esp_etm_channel_connect(chan: esp_etm_channel_handle_t, event: esp_etm_event_handle_t, task: esp_etm_task_handle_t) esp_err_t;
pub extern fn esp_etm_del_event(event: esp_etm_event_handle_t) esp_err_t;
pub extern fn esp_etm_del_task(task: esp_etm_task_handle_t) esp_err_t;
pub extern fn esp_etm_dump(out_stream: [*c]FILE) esp_err_t;
pub const struct_esp_timer = opaque {};
pub const esp_timer_handle_t = ?*struct_esp_timer;
pub const esp_timer_cb_t = ?*const fn (?*anyopaque) callconv(.c) void;
pub const ESP_TIMER_TASK: c_int = 0;
pub const ESP_TIMER_MAX: c_int = 1;
pub const esp_timer_dispatch_t = c_uint;
pub const esp_timer_create_args_t = extern struct {
    callback: esp_timer_cb_t = @import("std").mem.zeroes(esp_timer_cb_t),
    arg: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dispatch_method: esp_timer_dispatch_t = @import("std").mem.zeroes(esp_timer_dispatch_t),
    name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    skip_unhandled_events: bool = @import("std").mem.zeroes(bool),
};
pub extern fn esp_timer_early_init() esp_err_t;
pub extern fn esp_timer_init() esp_err_t;
pub extern fn esp_timer_deinit() esp_err_t;
pub extern fn esp_timer_create(create_args: [*c]const esp_timer_create_args_t, out_handle: [*c]esp_timer_handle_t) esp_err_t;
pub extern fn esp_timer_start_once(timer: esp_timer_handle_t, timeout_us: u64) esp_err_t;
pub extern fn esp_timer_start_periodic(timer: esp_timer_handle_t, period: u64) esp_err_t;
pub extern fn esp_timer_restart(timer: esp_timer_handle_t, timeout_us: u64) esp_err_t;
pub extern fn esp_timer_stop(timer: esp_timer_handle_t) esp_err_t;
pub extern fn esp_timer_delete(timer: esp_timer_handle_t) esp_err_t;
pub extern fn esp_timer_get_time() i64;
pub extern fn esp_timer_get_next_alarm() i64;
pub extern fn esp_timer_get_next_alarm_for_wake_up() i64;
pub extern fn esp_timer_get_period(timer: esp_timer_handle_t, period: [*c]u64) esp_err_t;
pub extern fn esp_timer_get_expiry_time(timer: esp_timer_handle_t, expiry: [*c]u64) esp_err_t;
pub extern fn esp_timer_dump(stream: [*c]FILE) esp_err_t;
pub extern fn esp_timer_is_active(timer: esp_timer_handle_t) bool;
pub extern fn esp_timer_new_etm_alarm_event(out_event: [*c]esp_etm_event_handle_t) esp_err_t;
pub const esp_apptrace_tmo_t = extern struct {
    start: i64 = @import("std").mem.zeroes(i64),
    tmo: i64 = @import("std").mem.zeroes(i64),
    elapsed: i64 = @import("std").mem.zeroes(i64),
};
pub fn esp_apptrace_tmo_init(arg_tmo: [*c]esp_apptrace_tmo_t, arg_user_tmo: u32) callconv(.c) void {
    var tmo = arg_tmo;
    _ = &tmo;
    var user_tmo = arg_user_tmo;
    _ = &user_tmo;
    tmo.*.start = esp_timer_get_time();
    tmo.*.tmo = if (user_tmo == @as(u32, @bitCast(-@as(c_int, 1)))) @as(i64, @bitCast(@as(c_longlong, -@as(c_int, 1)))) else @as(i64, @bitCast(@as(c_ulonglong, user_tmo)));
    tmo.*.elapsed = 0;
}
pub extern fn esp_apptrace_tmo_check(tmo: [*c]esp_apptrace_tmo_t) esp_err_t;
pub fn esp_apptrace_tmo_remaining_us(arg_tmo: [*c]esp_apptrace_tmo_t) callconv(.c) u32 {
    var tmo = arg_tmo;
    _ = &tmo;
    return @as(u32, @bitCast(@as(c_int, @truncate(if (tmo.*.tmo != @as(i64, @bitCast(@as(c_longlong, -@as(c_int, 1))))) tmo.*.elapsed - tmo.*.tmo else @as(i64, @bitCast(@as(c_ulonglong, @as(u32, @bitCast(-@as(c_int, 1))))))))));
}
pub const esp_apptrace_lock_t = extern struct {
    mux: spinlock_t = @import("std").mem.zeroes(spinlock_t),
    int_state: c_uint = @import("std").mem.zeroes(c_uint),
};
pub fn esp_apptrace_lock_init(arg_lock: [*c]esp_apptrace_lock_t) callconv(.c) void {
    var lock = arg_lock;
    _ = &lock;
    spinlock_initialize(&lock.*.mux);
    lock.*.int_state = 0;
}
pub extern fn esp_apptrace_lock_take(lock: [*c]esp_apptrace_lock_t, tmo: [*c]esp_apptrace_tmo_t) esp_err_t;
pub extern fn esp_apptrace_lock_give(lock: [*c]esp_apptrace_lock_t) esp_err_t;
pub const esp_apptrace_rb_t = extern struct {
    data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    size: u32 = @import("std").mem.zeroes(u32),
    cur_size: u32 = @import("std").mem.zeroes(u32),
    rd: u32 = @import("std").mem.zeroes(u32),
    wr: u32 = @import("std").mem.zeroes(u32),
};
pub fn esp_apptrace_rb_init(arg_rb: [*c]esp_apptrace_rb_t, arg_data: [*c]u8, arg_size: u32) callconv(.c) void {
    var rb = arg_rb;
    _ = &rb;
    var data = arg_data;
    _ = &data;
    var size = arg_size;
    _ = &size;
    rb.*.data = data;
    rb.*.size = blk: {
        const tmp = size;
        rb.*.cur_size = tmp;
        break :blk tmp;
    };
    rb.*.rd = 0;
    rb.*.wr = 0;
}
pub extern fn esp_apptrace_rb_produce(rb: [*c]esp_apptrace_rb_t, size: u32) [*c]u8;
pub extern fn esp_apptrace_rb_consume(rb: [*c]esp_apptrace_rb_t, size: u32) [*c]u8;
pub extern fn esp_apptrace_rb_read_size_get(rb: [*c]esp_apptrace_rb_t) u32;
pub extern fn esp_apptrace_rb_write_size_get(rb: [*c]esp_apptrace_rb_t) u32;
pub extern fn esp_apptrace_log_lock() c_int;
pub extern fn esp_apptrace_log_unlock() void;
pub const ESP_APPTRACE_DEST_JTAG: c_int = 1;
pub const ESP_APPTRACE_DEST_TRAX: c_int = 1;
pub const ESP_APPTRACE_DEST_UART: c_int = 2;
pub const ESP_APPTRACE_DEST_MAX: c_int = 3;
pub const ESP_APPTRACE_DEST_NUM: c_int = 4;
pub const esp_apptrace_dest_t = c_uint;
pub extern fn esp_apptrace_init() esp_err_t;
pub extern fn esp_apptrace_down_buffer_config(buf: [*c]u8, size: u32) void;
pub extern fn esp_apptrace_buffer_get(dest: esp_apptrace_dest_t, size: u32, tmo: u32) [*c]u8;
pub extern fn esp_apptrace_buffer_put(dest: esp_apptrace_dest_t, ptr: [*c]u8, tmo: u32) esp_err_t;
pub extern fn esp_apptrace_write(dest: esp_apptrace_dest_t, data: ?*const anyopaque, size: u32, tmo: u32) esp_err_t;
pub extern fn esp_apptrace_vprintf_to(dest: esp_apptrace_dest_t, tmo: u32, fmt: [*c]const u8, ap: va_list) c_int;
pub extern fn esp_apptrace_vprintf(fmt: [*c]const u8, ap: va_list) c_int;
pub extern fn esp_apptrace_flush(dest: esp_apptrace_dest_t, tmo: u32) esp_err_t;
pub extern fn esp_apptrace_flush_nolock(dest: esp_apptrace_dest_t, min_sz: u32, tmo: u32) esp_err_t;
pub extern fn esp_apptrace_read(dest: esp_apptrace_dest_t, data: ?*anyopaque, size: [*c]u32, tmo: u32) esp_err_t;
pub extern fn esp_apptrace_down_buffer_get(dest: esp_apptrace_dest_t, size: [*c]u32, tmo: u32) [*c]u8;
pub extern fn esp_apptrace_down_buffer_put(dest: esp_apptrace_dest_t, ptr: [*c]u8, tmo: u32) esp_err_t;
pub extern fn esp_apptrace_host_is_connected(dest: esp_apptrace_dest_t) bool;
pub extern fn esp_apptrace_fopen(dest: esp_apptrace_dest_t, path: [*c]const u8, mode: [*c]const u8) ?*anyopaque;
pub extern fn esp_apptrace_fclose(dest: esp_apptrace_dest_t, stream: ?*anyopaque) c_int;
pub extern fn esp_apptrace_fwrite(dest: esp_apptrace_dest_t, ptr: ?*const anyopaque, size: usize, nmemb: usize, stream: ?*anyopaque) usize;
pub extern fn esp_apptrace_fread(dest: esp_apptrace_dest_t, ptr: ?*anyopaque, size: usize, nmemb: usize, stream: ?*anyopaque) usize;
pub extern fn esp_apptrace_fseek(dest: esp_apptrace_dest_t, stream: ?*anyopaque, offset: c_long, whence: c_int) c_int;
pub extern fn esp_apptrace_ftell(dest: esp_apptrace_dest_t, stream: ?*anyopaque) c_int;
pub extern fn esp_apptrace_fstop(dest: esp_apptrace_dest_t) c_int;
pub extern fn esp_apptrace_feof(dest: esp_apptrace_dest_t, stream: ?*anyopaque) c_int;
pub extern fn esp_gcov_dump() void;
pub const esp_event_base_t = [*c]const u8;
pub const esp_event_loop_handle_t = ?*anyopaque;
pub const esp_event_handler_t = ?*const fn (?*anyopaque, esp_event_base_t, i32, ?*anyopaque) callconv(.c) void;
pub const esp_event_handler_instance_t = ?*anyopaque;
pub const ESP_IF_WIFI_STA: c_int = 0;
pub const ESP_IF_WIFI_AP: c_int = 1;
pub const ESP_IF_WIFI_NAN: c_int = 2;
pub const ESP_IF_ETH: c_int = 3;
pub const ESP_IF_MAX: c_int = 4;
pub const esp_interface_t = c_uint;
pub const WIFI_MODE_NULL: c_int = 0;
pub const WIFI_MODE_STA: c_int = 1;
pub const WIFI_MODE_AP: c_int = 2;
pub const WIFI_MODE_APSTA: c_int = 3;
pub const WIFI_MODE_NAN: c_int = 4;
pub const WIFI_MODE_MAX: c_int = 5;
pub const wifi_mode_t = c_uint;
pub const WIFI_IF_STA: c_int = 0;
pub const WIFI_IF_AP: c_int = 1;
pub const WIFI_IF_NAN: c_int = 2;
pub const WIFI_IF_MAX: c_int = 3;
pub const wifi_interface_t = c_uint;
pub const WIFI_COUNTRY_POLICY_AUTO: c_int = 0;
pub const WIFI_COUNTRY_POLICY_MANUAL: c_int = 1;
pub const wifi_country_policy_t = c_uint;
pub const wifi_country_t = extern struct {
    cc: [3]u8 = @import("std").mem.zeroes([3]u8),
    schan: u8 = @import("std").mem.zeroes(u8),
    nchan: u8 = @import("std").mem.zeroes(u8),
    max_tx_power: i8 = @import("std").mem.zeroes(i8),
    policy: wifi_country_policy_t = @import("std").mem.zeroes(wifi_country_policy_t),
};
pub const WIFI_AUTH_OPEN: c_int = 0;
pub const WIFI_AUTH_WEP: c_int = 1;
pub const WIFI_AUTH_WPA_PSK: c_int = 2;
pub const WIFI_AUTH_WPA2_PSK: c_int = 3;
pub const WIFI_AUTH_WPA_WPA2_PSK: c_int = 4;
pub const WIFI_AUTH_ENTERPRISE: c_int = 5;
pub const WIFI_AUTH_WPA2_ENTERPRISE: c_int = 5;
pub const WIFI_AUTH_WPA3_PSK: c_int = 6;
pub const WIFI_AUTH_WPA2_WPA3_PSK: c_int = 7;
pub const WIFI_AUTH_WAPI_PSK: c_int = 8;
pub const WIFI_AUTH_OWE: c_int = 9;
pub const WIFI_AUTH_WPA3_ENT_192: c_int = 10;
pub const WIFI_AUTH_WPA3_EXT_PSK: c_int = 11;
pub const WIFI_AUTH_WPA3_EXT_PSK_MIXED_MODE: c_int = 12;
pub const WIFI_AUTH_DPP: c_int = 13;
pub const WIFI_AUTH_MAX: c_int = 14;
pub const wifi_auth_mode_t = c_uint;
pub const WIFI_REASON_UNSPECIFIED: c_int = 1;
pub const WIFI_REASON_AUTH_EXPIRE: c_int = 2;
pub const WIFI_REASON_AUTH_LEAVE: c_int = 3;
pub const WIFI_REASON_ASSOC_EXPIRE: c_int = 4;
pub const WIFI_REASON_ASSOC_TOOMANY: c_int = 5;
pub const WIFI_REASON_NOT_AUTHED: c_int = 6;
pub const WIFI_REASON_NOT_ASSOCED: c_int = 7;
pub const WIFI_REASON_ASSOC_LEAVE: c_int = 8;
pub const WIFI_REASON_ASSOC_NOT_AUTHED: c_int = 9;
pub const WIFI_REASON_DISASSOC_PWRCAP_BAD: c_int = 10;
pub const WIFI_REASON_DISASSOC_SUPCHAN_BAD: c_int = 11;
pub const WIFI_REASON_BSS_TRANSITION_DISASSOC: c_int = 12;
pub const WIFI_REASON_IE_INVALID: c_int = 13;
pub const WIFI_REASON_MIC_FAILURE: c_int = 14;
pub const WIFI_REASON_4WAY_HANDSHAKE_TIMEOUT: c_int = 15;
pub const WIFI_REASON_GROUP_KEY_UPDATE_TIMEOUT: c_int = 16;
pub const WIFI_REASON_IE_IN_4WAY_DIFFERS: c_int = 17;
pub const WIFI_REASON_GROUP_CIPHER_INVALID: c_int = 18;
pub const WIFI_REASON_PAIRWISE_CIPHER_INVALID: c_int = 19;
pub const WIFI_REASON_AKMP_INVALID: c_int = 20;
pub const WIFI_REASON_UNSUPP_RSN_IE_VERSION: c_int = 21;
pub const WIFI_REASON_INVALID_RSN_IE_CAP: c_int = 22;
pub const WIFI_REASON_802_1X_AUTH_FAILED: c_int = 23;
pub const WIFI_REASON_CIPHER_SUITE_REJECTED: c_int = 24;
pub const WIFI_REASON_TDLS_PEER_UNREACHABLE: c_int = 25;
pub const WIFI_REASON_TDLS_UNSPECIFIED: c_int = 26;
pub const WIFI_REASON_SSP_REQUESTED_DISASSOC: c_int = 27;
pub const WIFI_REASON_NO_SSP_ROAMING_AGREEMENT: c_int = 28;
pub const WIFI_REASON_BAD_CIPHER_OR_AKM: c_int = 29;
pub const WIFI_REASON_NOT_AUTHORIZED_THIS_LOCATION: c_int = 30;
pub const WIFI_REASON_SERVICE_CHANGE_PERCLUDES_TS: c_int = 31;
pub const WIFI_REASON_UNSPECIFIED_QOS: c_int = 32;
pub const WIFI_REASON_NOT_ENOUGH_BANDWIDTH: c_int = 33;
pub const WIFI_REASON_MISSING_ACKS: c_int = 34;
pub const WIFI_REASON_EXCEEDED_TXOP: c_int = 35;
pub const WIFI_REASON_STA_LEAVING: c_int = 36;
pub const WIFI_REASON_END_BA: c_int = 37;
pub const WIFI_REASON_UNKNOWN_BA: c_int = 38;
pub const WIFI_REASON_TIMEOUT: c_int = 39;
pub const WIFI_REASON_PEER_INITIATED: c_int = 46;
pub const WIFI_REASON_AP_INITIATED: c_int = 47;
pub const WIFI_REASON_INVALID_FT_ACTION_FRAME_COUNT: c_int = 48;
pub const WIFI_REASON_INVALID_PMKID: c_int = 49;
pub const WIFI_REASON_INVALID_MDE: c_int = 50;
pub const WIFI_REASON_INVALID_FTE: c_int = 51;
pub const WIFI_REASON_TRANSMISSION_LINK_ESTABLISH_FAILED: c_int = 67;
pub const WIFI_REASON_ALTERATIVE_CHANNEL_OCCUPIED: c_int = 68;
pub const WIFI_REASON_BEACON_TIMEOUT: c_int = 200;
pub const WIFI_REASON_NO_AP_FOUND: c_int = 201;
pub const WIFI_REASON_AUTH_FAIL: c_int = 202;
pub const WIFI_REASON_ASSOC_FAIL: c_int = 203;
pub const WIFI_REASON_HANDSHAKE_TIMEOUT: c_int = 204;
pub const WIFI_REASON_CONNECTION_FAIL: c_int = 205;
pub const WIFI_REASON_AP_TSF_RESET: c_int = 206;
pub const WIFI_REASON_ROAMING: c_int = 207;
pub const WIFI_REASON_ASSOC_COMEBACK_TIME_TOO_LONG: c_int = 208;
pub const WIFI_REASON_SA_QUERY_TIMEOUT: c_int = 209;
pub const WIFI_REASON_NO_AP_FOUND_W_COMPATIBLE_SECURITY: c_int = 210;
pub const WIFI_REASON_NO_AP_FOUND_IN_AUTHMODE_THRESHOLD: c_int = 211;
pub const WIFI_REASON_NO_AP_FOUND_IN_RSSI_THRESHOLD: c_int = 212;
pub const wifi_err_reason_t = c_uint;
pub const WIFI_SECOND_CHAN_NONE: c_int = 0;
pub const WIFI_SECOND_CHAN_ABOVE: c_int = 1;
pub const WIFI_SECOND_CHAN_BELOW: c_int = 2;
pub const wifi_second_chan_t = c_uint;
pub const WIFI_SCAN_TYPE_ACTIVE: c_int = 0;
pub const WIFI_SCAN_TYPE_PASSIVE: c_int = 1;
pub const wifi_scan_type_t = c_uint;
pub const wifi_active_scan_time_t = extern struct {
    min: u32 = @import("std").mem.zeroes(u32),
    max: u32 = @import("std").mem.zeroes(u32),
};
pub const wifi_scan_time_t = extern struct {
    active: wifi_active_scan_time_t = @import("std").mem.zeroes(wifi_active_scan_time_t),
    passive: u32 = @import("std").mem.zeroes(u32),
};
pub const wifi_scan_channel_bitmap_t = extern struct {
    ghz_2_channels: u16 = @import("std").mem.zeroes(u16),
    ghz_5_channels: u32 = @import("std").mem.zeroes(u32),
};
pub const wifi_scan_config_t = extern struct {
    ssid: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    bssid: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    channel: u8 = @import("std").mem.zeroes(u8),
    show_hidden: bool = @import("std").mem.zeroes(bool),
    scan_type: wifi_scan_type_t = @import("std").mem.zeroes(wifi_scan_type_t),
    scan_time: wifi_scan_time_t = @import("std").mem.zeroes(wifi_scan_time_t),
    home_chan_dwell_time: u8 = @import("std").mem.zeroes(u8),
    channel_bitmap: wifi_scan_channel_bitmap_t = @import("std").mem.zeroes(wifi_scan_channel_bitmap_t),
};
pub const wifi_scan_default_params_t = extern struct {
    scan_time: wifi_scan_time_t = @import("std").mem.zeroes(wifi_scan_time_t),
    home_chan_dwell_time: u8 = @import("std").mem.zeroes(u8),
};
pub const WIFI_CIPHER_TYPE_NONE: c_int = 0;
pub const WIFI_CIPHER_TYPE_WEP40: c_int = 1;
pub const WIFI_CIPHER_TYPE_WEP104: c_int = 2;
pub const WIFI_CIPHER_TYPE_TKIP: c_int = 3;
pub const WIFI_CIPHER_TYPE_CCMP: c_int = 4;
pub const WIFI_CIPHER_TYPE_TKIP_CCMP: c_int = 5;
pub const WIFI_CIPHER_TYPE_AES_CMAC128: c_int = 6;
pub const WIFI_CIPHER_TYPE_SMS4: c_int = 7;
pub const WIFI_CIPHER_TYPE_GCMP: c_int = 8;
pub const WIFI_CIPHER_TYPE_GCMP256: c_int = 9;
pub const WIFI_CIPHER_TYPE_AES_GMAC128: c_int = 10;
pub const WIFI_CIPHER_TYPE_AES_GMAC256: c_int = 11;
pub const WIFI_CIPHER_TYPE_UNKNOWN: c_int = 12;
pub const wifi_cipher_type_t = c_uint;
pub const WIFI_ANT_ANT0: c_int = 0;
pub const WIFI_ANT_ANT1: c_int = 1;
pub const WIFI_ANT_MAX: c_int = 2;
pub const wifi_ant_t = c_uint;
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:231:13: warning: struct demoted to opaque type - has bitfield
pub const wifi_he_ap_info_t = opaque {};
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:248:14: warning: struct demoted to opaque type - has bitfield
pub const wifi_ap_record_t = opaque {};
pub const WIFI_FAST_SCAN: c_int = 0;
pub const WIFI_ALL_CHANNEL_SCAN: c_int = 1;
pub const wifi_scan_method_t = c_uint;
pub const WIFI_CONNECT_AP_BY_SIGNAL: c_int = 0;
pub const WIFI_CONNECT_AP_BY_SECURITY: c_int = 1;
pub const wifi_sort_method_t = c_uint;
pub const wifi_scan_threshold_t = extern struct {
    rssi: i8 = @import("std").mem.zeroes(i8),
    authmode: wifi_auth_mode_t = @import("std").mem.zeroes(wifi_auth_mode_t),
};
pub const WIFI_PS_NONE: c_int = 0;
pub const WIFI_PS_MIN_MODEM: c_int = 1;
pub const WIFI_PS_MAX_MODEM: c_int = 2;
pub const wifi_ps_type_t = c_uint;
pub const WIFI_BW_HT20: c_int = 1;
pub const WIFI_BW20: c_int = 1;
pub const WIFI_BW_HT40: c_int = 2;
pub const WIFI_BW40: c_int = 2;
pub const WIFI_BW80: c_int = 3;
pub const WIFI_BW160: c_int = 4;
pub const WIFI_BW80_BW80: c_int = 5;
pub const wifi_bandwidth_t = c_uint;
pub const wifi_pmf_config_t = extern struct {
    capable: bool = @import("std").mem.zeroes(bool),
    required: bool = @import("std").mem.zeroes(bool),
};
pub const WPA3_SAE_PWE_UNSPECIFIED: c_int = 0;
pub const WPA3_SAE_PWE_HUNT_AND_PECK: c_int = 1;
pub const WPA3_SAE_PWE_HASH_TO_ELEMENT: c_int = 2;
pub const WPA3_SAE_PWE_BOTH: c_int = 3;
pub const wifi_sae_pwe_method_t = c_uint;
pub const WPA3_SAE_PK_MODE_AUTOMATIC: c_int = 0;
pub const WPA3_SAE_PK_MODE_ONLY: c_int = 1;
pub const WPA3_SAE_PK_MODE_DISABLED: c_int = 2;
pub const wifi_sae_pk_mode_t = c_uint;
pub const wifi_ap_config_t = extern struct {
    ssid: [32]u8 = @import("std").mem.zeroes([32]u8),
    password: [64]u8 = @import("std").mem.zeroes([64]u8),
    ssid_len: u8 = @import("std").mem.zeroes(u8),
    channel: u8 = @import("std").mem.zeroes(u8),
    authmode: wifi_auth_mode_t = @import("std").mem.zeroes(wifi_auth_mode_t),
    ssid_hidden: u8 = @import("std").mem.zeroes(u8),
    max_connection: u8 = @import("std").mem.zeroes(u8),
    beacon_interval: u16 = @import("std").mem.zeroes(u16),
    csa_count: u8 = @import("std").mem.zeroes(u8),
    dtim_period: u8 = @import("std").mem.zeroes(u8),
    pairwise_cipher: wifi_cipher_type_t = @import("std").mem.zeroes(wifi_cipher_type_t),
    ftm_responder: bool = @import("std").mem.zeroes(bool),
    pmf_cfg: wifi_pmf_config_t = @import("std").mem.zeroes(wifi_pmf_config_t),
    sae_pwe_h2e: wifi_sae_pwe_method_t = @import("std").mem.zeroes(wifi_sae_pwe_method_t),
};
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:364:14: warning: struct demoted to opaque type - has bitfield
pub const wifi_sta_config_t = opaque {};
pub const wifi_nan_config_t = extern struct {
    op_channel: u8 = @import("std").mem.zeroes(u8),
    master_pref: u8 = @import("std").mem.zeroes(u8),
    scan_time: u8 = @import("std").mem.zeroes(u8),
    warm_up_sec: u16 = @import("std").mem.zeroes(u16),
};
pub const wifi_config_t = extern union {
    ap: wifi_ap_config_t,
    sta: wifi_sta_config_t,
    nan: wifi_nan_config_t,
};
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:414:14: warning: struct demoted to opaque type - has bitfield
pub const wifi_sta_info_t = opaque {};
pub const WIFI_STORAGE_FLASH: c_int = 0;
pub const WIFI_STORAGE_RAM: c_int = 1;
pub const wifi_storage_t = c_uint;
pub const WIFI_VND_IE_TYPE_BEACON: c_int = 0;
pub const WIFI_VND_IE_TYPE_PROBE_REQ: c_int = 1;
pub const WIFI_VND_IE_TYPE_PROBE_RESP: c_int = 2;
pub const WIFI_VND_IE_TYPE_ASSOC_REQ: c_int = 3;
pub const WIFI_VND_IE_TYPE_ASSOC_RESP: c_int = 4;
pub const wifi_vendor_ie_type_t = c_uint;
pub const WIFI_VND_IE_ID_0: c_int = 0;
pub const WIFI_VND_IE_ID_1: c_int = 1;
pub const wifi_vendor_ie_id_t = c_uint;
pub const WIFI_PHY_MODE_LR: c_int = 0;
pub const WIFI_PHY_MODE_11B: c_int = 1;
pub const WIFI_PHY_MODE_11G: c_int = 2;
pub const WIFI_PHY_MODE_11A: c_int = 3;
pub const WIFI_PHY_MODE_HT20: c_int = 4;
pub const WIFI_PHY_MODE_HT40: c_int = 5;
pub const WIFI_PHY_MODE_HE20: c_int = 6;
pub const WIFI_PHY_MODE_VHT20: c_int = 7;
pub const wifi_phy_mode_t = c_uint;
pub const vendor_ie_data_t = extern struct {
    element_id: u8 align(1) = @import("std").mem.zeroes(u8),
    length: u8 = @import("std").mem.zeroes(u8),
    vendor_oui: [3]u8 = @import("std").mem.zeroes([3]u8),
    vendor_oui_type: u8 = @import("std").mem.zeroes(u8),
    pub fn payload(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 6)));
    }
};
pub const WIFI_PKT_MGMT: c_int = 0;
pub const WIFI_PKT_CTRL: c_int = 1;
pub const WIFI_PKT_DATA: c_int = 2;
pub const WIFI_PKT_MISC: c_int = 3;
pub const wifi_promiscuous_pkt_type_t = c_uint;
pub const wifi_promiscuous_filter_t = extern struct {
    filter_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_wifi_csi_info_t = opaque {};
pub const wifi_csi_info_t = struct_wifi_csi_info_t;
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:535:13: warning: struct demoted to opaque type - has bitfield
pub const wifi_ant_gpio_t = opaque {};
pub const wifi_ant_gpio_config_t = extern struct {
    gpio_cfg: [4]wifi_ant_gpio_t = @import("std").mem.zeroes([4]wifi_ant_gpio_t),
};
pub const WIFI_ANT_MODE_ANT0: c_int = 0;
pub const WIFI_ANT_MODE_ANT1: c_int = 1;
pub const WIFI_ANT_MODE_AUTO: c_int = 2;
pub const WIFI_ANT_MODE_MAX: c_int = 3;
pub const wifi_ant_mode_t = c_uint;
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:566:21: warning: struct demoted to opaque type - has bitfield
pub const wifi_ant_config_t = opaque {};
pub const wifi_action_rx_cb_t = ?*const fn ([*c]u8, [*c]u8, usize, u8) callconv(.c) c_int;
pub const wifi_action_tx_req_t = extern struct {
    ifx: wifi_interface_t align(4) = @import("std").mem.zeroes(wifi_interface_t),
    dest_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    no_ack: bool = @import("std").mem.zeroes(bool),
    rx_cb: wifi_action_rx_cb_t = @import("std").mem.zeroes(wifi_action_rx_cb_t),
    data_len: u32 = @import("std").mem.zeroes(u32),
    pub fn data(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 20)));
    }
};
pub const wifi_ftm_initiator_cfg_t = extern struct {
    resp_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    channel: u8 = @import("std").mem.zeroes(u8),
    frm_count: u8 = @import("std").mem.zeroes(u8),
    burst_period: u16 = @import("std").mem.zeroes(u16),
    use_get_report_api: bool = @import("std").mem.zeroes(bool),
};
pub const NAN_PUBLISH_SOLICITED: c_int = 0;
pub const NAN_PUBLISH_UNSOLICITED: c_int = 1;
pub const NAN_SUBSCRIBE_ACTIVE: c_int = 2;
pub const NAN_SUBSCRIBE_PASSIVE: c_int = 3;
pub const wifi_nan_service_type_t = c_uint;
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:638:13: warning: struct demoted to opaque type - has bitfield
pub const wifi_nan_publish_cfg_t = opaque {};
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:652:13: warning: struct demoted to opaque type - has bitfield
pub const wifi_nan_subscribe_cfg_t = opaque {};
pub const wifi_nan_followup_params_t = extern struct {
    inst_id: u8 = @import("std").mem.zeroes(u8),
    peer_inst_id: u8 = @import("std").mem.zeroes(u8),
    peer_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    svc_info: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const wifi_nan_datapath_req_t = extern struct {
    pub_id: u8 = @import("std").mem.zeroes(u8),
    peer_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    confirm_required: bool = @import("std").mem.zeroes(bool),
};
pub const wifi_nan_datapath_resp_t = extern struct {
    accept: bool = @import("std").mem.zeroes(bool),
    ndp_id: u8 = @import("std").mem.zeroes(u8),
    peer_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const wifi_nan_datapath_end_req_t = extern struct {
    ndp_id: u8 = @import("std").mem.zeroes(u8),
    peer_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const WIFI_PHY_RATE_1M_L: c_int = 0;
pub const WIFI_PHY_RATE_2M_L: c_int = 1;
pub const WIFI_PHY_RATE_5M_L: c_int = 2;
pub const WIFI_PHY_RATE_11M_L: c_int = 3;
pub const WIFI_PHY_RATE_2M_S: c_int = 5;
pub const WIFI_PHY_RATE_5M_S: c_int = 6;
pub const WIFI_PHY_RATE_11M_S: c_int = 7;
pub const WIFI_PHY_RATE_48M: c_int = 8;
pub const WIFI_PHY_RATE_24M: c_int = 9;
pub const WIFI_PHY_RATE_12M: c_int = 10;
pub const WIFI_PHY_RATE_6M: c_int = 11;
pub const WIFI_PHY_RATE_54M: c_int = 12;
pub const WIFI_PHY_RATE_36M: c_int = 13;
pub const WIFI_PHY_RATE_18M: c_int = 14;
pub const WIFI_PHY_RATE_9M: c_int = 15;
pub const WIFI_PHY_RATE_MCS0_LGI: c_int = 16;
pub const WIFI_PHY_RATE_MCS1_LGI: c_int = 17;
pub const WIFI_PHY_RATE_MCS2_LGI: c_int = 18;
pub const WIFI_PHY_RATE_MCS3_LGI: c_int = 19;
pub const WIFI_PHY_RATE_MCS4_LGI: c_int = 20;
pub const WIFI_PHY_RATE_MCS5_LGI: c_int = 21;
pub const WIFI_PHY_RATE_MCS6_LGI: c_int = 22;
pub const WIFI_PHY_RATE_MCS7_LGI: c_int = 23;
pub const WIFI_PHY_RATE_MCS0_SGI: c_int = 24;
pub const WIFI_PHY_RATE_MCS1_SGI: c_int = 25;
pub const WIFI_PHY_RATE_MCS2_SGI: c_int = 26;
pub const WIFI_PHY_RATE_MCS3_SGI: c_int = 27;
pub const WIFI_PHY_RATE_MCS4_SGI: c_int = 28;
pub const WIFI_PHY_RATE_MCS5_SGI: c_int = 29;
pub const WIFI_PHY_RATE_MCS6_SGI: c_int = 30;
pub const WIFI_PHY_RATE_MCS7_SGI: c_int = 31;
pub const WIFI_PHY_RATE_LORA_250K: c_int = 41;
pub const WIFI_PHY_RATE_LORA_500K: c_int = 42;
pub const WIFI_PHY_RATE_MAX: c_int = 43;
pub const wifi_phy_rate_t = c_uint;
pub const WIFI_EVENT_WIFI_READY: c_int = 0;
pub const WIFI_EVENT_SCAN_DONE: c_int = 1;
pub const WIFI_EVENT_STA_START: c_int = 2;
pub const WIFI_EVENT_STA_STOP: c_int = 3;
pub const WIFI_EVENT_STA_CONNECTED: c_int = 4;
pub const WIFI_EVENT_STA_DISCONNECTED: c_int = 5;
pub const WIFI_EVENT_STA_AUTHMODE_CHANGE: c_int = 6;
pub const WIFI_EVENT_STA_WPS_ER_SUCCESS: c_int = 7;
pub const WIFI_EVENT_STA_WPS_ER_FAILED: c_int = 8;
pub const WIFI_EVENT_STA_WPS_ER_TIMEOUT: c_int = 9;
pub const WIFI_EVENT_STA_WPS_ER_PIN: c_int = 10;
pub const WIFI_EVENT_STA_WPS_ER_PBC_OVERLAP: c_int = 11;
pub const WIFI_EVENT_AP_START: c_int = 12;
pub const WIFI_EVENT_AP_STOP: c_int = 13;
pub const WIFI_EVENT_AP_STACONNECTED: c_int = 14;
pub const WIFI_EVENT_AP_STADISCONNECTED: c_int = 15;
pub const WIFI_EVENT_AP_PROBEREQRECVED: c_int = 16;
pub const WIFI_EVENT_FTM_REPORT: c_int = 17;
pub const WIFI_EVENT_STA_BSS_RSSI_LOW: c_int = 18;
pub const WIFI_EVENT_ACTION_TX_STATUS: c_int = 19;
pub const WIFI_EVENT_ROC_DONE: c_int = 20;
pub const WIFI_EVENT_STA_BEACON_TIMEOUT: c_int = 21;
pub const WIFI_EVENT_CONNECTIONLESS_MODULE_WAKE_INTERVAL_START: c_int = 22;
pub const WIFI_EVENT_AP_WPS_RG_SUCCESS: c_int = 23;
pub const WIFI_EVENT_AP_WPS_RG_FAILED: c_int = 24;
pub const WIFI_EVENT_AP_WPS_RG_TIMEOUT: c_int = 25;
pub const WIFI_EVENT_AP_WPS_RG_PIN: c_int = 26;
pub const WIFI_EVENT_AP_WPS_RG_PBC_OVERLAP: c_int = 27;
pub const WIFI_EVENT_ITWT_SETUP: c_int = 28;
pub const WIFI_EVENT_ITWT_TEARDOWN: c_int = 29;
pub const WIFI_EVENT_ITWT_PROBE: c_int = 30;
pub const WIFI_EVENT_ITWT_SUSPEND: c_int = 31;
pub const WIFI_EVENT_TWT_WAKEUP: c_int = 32;
pub const WIFI_EVENT_BTWT_SETUP: c_int = 33;
pub const WIFI_EVENT_BTWT_TEARDOWN: c_int = 34;
pub const WIFI_EVENT_NAN_STARTED: c_int = 35;
pub const WIFI_EVENT_NAN_STOPPED: c_int = 36;
pub const WIFI_EVENT_NAN_SVC_MATCH: c_int = 37;
pub const WIFI_EVENT_NAN_REPLIED: c_int = 38;
pub const WIFI_EVENT_NAN_RECEIVE: c_int = 39;
pub const WIFI_EVENT_NDP_INDICATION: c_int = 40;
pub const WIFI_EVENT_NDP_CONFIRM: c_int = 41;
pub const WIFI_EVENT_NDP_TERMINATED: c_int = 42;
pub const WIFI_EVENT_HOME_CHANNEL_CHANGE: c_int = 43;
pub const WIFI_EVENT_STA_NEIGHBOR_REP: c_int = 44;
pub const WIFI_EVENT_MAX: c_int = 45;
pub const wifi_event_t = c_uint;
pub extern const WIFI_EVENT: esp_event_base_t;
pub const wifi_event_sta_scan_done_t = extern struct {
    status: u32 = @import("std").mem.zeroes(u32),
    number: u8 = @import("std").mem.zeroes(u8),
    scan_id: u8 = @import("std").mem.zeroes(u8),
};
pub const wifi_event_sta_connected_t = extern struct {
    ssid: [32]u8 = @import("std").mem.zeroes([32]u8),
    ssid_len: u8 = @import("std").mem.zeroes(u8),
    bssid: [6]u8 = @import("std").mem.zeroes([6]u8),
    channel: u8 = @import("std").mem.zeroes(u8),
    authmode: wifi_auth_mode_t = @import("std").mem.zeroes(wifi_auth_mode_t),
    aid: u16 = @import("std").mem.zeroes(u16),
};
pub const wifi_event_sta_disconnected_t = extern struct {
    ssid: [32]u8 = @import("std").mem.zeroes([32]u8),
    ssid_len: u8 = @import("std").mem.zeroes(u8),
    bssid: [6]u8 = @import("std").mem.zeroes([6]u8),
    reason: u8 = @import("std").mem.zeroes(u8),
    rssi: i8 = @import("std").mem.zeroes(i8),
};
pub const wifi_event_sta_authmode_change_t = extern struct {
    old_mode: wifi_auth_mode_t = @import("std").mem.zeroes(wifi_auth_mode_t),
    new_mode: wifi_auth_mode_t = @import("std").mem.zeroes(wifi_auth_mode_t),
};
pub const wifi_event_sta_wps_er_pin_t = extern struct {
    pin_code: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const WPS_FAIL_REASON_NORMAL: c_int = 0;
pub const WPS_FAIL_REASON_RECV_M2D: c_int = 1;
pub const WPS_FAIL_REASON_RECV_DEAUTH: c_int = 2;
pub const WPS_FAIL_REASON_MAX: c_int = 3;
pub const wifi_event_sta_wps_fail_reason_t = c_uint;
const struct_unnamed_4 = extern struct {
    ssid: [32]u8 = @import("std").mem.zeroes([32]u8),
    passphrase: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const wifi_event_sta_wps_er_success_t = extern struct {
    ap_cred_cnt: u8 = @import("std").mem.zeroes(u8),
    ap_cred: [3]struct_unnamed_4 = @import("std").mem.zeroes([3]struct_unnamed_4),
};
pub const wifi_event_ap_staconnected_t = extern struct {
    mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    aid: u8 = @import("std").mem.zeroes(u8),
    is_mesh_child: bool = @import("std").mem.zeroes(bool),
};
pub const wifi_event_ap_stadisconnected_t = extern struct {
    mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    aid: u8 = @import("std").mem.zeroes(u8),
    is_mesh_child: bool = @import("std").mem.zeroes(bool),
    reason: u16 = @import("std").mem.zeroes(u16),
};
pub const wifi_event_ap_probe_req_rx_t = extern struct {
    rssi: c_int = @import("std").mem.zeroes(c_int),
    mac: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const wifi_event_bss_rssi_low_t = extern struct {
    rssi: i32 = @import("std").mem.zeroes(i32),
};
pub const wifi_event_home_channel_change_t = extern struct {
    old_chan: u8 = @import("std").mem.zeroes(u8),
    old_snd: wifi_second_chan_t = @import("std").mem.zeroes(wifi_second_chan_t),
    new_chan: u8 = @import("std").mem.zeroes(u8),
    new_snd: wifi_second_chan_t = @import("std").mem.zeroes(wifi_second_chan_t),
};
pub const FTM_STATUS_SUCCESS: c_int = 0;
pub const FTM_STATUS_UNSUPPORTED: c_int = 1;
pub const FTM_STATUS_CONF_REJECTED: c_int = 2;
pub const FTM_STATUS_NO_RESPONSE: c_int = 3;
pub const FTM_STATUS_FAIL: c_int = 4;
pub const FTM_STATUS_NO_VALID_MSMT: c_int = 5;
pub const FTM_STATUS_USER_TERM: c_int = 6;
pub const wifi_ftm_status_t = c_uint;
pub const wifi_ftm_report_entry_t = extern struct {
    dlog_token: u8 = @import("std").mem.zeroes(u8),
    rssi: i8 = @import("std").mem.zeroes(i8),
    rtt: u32 = @import("std").mem.zeroes(u32),
    t1: u64 = @import("std").mem.zeroes(u64),
    t2: u64 = @import("std").mem.zeroes(u64),
    t3: u64 = @import("std").mem.zeroes(u64),
    t4: u64 = @import("std").mem.zeroes(u64),
};
pub const wifi_event_ftm_report_t = extern struct {
    peer_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    status: wifi_ftm_status_t = @import("std").mem.zeroes(wifi_ftm_status_t),
    rtt_raw: u32 = @import("std").mem.zeroes(u32),
    rtt_est: u32 = @import("std").mem.zeroes(u32),
    dist_est: u32 = @import("std").mem.zeroes(u32),
    ftm_report_data: [*c]wifi_ftm_report_entry_t = @import("std").mem.zeroes([*c]wifi_ftm_report_entry_t),
    ftm_report_num_entries: u8 = @import("std").mem.zeroes(u8),
};
pub const wifi_event_action_tx_status_t = extern struct {
    ifx: wifi_interface_t = @import("std").mem.zeroes(wifi_interface_t),
    context: u32 = @import("std").mem.zeroes(u32),
    da: [6]u8 = @import("std").mem.zeroes([6]u8),
    status: u8 = @import("std").mem.zeroes(u8),
};
pub const wifi_event_roc_done_t = extern struct {
    context: u32 = @import("std").mem.zeroes(u32),
};
pub const wifi_event_ap_wps_rg_pin_t = extern struct {
    pin_code: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const WPS_AP_FAIL_REASON_NORMAL: c_int = 0;
pub const WPS_AP_FAIL_REASON_CONFIG: c_int = 1;
pub const WPS_AP_FAIL_REASON_AUTH: c_int = 2;
pub const WPS_AP_FAIL_REASON_MAX: c_int = 3;
pub const wps_fail_reason_t = c_uint;
pub const wifi_event_ap_wps_rg_fail_reason_t = extern struct {
    reason: wps_fail_reason_t = @import("std").mem.zeroes(wps_fail_reason_t),
    peer_macaddr: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const wifi_event_ap_wps_rg_success_t = extern struct {
    peer_macaddr: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const wifi_event_nan_svc_match_t = extern struct {
    subscribe_id: u8 = @import("std").mem.zeroes(u8),
    publish_id: u8 = @import("std").mem.zeroes(u8),
    pub_if_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    update_pub_id: bool = @import("std").mem.zeroes(bool),
};
pub const wifi_event_nan_replied_t = extern struct {
    publish_id: u8 = @import("std").mem.zeroes(u8),
    subscribe_id: u8 = @import("std").mem.zeroes(u8),
    sub_if_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const wifi_event_nan_receive_t = extern struct {
    inst_id: u8 = @import("std").mem.zeroes(u8),
    peer_inst_id: u8 = @import("std").mem.zeroes(u8),
    peer_if_mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    peer_svc_info: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const wifi_event_ndp_indication_t = extern struct {
    publish_id: u8 = @import("std").mem.zeroes(u8),
    ndp_id: u8 = @import("std").mem.zeroes(u8),
    peer_nmi: [6]u8 = @import("std").mem.zeroes([6]u8),
    peer_ndi: [6]u8 = @import("std").mem.zeroes([6]u8),
    svc_info: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const wifi_event_ndp_confirm_t = extern struct {
    status: u8 = @import("std").mem.zeroes(u8),
    ndp_id: u8 = @import("std").mem.zeroes(u8),
    peer_nmi: [6]u8 = @import("std").mem.zeroes([6]u8),
    peer_ndi: [6]u8 = @import("std").mem.zeroes([6]u8),
    own_ndi: [6]u8 = @import("std").mem.zeroes([6]u8),
    svc_info: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const wifi_event_ndp_terminated_t = extern struct {
    reason: u8 = @import("std").mem.zeroes(u8),
    ndp_id: u8 = @import("std").mem.zeroes(u8),
    init_ndi: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const wifi_event_neighbor_report_t = extern struct {
    report: [64]u8 = @import("std").mem.zeroes([64]u8),
    report_len: u16 = @import("std").mem.zeroes(u16),
};
pub const WIFI_BAND_2G: c_int = 1;
pub const WIFI_BAND_5G: c_int = 2;
pub const WIFI_BAND_2G_5G: c_int = 3;
pub const wifi_band_t = c_uint;
pub const struct_wifi_csi_config_t = opaque {};
pub const wifi_csi_config_t = struct_wifi_csi_config_t;
pub const struct_wifi_pkt_rx_ctrl_t = opaque {};
pub const wifi_pkt_rx_ctrl_t = struct_wifi_pkt_rx_ctrl_t;
pub const esp_event_loop_args_t = extern struct {
    queue_size: i32 = @import("std").mem.zeroes(i32),
    task_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    task_priority: UBaseType_t = @import("std").mem.zeroes(UBaseType_t),
    task_stack_size: u32 = @import("std").mem.zeroes(u32),
    task_core_id: BaseType_t = @import("std").mem.zeroes(BaseType_t),
};
pub extern fn esp_event_loop_create(event_loop_args: [*c]const esp_event_loop_args_t, event_loop: [*c]esp_event_loop_handle_t) esp_err_t;
pub extern fn esp_event_loop_delete(event_loop: esp_event_loop_handle_t) esp_err_t;
pub extern fn esp_event_loop_create_default() esp_err_t;
pub extern fn esp_event_loop_delete_default() esp_err_t;
pub extern fn esp_event_loop_run(event_loop: esp_event_loop_handle_t, ticks_to_run: TickType_t) esp_err_t;
pub extern fn esp_event_handler_register(event_base: esp_event_base_t, event_id: i32, event_handler: esp_event_handler_t, event_handler_arg: ?*anyopaque) esp_err_t;
pub extern fn esp_event_handler_register_with(event_loop: esp_event_loop_handle_t, event_base: esp_event_base_t, event_id: i32, event_handler: esp_event_handler_t, event_handler_arg: ?*anyopaque) esp_err_t;
pub extern fn esp_event_handler_instance_register_with(event_loop: esp_event_loop_handle_t, event_base: esp_event_base_t, event_id: i32, event_handler: esp_event_handler_t, event_handler_arg: ?*anyopaque, instance: [*c]esp_event_handler_instance_t) esp_err_t;
pub extern fn esp_event_handler_instance_register(event_base: esp_event_base_t, event_id: i32, event_handler: esp_event_handler_t, event_handler_arg: ?*anyopaque, instance: [*c]esp_event_handler_instance_t) esp_err_t;
pub extern fn esp_event_handler_unregister(event_base: esp_event_base_t, event_id: i32, event_handler: esp_event_handler_t) esp_err_t;
pub extern fn esp_event_handler_unregister_with(event_loop: esp_event_loop_handle_t, event_base: esp_event_base_t, event_id: i32, event_handler: esp_event_handler_t) esp_err_t;
pub extern fn esp_event_handler_instance_unregister_with(event_loop: esp_event_loop_handle_t, event_base: esp_event_base_t, event_id: i32, instance: esp_event_handler_instance_t) esp_err_t;
pub extern fn esp_event_handler_instance_unregister(event_base: esp_event_base_t, event_id: i32, instance: esp_event_handler_instance_t) esp_err_t;
pub extern fn esp_event_post(event_base: esp_event_base_t, event_id: i32, event_data: ?*const anyopaque, event_data_size: usize, ticks_to_wait: TickType_t) esp_err_t;
pub extern fn esp_event_post_to(event_loop: esp_event_loop_handle_t, event_base: esp_event_base_t, event_id: i32, event_data: ?*const anyopaque, event_data_size: usize, ticks_to_wait: TickType_t) esp_err_t;
pub extern fn esp_event_isr_post(event_base: esp_event_base_t, event_id: i32, event_data: ?*const anyopaque, event_data_size: usize, task_unblocked: [*c]BaseType_t) esp_err_t;
pub extern fn esp_event_isr_post_to(event_loop: esp_event_loop_handle_t, event_base: esp_event_base_t, event_id: i32, event_data: ?*const anyopaque, event_data_size: usize, task_unblocked: [*c]BaseType_t) esp_err_t;
pub extern fn esp_event_dump(file: [*c]FILE) esp_err_t;
pub const ESP_CRYPTO_HASH_ALG_MD5: c_int = 0;
pub const ESP_CRYPTO_HASH_ALG_SHA1: c_int = 1;
pub const ESP_CRYPTO_HASH_ALG_HMAC_MD5: c_int = 2;
pub const ESP_CRYPTO_HASH_ALG_HMAC_SHA1: c_int = 3;
pub const ESP_CRYPTO_HASH_ALG_SHA256: c_int = 4;
pub const ESP_CRYPTO_HASH_ALG_HMAC_SHA256: c_int = 5;
pub const esp_crypto_hash_alg_t = c_uint;
pub const ESP_CRYPTO_CIPHER_NULL: c_int = 0;
pub const ESP_CRYPTO_CIPHER_ALG_AES: c_int = 1;
pub const ESP_CRYPTO_CIPHER_ALG_3DES: c_int = 2;
pub const ESP_CRYPTO_CIPHER_ALG_DES: c_int = 3;
pub const ESP_CRYPTO_CIPHER_ALG_RC2: c_int = 4;
pub const ESP_CRYPTO_CIPHER_ALG_RC4: c_int = 5;
pub const esp_crypto_cipher_alg_t = c_uint;
pub const struct_crypto_hash = opaque {};
pub const esp_crypto_hash_t = struct_crypto_hash;
pub const struct_crypto_cipher = opaque {};
pub const esp_crypto_cipher_t = struct_crypto_cipher;
pub const esp_aes_128_encrypt_t = ?*const fn ([*c]const u8, [*c]const u8, [*c]u8, c_int) callconv(.c) c_int;
pub const esp_aes_128_decrypt_t = ?*const fn ([*c]const u8, [*c]const u8, [*c]u8, c_int) callconv(.c) c_int;
pub const esp_aes_wrap_t = ?*const fn ([*c]const u8, c_int, [*c]const u8, [*c]u8) callconv(.c) c_int;
pub const esp_aes_unwrap_t = ?*const fn ([*c]const u8, c_int, [*c]const u8, [*c]u8) callconv(.c) c_int;
pub const esp_hmac_sha256_vector_t = ?*const fn ([*c]const u8, c_int, c_int, [*c][*c]const u8, [*c]const c_int, [*c]u8) callconv(.c) c_int;
pub const esp_sha256_prf_t = ?*const fn ([*c]const u8, c_int, [*c]const u8, [*c]const u8, c_int, [*c]u8, c_int) callconv(.c) c_int;
pub const esp_hmac_md5_t = ?*const fn ([*c]const u8, c_uint, [*c]const u8, c_uint, [*c]u8) callconv(.c) c_int;
pub const esp_hmac_md5_vector_t = ?*const fn ([*c]const u8, c_uint, c_uint, [*c][*c]const u8, [*c]const c_uint, [*c]u8) callconv(.c) c_int;
pub const esp_hmac_sha1_t = ?*const fn ([*c]const u8, c_uint, [*c]const u8, c_uint, [*c]u8) callconv(.c) c_int;
pub const esp_hmac_sha1_vector_t = ?*const fn ([*c]const u8, c_uint, c_uint, [*c][*c]const u8, [*c]const c_uint, [*c]u8) callconv(.c) c_int;
pub const esp_sha1_prf_t = ?*const fn ([*c]const u8, c_uint, [*c]const u8, [*c]const u8, c_uint, [*c]u8, c_uint) callconv(.c) c_int;
pub const esp_sha1_vector_t = ?*const fn (c_uint, [*c][*c]const u8, [*c]const c_uint, [*c]u8) callconv(.c) c_int;
pub const esp_pbkdf2_sha1_t = ?*const fn ([*c]const u8, [*c]const u8, c_uint, c_int, [*c]u8, c_uint) callconv(.c) c_int;
pub const esp_rc4_skip_t = ?*const fn ([*c]const u8, c_uint, c_uint, [*c]u8, c_uint) callconv(.c) c_int;
pub const esp_md5_vector_t = ?*const fn (c_uint, [*c][*c]const u8, [*c]const c_uint, [*c]u8) callconv(.c) c_int;
pub const esp_aes_encrypt_t = ?*const fn (?*anyopaque, [*c]const u8, [*c]u8) callconv(.c) void;
pub const esp_aes_encrypt_init_t = ?*const fn ([*c]const u8, c_uint) callconv(.c) ?*anyopaque;
pub const esp_aes_encrypt_deinit_t = ?*const fn (?*anyopaque) callconv(.c) void;
pub const esp_aes_decrypt_t = ?*const fn (?*anyopaque, [*c]const u8, [*c]u8) callconv(.c) void;
pub const esp_aes_decrypt_init_t = ?*const fn ([*c]const u8, c_uint) callconv(.c) ?*anyopaque;
pub const esp_aes_decrypt_deinit_t = ?*const fn (?*anyopaque) callconv(.c) void;
pub const esp_omac1_aes_128_t = ?*const fn ([*c]const u8, [*c]const u8, usize, [*c]u8) callconv(.c) c_int;
pub const esp_ccmp_decrypt_t = ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8, usize, [*c]usize, bool) callconv(.c) [*c]u8;
pub const esp_ccmp_encrypt_t = ?*const fn ([*c]const u8, [*c]u8, usize, usize, [*c]u8, c_int, [*c]usize) callconv(.c) [*c]u8;
pub const esp_aes_gmac_t = ?*const fn ([*c]const u8, usize, [*c]const u8, usize, [*c]const u8, usize, [*c]u8) callconv(.c) c_int;
pub const esp_sha256_vector_t = ?*const fn (usize, [*c][*c]const u8, [*c]const usize, [*c]u8) callconv(.c) c_int;
pub const esp_crc32_le_t = ?*const fn (u32, [*c]const u8, u32) callconv(.c) u32;
pub const struct_wpa_crypto_funcs_t = extern struct {
    size: u32 = @import("std").mem.zeroes(u32),
    version: u32 = @import("std").mem.zeroes(u32),
    aes_wrap: esp_aes_wrap_t = @import("std").mem.zeroes(esp_aes_wrap_t),
    aes_unwrap: esp_aes_unwrap_t = @import("std").mem.zeroes(esp_aes_unwrap_t),
    hmac_sha256_vector: esp_hmac_sha256_vector_t = @import("std").mem.zeroes(esp_hmac_sha256_vector_t),
    sha256_prf: esp_sha256_prf_t = @import("std").mem.zeroes(esp_sha256_prf_t),
    hmac_md5: esp_hmac_md5_t = @import("std").mem.zeroes(esp_hmac_md5_t),
    hamc_md5_vector: esp_hmac_md5_vector_t = @import("std").mem.zeroes(esp_hmac_md5_vector_t),
    hmac_sha1: esp_hmac_sha1_t = @import("std").mem.zeroes(esp_hmac_sha1_t),
    hmac_sha1_vector: esp_hmac_sha1_vector_t = @import("std").mem.zeroes(esp_hmac_sha1_vector_t),
    sha1_prf: esp_sha1_prf_t = @import("std").mem.zeroes(esp_sha1_prf_t),
    sha1_vector: esp_sha1_vector_t = @import("std").mem.zeroes(esp_sha1_vector_t),
    pbkdf2_sha1: esp_pbkdf2_sha1_t = @import("std").mem.zeroes(esp_pbkdf2_sha1_t),
    rc4_skip: esp_rc4_skip_t = @import("std").mem.zeroes(esp_rc4_skip_t),
    md5_vector: esp_md5_vector_t = @import("std").mem.zeroes(esp_md5_vector_t),
    aes_encrypt: esp_aes_encrypt_t = @import("std").mem.zeroes(esp_aes_encrypt_t),
    aes_encrypt_init: esp_aes_encrypt_init_t = @import("std").mem.zeroes(esp_aes_encrypt_init_t),
    aes_encrypt_deinit: esp_aes_encrypt_deinit_t = @import("std").mem.zeroes(esp_aes_encrypt_deinit_t),
    aes_decrypt: esp_aes_decrypt_t = @import("std").mem.zeroes(esp_aes_decrypt_t),
    aes_decrypt_init: esp_aes_decrypt_init_t = @import("std").mem.zeroes(esp_aes_decrypt_init_t),
    aes_decrypt_deinit: esp_aes_decrypt_deinit_t = @import("std").mem.zeroes(esp_aes_decrypt_deinit_t),
    aes_128_encrypt: esp_aes_128_encrypt_t = @import("std").mem.zeroes(esp_aes_128_encrypt_t),
    aes_128_decrypt: esp_aes_128_decrypt_t = @import("std").mem.zeroes(esp_aes_128_decrypt_t),
    omac1_aes_128: esp_omac1_aes_128_t = @import("std").mem.zeroes(esp_omac1_aes_128_t),
    ccmp_decrypt: esp_ccmp_decrypt_t = @import("std").mem.zeroes(esp_ccmp_decrypt_t),
    ccmp_encrypt: esp_ccmp_encrypt_t = @import("std").mem.zeroes(esp_ccmp_encrypt_t),
    aes_gmac: esp_aes_gmac_t = @import("std").mem.zeroes(esp_aes_gmac_t),
    sha256_vector: esp_sha256_vector_t = @import("std").mem.zeroes(esp_sha256_vector_t),
    crc32: esp_crc32_le_t = @import("std").mem.zeroes(esp_crc32_le_t),
};
pub const wpa_crypto_funcs_t = struct_wpa_crypto_funcs_t;
pub const mesh_crypto_funcs_t = extern struct {
    aes_128_encrypt: esp_aes_128_encrypt_t = @import("std").mem.zeroes(esp_aes_128_encrypt_t),
    aes_128_decrypt: esp_aes_128_decrypt_t = @import("std").mem.zeroes(esp_aes_128_decrypt_t),
};
pub const struct_esp_ip6_addr = extern struct {
    addr: [4]u32 = @import("std").mem.zeroes([4]u32),
    zone: u8 = @import("std").mem.zeroes(u8),
};
pub const struct_esp_ip4_addr = extern struct {
    addr: u32 = @import("std").mem.zeroes(u32),
};
pub const esp_ip4_addr_t = struct_esp_ip4_addr;
pub const esp_ip6_addr_t = struct_esp_ip6_addr;
const union_unnamed_5 = extern union {
    ip6: esp_ip6_addr_t,
    ip4: esp_ip4_addr_t,
};
pub const struct__ip_addr = extern struct {
    u_addr: union_unnamed_5 = @import("std").mem.zeroes(union_unnamed_5),
    type: u8 = @import("std").mem.zeroes(u8),
};
pub const esp_ip_addr_t = struct__ip_addr;
pub const ESP_IP6_ADDR_IS_UNKNOWN: c_int = 0;
pub const ESP_IP6_ADDR_IS_GLOBAL: c_int = 1;
pub const ESP_IP6_ADDR_IS_LINK_LOCAL: c_int = 2;
pub const ESP_IP6_ADDR_IS_SITE_LOCAL: c_int = 3;
pub const ESP_IP6_ADDR_IS_UNIQUE_LOCAL: c_int = 4;
pub const ESP_IP6_ADDR_IS_IPV4_MAPPED_IPV6: c_int = 5;
pub const esp_ip6_addr_type_t = c_uint;
pub extern fn esp_netif_ip6_get_addr_type(ip6_addr: [*c]esp_ip6_addr_t) esp_ip6_addr_type_t;
pub fn esp_netif_ip_addr_copy(arg_dest: [*c]esp_ip_addr_t, arg_src: [*c]const esp_ip_addr_t) callconv(.c) void {
    var dest = arg_dest;
    _ = &dest;
    var src = arg_src;
    _ = &src;
    dest.*.type = src.*.type;
    if (@as(c_uint, @bitCast(@as(c_uint, src.*.type))) == @as(c_uint, 6)) {
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 0)))] = src.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 0)))];
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 1)))] = src.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 1)))];
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 2)))] = src.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 2)))];
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 3)))] = src.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 3)))];
        dest.*.u_addr.ip6.zone = src.*.u_addr.ip6.zone;
    } else {
        dest.*.u_addr.ip4.addr = src.*.u_addr.ip4.addr;
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 1)))] = 0;
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 2)))] = 0;
        dest.*.u_addr.ip6.addr[@as(c_uint, @intCast(@as(c_int, 3)))] = 0;
        dest.*.u_addr.ip6.zone = 0;
    }
}
pub const struct_esp_netif_obj = opaque {};
pub const esp_netif_t = struct_esp_netif_obj;
pub const ESP_NETIF_DNS_MAIN: c_int = 0;
pub const ESP_NETIF_DNS_BACKUP: c_int = 1;
pub const ESP_NETIF_DNS_FALLBACK: c_int = 2;
pub const ESP_NETIF_DNS_MAX: c_int = 3;
pub const esp_netif_dns_type_t = c_uint;
pub const esp_netif_dns_info_t = extern struct {
    ip: esp_ip_addr_t = @import("std").mem.zeroes(esp_ip_addr_t),
};
pub const ESP_NETIF_DHCP_INIT: c_int = 0;
pub const ESP_NETIF_DHCP_STARTED: c_int = 1;
pub const ESP_NETIF_DHCP_STOPPED: c_int = 2;
pub const ESP_NETIF_DHCP_STATUS_MAX: c_int = 3;
pub const esp_netif_dhcp_status_t = c_uint;
pub const ESP_NETIF_OP_START: c_int = 0;
pub const ESP_NETIF_OP_SET: c_int = 1;
pub const ESP_NETIF_OP_GET: c_int = 2;
pub const ESP_NETIF_OP_MAX: c_int = 3;
pub const esp_netif_dhcp_option_mode_t = c_uint;
pub const ESP_NETIF_SUBNET_MASK: c_int = 1;
pub const ESP_NETIF_DOMAIN_NAME_SERVER: c_int = 6;
pub const ESP_NETIF_ROUTER_SOLICITATION_ADDRESS: c_int = 32;
pub const ESP_NETIF_REQUESTED_IP_ADDRESS: c_int = 50;
pub const ESP_NETIF_IP_ADDRESS_LEASE_TIME: c_int = 51;
pub const ESP_NETIF_IP_REQUEST_RETRY_TIME: c_int = 52;
pub const ESP_NETIF_VENDOR_CLASS_IDENTIFIER: c_int = 60;
pub const ESP_NETIF_VENDOR_SPECIFIC_INFO: c_int = 43;
pub const esp_netif_dhcp_option_id_t = c_uint;
pub const IP_EVENT_STA_GOT_IP: c_int = 0;
pub const IP_EVENT_STA_LOST_IP: c_int = 1;
pub const IP_EVENT_AP_STAIPASSIGNED: c_int = 2;
pub const IP_EVENT_GOT_IP6: c_int = 3;
pub const IP_EVENT_ETH_GOT_IP: c_int = 4;
pub const IP_EVENT_ETH_LOST_IP: c_int = 5;
pub const IP_EVENT_PPP_GOT_IP: c_int = 6;
pub const IP_EVENT_PPP_LOST_IP: c_int = 7;
pub const ip_event_t = c_uint;
pub extern const IP_EVENT: esp_event_base_t;
pub const esp_netif_ip_info_t = extern struct {
    ip: esp_ip4_addr_t = @import("std").mem.zeroes(esp_ip4_addr_t),
    netmask: esp_ip4_addr_t = @import("std").mem.zeroes(esp_ip4_addr_t),
    gw: esp_ip4_addr_t = @import("std").mem.zeroes(esp_ip4_addr_t),
};
pub const esp_netif_ip6_info_t = extern struct {
    ip: esp_ip6_addr_t = @import("std").mem.zeroes(esp_ip6_addr_t),
};
pub const ip_event_got_ip_t = extern struct {
    esp_netif: ?*esp_netif_t = @import("std").mem.zeroes(?*esp_netif_t),
    ip_info: esp_netif_ip_info_t = @import("std").mem.zeroes(esp_netif_ip_info_t),
    ip_changed: bool = @import("std").mem.zeroes(bool),
};
pub const ip_event_got_ip6_t = extern struct {
    esp_netif: ?*esp_netif_t = @import("std").mem.zeroes(?*esp_netif_t),
    ip6_info: esp_netif_ip6_info_t = @import("std").mem.zeroes(esp_netif_ip6_info_t),
    ip_index: c_int = @import("std").mem.zeroes(c_int),
};
pub const ip_event_add_ip6_t = extern struct {
    addr: esp_ip6_addr_t = @import("std").mem.zeroes(esp_ip6_addr_t),
    preferred: bool = @import("std").mem.zeroes(bool),
};
pub const ip_event_ap_staipassigned_t = extern struct {
    esp_netif: ?*esp_netif_t = @import("std").mem.zeroes(?*esp_netif_t),
    ip: esp_ip4_addr_t = @import("std").mem.zeroes(esp_ip4_addr_t),
    mac: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const ESP_NETIF_DHCP_CLIENT: c_int = 1;
pub const ESP_NETIF_DHCP_SERVER: c_int = 2;
pub const ESP_NETIF_FLAG_AUTOUP: c_int = 4;
pub const ESP_NETIF_FLAG_GARP: c_int = 8;
pub const ESP_NETIF_FLAG_EVENT_IP_MODIFIED: c_int = 16;
pub const ESP_NETIF_FLAG_IS_PPP: c_int = 32;
pub const ESP_NETIF_FLAG_IS_BRIDGE: c_int = 64;
pub const ESP_NETIF_FLAG_MLDV6_REPORT: c_int = 128;
pub const enum_esp_netif_flags = c_uint;
pub const esp_netif_flags_t = enum_esp_netif_flags;
pub const ESP_NETIF_IP_EVENT_GOT_IP: c_int = 1;
pub const ESP_NETIF_IP_EVENT_LOST_IP: c_int = 2;
pub const enum_esp_netif_ip_event_type = c_uint;
pub const esp_netif_ip_event_type_t = enum_esp_netif_ip_event_type;
pub const struct_bridgeif_config = extern struct {
    max_fdb_dyn_entries: u16 = @import("std").mem.zeroes(u16),
    max_fdb_sta_entries: u16 = @import("std").mem.zeroes(u16),
    max_ports: u8 = @import("std").mem.zeroes(u8),
};
pub const bridgeif_config_t = struct_bridgeif_config;
pub const struct_esp_netif_inherent_config = extern struct {
    flags: esp_netif_flags_t = @import("std").mem.zeroes(esp_netif_flags_t),
    mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    ip_info: [*c]const esp_netif_ip_info_t = @import("std").mem.zeroes([*c]const esp_netif_ip_info_t),
    get_ip_event: u32 = @import("std").mem.zeroes(u32),
    lost_ip_event: u32 = @import("std").mem.zeroes(u32),
    if_key: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    if_desc: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    route_prio: c_int = @import("std").mem.zeroes(c_int),
    bridge_info: [*c]bridgeif_config_t = @import("std").mem.zeroes([*c]bridgeif_config_t),
};
pub const esp_netif_inherent_config_t = struct_esp_netif_inherent_config;
pub const esp_netif_iodriver_handle = ?*anyopaque;
pub const struct_esp_netif_driver_ifconfig = extern struct {
    handle: esp_netif_iodriver_handle = @import("std").mem.zeroes(esp_netif_iodriver_handle),
    transmit: ?*const fn (?*anyopaque, ?*anyopaque, usize) callconv(.c) esp_err_t = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque, usize) callconv(.c) esp_err_t),
    transmit_wrap: ?*const fn (?*anyopaque, ?*anyopaque, usize, ?*anyopaque) callconv(.c) esp_err_t = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque, usize, ?*anyopaque) callconv(.c) esp_err_t),
    driver_free_rx_buffer: ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void),
};
pub const esp_netif_driver_ifconfig_t = struct_esp_netif_driver_ifconfig;
pub const struct_esp_netif_netstack_config = opaque {};
pub const esp_netif_netstack_config_t = struct_esp_netif_netstack_config;
pub const struct_esp_netif_config = extern struct {
    base: [*c]const esp_netif_inherent_config_t = @import("std").mem.zeroes([*c]const esp_netif_inherent_config_t),
    driver: [*c]const esp_netif_driver_ifconfig_t = @import("std").mem.zeroes([*c]const esp_netif_driver_ifconfig_t),
    stack: ?*const esp_netif_netstack_config_t = @import("std").mem.zeroes(?*const esp_netif_netstack_config_t),
};
pub const esp_netif_config_t = struct_esp_netif_config;
pub const struct_esp_netif_driver_base_s = extern struct {
    post_attach: ?*const fn (?*esp_netif_t, esp_netif_iodriver_handle) callconv(.c) esp_err_t = @import("std").mem.zeroes(?*const fn (?*esp_netif_t, esp_netif_iodriver_handle) callconv(.c) esp_err_t),
    netif: ?*esp_netif_t = @import("std").mem.zeroes(?*esp_netif_t),
};
pub const esp_netif_driver_base_t = struct_esp_netif_driver_base_s;
pub const esp_netif_pair_mac_ip_t = extern struct {
    mac: [6]u8 = @import("std").mem.zeroes([6]u8),
    ip: esp_ip4_addr_t = @import("std").mem.zeroes(esp_ip4_addr_t),
};
pub const esp_netif_receive_t = ?*const fn (?*esp_netif_t, ?*anyopaque, usize, ?*anyopaque) callconv(.c) esp_err_t;
pub extern var _g_esp_netif_netstack_default_eth: ?*const esp_netif_netstack_config_t;
pub extern var _g_esp_netif_netstack_default_br: ?*const esp_netif_netstack_config_t;
pub extern var _g_esp_netif_netstack_default_wifi_sta: ?*const esp_netif_netstack_config_t;
pub extern var _g_esp_netif_netstack_default_wifi_ap: ?*const esp_netif_netstack_config_t;
pub extern const _g_esp_netif_inherent_sta_config: esp_netif_inherent_config_t;
pub extern const _g_esp_netif_inherent_ap_config: esp_netif_inherent_config_t;
pub extern const _g_esp_netif_inherent_eth_config: esp_netif_inherent_config_t;
pub extern const _g_esp_netif_soft_ap_ip: esp_netif_ip_info_t;
pub extern fn esp_netif_init() esp_err_t;
pub extern fn esp_netif_deinit() esp_err_t;
pub extern fn esp_netif_new(esp_netif_config: [*c]const esp_netif_config_t) ?*esp_netif_t;
pub extern fn esp_netif_destroy(esp_netif: ?*esp_netif_t) void;
pub extern fn esp_netif_set_driver_config(esp_netif: ?*esp_netif_t, driver_config: [*c]const esp_netif_driver_ifconfig_t) esp_err_t;
pub extern fn esp_netif_attach(esp_netif: ?*esp_netif_t, driver_handle: esp_netif_iodriver_handle) esp_err_t;
pub extern fn esp_netif_receive(esp_netif: ?*esp_netif_t, buffer: ?*anyopaque, len: usize, eb: ?*anyopaque) esp_err_t;
pub extern fn esp_netif_action_start(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_stop(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_connected(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_disconnected(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_got_ip(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_join_ip6_multicast_group(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_leave_ip6_multicast_group(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_add_ip6_address(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_action_remove_ip6_address(esp_netif: ?*anyopaque, base: esp_event_base_t, event_id: i32, data: ?*anyopaque) void;
pub extern fn esp_netif_set_default_netif(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_get_default_netif() ?*esp_netif_t;
pub extern fn esp_netif_join_ip6_multicast_group(esp_netif: ?*esp_netif_t, addr: [*c]const esp_ip6_addr_t) esp_err_t;
pub extern fn esp_netif_leave_ip6_multicast_group(esp_netif: ?*esp_netif_t, addr: [*c]const esp_ip6_addr_t) esp_err_t;
pub extern fn esp_netif_set_mac(esp_netif: ?*esp_netif_t, mac: [*c]u8) esp_err_t;
pub extern fn esp_netif_get_mac(esp_netif: ?*esp_netif_t, mac: [*c]u8) esp_err_t;
pub extern fn esp_netif_set_hostname(esp_netif: ?*esp_netif_t, hostname: [*c]const u8) esp_err_t;
pub extern fn esp_netif_get_hostname(esp_netif: ?*esp_netif_t, hostname: [*c][*c]const u8) esp_err_t;
pub extern fn esp_netif_is_netif_up(esp_netif: ?*esp_netif_t) bool;
pub extern fn esp_netif_get_ip_info(esp_netif: ?*esp_netif_t, ip_info: [*c]esp_netif_ip_info_t) esp_err_t;
pub extern fn esp_netif_get_old_ip_info(esp_netif: ?*esp_netif_t, ip_info: [*c]esp_netif_ip_info_t) esp_err_t;
pub extern fn esp_netif_set_ip_info(esp_netif: ?*esp_netif_t, ip_info: [*c]const esp_netif_ip_info_t) esp_err_t;
pub extern fn esp_netif_set_old_ip_info(esp_netif: ?*esp_netif_t, ip_info: [*c]const esp_netif_ip_info_t) esp_err_t;
pub extern fn esp_netif_get_netif_impl_index(esp_netif: ?*esp_netif_t) c_int;
pub extern fn esp_netif_get_netif_impl_name(esp_netif: ?*esp_netif_t, name: [*c]u8) esp_err_t;
pub extern fn esp_netif_napt_enable(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_napt_disable(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_dhcps_option(esp_netif: ?*esp_netif_t, opt_op: esp_netif_dhcp_option_mode_t, opt_id: esp_netif_dhcp_option_id_t, opt_val: ?*anyopaque, opt_len: u32) esp_err_t;
pub extern fn esp_netif_dhcpc_option(esp_netif: ?*esp_netif_t, opt_op: esp_netif_dhcp_option_mode_t, opt_id: esp_netif_dhcp_option_id_t, opt_val: ?*anyopaque, opt_len: u32) esp_err_t;
pub extern fn esp_netif_dhcpc_start(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_dhcpc_stop(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_dhcpc_get_status(esp_netif: ?*esp_netif_t, status: [*c]esp_netif_dhcp_status_t) esp_err_t;
pub extern fn esp_netif_dhcps_get_status(esp_netif: ?*esp_netif_t, status: [*c]esp_netif_dhcp_status_t) esp_err_t;
pub extern fn esp_netif_dhcps_start(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_dhcps_stop(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_dhcps_get_clients_by_mac(esp_netif: ?*esp_netif_t, num: c_int, mac_ip_pair: [*c]esp_netif_pair_mac_ip_t) esp_err_t;
pub extern fn esp_netif_set_dns_info(esp_netif: ?*esp_netif_t, @"type": esp_netif_dns_type_t, dns: [*c]esp_netif_dns_info_t) esp_err_t;
pub extern fn esp_netif_get_dns_info(esp_netif: ?*esp_netif_t, @"type": esp_netif_dns_type_t, dns: [*c]esp_netif_dns_info_t) esp_err_t;
pub extern fn esp_netif_create_ip6_linklocal(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_get_ip6_linklocal(esp_netif: ?*esp_netif_t, if_ip6: [*c]esp_ip6_addr_t) esp_err_t;
pub extern fn esp_netif_get_ip6_global(esp_netif: ?*esp_netif_t, if_ip6: [*c]esp_ip6_addr_t) esp_err_t;
pub extern fn esp_netif_get_all_ip6(esp_netif: ?*esp_netif_t, if_ip6: [*c]esp_ip6_addr_t) c_int;
pub extern fn esp_netif_add_ip6_address(esp_netif: ?*esp_netif_t, addr: esp_ip6_addr_t, preferred: bool) esp_err_t;
pub extern fn esp_netif_remove_ip6_address(esp_netif: ?*esp_netif_t, addr: [*c]const esp_ip6_addr_t) esp_err_t;
pub extern fn esp_netif_set_ip4_addr(addr: [*c]esp_ip4_addr_t, a: u8, b: u8, c: u8, d: u8) void;
pub extern fn esp_ip4addr_ntoa(addr: [*c]const esp_ip4_addr_t, buf: [*c]u8, buflen: c_int) [*c]u8;
pub extern fn esp_ip4addr_aton(addr: [*c]const u8) u32;
pub extern fn esp_netif_str_to_ip4(src: [*c]const u8, dst: [*c]esp_ip4_addr_t) esp_err_t;
pub extern fn esp_netif_str_to_ip6(src: [*c]const u8, dst: [*c]esp_ip6_addr_t) esp_err_t;
pub extern fn esp_netif_get_io_driver(esp_netif: ?*esp_netif_t) esp_netif_iodriver_handle;
pub extern fn esp_netif_get_handle_from_ifkey(if_key: [*c]const u8) ?*esp_netif_t;
pub extern fn esp_netif_get_flags(esp_netif: ?*esp_netif_t) esp_netif_flags_t;
pub extern fn esp_netif_get_ifkey(esp_netif: ?*esp_netif_t) [*c]const u8;
pub extern fn esp_netif_get_desc(esp_netif: ?*esp_netif_t) [*c]const u8;
pub extern fn esp_netif_get_route_prio(esp_netif: ?*esp_netif_t) c_int;
pub extern fn esp_netif_get_event_id(esp_netif: ?*esp_netif_t, event_type: esp_netif_ip_event_type_t) i32;
pub extern fn esp_netif_next(esp_netif: ?*esp_netif_t) ?*esp_netif_t;
pub extern fn esp_netif_next_unsafe(esp_netif: ?*esp_netif_t) ?*esp_netif_t;
pub const esp_netif_find_predicate_t = ?*const fn (?*esp_netif_t, ?*anyopaque) callconv(.c) bool;
pub extern fn esp_netif_find_if(@"fn": esp_netif_find_predicate_t, ctx: ?*anyopaque) ?*esp_netif_t;
pub extern fn esp_netif_get_nr_of_ifs() usize;
pub extern fn esp_netif_netstack_buf_ref(netstack_buf: ?*anyopaque) void;
pub extern fn esp_netif_netstack_buf_free(netstack_buf: ?*anyopaque) void;
pub const esp_netif_callback_fn = ?*const fn (?*anyopaque) callconv(.c) esp_err_t;
pub extern fn esp_netif_tcpip_exec(@"fn": esp_netif_callback_fn, ctx: ?*anyopaque) esp_err_t;
pub extern fn esp_netif_attach_wifi_station(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_netif_attach_wifi_ap(esp_netif: ?*esp_netif_t) esp_err_t;
pub extern fn esp_wifi_set_default_wifi_sta_handlers() esp_err_t;
pub extern fn esp_wifi_set_default_wifi_ap_handlers() esp_err_t;
pub extern fn esp_wifi_set_default_wifi_nan_handlers() esp_err_t;
pub extern fn esp_wifi_clear_default_wifi_driver_and_handlers(esp_netif: ?*anyopaque) esp_err_t;
pub extern fn esp_netif_create_default_wifi_ap() ?*esp_netif_t;
pub extern fn esp_netif_create_default_wifi_sta() ?*esp_netif_t;
pub extern fn esp_netif_create_default_wifi_nan() ?*esp_netif_t;
pub extern fn esp_netif_destroy_default_wifi(esp_netif: ?*anyopaque) void;
pub extern fn esp_netif_create_wifi(wifi_if: wifi_interface_t, esp_netif_config: [*c]const esp_netif_inherent_config_t) ?*esp_netif_t;
pub extern fn esp_netif_create_default_wifi_mesh_netifs(p_netif_sta: [*c]?*esp_netif_t, p_netif_ap: [*c]?*esp_netif_t) esp_err_t;
pub const struct_wifi_osi_funcs_t = opaque {};
pub const wifi_osi_funcs_t = struct_wifi_osi_funcs_t;
pub const wifi_init_config_t = extern struct {
    osi_funcs: ?*wifi_osi_funcs_t = @import("std").mem.zeroes(?*wifi_osi_funcs_t),
    wpa_crypto_funcs: wpa_crypto_funcs_t = @import("std").mem.zeroes(wpa_crypto_funcs_t),
    static_rx_buf_num: c_int = @import("std").mem.zeroes(c_int),
    dynamic_rx_buf_num: c_int = @import("std").mem.zeroes(c_int),
    tx_buf_type: c_int = @import("std").mem.zeroes(c_int),
    static_tx_buf_num: c_int = @import("std").mem.zeroes(c_int),
    dynamic_tx_buf_num: c_int = @import("std").mem.zeroes(c_int),
    rx_mgmt_buf_type: c_int = @import("std").mem.zeroes(c_int),
    rx_mgmt_buf_num: c_int = @import("std").mem.zeroes(c_int),
    cache_tx_buf_num: c_int = @import("std").mem.zeroes(c_int),
    csi_enable: c_int = @import("std").mem.zeroes(c_int),
    ampdu_rx_enable: c_int = @import("std").mem.zeroes(c_int),
    ampdu_tx_enable: c_int = @import("std").mem.zeroes(c_int),
    amsdu_tx_enable: c_int = @import("std").mem.zeroes(c_int),
    nvs_enable: c_int = @import("std").mem.zeroes(c_int),
    nano_enable: c_int = @import("std").mem.zeroes(c_int),
    rx_ba_win: c_int = @import("std").mem.zeroes(c_int),
    wifi_task_core_id: c_int = @import("std").mem.zeroes(c_int),
    beacon_max_len: c_int = @import("std").mem.zeroes(c_int),
    mgmt_sbuf_num: c_int = @import("std").mem.zeroes(c_int),
    feature_caps: u64 = @import("std").mem.zeroes(u64),
    sta_disconnected_pm: bool = @import("std").mem.zeroes(bool),
    espnow_max_encrypt_num: c_int = @import("std").mem.zeroes(c_int),
    tx_hetb_queue_num: c_int = @import("std").mem.zeroes(c_int),
    dump_hesigb_enable: bool = @import("std").mem.zeroes(bool),
    magic: c_int = @import("std").mem.zeroes(c_int),
};
pub extern const g_wifi_default_wpa_crypto_funcs: wpa_crypto_funcs_t;
pub extern var g_wifi_osi_funcs: wifi_osi_funcs_t;
pub extern fn esp_wifi_init(config: [*c]const wifi_init_config_t) esp_err_t;
pub extern fn esp_wifi_deinit() esp_err_t;
pub extern fn esp_wifi_set_mode(mode: wifi_mode_t) esp_err_t;
pub extern fn esp_wifi_get_mode(mode: [*c]wifi_mode_t) esp_err_t;
pub extern fn esp_wifi_start() esp_err_t;
pub extern fn esp_wifi_stop() esp_err_t;
pub extern fn esp_wifi_restore() esp_err_t;
pub extern fn esp_wifi_connect() esp_err_t;
pub extern fn esp_wifi_disconnect() esp_err_t;
pub extern fn esp_wifi_clear_fast_connect() esp_err_t;
pub extern fn esp_wifi_deauth_sta(aid: u16) esp_err_t;
pub extern fn esp_wifi_scan_start(config: [*c]const wifi_scan_config_t, block: bool) esp_err_t;
pub extern fn esp_wifi_set_scan_parameters(config: [*c]const wifi_scan_default_params_t) esp_err_t;
pub extern fn esp_wifi_get_scan_parameters(config: [*c]wifi_scan_default_params_t) esp_err_t;
pub extern fn esp_wifi_scan_stop() esp_err_t;
pub extern fn esp_wifi_scan_get_ap_num(number: [*c]u16) esp_err_t;
pub extern fn esp_wifi_scan_get_ap_records(number: [*c]u16, ap_records: ?*wifi_ap_record_t) esp_err_t;
pub extern fn esp_wifi_scan_get_ap_record(ap_record: ?*wifi_ap_record_t) esp_err_t;
pub extern fn esp_wifi_clear_ap_list() esp_err_t;
pub extern fn esp_wifi_sta_get_ap_info(ap_info: ?*wifi_ap_record_t) esp_err_t;
pub extern fn esp_wifi_set_ps(@"type": wifi_ps_type_t) esp_err_t;
pub extern fn esp_wifi_get_ps(@"type": [*c]wifi_ps_type_t) esp_err_t;
pub extern fn esp_wifi_set_protocol(ifx: wifi_interface_t, protocol_bitmap: u8) esp_err_t;
pub extern fn esp_wifi_get_protocol(ifx: wifi_interface_t, protocol_bitmap: [*c]u8) esp_err_t;
pub extern fn esp_wifi_set_bandwidth(ifx: wifi_interface_t, bw: wifi_bandwidth_t) esp_err_t;
pub extern fn esp_wifi_get_bandwidth(ifx: wifi_interface_t, bw: [*c]wifi_bandwidth_t) esp_err_t;
pub extern fn esp_wifi_set_channel(primary: u8, second: wifi_second_chan_t) esp_err_t;
pub extern fn esp_wifi_get_channel(primary: [*c]u8, second: [*c]wifi_second_chan_t) esp_err_t;
pub extern fn esp_wifi_set_country(country: [*c]const wifi_country_t) esp_err_t;
pub extern fn esp_wifi_get_country(country: [*c]wifi_country_t) esp_err_t;
pub extern fn esp_wifi_set_mac(ifx: wifi_interface_t, mac: [*c]const u8) esp_err_t;
pub extern fn esp_wifi_get_mac(ifx: wifi_interface_t, mac: [*c]u8) esp_err_t;
pub const wifi_promiscuous_cb_t = ?*const fn (?*anyopaque, wifi_promiscuous_pkt_type_t) callconv(.c) void;
pub extern fn esp_wifi_set_promiscuous_rx_cb(cb: wifi_promiscuous_cb_t) esp_err_t;
pub extern fn esp_wifi_set_promiscuous(en: bool) esp_err_t;
pub extern fn esp_wifi_get_promiscuous(en: [*c]bool) esp_err_t;
pub extern fn esp_wifi_set_promiscuous_filter(filter: [*c]const wifi_promiscuous_filter_t) esp_err_t;
pub extern fn esp_wifi_get_promiscuous_filter(filter: [*c]wifi_promiscuous_filter_t) esp_err_t;
pub extern fn esp_wifi_set_promiscuous_ctrl_filter(filter: [*c]const wifi_promiscuous_filter_t) esp_err_t;
pub extern fn esp_wifi_get_promiscuous_ctrl_filter(filter: [*c]wifi_promiscuous_filter_t) esp_err_t;
pub extern fn esp_wifi_set_config(interface: wifi_interface_t, conf: ?*wifi_config_t) esp_err_t;
pub extern fn esp_wifi_get_config(interface: wifi_interface_t, conf: ?*wifi_config_t) esp_err_t;
pub const struct_wifi_sta_list_t = opaque {};
pub const wifi_sta_list_t = struct_wifi_sta_list_t;
pub extern fn esp_wifi_ap_get_sta_list(sta: ?*wifi_sta_list_t) esp_err_t;
pub extern fn esp_wifi_ap_get_sta_aid(mac: [*c]const u8, aid: [*c]u16) esp_err_t;
pub extern fn esp_wifi_set_storage(storage: wifi_storage_t) esp_err_t;
pub const esp_vendor_ie_cb_t = ?*const fn (?*anyopaque, wifi_vendor_ie_type_t, [*c]const u8, [*c]const vendor_ie_data_t, c_int) callconv(.c) void;
pub extern fn esp_wifi_set_vendor_ie(enable: bool, @"type": wifi_vendor_ie_type_t, idx: wifi_vendor_ie_id_t, vnd_ie: ?*const anyopaque) esp_err_t;
pub extern fn esp_wifi_set_vendor_ie_cb(cb: esp_vendor_ie_cb_t, ctx: ?*anyopaque) esp_err_t;
pub extern fn esp_wifi_set_max_tx_power(power: i8) esp_err_t;
pub extern fn esp_wifi_get_max_tx_power(power: [*c]i8) esp_err_t;
pub extern fn esp_wifi_set_event_mask(mask: u32) esp_err_t;
pub extern fn esp_wifi_get_event_mask(mask: [*c]u32) esp_err_t;
pub extern fn esp_wifi_80211_tx(ifx: wifi_interface_t, buffer: ?*const anyopaque, len: c_int, en_sys_seq: bool) esp_err_t;
pub const wifi_csi_cb_t = ?*const fn (?*anyopaque, ?*wifi_csi_info_t) callconv(.c) void;
pub extern fn esp_wifi_set_csi_rx_cb(cb: wifi_csi_cb_t, ctx: ?*anyopaque) esp_err_t;
pub extern fn esp_wifi_set_csi_config(config: ?*const wifi_csi_config_t) esp_err_t;
pub extern fn esp_wifi_get_csi_config(config: ?*wifi_csi_config_t) esp_err_t;
pub extern fn esp_wifi_set_csi(en: bool) esp_err_t;
pub extern fn esp_wifi_set_ant_gpio(config: [*c]const wifi_ant_gpio_config_t) esp_err_t;
pub extern fn esp_wifi_get_ant_gpio(config: [*c]wifi_ant_gpio_config_t) esp_err_t;
pub extern fn esp_wifi_set_ant(config: ?*const wifi_ant_config_t) esp_err_t;
pub extern fn esp_wifi_get_ant(config: ?*wifi_ant_config_t) esp_err_t;
pub extern fn esp_wifi_get_tsf_time(interface: wifi_interface_t) i64;
pub extern fn esp_wifi_set_inactive_time(ifx: wifi_interface_t, sec: u16) esp_err_t;
pub extern fn esp_wifi_get_inactive_time(ifx: wifi_interface_t, sec: [*c]u16) esp_err_t;
pub extern fn esp_wifi_statis_dump(modules: u32) esp_err_t;
pub extern fn esp_wifi_set_rssi_threshold(rssi: i32) esp_err_t;
pub extern fn esp_wifi_ftm_initiate_session(cfg: [*c]wifi_ftm_initiator_cfg_t) esp_err_t;
pub extern fn esp_wifi_ftm_end_session() esp_err_t;
pub extern fn esp_wifi_ftm_resp_set_offset(offset_cm: i16) esp_err_t;
pub extern fn esp_wifi_ftm_get_report(report: [*c]wifi_ftm_report_entry_t, num_entries: u8) esp_err_t;
pub extern fn esp_wifi_config_11b_rate(ifx: wifi_interface_t, disable: bool) esp_err_t;
pub extern fn esp_wifi_connectionless_module_set_wake_interval(wake_interval: u16) esp_err_t;
pub extern fn esp_wifi_force_wakeup_acquire() esp_err_t;
pub extern fn esp_wifi_force_wakeup_release() esp_err_t;
pub extern fn esp_wifi_set_country_code(country: [*c]const u8, ieee80211d_enabled: bool) esp_err_t;
pub extern fn esp_wifi_get_country_code(country: [*c]u8) esp_err_t;
pub extern fn esp_wifi_config_80211_tx_rate(ifx: wifi_interface_t, rate: wifi_phy_rate_t) esp_err_t;
pub extern fn esp_wifi_disable_pmf_config(ifx: wifi_interface_t) esp_err_t;
pub extern fn esp_wifi_sta_get_aid(aid: [*c]u16) esp_err_t;
pub extern fn esp_wifi_sta_get_negotiated_phymode(phymode: [*c]wifi_phy_mode_t) esp_err_t;
pub extern fn esp_wifi_set_dynamic_cs(enabled: bool) esp_err_t;
pub extern fn esp_wifi_sta_get_rssi(rssi: [*c]c_int) esp_err_t;
pub const nvs_handle_t = u32;
pub const nvs_handle = nvs_handle_t;
pub const NVS_READONLY: c_int = 0;
pub const NVS_READWRITE: c_int = 1;
pub const nvs_open_mode_t = c_uint;
pub const nvs_open_mode = nvs_open_mode_t;
pub const NVS_TYPE_U8: c_int = 1;
pub const NVS_TYPE_I8: c_int = 17;
pub const NVS_TYPE_U16: c_int = 2;
pub const NVS_TYPE_I16: c_int = 18;
pub const NVS_TYPE_U32: c_int = 4;
pub const NVS_TYPE_I32: c_int = 20;
pub const NVS_TYPE_U64: c_int = 8;
pub const NVS_TYPE_I64: c_int = 24;
pub const NVS_TYPE_STR: c_int = 33;
pub const NVS_TYPE_BLOB: c_int = 66;
pub const NVS_TYPE_ANY: c_int = 255;
pub const nvs_type_t = c_uint;
pub const nvs_entry_info_t = extern struct {
    namespace_name: [16]u8 = @import("std").mem.zeroes([16]u8),
    key: [16]u8 = @import("std").mem.zeroes([16]u8),
    type: nvs_type_t = @import("std").mem.zeroes(nvs_type_t),
};
pub const struct_nvs_opaque_iterator_t = opaque {};
pub const nvs_iterator_t = ?*struct_nvs_opaque_iterator_t;
pub extern fn nvs_open(namespace_name: [*c]const u8, open_mode: nvs_open_mode_t, out_handle: [*c]nvs_handle_t) esp_err_t;
pub extern fn nvs_open_from_partition(part_name: [*c]const u8, namespace_name: [*c]const u8, open_mode: nvs_open_mode_t, out_handle: [*c]nvs_handle_t) esp_err_t;
pub extern fn nvs_set_i8(handle: nvs_handle_t, key: [*c]const u8, value: i8) esp_err_t;
pub extern fn nvs_set_u8(handle: nvs_handle_t, key: [*c]const u8, value: u8) esp_err_t;
pub extern fn nvs_set_i16(handle: nvs_handle_t, key: [*c]const u8, value: i16) esp_err_t;
pub extern fn nvs_set_u16(handle: nvs_handle_t, key: [*c]const u8, value: u16) esp_err_t;
pub extern fn nvs_set_i32(handle: nvs_handle_t, key: [*c]const u8, value: i32) esp_err_t;
pub extern fn nvs_set_u32(handle: nvs_handle_t, key: [*c]const u8, value: u32) esp_err_t;
pub extern fn nvs_set_i64(handle: nvs_handle_t, key: [*c]const u8, value: i64) esp_err_t;
pub extern fn nvs_set_u64(handle: nvs_handle_t, key: [*c]const u8, value: u64) esp_err_t;
pub extern fn nvs_set_str(handle: nvs_handle_t, key: [*c]const u8, value: [*c]const u8) esp_err_t;
pub extern fn nvs_set_blob(handle: nvs_handle_t, key: [*c]const u8, value: ?*const anyopaque, length: usize) esp_err_t;
pub extern fn nvs_get_i8(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]i8) esp_err_t;
pub extern fn nvs_get_u8(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]u8) esp_err_t;
pub extern fn nvs_get_i16(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]i16) esp_err_t;
pub extern fn nvs_get_u16(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]u16) esp_err_t;
pub extern fn nvs_get_i32(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]i32) esp_err_t;
pub extern fn nvs_get_u32(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]u32) esp_err_t;
pub extern fn nvs_get_i64(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]i64) esp_err_t;
pub extern fn nvs_get_u64(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]u64) esp_err_t;
pub extern fn nvs_get_str(handle: nvs_handle_t, key: [*c]const u8, out_value: [*c]u8, length: [*c]usize) esp_err_t;
pub extern fn nvs_get_blob(handle: nvs_handle_t, key: [*c]const u8, out_value: ?*anyopaque, length: [*c]usize) esp_err_t;
pub extern fn nvs_find_key(handle: nvs_handle_t, key: [*c]const u8, out_type: [*c]nvs_type_t) esp_err_t;
pub extern fn nvs_erase_key(handle: nvs_handle_t, key: [*c]const u8) esp_err_t;
pub extern fn nvs_erase_all(handle: nvs_handle_t) esp_err_t;
pub extern fn nvs_commit(handle: nvs_handle_t) esp_err_t;
pub extern fn nvs_close(handle: nvs_handle_t) void;
pub const nvs_stats_t = extern struct {
    used_entries: usize = @import("std").mem.zeroes(usize),
    free_entries: usize = @import("std").mem.zeroes(usize),
    available_entries: usize = @import("std").mem.zeroes(usize),
    total_entries: usize = @import("std").mem.zeroes(usize),
    namespace_count: usize = @import("std").mem.zeroes(usize),
};
pub extern fn nvs_get_stats(part_name: [*c]const u8, nvs_stats: [*c]nvs_stats_t) esp_err_t;
pub extern fn nvs_get_used_entry_count(handle: nvs_handle_t, used_entries: [*c]usize) esp_err_t;
pub extern fn nvs_entry_find(part_name: [*c]const u8, namespace_name: [*c]const u8, @"type": nvs_type_t, output_iterator: [*c]nvs_iterator_t) esp_err_t;
pub extern fn nvs_entry_find_in_handle(handle: nvs_handle_t, @"type": nvs_type_t, output_iterator: [*c]nvs_iterator_t) esp_err_t;
pub extern fn nvs_entry_next(iterator: [*c]nvs_iterator_t) esp_err_t;
pub extern fn nvs_entry_info(iterator: nvs_iterator_t, out_info: [*c]nvs_entry_info_t) esp_err_t;
pub extern fn nvs_release_iterator(iterator: nvs_iterator_t) void;
pub const struct_esp_flash_t = opaque {};
pub const esp_flash_t = struct_esp_flash_t;
pub const ESP_PARTITION_MMAP_DATA: c_int = 0;
pub const ESP_PARTITION_MMAP_INST: c_int = 1;
pub const esp_partition_mmap_memory_t = c_uint;
pub const esp_partition_mmap_handle_t = u32;
pub const ESP_PARTITION_TYPE_APP: c_int = 0;
pub const ESP_PARTITION_TYPE_DATA: c_int = 1;
pub const ESP_PARTITION_TYPE_ANY: c_int = 255;
pub const esp_partition_type_t = c_uint;
pub const ESP_PARTITION_SUBTYPE_APP_FACTORY: c_int = 0;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_MIN: c_int = 16;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_0: c_int = 16;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_1: c_int = 17;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_2: c_int = 18;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_3: c_int = 19;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_4: c_int = 20;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_5: c_int = 21;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_6: c_int = 22;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_7: c_int = 23;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_8: c_int = 24;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_9: c_int = 25;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_10: c_int = 26;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_11: c_int = 27;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_12: c_int = 28;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_13: c_int = 29;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_14: c_int = 30;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_15: c_int = 31;
pub const ESP_PARTITION_SUBTYPE_APP_OTA_MAX: c_int = 32;
pub const ESP_PARTITION_SUBTYPE_APP_TEST: c_int = 32;
pub const ESP_PARTITION_SUBTYPE_DATA_OTA: c_int = 0;
pub const ESP_PARTITION_SUBTYPE_DATA_PHY: c_int = 1;
pub const ESP_PARTITION_SUBTYPE_DATA_NVS: c_int = 2;
pub const ESP_PARTITION_SUBTYPE_DATA_COREDUMP: c_int = 3;
pub const ESP_PARTITION_SUBTYPE_DATA_NVS_KEYS: c_int = 4;
pub const ESP_PARTITION_SUBTYPE_DATA_EFUSE_EM: c_int = 5;
pub const ESP_PARTITION_SUBTYPE_DATA_UNDEFINED: c_int = 6;
pub const ESP_PARTITION_SUBTYPE_DATA_ESPHTTPD: c_int = 128;
pub const ESP_PARTITION_SUBTYPE_DATA_FAT: c_int = 129;
pub const ESP_PARTITION_SUBTYPE_DATA_SPIFFS: c_int = 130;
pub const ESP_PARTITION_SUBTYPE_DATA_LITTLEFS: c_int = 131;
pub const ESP_PARTITION_SUBTYPE_ANY: c_int = 255;
pub const esp_partition_subtype_t = c_uint;
pub const struct_esp_partition_iterator_opaque_ = opaque {};
pub const esp_partition_iterator_t = ?*struct_esp_partition_iterator_opaque_;
pub const esp_partition_t = extern struct {
    flash_chip: ?*esp_flash_t = @import("std").mem.zeroes(?*esp_flash_t),
    type: esp_partition_type_t = @import("std").mem.zeroes(esp_partition_type_t),
    subtype: esp_partition_subtype_t = @import("std").mem.zeroes(esp_partition_subtype_t),
    address: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
    erase_size: u32 = @import("std").mem.zeroes(u32),
    label: [17]u8 = @import("std").mem.zeroes([17]u8),
    encrypted: bool = @import("std").mem.zeroes(bool),
    readonly: bool = @import("std").mem.zeroes(bool),
};
pub extern fn esp_partition_find(@"type": esp_partition_type_t, subtype: esp_partition_subtype_t, label: [*c]const u8) esp_partition_iterator_t;
pub extern fn esp_partition_find_first(@"type": esp_partition_type_t, subtype: esp_partition_subtype_t, label: [*c]const u8) [*c]const esp_partition_t;
pub extern fn esp_partition_get(iterator: esp_partition_iterator_t) [*c]const esp_partition_t;
pub extern fn esp_partition_next(iterator: esp_partition_iterator_t) esp_partition_iterator_t;
pub extern fn esp_partition_iterator_release(iterator: esp_partition_iterator_t) void;
pub extern fn esp_partition_verify(partition: [*c]const esp_partition_t) [*c]const esp_partition_t;
pub extern fn esp_partition_read(partition: [*c]const esp_partition_t, src_offset: usize, dst: ?*anyopaque, size: usize) esp_err_t;
pub extern fn esp_partition_write(partition: [*c]const esp_partition_t, dst_offset: usize, src: ?*const anyopaque, size: usize) esp_err_t;
pub extern fn esp_partition_read_raw(partition: [*c]const esp_partition_t, src_offset: usize, dst: ?*anyopaque, size: usize) esp_err_t;
pub extern fn esp_partition_write_raw(partition: [*c]const esp_partition_t, dst_offset: usize, src: ?*const anyopaque, size: usize) esp_err_t;
pub extern fn esp_partition_erase_range(partition: [*c]const esp_partition_t, offset: usize, size: usize) esp_err_t;
pub extern fn esp_partition_mmap(partition: [*c]const esp_partition_t, offset: usize, size: usize, memory: esp_partition_mmap_memory_t, out_ptr: [*c]?*const anyopaque, out_handle: [*c]esp_partition_mmap_handle_t) esp_err_t;
pub extern fn esp_partition_munmap(handle: esp_partition_mmap_handle_t) void;
pub extern fn esp_partition_get_sha256(partition: [*c]const esp_partition_t, sha_256: [*c]u8) esp_err_t;
pub extern fn esp_partition_check_identity(partition_1: [*c]const esp_partition_t, partition_2: [*c]const esp_partition_t) bool;
pub extern fn esp_partition_register_external(flash_chip: ?*esp_flash_t, offset: usize, size: usize, label: [*c]const u8, @"type": esp_partition_type_t, subtype: esp_partition_subtype_t, out_partition: [*c][*c]const esp_partition_t) esp_err_t;
pub extern fn esp_partition_deregister_external(partition: [*c]const esp_partition_t) esp_err_t;
pub extern fn esp_partition_unload_all() void;
pub const nvs_sec_cfg_t = extern struct {
    eky: [32]u8 = @import("std").mem.zeroes([32]u8),
    tky: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const nvs_flash_generate_keys_t = ?*const fn (?*const anyopaque, [*c]nvs_sec_cfg_t) callconv(.c) esp_err_t;
pub const nvs_flash_read_cfg_t = ?*const fn (?*const anyopaque, [*c]nvs_sec_cfg_t) callconv(.c) esp_err_t;
pub const nvs_sec_scheme_t = extern struct {
    scheme_id: c_int = @import("std").mem.zeroes(c_int),
    scheme_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    nvs_flash_key_gen: nvs_flash_generate_keys_t = @import("std").mem.zeroes(nvs_flash_generate_keys_t),
    nvs_flash_read_cfg: nvs_flash_read_cfg_t = @import("std").mem.zeroes(nvs_flash_read_cfg_t),
};
pub extern fn nvs_flash_init() esp_err_t;
pub extern fn nvs_flash_init_partition(partition_label: [*c]const u8) esp_err_t;
pub extern fn nvs_flash_init_partition_ptr(partition: [*c]const esp_partition_t) esp_err_t;
pub extern fn nvs_flash_deinit() esp_err_t;
pub extern fn nvs_flash_deinit_partition(partition_label: [*c]const u8) esp_err_t;
pub extern fn nvs_flash_erase() esp_err_t;
pub extern fn nvs_flash_erase_partition(part_name: [*c]const u8) esp_err_t;
pub extern fn nvs_flash_erase_partition_ptr(partition: [*c]const esp_partition_t) esp_err_t;
pub extern fn nvs_flash_secure_init(cfg: [*c]nvs_sec_cfg_t) esp_err_t;
pub extern fn nvs_flash_secure_init_partition(partition_label: [*c]const u8, cfg: [*c]nvs_sec_cfg_t) esp_err_t;
pub extern fn nvs_flash_generate_keys(partition: [*c]const esp_partition_t, cfg: [*c]nvs_sec_cfg_t) esp_err_t;
pub extern fn nvs_flash_read_security_cfg(partition: [*c]const esp_partition_t, cfg: [*c]nvs_sec_cfg_t) esp_err_t;
pub extern fn nvs_flash_register_security_scheme(scheme_cfg: [*c]nvs_sec_scheme_t) esp_err_t;
pub extern fn nvs_flash_get_default_security_scheme() [*c]nvs_sec_scheme_t;
pub extern fn nvs_flash_generate_keys_v2(scheme_cfg: [*c]nvs_sec_scheme_t, cfg: [*c]nvs_sec_cfg_t) esp_err_t;
pub extern fn nvs_flash_read_security_cfg_v2(scheme_cfg: [*c]nvs_sec_scheme_t, cfg: [*c]nvs_sec_cfg_t) esp_err_t;
pub extern fn bcmp(?*const anyopaque, ?*const anyopaque, usize) c_int;
pub extern fn bcopy(?*const anyopaque, ?*anyopaque, usize) void;
pub extern fn bzero(?*anyopaque, usize) void;
pub extern fn explicit_bzero(?*anyopaque, usize) void;
pub extern fn ffs(c_int) c_int;
pub extern fn ffsl(c_long) c_int;
pub extern fn ffsll(c_longlong) c_int;
pub extern fn fls(c_int) c_int;
pub extern fn flsl(c_long) c_int;
pub extern fn flsll(c_longlong) c_int;
pub extern fn index([*c]const u8, c_int) [*c]u8;
pub extern fn rindex([*c]const u8, c_int) [*c]u8;
pub extern fn strcasecmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strncasecmp([*c]const u8, [*c]const u8, usize) c_int;
pub extern fn strcasecmp_l([*c]const u8, [*c]const u8, locale_t) c_int;
pub extern fn strncasecmp_l([*c]const u8, [*c]const u8, usize, locale_t) c_int;
pub extern fn memchr(?*const anyopaque, c_int, usize) ?*anyopaque;
pub extern fn memcmp(?*const anyopaque, ?*const anyopaque, usize) c_int;
pub extern fn memcpy(noalias ?*anyopaque, noalias ?*const anyopaque, usize) ?*anyopaque;
pub extern fn memmove(?*anyopaque, ?*const anyopaque, usize) ?*anyopaque;
pub extern fn memset(?*anyopaque, c_int, usize) ?*anyopaque;
pub extern fn strcat(noalias [*c]u8, noalias [*c]const u8) [*c]u8;
pub extern fn strchr([*c]const u8, c_int) [*c]u8;
pub extern fn strcmp([*c]const u8, [*c]const u8) c_int;
pub extern fn strcoll([*c]const u8, [*c]const u8) c_int;
pub extern fn strcpy(noalias [*c]u8, noalias [*c]const u8) [*c]u8;
pub extern fn strcspn([*c]const u8, [*c]const u8) usize;
pub extern fn strerror(c_int) [*c]u8;
pub extern fn strlen([*c]const u8) usize;
pub extern fn strncat(noalias [*c]u8, noalias [*c]const u8, usize) [*c]u8;
pub extern fn strncmp([*c]const u8, [*c]const u8, usize) c_int;
pub extern fn strncpy(noalias [*c]u8, noalias [*c]const u8, usize) [*c]u8;
pub extern fn strpbrk([*c]const u8, [*c]const u8) [*c]u8;
pub extern fn strrchr([*c]const u8, c_int) [*c]u8;
pub extern fn strspn([*c]const u8, [*c]const u8) usize;
pub extern fn strstr([*c]const u8, [*c]const u8) [*c]u8;
pub extern fn strtok(noalias [*c]u8, noalias [*c]const u8) [*c]u8;
pub extern fn strxfrm(noalias [*c]u8, noalias [*c]const u8, usize) usize;
pub extern fn strcoll_l([*c]const u8, [*c]const u8, locale_t) c_int;
pub extern fn strerror_l(c_int, locale_t) [*c]u8;
pub extern fn strxfrm_l(noalias [*c]u8, noalias [*c]const u8, usize, locale_t) usize;
pub extern fn strtok_r(noalias [*c]u8, noalias [*c]const u8, noalias [*c][*c]u8) [*c]u8;
pub extern fn timingsafe_bcmp(?*const anyopaque, ?*const anyopaque, usize) c_int;
pub extern fn timingsafe_memcmp(?*const anyopaque, ?*const anyopaque, usize) c_int;
pub extern fn memccpy(noalias ?*anyopaque, noalias ?*const anyopaque, c_int, usize) ?*anyopaque;
pub extern fn stpcpy(noalias [*c]u8, noalias [*c]const u8) [*c]u8;
pub extern fn stpncpy(noalias [*c]u8, noalias [*c]const u8, usize) [*c]u8;
pub extern fn strdup([*c]const u8) [*c]u8;
pub extern fn _strdup_r([*c]struct__reent, [*c]const u8) [*c]u8;
pub extern fn strndup([*c]const u8, usize) [*c]u8;
pub extern fn _strndup_r([*c]struct__reent, [*c]const u8, usize) [*c]u8;
pub extern fn strerror_r(c_int, [*c]u8, usize) c_int;
pub extern fn _strerror_r([*c]struct__reent, c_int, c_int, [*c]c_int) [*c]u8;
pub extern fn strlcat([*c]u8, [*c]const u8, usize) usize;
pub extern fn strlcpy([*c]u8, [*c]const u8, usize) usize;
pub extern fn strnlen([*c]const u8, usize) usize;
pub extern fn strsep([*c][*c]u8, [*c]const u8) [*c]u8;
pub extern fn strnstr([*c]const u8, [*c]const u8, usize) [*c]u8;
pub extern fn strlwr([*c]u8) [*c]u8;
pub extern fn strupr([*c]u8) [*c]u8;
pub extern fn strsignal(__signo: c_int) [*c]u8;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = __intptr_t;
pub const __sigset_t = c_ulong;
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub const sigset_t = __sigset_t;
pub const __fd_mask = c_ulong;
pub const fd_mask = __fd_mask;
pub const struct_fd_set = extern struct {
    __fds_bits: [2]__fd_mask = @import("std").mem.zeroes([2]__fd_mask),
};
pub const fd_set = struct_fd_set;
pub extern fn select(__n: c_int, __readfds: [*c]fd_set, __writefds: [*c]fd_set, __exceptfds: [*c]fd_set, __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__n: c_int, __readfds: [*c]fd_set, __writefds: [*c]fd_set, __exceptfds: [*c]fd_set, __timeout: [*c]const struct_timespec, __set: [*c]const sigset_t) c_int;
pub const in_addr_t = __uint32_t;
pub const in_port_t = __uint16_t;
pub const u_register_t = __uintptr_t;
pub const u_char = u8;
pub const u_short = c_ushort;
pub const u_int = c_uint;
pub const u_long = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const ulong = c_ulong;
pub const clock_t = c_ulong;
pub const daddr_t = __daddr_t;
pub const caddr_t = [*c]u8;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const id_t = __id_t;
pub const pid_t = __pid_t;
pub const key_t = __key_t;
pub const clockid_t = __clockid_t;
pub const timer_t = __timer_t;
pub const useconds_t = __useconds_t;
pub const sbintime_t = __int64_t;
pub const struct_sched_param = extern struct {
    sched_priority: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn sched_yield() c_int;
pub const pthread_t = __uint32_t;
pub const pthread_attr_t = extern struct {
    is_initialized: c_int = @import("std").mem.zeroes(c_int),
    stackaddr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stacksize: c_int = @import("std").mem.zeroes(c_int),
    contentionscope: c_int = @import("std").mem.zeroes(c_int),
    inheritsched: c_int = @import("std").mem.zeroes(c_int),
    schedpolicy: c_int = @import("std").mem.zeroes(c_int),
    schedparam: struct_sched_param = @import("std").mem.zeroes(struct_sched_param),
    detachstate: c_int = @import("std").mem.zeroes(c_int),
};
pub const pthread_mutex_t = __uint32_t;
pub const pthread_mutexattr_t = extern struct {
    is_initialized: c_int = @import("std").mem.zeroes(c_int),
    type: c_int = @import("std").mem.zeroes(c_int),
    recursive: c_int = @import("std").mem.zeroes(c_int),
};
pub const pthread_cond_t = __uint32_t;
pub const pthread_condattr_t = extern struct {
    is_initialized: c_int = @import("std").mem.zeroes(c_int),
    clock: clock_t = @import("std").mem.zeroes(clock_t),
};
pub const pthread_key_t = __uint32_t;
pub const pthread_once_t = extern struct {
    is_initialized: c_int = @import("std").mem.zeroes(c_int),
    init_executed: c_int = @import("std").mem.zeroes(c_int),
};
pub extern var environ: [*c][*c]u8;
pub extern fn _exit(__status: c_int) noreturn;
pub extern fn access(__path: [*c]const u8, __amode: c_int) c_int;
pub extern fn alarm(__secs: c_uint) c_uint;
pub extern fn chdir(__path: [*c]const u8) c_int;
pub extern fn chmod(__path: [*c]const u8, __mode: mode_t) c_int;
pub extern fn chown(__path: [*c]const u8, __owner: uid_t, __group: gid_t) c_int;
pub extern fn chroot(__path: [*c]const u8) c_int;
pub extern fn close(__fildes: c_int) c_int;
pub extern fn confstr(__name: c_int, __buf: [*c]u8, __len: usize) usize;
pub extern fn daemon(nochdir: c_int, noclose: c_int) c_int;
pub extern fn dup(__fildes: c_int) c_int;
pub extern fn dup2(__fildes: c_int, __fildes2: c_int) c_int;
pub extern fn endusershell() void;
pub extern fn execl(__path: [*c]const u8, [*c]const u8, ...) c_int;
pub extern fn execle(__path: [*c]const u8, [*c]const u8, ...) c_int;
pub extern fn execlp(__file: [*c]const u8, [*c]const u8, ...) c_int;
pub extern fn execlpe(__file: [*c]const u8, [*c]const u8, ...) c_int;
pub extern fn execv(__path: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execve(__path: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn execvp(__file: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn faccessat(__dirfd: c_int, __path: [*c]const u8, __mode: c_int, __flags: c_int) c_int;
pub extern fn fchdir(__fildes: c_int) c_int;
pub extern fn fchmod(__fildes: c_int, __mode: mode_t) c_int;
pub extern fn fchown(__fildes: c_int, __owner: uid_t, __group: gid_t) c_int;
pub extern fn fchownat(__dirfd: c_int, __path: [*c]const u8, __owner: uid_t, __group: gid_t, __flags: c_int) c_int;
pub extern fn fexecve(__fd: c_int, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn fork() pid_t;
pub extern fn fpathconf(__fd: c_int, __name: c_int) c_long;
pub extern fn fsync(__fd: c_int) c_int;
pub extern fn fdatasync(__fd: c_int) c_int;
pub extern fn getcwd(__buf: [*c]u8, __size: usize) [*c]u8;
pub extern fn getdomainname(__name: [*c]u8, __len: usize) c_int;
pub extern fn getentropy(?*anyopaque, usize) c_int;
pub extern fn getegid() gid_t;
pub extern fn geteuid() uid_t;
pub extern fn getgid() gid_t;
pub extern fn getgroups(__gidsetsize: c_int, __grouplist: [*c]gid_t) c_int;
pub extern fn gethostid() c_long;
pub extern fn getlogin() [*c]u8;
pub extern fn getpass(__prompt: [*c]const u8) [*c]u8;
pub extern fn getpagesize() c_int;
pub extern fn getpeereid(c_int, [*c]uid_t, [*c]gid_t) c_int;
pub extern fn getpgid(pid_t) pid_t;
pub extern fn getpgrp() pid_t;
pub extern fn getpid() pid_t;
pub extern fn getppid() pid_t;
pub extern fn getsid(pid_t) pid_t;
pub extern fn getuid() uid_t;
pub extern fn getusershell() [*c]u8;
pub extern fn getwd(__buf: [*c]u8) [*c]u8;
pub extern fn iruserok(raddr: c_ulong, superuser: c_int, ruser: [*c]const u8, luser: [*c]const u8) c_int;
pub extern fn isatty(__fildes: c_int) c_int;
pub extern fn issetugid() c_int;
pub extern fn lchown(__path: [*c]const u8, __owner: uid_t, __group: gid_t) c_int;
pub extern fn link(__path1: [*c]const u8, __path2: [*c]const u8) c_int;
pub extern fn linkat(__dirfd1: c_int, __path1: [*c]const u8, __dirfd2: c_int, __path2: [*c]const u8, __flags: c_int) c_int;
pub extern fn nice(__nice_value: c_int) c_int;
pub extern fn lseek(__fildes: c_int, __offset: off_t, __whence: c_int) off_t;
pub extern fn lockf(__fd: c_int, __cmd: c_int, __len: off_t) c_int;
pub extern fn pathconf(__path: [*c]const u8, __name: c_int) c_long;
pub extern fn pause() c_int;
pub extern fn pthread_atfork(?*const fn () callconv(.c) void, ?*const fn () callconv(.c) void, ?*const fn () callconv(.c) void) c_int;
pub extern fn pipe(__fildes: [*c]c_int) c_int;
pub extern fn pread(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize, __offset: off_t) isize;
pub extern fn pwrite(__fd: c_int, __buf: ?*const anyopaque, __nbytes: usize, __offset: off_t) isize;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbyte: usize) c_int;
pub extern fn rresvport(__alport: [*c]c_int) c_int;
pub extern fn revoke(__path: [*c]u8) c_int;
pub extern fn rmdir(__path: [*c]const u8) c_int;
pub extern fn ruserok(rhost: [*c]const u8, superuser: c_int, ruser: [*c]const u8, luser: [*c]const u8) c_int;
pub extern fn sbrk(__incr: ptrdiff_t) ?*anyopaque;
pub extern fn setegid(__gid: gid_t) c_int;
pub extern fn seteuid(__uid: uid_t) c_int;
pub extern fn setgid(__gid: gid_t) c_int;
pub extern fn setgroups(ngroups: c_int, grouplist: [*c]const gid_t) c_int;
pub extern fn sethostname([*c]const u8, usize) c_int;
pub extern fn setpgid(__pid: pid_t, __pgid: pid_t) c_int;
pub extern fn setpgrp() c_int;
pub extern fn setregid(__rgid: gid_t, __egid: gid_t) c_int;
pub extern fn setreuid(__ruid: uid_t, __euid: uid_t) c_int;
pub extern fn setsid() pid_t;
pub extern fn setuid(__uid: uid_t) c_int;
pub extern fn setusershell() void;
pub extern fn sleep(__seconds: c_uint) c_uint;
pub extern fn sysconf(__name: c_int) c_long;
pub extern fn tcgetpgrp(__fildes: c_int) pid_t;
pub extern fn tcsetpgrp(__fildes: c_int, __pgrp_id: pid_t) c_int;
pub extern fn ttyname(__fildes: c_int) [*c]u8;
pub extern fn ttyname_r(c_int, [*c]u8, usize) c_int;
pub extern fn unlink(__path: [*c]const u8) c_int;
pub extern fn usleep(__useconds: useconds_t) c_int;
pub extern fn vhangup() c_int;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __nbyte: usize) c_int;
pub extern var optarg: [*c]u8;
pub extern var optind: c_int;
pub extern var opterr: c_int;
pub extern var optopt: c_int;
pub extern fn getopt(c_int, [*c]const [*c]u8, [*c]const u8) c_int;
pub extern var optreset: c_int;
pub extern fn vfork() pid_t;
pub extern fn ftruncate(__fd: c_int, __length: off_t) c_int;
pub extern fn truncate([*c]const u8, __length: off_t) c_int;
pub extern fn getdtablesize() c_int;
pub extern fn ualarm(__useconds: useconds_t, __interval: useconds_t) useconds_t;
pub extern fn gethostname(__name: [*c]u8, __len: usize) c_int;
pub extern fn setdtablesize(c_int) c_int;
pub extern fn sync() void;
pub extern fn readlink(noalias __path: [*c]const u8, noalias __buf: [*c]u8, __buflen: usize) isize;
pub extern fn symlink(__name1: [*c]const u8, __name2: [*c]const u8) c_int;
pub extern fn readlinkat(__dirfd1: c_int, noalias __path: [*c]const u8, noalias __buf: [*c]u8, __buflen: usize) isize;
pub extern fn symlinkat([*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn unlinkat(c_int, [*c]const u8, c_int) c_int;
pub const struct_flock = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: c_long = @import("std").mem.zeroes(c_long),
    l_len: c_long = @import("std").mem.zeroes(c_long),
    l_pid: c_short = @import("std").mem.zeroes(c_short),
    l_xxx: c_short = @import("std").mem.zeroes(c_short),
};
pub const struct_eflock = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: c_long = @import("std").mem.zeroes(c_long),
    l_len: c_long = @import("std").mem.zeroes(c_long),
    l_pid: c_short = @import("std").mem.zeroes(c_short),
    l_xxx: c_short = @import("std").mem.zeroes(c_short),
    l_rpid: c_long = @import("std").mem.zeroes(c_long),
    l_rsys: c_long = @import("std").mem.zeroes(c_long),
};
pub const struct_tm = extern struct {
    tm_sec: c_int = @import("std").mem.zeroes(c_int),
    tm_min: c_int = @import("std").mem.zeroes(c_int),
    tm_hour: c_int = @import("std").mem.zeroes(c_int),
    tm_mday: c_int = @import("std").mem.zeroes(c_int),
    tm_mon: c_int = @import("std").mem.zeroes(c_int),
    tm_year: c_int = @import("std").mem.zeroes(c_int),
    tm_wday: c_int = @import("std").mem.zeroes(c_int),
    tm_yday: c_int = @import("std").mem.zeroes(c_int),
    tm_isdst: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn clock() clock_t;
pub extern fn difftime(_time2: time_t, _time1: time_t) f64;
pub extern fn mktime(_timeptr: [*c]struct_tm) time_t;
pub extern fn time(_timer: [*c]time_t) time_t;
pub extern fn asctime(_tblock: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(_time: [*c]const time_t) [*c]u8;
pub extern fn gmtime(_timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(_timer: [*c]const time_t) [*c]struct_tm;
pub extern fn strftime(noalias _s: [*c]u8, _maxsize: usize, noalias _fmt: [*c]const u8, noalias _t: [*c]const struct_tm) usize;
pub extern fn strftime_l(noalias _s: [*c]u8, _maxsize: usize, noalias _fmt: [*c]const u8, noalias _t: [*c]const struct_tm, _l: locale_t) usize;
pub extern fn asctime_r(noalias [*c]const struct_tm, noalias [*c]u8) [*c]u8;
pub extern fn ctime_r([*c]const time_t, [*c]u8) [*c]u8;
pub extern fn gmtime_r(noalias [*c]const time_t, noalias [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias [*c]const time_t, noalias [*c]struct_tm) [*c]struct_tm;
pub extern fn tzset() void;
pub extern fn _tzset_r([*c]struct__reent) void;
pub extern var _timezone: c_long;
pub extern var _daylight: c_int;
pub extern var _tzname: [2][*c]u8;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const struct_sigevent = extern struct {
    sigev_notify: c_int = @import("std").mem.zeroes(c_int),
    sigev_signo: c_int = @import("std").mem.zeroes(c_int),
    sigev_value: union_sigval = @import("std").mem.zeroes(union_sigval),
    sigev_notify_function: ?*const fn (union_sigval) callconv(.c) void = @import("std").mem.zeroes(?*const fn (union_sigval) callconv(.c) void),
    sigev_notify_attributes: [*c]pthread_attr_t = @import("std").mem.zeroes([*c]pthread_attr_t),
};
pub const siginfo_t = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    si_value: union_sigval = @import("std").mem.zeroes(union_sigval),
};
pub const _sig_func_ptr = ?*const fn (c_int) callconv(.c) void;
pub const struct_sigaction = extern struct {
    sa_handler: _sig_func_ptr = @import("std").mem.zeroes(_sig_func_ptr),
    sa_mask: sigset_t = @import("std").mem.zeroes(sigset_t),
    sa_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_sigaltstack = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_flags: c_int = @import("std").mem.zeroes(c_int),
    ss_size: usize = @import("std").mem.zeroes(usize),
};
pub const stack_t = struct_sigaltstack;
pub extern fn sigprocmask(c_int, [*c]const sigset_t, [*c]sigset_t) c_int;
pub extern fn pthread_sigmask(c_int, [*c]const sigset_t, [*c]sigset_t) c_int;
pub extern fn kill(pid_t, c_int) c_int;
pub extern fn killpg(pid_t, c_int) c_int;
pub extern fn sigaction(c_int, [*c]const struct_sigaction, [*c]struct_sigaction) c_int;
pub extern fn sigaddset([*c]sigset_t, c_int) c_int;
pub extern fn sigdelset([*c]sigset_t, c_int) c_int;
pub extern fn sigismember([*c]const sigset_t, c_int) c_int;
pub extern fn sigfillset([*c]sigset_t) c_int;
pub extern fn sigemptyset([*c]sigset_t) c_int;
pub extern fn sigpending([*c]sigset_t) c_int;
pub extern fn sigsuspend([*c]const sigset_t) c_int;
pub extern fn sigwait([*c]const sigset_t, [*c]c_int) c_int;
pub extern fn sigpause(c_int) c_int;
pub extern fn sigaltstack(noalias [*c]const stack_t, noalias [*c]stack_t) c_int;
pub extern fn pthread_kill(pthread_t, c_int) c_int;
pub extern fn sigwaitinfo([*c]const sigset_t, [*c]siginfo_t) c_int;
pub extern fn sigtimedwait([*c]const sigset_t, [*c]siginfo_t, [*c]const struct_timespec) c_int;
pub extern fn sigqueue(pid_t, c_int, union_sigval) c_int;
pub extern fn sig2str(c_int, [*c]u8) c_int;
pub extern fn str2sig(noalias [*c]const u8, noalias [*c]c_int) c_int;
pub const sig_atomic_t = c_int;
pub const sig_t = _sig_func_ptr;
pub extern fn _signal_r([*c]struct__reent, c_int, _sig_func_ptr) _sig_func_ptr;
pub extern fn _raise_r([*c]struct__reent, c_int) c_int;
pub extern fn signal(c_int, _sig_func_ptr) _sig_func_ptr;
pub extern fn raise(c_int) c_int;
pub extern fn psignal(c_int, [*c]const u8) void;
pub extern fn clock_settime(clock_id: clockid_t, tp: [*c]const struct_timespec) c_int;
pub extern fn clock_gettime(clock_id: clockid_t, tp: [*c]struct_timespec) c_int;
pub extern fn clock_getres(clock_id: clockid_t, res: [*c]struct_timespec) c_int;
pub extern fn timer_create(clock_id: clockid_t, noalias evp: [*c]struct_sigevent, noalias timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(timerid: timer_t) c_int;
pub extern fn timer_settime(timerid: timer_t, flags: c_int, noalias value: [*c]const struct_itimerspec, noalias ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(timerid: timer_t, value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(timerid: timer_t) c_int;
pub extern fn nanosleep(rqtp: [*c]const struct_timespec, rmtp: [*c]struct_timespec) c_int;
pub extern fn clock_nanosleep(clock_id: clockid_t, flags: c_int, rqtp: [*c]const struct_timespec, rmtp: [*c]struct_timespec) c_int;
pub extern fn fstat(__fd: c_int, __sbuf: [*c]struct_stat) c_int;
pub extern fn mkdir(_path: [*c]const u8, __mode: mode_t) c_int;
pub extern fn mkfifo(__path: [*c]const u8, __mode: mode_t) c_int;
pub extern fn stat(noalias __path: [*c]const u8, noalias __sbuf: [*c]struct_stat) c_int;
pub extern fn umask(__mask: mode_t) mode_t;
pub extern fn fchmodat(c_int, [*c]const u8, mode_t, c_int) c_int;
pub extern fn fstatat(c_int, noalias [*c]const u8, noalias [*c]struct_stat, c_int) c_int;
pub extern fn mkdirat(c_int, [*c]const u8, mode_t) c_int;
pub extern fn mkfifoat(c_int, [*c]const u8, mode_t) c_int;
pub extern fn mknodat(c_int, [*c]const u8, mode_t, dev_t) c_int;
pub extern fn utimensat(c_int, [*c]const u8, [*c]const struct_timespec, c_int) c_int;
pub extern fn futimens(c_int, [*c]const struct_timespec) c_int;
pub extern fn open([*c]const u8, c_int, ...) c_int;
pub extern fn openat(c_int, [*c]const u8, c_int, ...) c_int;
pub extern fn creat([*c]const u8, mode_t) c_int;
pub extern fn fcntl(c_int, c_int, ...) c_int;
pub extern fn flock(c_int, c_int) c_int;
pub extern fn ioctl(fd: c_int, request: c_int, ...) c_int;
pub const struct_pollfd = extern struct {
    fd: c_int = @import("std").mem.zeroes(c_int),
    events: c_short = @import("std").mem.zeroes(c_short),
    revents: c_short = @import("std").mem.zeroes(c_short),
};
pub const nfds_t = c_uint;
pub extern fn poll(fds: [*c]struct_pollfd, nfds: nfds_t, timeout: c_int) c_int;
pub extern fn esp_random() u32;
pub extern fn esp_fill_random(buf: ?*anyopaque, len: usize) void;
pub extern fn sntp_get_sync_interval() u32;
pub extern fn sntp_set_system_time(sec: u32, us: u32) void;
pub extern fn sntp_get_system_time(sec: [*c]u32, us: [*c]u32) void;
pub const struct_lwip_sock = opaque {};
pub extern fn lwip_setsockopt_impl_ext(sock: ?*struct_lwip_sock, level: c_int, optname: c_int, optval: ?*const anyopaque, optlen: u32, err: [*c]c_int) bool;
pub extern fn lwip_getsockopt_impl_ext(sock: ?*struct_lwip_sock, level: c_int, optname: c_int, optval: ?*anyopaque, optlen: [*c]u32, err: [*c]c_int) bool;
pub const sys_sem_t = SemaphoreHandle_t;
pub const sys_mutex_t = SemaphoreHandle_t;
pub const sys_thread_t = TaskHandle_t;
pub const struct_sys_mbox_s = extern struct {
    os_mbox: QueueHandle_t = @import("std").mem.zeroes(QueueHandle_t),
    owner: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const sys_mbox_t = [*c]struct_sys_mbox_s;
pub extern fn sys_delay_ms(ms: u32) void;
pub extern fn sys_thread_sem_init() [*c]sys_sem_t;
pub extern fn sys_thread_sem_deinit() void;
pub extern fn sys_thread_sem_get() [*c]sys_sem_t;
pub const LWIP_CORE_LOCK_QUERY_HOLDER: c_int = 0;
pub const LWIP_CORE_LOCK_MARK_HOLDER: c_int = 1;
pub const LWIP_CORE_LOCK_UNMARK_HOLDER: c_int = 2;
pub const LWIP_CORE_MARK_TCPIP_TASK: c_int = 3;
pub const LWIP_CORE_IS_TCPIP_INITIALIZED: c_int = 4;
pub const sys_thread_core_lock_t = c_uint;
pub extern fn sys_thread_tcpip(@"type": sys_thread_core_lock_t) bool;
pub fn timeout_from_offered(arg_lease: u32, arg_min: u32) callconv(.c) u32 {
    var lease = arg_lease;
    _ = &lease;
    var min = arg_min;
    _ = &min;
    var timeout: u32 = lease;
    _ = &timeout;
    if (timeout == @as(u32, @bitCast(@as(c_int, 0)))) {
        timeout = min;
    }
    timeout = ((timeout +% @as(u32, @bitCast(@as(c_int, 1)))) -% @as(u32, @bitCast(@as(c_int, 1)))) / @as(u32, @bitCast(@as(c_int, 1)));
    return timeout;
}
pub const error_t = c_int;
pub extern fn __errno() [*c]c_int;
pub const _sys_errlist: [*c]const [*c]const u8 = @extern([*c]const [*c]const u8, .{
    .name = "_sys_errlist",
});
pub extern var _sys_nerr: c_int;
pub const u8_t = u8;
pub const s8_t = i8;
pub const u16_t = u16;
pub const s16_t = i16;
pub const u32_t = u32;
pub const s32_t = i32;
pub const sys_prot_t = c_int;
pub const u64_t = u64;
pub const s64_t = i64;
pub const mem_ptr_t = usize;
pub extern fn isalnum(__c: c_int) c_int;
pub extern fn isalpha(__c: c_int) c_int;
pub extern fn iscntrl(__c: c_int) c_int;
pub extern fn isdigit(__c: c_int) c_int;
pub extern fn isgraph(__c: c_int) c_int;
pub extern fn islower(__c: c_int) c_int;
pub extern fn isprint(__c: c_int) c_int;
pub extern fn ispunct(__c: c_int) c_int;
pub extern fn isspace(__c: c_int) c_int;
pub extern fn isupper(__c: c_int) c_int;
pub extern fn isxdigit(__c: c_int) c_int;
pub extern fn tolower(__c: c_int) c_int;
pub extern fn toupper(__c: c_int) c_int;
pub extern fn isblank(__c: c_int) c_int;
pub extern fn isascii(__c: c_int) c_int;
pub extern fn toascii(__c: c_int) c_int;
pub extern fn isalnum_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isalpha_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isblank_l(__c: c_int, __l: locale_t) c_int;
pub extern fn iscntrl_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isdigit_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isgraph_l(__c: c_int, __l: locale_t) c_int;
pub extern fn islower_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isprint_l(__c: c_int, __l: locale_t) c_int;
pub extern fn ispunct_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isspace_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isupper_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isxdigit_l(__c: c_int, __l: locale_t) c_int;
pub extern fn tolower_l(__c: c_int, __l: locale_t) c_int;
pub extern fn toupper_l(__c: c_int, __l: locale_t) c_int;
pub extern fn isascii_l(__c: c_int, __l: locale_t) c_int;
pub extern fn toascii_l(__c: c_int, __l: locale_t) c_int;
pub const _ctype_: [*c]const u8 = @extern([*c]const u8, .{
    .name = "_ctype_",
});
pub fn __locale_ctype_ptr_l(arg__l: locale_t) callconv(.c) [*c]const u8 {
    var _l = arg__l;
    _ = &_l;
    _ = &_l;
    return @as([*c]const u8, @ptrCast(@alignCast(&_ctype_)));
}
pub extern fn lwip_htons(x: u16_t) u16_t;
pub extern fn lwip_htonl(x: u32_t) u32_t;
pub extern fn lwip_itoa(result: [*c]u8, bufsize: usize, number: c_int) void;
pub extern fn lwip_strnicmp(str1: [*c]const u8, str2: [*c]const u8, len: usize) c_int;
pub extern fn lwip_stricmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn lwip_strnstr(buffer: [*c]const u8, token: [*c]const u8, n: usize) [*c]u8;
pub const struct_ip4_addr = extern struct {
    addr: u32_t = @import("std").mem.zeroes(u32_t),
};
pub const ip4_addr_t = struct_ip4_addr;
pub const struct_ip6_addr = extern struct {
    addr: [4]u32_t = @import("std").mem.zeroes([4]u32_t),
    zone: u8_t = @import("std").mem.zeroes(u8_t),
};
pub const ip6_addr_t = struct_ip6_addr;
const union_unnamed_6 = extern union {
    ip6: ip6_addr_t,
    ip4: ip4_addr_t,
};
pub const struct_ip_addr = extern struct {
    u_addr: union_unnamed_6 = @import("std").mem.zeroes(union_unnamed_6),
    type: u8_t = @import("std").mem.zeroes(u8_t),
};
pub const ip_addr_t = struct_ip_addr;
pub const struct_pbuf = extern struct {
    next: [*c]struct_pbuf = @import("std").mem.zeroes([*c]struct_pbuf),
    payload: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tot_len: u16_t = @import("std").mem.zeroes(u16_t),
    len: u16_t = @import("std").mem.zeroes(u16_t),
    type_internal: u8_t = @import("std").mem.zeroes(u8_t),
    flags: u8_t = @import("std").mem.zeroes(u8_t),
    ref: u8_t = @import("std").mem.zeroes(u8_t),
    if_idx: u8_t = @import("std").mem.zeroes(u8_t),
};
pub const err_t = s8_t;
pub const netif_input_fn = ?*const fn ([*c]struct_pbuf, [*c]struct_netif) callconv(.c) err_t;
pub const netif_output_fn = ?*const fn ([*c]struct_netif, [*c]struct_pbuf, [*c]const ip4_addr_t) callconv(.c) err_t;
pub const netif_linkoutput_fn = ?*const fn ([*c]struct_netif, [*c]struct_pbuf) callconv(.c) err_t;
pub const netif_output_ip6_fn = ?*const fn ([*c]struct_netif, [*c]struct_pbuf, [*c]const ip6_addr_t) callconv(.c) err_t;
pub const NETIF_DEL_MAC_FILTER: c_int = 0;
pub const NETIF_ADD_MAC_FILTER: c_int = 1;
pub const enum_netif_mac_filter_action = c_uint;
pub const netif_igmp_mac_filter_fn = ?*const fn ([*c]struct_netif, [*c]const ip4_addr_t, enum_netif_mac_filter_action) callconv(.c) err_t;
pub const netif_mld_mac_filter_fn = ?*const fn ([*c]struct_netif, [*c]const ip6_addr_t, enum_netif_mac_filter_action) callconv(.c) err_t;
pub const struct_netif = extern struct {
    next: [*c]struct_netif = @import("std").mem.zeroes([*c]struct_netif),
    ip_addr: ip_addr_t = @import("std").mem.zeroes(ip_addr_t),
    netmask: ip_addr_t = @import("std").mem.zeroes(ip_addr_t),
    gw: ip_addr_t = @import("std").mem.zeroes(ip_addr_t),
    ip6_addr: [3]ip_addr_t = @import("std").mem.zeroes([3]ip_addr_t),
    ip6_addr_state: [3]u8_t = @import("std").mem.zeroes([3]u8_t),
    ip6_addr_valid_life: [3]u32_t = @import("std").mem.zeroes([3]u32_t),
    ip6_addr_pref_life: [3]u32_t = @import("std").mem.zeroes([3]u32_t),
    input: netif_input_fn = @import("std").mem.zeroes(netif_input_fn),
    output: netif_output_fn = @import("std").mem.zeroes(netif_output_fn),
    linkoutput: netif_linkoutput_fn = @import("std").mem.zeroes(netif_linkoutput_fn),
    output_ip6: netif_output_ip6_fn = @import("std").mem.zeroes(netif_output_ip6_fn),
    state: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    client_data: [3]?*anyopaque = @import("std").mem.zeroes([3]?*anyopaque),
    hostname: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    mtu: u16_t = @import("std").mem.zeroes(u16_t),
    mtu6: u16_t = @import("std").mem.zeroes(u16_t),
    hwaddr: [6]u8_t = @import("std").mem.zeroes([6]u8_t),
    hwaddr_len: u8_t = @import("std").mem.zeroes(u8_t),
    flags: u8_t = @import("std").mem.zeroes(u8_t),
    name: [2]u8 = @import("std").mem.zeroes([2]u8),
    num: u8_t = @import("std").mem.zeroes(u8_t),
    ip6_autoconfig_enabled: u8_t = @import("std").mem.zeroes(u8_t),
    rs_count: u8_t = @import("std").mem.zeroes(u8_t),
    igmp_mac_filter: netif_igmp_mac_filter_fn = @import("std").mem.zeroes(netif_igmp_mac_filter_fn),
    mld_mac_filter: netif_mld_mac_filter_fn = @import("std").mem.zeroes(netif_mld_mac_filter_fn),
    loop_first: [*c]struct_pbuf = @import("std").mem.zeroes([*c]struct_pbuf),
    loop_last: [*c]struct_pbuf = @import("std").mem.zeroes([*c]struct_pbuf),
    loop_cnt_current: u16_t = @import("std").mem.zeroes(u16_t),
    reschedule_poll: u8_t = @import("std").mem.zeroes(u8_t),
};
pub extern fn ip4_addr_isbroadcast_u32(addr: u32_t, netif: [*c]const struct_netif) u8_t;
pub extern fn ip4_addr_netmask_valid(netmask: u32_t) u8_t;
pub extern fn ipaddr_addr(cp: [*c]const u8) u32_t;
pub extern fn ip4addr_aton(cp: [*c]const u8, addr: [*c]ip4_addr_t) c_int;
pub extern fn ip4addr_ntoa(addr: [*c]const ip4_addr_t) [*c]u8;
pub extern fn ip4addr_ntoa_r(addr: [*c]const ip4_addr_t, buf: [*c]u8, buflen: c_int) [*c]u8;
pub const IP6_UNKNOWN: c_int = 0;
pub const IP6_UNICAST: c_int = 1;
pub const IP6_MULTICAST: c_int = 2;
pub const enum_lwip_ipv6_scope_type = c_uint;
pub extern fn ip6addr_aton(cp: [*c]const u8, addr: [*c]ip6_addr_t) c_int;
pub extern fn ip6addr_ntoa(addr: [*c]const ip6_addr_t) [*c]u8;
pub extern fn ip6addr_ntoa_r(addr: [*c]const ip6_addr_t, buf: [*c]u8, buflen: c_int) [*c]u8;
pub const IPADDR_TYPE_V4: c_int = 0;
pub const IPADDR_TYPE_V6: c_int = 6;
pub const IPADDR_TYPE_ANY: c_int = 46;
pub const enum_lwip_ip_addr_type = c_uint;
pub extern const ip_addr_any_type: ip_addr_t;
pub extern fn ipaddr_ntoa(addr: [*c]const ip_addr_t) [*c]u8;
pub extern fn ipaddr_ntoa_r(addr: [*c]const ip_addr_t, buf: [*c]u8, buflen: c_int) [*c]u8;
pub extern fn ipaddr_aton(cp: [*c]const u8, addr: [*c]ip_addr_t) c_int;
pub extern const ip_addr_any: ip_addr_t;
pub extern const ip_addr_broadcast: ip_addr_t;
pub extern const ip6_addr_any: ip_addr_t;
pub const ERR_OK: c_int = 0;
pub const ERR_MEM: c_int = -1;
pub const ERR_BUF: c_int = -2;
pub const ERR_TIMEOUT: c_int = -3;
pub const ERR_RTE: c_int = -4;
pub const ERR_INPROGRESS: c_int = -5;
pub const ERR_VAL: c_int = -6;
pub const ERR_WOULDBLOCK: c_int = -7;
pub const ERR_USE: c_int = -8;
pub const ERR_ALREADY: c_int = -9;
pub const ERR_ISCONN: c_int = -10;
pub const ERR_CONN: c_int = -11;
pub const ERR_IF: c_int = -12;
pub const ERR_ABRT: c_int = -13;
pub const ERR_RST: c_int = -14;
pub const ERR_CLSD: c_int = -15;
pub const ERR_ARG: c_int = -16;
pub const err_enum_t = c_int;
pub extern fn err_to_errno(err: err_t) c_int;
pub const PBUF_TRANSPORT: c_int = 74;
pub const PBUF_IP: c_int = 54;
pub const PBUF_LINK: c_int = 14;
pub const PBUF_RAW_TX: c_int = 0;
pub const PBUF_RAW: c_int = 0;
pub const pbuf_layer = c_uint;
pub const PBUF_RAM: c_int = 640;
pub const PBUF_ROM: c_int = 1;
pub const PBUF_REF: c_int = 65;
pub const PBUF_POOL: c_int = 386;
pub const pbuf_type = c_uint;
pub const struct_pbuf_rom = extern struct {
    next: [*c]struct_pbuf = @import("std").mem.zeroes([*c]struct_pbuf),
    payload: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const pbuf_free_custom_fn = ?*const fn ([*c]struct_pbuf) callconv(.c) void;
pub const struct_pbuf_custom = extern struct {
    pbuf: struct_pbuf = @import("std").mem.zeroes(struct_pbuf),
    custom_free_function: pbuf_free_custom_fn = @import("std").mem.zeroes(pbuf_free_custom_fn),
};
pub extern fn pbuf_alloc(l: pbuf_layer, length: u16_t, @"type": pbuf_type) [*c]struct_pbuf;
pub extern fn pbuf_alloc_reference(payload: ?*anyopaque, length: u16_t, @"type": pbuf_type) [*c]struct_pbuf;
pub extern fn pbuf_alloced_custom(l: pbuf_layer, length: u16_t, @"type": pbuf_type, p: [*c]struct_pbuf_custom, payload_mem: ?*anyopaque, payload_mem_len: u16_t) [*c]struct_pbuf;
pub extern fn pbuf_realloc(p: [*c]struct_pbuf, size: u16_t) void;
pub extern fn pbuf_header(p: [*c]struct_pbuf, header_size: s16_t) u8_t;
pub extern fn pbuf_header_force(p: [*c]struct_pbuf, header_size: s16_t) u8_t;
pub extern fn pbuf_add_header(p: [*c]struct_pbuf, header_size_increment: usize) u8_t;
pub extern fn pbuf_add_header_force(p: [*c]struct_pbuf, header_size_increment: usize) u8_t;
pub extern fn pbuf_remove_header(p: [*c]struct_pbuf, header_size: usize) u8_t;
pub extern fn pbuf_free_header(q: [*c]struct_pbuf, size: u16_t) [*c]struct_pbuf;
pub extern fn pbuf_ref(p: [*c]struct_pbuf) void;
pub extern fn pbuf_free(p: [*c]struct_pbuf) u8_t;
pub extern fn pbuf_clen(p: [*c]const struct_pbuf) u16_t;
pub extern fn pbuf_cat(head: [*c]struct_pbuf, tail: [*c]struct_pbuf) void;
pub extern fn pbuf_chain(head: [*c]struct_pbuf, tail: [*c]struct_pbuf) void;
pub extern fn pbuf_dechain(p: [*c]struct_pbuf) [*c]struct_pbuf;
pub extern fn pbuf_copy(p_to: [*c]struct_pbuf, p_from: [*c]const struct_pbuf) err_t;
pub extern fn pbuf_copy_partial_pbuf(p_to: [*c]struct_pbuf, p_from: [*c]const struct_pbuf, copy_len: u16_t, offset: u16_t) err_t;
pub extern fn pbuf_copy_partial(p: [*c]const struct_pbuf, dataptr: ?*anyopaque, len: u16_t, offset: u16_t) u16_t;
pub extern fn pbuf_get_contiguous(p: [*c]const struct_pbuf, buffer: ?*anyopaque, bufsize: usize, len: u16_t, offset: u16_t) ?*anyopaque;
pub extern fn pbuf_take(buf: [*c]struct_pbuf, dataptr: ?*const anyopaque, len: u16_t) err_t;
pub extern fn pbuf_take_at(buf: [*c]struct_pbuf, dataptr: ?*const anyopaque, len: u16_t, offset: u16_t) err_t;
pub extern fn pbuf_skip(in: [*c]struct_pbuf, in_offset: u16_t, out_offset: [*c]u16_t) [*c]struct_pbuf;
pub extern fn pbuf_coalesce(p: [*c]struct_pbuf, layer: pbuf_layer) [*c]struct_pbuf;
pub extern fn pbuf_clone(l: pbuf_layer, @"type": pbuf_type, p: [*c]struct_pbuf) [*c]struct_pbuf;
pub extern fn pbuf_get_at(p: [*c]const struct_pbuf, offset: u16_t) u8_t;
pub extern fn pbuf_try_get_at(p: [*c]const struct_pbuf, offset: u16_t) c_int;
pub extern fn pbuf_put_at(p: [*c]struct_pbuf, offset: u16_t, data: u8_t) void;
pub extern fn pbuf_memcmp(p: [*c]const struct_pbuf, offset: u16_t, s2: ?*const anyopaque, n: u16_t) u16_t;
pub extern fn pbuf_memfind(p: [*c]const struct_pbuf, mem: ?*const anyopaque, mem_len: u16_t, start_offset: u16_t) u16_t;
pub extern fn pbuf_strstr(p: [*c]const struct_pbuf, substr: [*c]const u8) u16_t;
pub const mem_size_t = usize;
pub extern fn mem_init() void;
pub extern fn mem_trim(mem: ?*anyopaque, size: mem_size_t) ?*anyopaque;
pub extern fn mem_malloc(size: mem_size_t) ?*anyopaque;
pub extern fn mem_calloc(count: mem_size_t, size: mem_size_t) ?*anyopaque;
pub extern fn mem_free(mem: ?*anyopaque) void;
pub const MEMP_RAW_PCB: c_int = 0;
pub const MEMP_UDP_PCB: c_int = 1;
pub const MEMP_TCP_PCB: c_int = 2;
pub const MEMP_TCP_PCB_LISTEN: c_int = 3;
pub const MEMP_TCP_SEG: c_int = 4;
pub const MEMP_FRAG_PBUF: c_int = 5;
pub const MEMP_NETBUF: c_int = 6;
pub const MEMP_NETCONN: c_int = 7;
pub const MEMP_TCPIP_MSG_API: c_int = 8;
pub const MEMP_TCPIP_MSG_INPKT: c_int = 9;
pub const MEMP_ARP_QUEUE: c_int = 10;
pub const MEMP_IGMP_GROUP: c_int = 11;
pub const MEMP_SYS_TIMEOUT: c_int = 12;
pub const MEMP_NETDB: c_int = 13;
pub const MEMP_ND6_QUEUE: c_int = 14;
pub const MEMP_MLD6_GROUP: c_int = 15;
pub const MEMP_PBUF: c_int = 16;
pub const MEMP_PBUF_POOL: c_int = 17;
pub const MEMP_MAX: c_int = 18;
pub const memp_t = c_uint;
pub const struct_memp_desc = extern struct {
    size: u16_t = @import("std").mem.zeroes(u16_t),
};
pub extern fn memp_init_pool(desc: [*c]const struct_memp_desc) void;
pub extern fn memp_malloc_pool(desc: [*c]const struct_memp_desc) ?*anyopaque;
pub extern fn memp_free_pool(desc: [*c]const struct_memp_desc, mem: ?*anyopaque) void;
pub extern const memp_pools: [18][*c]const struct_memp_desc;
pub extern fn memp_init() void;
pub extern fn memp_malloc(@"type": memp_t) ?*anyopaque;
pub extern fn memp_free(@"type": memp_t, mem: ?*anyopaque) void;
pub const LWIP_NETIF_CLIENT_DATA_INDEX_DHCP: c_int = 0;
pub const LWIP_NETIF_CLIENT_DATA_INDEX_IGMP: c_int = 1;
pub const LWIP_NETIF_CLIENT_DATA_INDEX_MLD6: c_int = 2;
pub const LWIP_NETIF_CLIENT_DATA_INDEX_MAX: c_int = 3;
pub const enum_lwip_internal_netif_client_data_index = c_uint;
pub const netif_init_fn = ?*const fn ([*c]struct_netif) callconv(.c) err_t;
pub const netif_status_callback_fn = ?*const fn ([*c]struct_netif) callconv(.c) void;
pub const netif_addr_idx_t = u8_t;
pub extern var netif_list: [*c]struct_netif;
pub extern var netif_default: [*c]struct_netif;
pub extern fn netif_init() void;
pub extern fn netif_add_noaddr(netif: [*c]struct_netif, state: ?*anyopaque, init: netif_init_fn, input: netif_input_fn) [*c]struct_netif;
pub extern fn netif_add(netif: [*c]struct_netif, ipaddr: [*c]const ip4_addr_t, netmask: [*c]const ip4_addr_t, gw: [*c]const ip4_addr_t, state: ?*anyopaque, init: netif_init_fn, input: netif_input_fn) [*c]struct_netif;
pub extern fn netif_set_addr(netif: [*c]struct_netif, ipaddr: [*c]const ip4_addr_t, netmask: [*c]const ip4_addr_t, gw: [*c]const ip4_addr_t) void;
pub extern fn netif_remove(netif: [*c]struct_netif) void;
pub extern fn netif_find(name: [*c]const u8) [*c]struct_netif;
pub extern fn netif_set_default(netif: [*c]struct_netif) void;
pub extern fn netif_set_ipaddr(netif: [*c]struct_netif, ipaddr: [*c]const ip4_addr_t) void;
pub extern fn netif_set_netmask(netif: [*c]struct_netif, netmask: [*c]const ip4_addr_t) void;
pub extern fn netif_set_gw(netif: [*c]struct_netif, gw: [*c]const ip4_addr_t) void;
pub extern fn netif_set_up(netif: [*c]struct_netif) void;
pub extern fn netif_set_down(netif: [*c]struct_netif) void;
pub extern fn netif_set_link_up(netif: [*c]struct_netif) void;
pub extern fn netif_set_link_down(netif: [*c]struct_netif) void;
pub extern fn netif_loop_output(netif: [*c]struct_netif, p: [*c]struct_pbuf) err_t;
pub extern fn netif_poll(netif: [*c]struct_netif) void;
pub extern fn netif_input(p: [*c]struct_pbuf, inp: [*c]struct_netif) err_t;
pub extern fn netif_ip6_addr_set(netif: [*c]struct_netif, addr_idx: s8_t, addr6: [*c]const ip6_addr_t) void;
pub extern fn netif_ip6_addr_set_parts(netif: [*c]struct_netif, addr_idx: s8_t, @"i0": u32_t, @"i1": u32_t, @"i2": u32_t, @"i3": u32_t) void;
pub extern fn netif_ip6_addr_set_state(netif: [*c]struct_netif, addr_idx: s8_t, state: u8_t) void;
pub extern fn netif_get_ip6_addr_match(netif: [*c]struct_netif, ip6addr: [*c]const ip6_addr_t) s8_t;
pub extern fn netif_create_ip6_linklocal_address(netif: [*c]struct_netif, from_mac_48bit: u8_t) void;
pub extern fn netif_add_ip6_address(netif: [*c]struct_netif, ip6addr: [*c]const ip6_addr_t, chosen_idx: [*c]s8_t) err_t;
pub extern fn netif_name_to_index(name: [*c]const u8) u8_t;
pub extern fn netif_index_to_name(idx: u8_t, name: [*c]u8) [*c]u8;
pub extern fn netif_get_by_index(idx: u8_t) [*c]struct_netif;
pub const netif_nsc_reason_t = u16_t;
pub const struct_link_changed_s_7 = extern struct {
    state: u8_t = @import("std").mem.zeroes(u8_t),
};
pub const struct_status_changed_s_8 = extern struct {
    state: u8_t = @import("std").mem.zeroes(u8_t),
};
pub const struct_ipv4_changed_s_9 = extern struct {
    old_address: [*c]const ip_addr_t = @import("std").mem.zeroes([*c]const ip_addr_t),
    old_netmask: [*c]const ip_addr_t = @import("std").mem.zeroes([*c]const ip_addr_t),
    old_gw: [*c]const ip_addr_t = @import("std").mem.zeroes([*c]const ip_addr_t),
};
pub const struct_ipv6_set_s_10 = extern struct {
    addr_index: s8_t = @import("std").mem.zeroes(s8_t),
    old_address: [*c]const ip_addr_t = @import("std").mem.zeroes([*c]const ip_addr_t),
};
pub const struct_ipv6_addr_state_changed_s_11 = extern struct {
    addr_index: s8_t = @import("std").mem.zeroes(s8_t),
    old_state: u8_t = @import("std").mem.zeroes(u8_t),
    address: [*c]const ip_addr_t = @import("std").mem.zeroes([*c]const ip_addr_t),
};
pub const netif_ext_callback_args_t = extern union {
    link_changed: struct_link_changed_s_7,
    status_changed: struct_status_changed_s_8,
    ipv4_changed: struct_ipv4_changed_s_9,
    ipv6_set: struct_ipv6_set_s_10,
    ipv6_addr_state_changed: struct_ipv6_addr_state_changed_s_11,
};
pub const netif_ext_callback_fn = ?*const fn ([*c]struct_netif, netif_nsc_reason_t, [*c]const netif_ext_callback_args_t) callconv(.c) void;
pub const struct_netif_ext_callback = extern struct {
    callback_fn: netif_ext_callback_fn = @import("std").mem.zeroes(netif_ext_callback_fn),
    next: [*c]struct_netif_ext_callback = @import("std").mem.zeroes([*c]struct_netif_ext_callback),
};
pub const netif_ext_callback_t = struct_netif_ext_callback;
pub extern fn netif_add_ext_callback(callback: [*c]netif_ext_callback_t, @"fn": netif_ext_callback_fn) void;
pub extern fn netif_remove_ext_callback(callback: [*c]netif_ext_callback_t) void;
pub extern fn netif_invoke_ext_callback(netif: [*c]struct_netif, reason: netif_nsc_reason_t, args: [*c]const netif_ext_callback_args_t) void;
pub const struct_in_addr = extern struct {
    s_addr: in_addr_t = @import("std").mem.zeroes(in_addr_t),
};
const union_unnamed_12 = extern union {
    u32_addr: [4]u32_t,
    u8_addr: [16]u8_t,
};
pub const struct_in6_addr = extern struct {
    un: union_unnamed_12 = @import("std").mem.zeroes(union_unnamed_12),
};
pub extern const in6addr_any: struct_in6_addr;
pub const sa_family_t = u8_t;
pub const struct_sockaddr_in = extern struct {
    sin_len: u8_t = @import("std").mem.zeroes(u8_t),
    sin_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    sin_zero: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct_sockaddr_in6 = extern struct {
    sin6_len: u8_t = @import("std").mem.zeroes(u8_t),
    sin6_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin6_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin6_flowinfo: u32_t = @import("std").mem.zeroes(u32_t),
    sin6_addr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    sin6_scope_id: u32_t = @import("std").mem.zeroes(u32_t),
};
pub const struct_sockaddr = extern struct {
    sa_len: u8_t = @import("std").mem.zeroes(u8_t),
    sa_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const struct_sockaddr_storage = extern struct {
    s2_len: u8_t = @import("std").mem.zeroes(u8_t),
    ss_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    s2_data1: [2]u8 = @import("std").mem.zeroes([2]u8),
    s2_data2: [3]u32_t = @import("std").mem.zeroes([3]u32_t),
    s2_data3: [3]u32_t = @import("std").mem.zeroes([3]u32_t),
};
pub const socklen_t = u32_t;
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    iov_len: usize = @import("std").mem.zeroes(usize),
};
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_namelen: socklen_t = @import("std").mem.zeroes(socklen_t),
    msg_iov: [*c]struct_iovec = @import("std").mem.zeroes([*c]struct_iovec),
    msg_iovlen: c_int = @import("std").mem.zeroes(c_int),
    msg_control: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_controllen: socklen_t = @import("std").mem.zeroes(socklen_t),
    msg_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: socklen_t = @import("std").mem.zeroes(socklen_t),
    cmsg_level: c_int = @import("std").mem.zeroes(c_int),
    cmsg_type: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_ifreq = extern struct {
    ifr_name: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const struct_linger = extern struct {
    l_onoff: c_int = @import("std").mem.zeroes(c_int),
    l_linger: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_ip_mreq = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const ip_mreq = struct_ip_mreq;
pub const struct_in_pktinfo = extern struct {
    ipi_ifindex: c_uint = @import("std").mem.zeroes(c_uint),
    ipi_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_ipv6_mreq = extern struct {
    ipv6mr_multiaddr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    ipv6mr_interface: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const ipv6_mreq = struct_ipv6_mreq;
pub extern fn lwip_socket_thread_init() void;
pub extern fn lwip_socket_thread_cleanup() void;
pub extern fn lwip_accept(s: c_int, addr: [*c]struct_sockaddr, addrlen: [*c]socklen_t) c_int;
pub extern fn lwip_bind(s: c_int, name: [*c]const struct_sockaddr, namelen: socklen_t) c_int;
pub extern fn lwip_shutdown(s: c_int, how: c_int) c_int;
pub extern fn lwip_getpeername(s: c_int, name: [*c]struct_sockaddr, namelen: [*c]socklen_t) c_int;
pub extern fn lwip_getsockname(s: c_int, name: [*c]struct_sockaddr, namelen: [*c]socklen_t) c_int;
pub extern fn lwip_getsockopt(s: c_int, level: c_int, optname: c_int, optval: ?*anyopaque, optlen: [*c]socklen_t) c_int;
pub extern fn lwip_setsockopt(s: c_int, level: c_int, optname: c_int, optval: ?*const anyopaque, optlen: socklen_t) c_int;
pub extern fn lwip_close(s: c_int) c_int;
pub extern fn lwip_connect(s: c_int, name: [*c]const struct_sockaddr, namelen: socklen_t) c_int;
pub extern fn lwip_listen(s: c_int, backlog: c_int) c_int;
pub extern fn lwip_recv(s: c_int, mem: ?*anyopaque, len: usize, flags: c_int) isize;
pub extern fn lwip_read(s: c_int, mem: ?*anyopaque, len: usize) isize;
pub extern fn lwip_readv(s: c_int, iov: [*c]const struct_iovec, iovcnt: c_int) isize;
pub extern fn lwip_recvfrom(s: c_int, mem: ?*anyopaque, len: usize, flags: c_int, from: [*c]struct_sockaddr, fromlen: [*c]socklen_t) isize;
pub extern fn lwip_recvmsg(s: c_int, message: [*c]struct_msghdr, flags: c_int) isize;
pub extern fn lwip_send(s: c_int, dataptr: ?*const anyopaque, size: usize, flags: c_int) isize;
pub extern fn lwip_sendmsg(s: c_int, message: [*c]const struct_msghdr, flags: c_int) isize;
pub extern fn lwip_sendto(s: c_int, dataptr: ?*const anyopaque, size: usize, flags: c_int, to: [*c]const struct_sockaddr, tolen: socklen_t) isize;
pub extern fn lwip_socket(domain: c_int, @"type": c_int, protocol: c_int) c_int;
pub extern fn lwip_write(s: c_int, dataptr: ?*const anyopaque, size: usize) isize;
pub extern fn lwip_writev(s: c_int, iov: [*c]const struct_iovec, iovcnt: c_int) isize;
pub extern fn lwip_select(maxfdp1: c_int, readset: [*c]fd_set, writeset: [*c]fd_set, exceptset: [*c]fd_set, timeout: [*c]struct_timeval) c_int;
pub extern fn lwip_poll(fds: [*c]struct_pollfd, nfds: nfds_t, timeout: c_int) c_int;
pub extern fn lwip_ioctl(s: c_int, cmd: c_long, argp: ?*anyopaque) c_int;
pub extern fn lwip_fcntl(s: c_int, cmd: c_int, val: c_int) c_int;
pub extern fn lwip_inet_ntop(af: c_int, src: ?*const anyopaque, dst: [*c]u8, size: socklen_t) [*c]const u8;
pub extern fn lwip_inet_pton(af: c_int, src: [*c]const u8, dst: ?*anyopaque) c_int;
pub fn accept(arg_s: c_int, arg_addr: [*c]struct_sockaddr, arg_addrlen: [*c]socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var addr = arg_addr;
    _ = &addr;
    var addrlen = arg_addrlen;
    _ = &addrlen;
    return lwip_accept(s, addr, addrlen);
}
pub fn bind(arg_s: c_int, arg_name: [*c]const struct_sockaddr, arg_namelen: socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var name = arg_name;
    _ = &name;
    var namelen = arg_namelen;
    _ = &namelen;
    return lwip_bind(s, name, namelen);
}
pub fn shutdown(arg_s: c_int, arg_how: c_int) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var how = arg_how;
    _ = &how;
    return lwip_shutdown(s, how);
}
pub fn getpeername(arg_s: c_int, arg_name: [*c]struct_sockaddr, arg_namelen: [*c]socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var name = arg_name;
    _ = &name;
    var namelen = arg_namelen;
    _ = &namelen;
    return lwip_getpeername(s, name, namelen);
}
pub fn getsockname(arg_s: c_int, arg_name: [*c]struct_sockaddr, arg_namelen: [*c]socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var name = arg_name;
    _ = &name;
    var namelen = arg_namelen;
    _ = &namelen;
    return lwip_getsockname(s, name, namelen);
}
pub fn setsockopt(arg_s: c_int, arg_level: c_int, arg_optname: c_int, arg_opval: ?*const anyopaque, arg_optlen: socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var level = arg_level;
    _ = &level;
    var optname = arg_optname;
    _ = &optname;
    var opval = arg_opval;
    _ = &opval;
    var optlen = arg_optlen;
    _ = &optlen;
    return lwip_setsockopt(s, level, optname, opval, optlen);
}
pub fn getsockopt(arg_s: c_int, arg_level: c_int, arg_optname: c_int, arg_opval: ?*anyopaque, arg_optlen: [*c]socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var level = arg_level;
    _ = &level;
    var optname = arg_optname;
    _ = &optname;
    var opval = arg_opval;
    _ = &opval;
    var optlen = arg_optlen;
    _ = &optlen;
    return lwip_getsockopt(s, level, optname, opval, optlen);
}
pub fn closesocket(arg_s: c_int) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    return lwip_close(s);
}
pub fn connect(arg_s: c_int, arg_name: [*c]const struct_sockaddr, arg_namelen: socklen_t) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var name = arg_name;
    _ = &name;
    var namelen = arg_namelen;
    _ = &namelen;
    return lwip_connect(s, name, namelen);
}
pub fn listen(arg_s: c_int, arg_backlog: c_int) callconv(.c) c_int {
    var s = arg_s;
    _ = &s;
    var backlog = arg_backlog;
    _ = &backlog;
    return lwip_listen(s, backlog);
}
pub fn recvmsg(arg_sockfd: c_int, arg_msg: [*c]struct_msghdr, arg_flags: c_int) callconv(.c) isize {
    var sockfd = arg_sockfd;
    _ = &sockfd;
    var msg = arg_msg;
    _ = &msg;
    var flags = arg_flags;
    _ = &flags;
    return lwip_recvmsg(sockfd, msg, flags);
}
pub fn recv(arg_s: c_int, arg_mem: ?*anyopaque, arg_len: usize, arg_flags: c_int) callconv(.c) isize {
    var s = arg_s;
    _ = &s;
    var mem = arg_mem;
    _ = &mem;
    var len = arg_len;
    _ = &len;
    var flags = arg_flags;
    _ = &flags;
    return lwip_recv(s, mem, len, flags);
}
pub fn recvfrom(arg_s: c_int, arg_mem: ?*anyopaque, arg_len: usize, arg_flags: c_int, arg_from: [*c]struct_sockaddr, arg_fromlen: [*c]socklen_t) callconv(.c) isize {
    var s = arg_s;
    _ = &s;
    var mem = arg_mem;
    _ = &mem;
    var len = arg_len;
    _ = &len;
    var flags = arg_flags;
    _ = &flags;
    var from = arg_from;
    _ = &from;
    var fromlen = arg_fromlen;
    _ = &fromlen;
    return lwip_recvfrom(s, mem, len, flags, from, fromlen);
}
pub fn send(arg_s: c_int, arg_dataptr: ?*const anyopaque, arg_size: usize, arg_flags: c_int) callconv(.c) isize {
    var s = arg_s;
    _ = &s;
    var dataptr = arg_dataptr;
    _ = &dataptr;
    var size = arg_size;
    _ = &size;
    var flags = arg_flags;
    _ = &flags;
    return lwip_send(s, dataptr, size, flags);
}
pub fn sendmsg(arg_s: c_int, arg_message: [*c]const struct_msghdr, arg_flags: c_int) callconv(.c) isize {
    var s = arg_s;
    _ = &s;
    var message = arg_message;
    _ = &message;
    var flags = arg_flags;
    _ = &flags;
    return lwip_sendmsg(s, message, flags);
}
pub fn sendto(arg_s: c_int, arg_dataptr: ?*const anyopaque, arg_size: usize, arg_flags: c_int, arg_to: [*c]const struct_sockaddr, arg_tolen: socklen_t) callconv(.c) isize {
    var s = arg_s;
    _ = &s;
    var dataptr = arg_dataptr;
    _ = &dataptr;
    var size = arg_size;
    _ = &size;
    var flags = arg_flags;
    _ = &flags;
    var to = arg_to;
    _ = &to;
    var tolen = arg_tolen;
    _ = &tolen;
    return lwip_sendto(s, dataptr, size, flags, to, tolen);
}
pub fn socket(arg_domain: c_int, arg_type: c_int, arg_protocol: c_int) callconv(.c) c_int {
    var domain = arg_domain;
    _ = &domain;
    var @"type" = arg_type;
    _ = &@"type";
    var protocol = arg_protocol;
    _ = &protocol;
    return lwip_socket(domain, @"type", protocol);
}
pub fn inet_ntop(arg_af: c_int, arg_src: ?*const anyopaque, arg_dst: [*c]u8, arg_size: socklen_t) callconv(.c) [*c]const u8 {
    var af = arg_af;
    _ = &af;
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var size = arg_size;
    _ = &size;
    return lwip_inet_ntop(af, src, dst, size);
}
pub fn inet_pton(arg_af: c_int, arg_src: [*c]const u8, arg_dst: ?*anyopaque) callconv(.c) c_int {
    var af = arg_af;
    _ = &af;
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    return lwip_inet_pton(af, src, dst);
}
pub const struct_hostent = extern struct {
    h_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    h_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    h_addrtype: c_int = @import("std").mem.zeroes(c_int),
    h_length: c_int = @import("std").mem.zeroes(c_int),
    h_addr_list: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
};
pub const struct_addrinfo = extern struct {
    ai_flags: c_int = @import("std").mem.zeroes(c_int),
    ai_family: c_int = @import("std").mem.zeroes(c_int),
    ai_socktype: c_int = @import("std").mem.zeroes(c_int),
    ai_protocol: c_int = @import("std").mem.zeroes(c_int),
    ai_addrlen: socklen_t = @import("std").mem.zeroes(socklen_t),
    ai_addr: [*c]struct_sockaddr = @import("std").mem.zeroes([*c]struct_sockaddr),
    ai_canonname: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    ai_next: [*c]struct_addrinfo = @import("std").mem.zeroes([*c]struct_addrinfo),
};
pub extern var h_errno: c_int;
pub extern fn lwip_gethostbyname(name: [*c]const u8) [*c]struct_hostent;
pub extern fn lwip_gethostbyname_r(name: [*c]const u8, ret: [*c]struct_hostent, buf: [*c]u8, buflen: usize, result: [*c][*c]struct_hostent, h_errnop: [*c]c_int) c_int;
pub extern fn lwip_freeaddrinfo(ai: [*c]struct_addrinfo) void;
pub extern fn lwip_getaddrinfo(nodename: [*c]const u8, servname: [*c]const u8, hints: [*c]const struct_addrinfo, res: [*c][*c]struct_addrinfo) c_int;
pub fn gethostbyname_r(arg_name: [*c]const u8, arg_ret: [*c]struct_hostent, arg_buf: [*c]u8, arg_buflen: usize, arg_result: [*c][*c]struct_hostent, arg_h_errnop: [*c]c_int) callconv(.c) c_int {
    var name = arg_name;
    _ = &name;
    var ret = arg_ret;
    _ = &ret;
    var buf = arg_buf;
    _ = &buf;
    var buflen = arg_buflen;
    _ = &buflen;
    var result = arg_result;
    _ = &result;
    var h_errnop = arg_h_errnop;
    _ = &h_errnop;
    return lwip_gethostbyname_r(name, ret, buf, buflen, result, h_errnop);
}
pub fn gethostbyname(arg_name: [*c]const u8) callconv(.c) [*c]struct_hostent {
    var name = arg_name;
    _ = &name;
    return lwip_gethostbyname(name);
}
pub fn freeaddrinfo(arg_ai: [*c]struct_addrinfo) callconv(.c) void {
    var ai = arg_ai;
    _ = &ai;
    lwip_freeaddrinfo(ai);
}
pub fn getaddrinfo(arg_nodename: [*c]const u8, arg_servname: [*c]const u8, arg_hints: [*c]const struct_addrinfo, arg_res: [*c][*c]struct_addrinfo) callconv(.c) c_int {
    var nodename = arg_nodename;
    _ = &nodename;
    var servname = arg_servname;
    _ = &servname;
    var hints = arg_hints;
    _ = &hints;
    var res = arg_res;
    _ = &res;
    return lwip_getaddrinfo(nodename, servname, hints, res);
}
pub const lwip_thread_fn = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn sys_mutex_new(mutex: [*c]sys_mutex_t) err_t;
pub extern fn sys_mutex_lock(mutex: [*c]sys_mutex_t) void;
pub extern fn sys_mutex_unlock(mutex: [*c]sys_mutex_t) void;
pub extern fn sys_mutex_free(mutex: [*c]sys_mutex_t) void;
pub extern fn sys_sem_new(sem: [*c]sys_sem_t, count: u8_t) err_t;
pub extern fn sys_sem_signal(sem: [*c]sys_sem_t) void;
pub extern fn sys_arch_sem_wait(sem: [*c]sys_sem_t, timeout: u32_t) u32_t;
pub extern fn sys_sem_free(sem: [*c]sys_sem_t) void;
pub extern fn sys_mbox_new(mbox: [*c]sys_mbox_t, size: c_int) err_t;
pub extern fn sys_mbox_post(mbox: [*c]sys_mbox_t, msg: ?*anyopaque) void;
pub extern fn sys_mbox_trypost(mbox: [*c]sys_mbox_t, msg: ?*anyopaque) err_t;
pub extern fn sys_mbox_trypost_fromisr(mbox: [*c]sys_mbox_t, msg: ?*anyopaque) err_t;
pub extern fn sys_arch_mbox_fetch(mbox: [*c]sys_mbox_t, msg: [*c]?*anyopaque, timeout: u32_t) u32_t;
pub extern fn sys_arch_mbox_tryfetch(mbox: [*c]sys_mbox_t, msg: [*c]?*anyopaque) u32_t;
pub extern fn sys_mbox_free(mbox: [*c]sys_mbox_t) void;
pub extern fn sys_thread_new(name: [*c]const u8, thread: lwip_thread_fn, arg: ?*anyopaque, stacksize: c_int, prio: c_int) sys_thread_t;
pub extern fn sys_init() void;
pub extern fn sys_jiffies() u32_t;
pub extern fn sys_now() u32_t;
pub extern fn sys_arch_protect() sys_prot_t;
pub extern fn sys_arch_unprotect(pval: sys_prot_t) void;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 19);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 7);
pub const __clang_version__ = "19.1.7 (git@github.com:kassane/zig-espressif-bootstrap.git da1eb5f0196da1d670e5e60cfba4840483f868fa)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 19.1.7 (git@github.com:kassane/zig-espressif-bootstrap.git da1eb5f0196da1d670e5e60cfba4840483f868fa)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _ILP32 = @as(c_int, 1);
pub const __ILP32__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @as(c_int, 128);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 32);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 32);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 32);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 32);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 4);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 4);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 4);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_FMTd__ = "lld";
pub const __INTMAX_FMTi__ = "lli";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):94:9
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_FMTo__ = "llo";
pub const __UINTMAX_FMTu__ = "llu";
pub const __UINTMAX_FMTx__ = "llx";
pub const __UINTMAX_FMTX__ = "llX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):100:9
pub const __PTRDIFF_TYPE__ = c_int;
pub const __PTRDIFF_FMTd__ = "d";
pub const __PTRDIFF_FMTi__ = "i";
pub const __INTPTR_TYPE__ = c_int;
pub const __INTPTR_FMTd__ = "d";
pub const __INTPTR_FMTi__ = "i";
pub const __SIZE_TYPE__ = c_uint;
pub const __SIZE_FMTo__ = "o";
pub const __SIZE_FMTu__ = "u";
pub const __SIZE_FMTx__ = "x";
pub const __SIZE_FMTX__ = "X";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_uint;
pub const __UINTPTR_FMTo__ = "o";
pub const __UINTPTR_FMTu__ = "u";
pub const __UINTPTR_FMTx__ = "x";
pub const __UINTPTR_FMTX__ = "X";
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 4.9406564584124654e-324);
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.7976931348623157e+308);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 15);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 2.2204460492503131e-16);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 53);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __LDBL_MAX_EXP__ = @as(c_int, 1024);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.7976931348623157e+308);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __LDBL_MIN__ = @as(c_longdouble, 2.2250738585072014e-308);
pub const __POINTER_WIDTH__ = @as(c_int, 32);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 4);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):186:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):208:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):216:9
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __xtensa__ = @as(c_int, 1);
pub const __XTENSA__ = @as(c_int, 1);
pub const __XTENSA_EL__ = @as(c_int, 1);
pub const __XTENSA_CALL0_ABI__ = @as(c_int, 1);
pub const __XTENSA_SOFT_FLOAT__ = @as(c_int, 1);
pub const __XCHAL_HAVE_BE = @as(c_int, 0);
pub const __XCHAL_HAVE_DENSITY = @as(c_int, 0);
pub const __XCHAL_HAVE_MAC16 = @as(c_int, 0);
pub const __XCHAL_HAVE_MUL32 = @as(c_int, 0);
pub const __XCHAL_HAVE_MUL32_HIGH = @as(c_int, 0);
pub const __XCHAL_HAVE_DIV32 = @as(c_int, 0);
pub const __XCHAL_HAVE_NSA = @as(c_int, 0);
pub const __XCHAL_HAVE_MINMAX = @as(c_int, 0);
pub const __XCHAL_HAVE_SEXT = @as(c_int, 0);
pub const __XCHAL_HAVE_LOOPS = @as(c_int, 0);
pub const __XCHAL_HAVE_THREADPTR = @as(c_int, 0);
pub const __XCHAL_HAVE_S32C1I = @as(c_int, 0);
pub const __XCHAL_HAVE_BOOLEANS = @as(c_int, 0);
pub const __XCHAL_HAVE_FP = @as(c_int, 0);
pub const __XCHAL_HAVE_DFP_ACCEL = @as(c_int, 0);
pub const __XCHAL_HAVE_WINDOWED = @as(c_int, 0);
pub const __XCHAL_HAVE_DEBUG = @as(c_int, 0);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 0);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const _DEBUG = @as(c_int, 1);
pub const __xtensa = "";
pub const __COUNTER__ = @as(c_int, 0);
pub const CONFIG_IDF_TARGET_ESP32S3 = @as(c_int, 1);
pub const XCHAL_NUM_AREGS = @as(c_int, 64);
pub const XCHAL_HAVE_s32c1I = @as(c_int, 1);
pub const LOG_LOCAL_LEVEL = ESP_LOG_VERBOSE;
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const BINDINGS_H = "";
pub const _STDLIB_H_ = "";
pub const __IEEE_LITTLE_ENDIAN = "";
pub const __OBSOLETE_MATH_DEFAULT = @as(c_int, 1);
pub const __OBSOLETE_MATH = __OBSOLETE_MATH_DEFAULT;
pub const _ANSIDECL_H_ = "";
pub const __NEWLIB_H__ = @as(c_int, 1);
pub const _NEWLIB_VERSION_H__ = @as(c_int, 1);
pub const _NEWLIB_VERSION = "4.3.0";
pub const __NEWLIB__ = @as(c_int, 4);
pub const __NEWLIB_MINOR__ = @as(c_int, 3);
pub const __NEWLIB_PATCHLEVEL__ = @as(c_int, 0);
pub const _ATEXIT_DYNAMIC_ALLOC = @as(c_int, 1);
pub const _FSEEK_OPTIMIZATION = @as(c_int, 1);
pub const _FVWRITE_IN_STREAMIO = @as(c_int, 1);
pub const _HAVE_CC_INHIBIT_LOOP_TO_LIBCALL = @as(c_int, 1);
pub const _HAVE_INITFINI_ARRAY = @as(c_int, 1);
pub const _HAVE_LONG_DOUBLE = @as(c_int, 1);
pub const _ICONV_ENABLED = @as(c_int, 1);
pub const _LDBL_EQ_DBL = @as(c_int, 1);
pub const _MB_LEN_MAX = @as(c_int, 1);
pub const _NANO_MALLOC = @as(c_int, 1);
pub const _REENT_CHECK_VERIFY = @as(c_int, 1);
pub const _RETARGETABLE_LOCKING = @as(c_int, 1);
pub const _UNBUF_STREAM_OPT = @as(c_int, 1);
pub const _WANT_IO_C99_FORMATS = @as(c_int, 1);
pub const _WANT_IO_LONG_LONG = @as(c_int, 1);
pub const _WANT_IO_POS_ARGS = @as(c_int, 1);
pub const _WANT_REENT_BACKWARD_BINARY_COMPAT = @as(c_int, 1);
pub const _WANT_REENT_SMALL = @as(c_int, 1);
pub const _WANT_USE_GDTOA = @as(c_int, 1);
pub const __SYS_CONFIG_H__ = "";
pub const _SYS_FEATURES_H = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __GNUC_PREREQ__(ma: anytype, mi: anytype) @TypeOf(__GNUC_PREREQ(ma, mi)) {
    _ = &ma;
    _ = &mi;
    return __GNUC_PREREQ(ma, mi);
}
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __ATFILE_VISIBLE = @as(c_int, 1);
pub const __BSD_VISIBLE = @as(c_int, 1);
pub const __GNU_VISIBLE = @as(c_int, 0);
pub const __ISO_C_VISIBLE = @as(c_int, 2011);
pub const __LARGEFILE_VISIBLE = @as(c_int, 0);
pub const __MISC_VISIBLE = @as(c_int, 1);
pub const __POSIX_VISIBLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 200809, .decimal);
pub const __SVID_VISIBLE = @as(c_int, 1);
pub const __XSI_VISIBLE = @as(c_int, 0);
pub const __SSP_FORTIFY_LEVEL = @as(c_int, 0);
pub const _POSIX_THREADS = @as(c_int, 1);
pub const _POSIX_TIMEOUTS = @as(c_int, 1);
pub const _POSIX_TIMERS = @as(c_int, 1);
pub const _POSIX_MONOTONIC_CLOCK = @as(c_long, 200112);
pub const _POSIX_CLOCK_SELECTION = @as(c_long, 200112);
pub const _UNIX98_THREAD_MUTEX_ATTRIBUTES = @as(c_int, 1);
pub const __BUFSIZ__ = @as(c_int, 128);
pub const __DYNAMIC_REENT__ = "";
pub const _REENT_SMALL = "";
pub const _POINTER_INT = c_long;
pub const __RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex);
pub const __EXPORT = "";
pub const __IMPORT = "";
pub const _READ_WRITE_RETURN_TYPE = c_int;
pub const _READ_WRITE_BUFSIZE_TYPE = c_int;
pub const _USE_GDTOA = "";
pub const _REENT_BACKWARD_BINARY_COMPAT = "";
pub const _BEGIN_STD_C = "";
pub const _END_STD_C = "";
pub const _NOTHROW = "";
pub const _LONG_DOUBLE = @compileError("unable to translate: TODO long double");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/_ansi.h:37:9
pub const _ATTRIBUTE = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/_ansi.h:43:9
pub const _ELIDABLE_INLINE = @compileError("unable to translate C expr: unexpected token 'static'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/_ansi.h:69:9
pub const _NOINLINE = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/_ansi.h:73:9
pub const _NOINLINE_STATIC = @compileError("unable to translate C expr: unexpected token 'static'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/_ansi.h:74:9
pub const __need_size_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const _SIZE_T = "";
pub const _WCHAR_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _SYS_REENT_H_ = "";
pub const __need_ptrdiff_t = "";
pub const __need_max_align_t = "";
pub const __need_offsetof = "";
pub const __STDDEF_H = "";
pub const _PTRDIFF_T = "";
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /home/wiiggee1/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/lib/include/__stddef_offsetof.h:16:9
pub const _SYS__TYPES_H = "";
pub const __need_wint_t = "";
pub const _WINT_T = "";
pub const _MACHINE__TYPES_H = "";
pub const _MACHINE__DEFAULT_TYPES_H = "";
pub const __EXP = @compileError("unable to translate macro: undefined identifier `__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/machine/_default_types.h:15:9
pub const __have_longlong64 = @as(c_int, 1);
pub const __have_long32 = @as(c_int, 1);
pub const ___int8_t_defined = @as(c_int, 1);
pub const ___int16_t_defined = @as(c_int, 1);
pub const ___int32_t_defined = @as(c_int, 1);
pub const ___int64_t_defined = @as(c_int, 1);
pub const ___int_least8_t_defined = @as(c_int, 1);
pub const ___int_least16_t_defined = @as(c_int, 1);
pub const ___int_least32_t_defined = @as(c_int, 1);
pub const ___int_least64_t_defined = @as(c_int, 1);
pub const unsigned = c_int;
pub const _CLOCK_T_ = c_ulong;
pub const _TIME_T_ = __int_least64_t;
pub const _CLOCKID_T_ = c_ulong;
pub const _TIMER_T_ = c_ulong;
pub const _NULL = @as(c_int, 0);
pub const __Long = c_long;
pub const __SYS_LOCK_H__ = "";
pub const _LOCK_RECURSIVE_T = _LOCK_T;
pub const __LOCK_INIT = @compileError("unable to translate macro: undefined identifier `__lock_`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/lock.h:37:9
pub inline fn __LOCK_INIT_RECURSIVE(class: anytype, lock: anytype) @TypeOf(__LOCK_INIT(class, lock)) {
    _ = &class;
    _ = &lock;
    return __LOCK_INIT(class, lock);
}
pub inline fn __lock_init(lock: anytype) @TypeOf(__retarget_lock_init(&lock)) {
    _ = &lock;
    return __retarget_lock_init(&lock);
}
pub inline fn __lock_init_recursive(lock: anytype) @TypeOf(__retarget_lock_init_recursive(&lock)) {
    _ = &lock;
    return __retarget_lock_init_recursive(&lock);
}
pub inline fn __lock_close(lock: anytype) @TypeOf(__retarget_lock_close(lock)) {
    _ = &lock;
    return __retarget_lock_close(lock);
}
pub inline fn __lock_close_recursive(lock: anytype) @TypeOf(__retarget_lock_close_recursive(lock)) {
    _ = &lock;
    return __retarget_lock_close_recursive(lock);
}
pub inline fn __lock_acquire(lock: anytype) @TypeOf(__retarget_lock_acquire(lock)) {
    _ = &lock;
    return __retarget_lock_acquire(lock);
}
pub inline fn __lock_acquire_recursive(lock: anytype) @TypeOf(__retarget_lock_acquire_recursive(lock)) {
    _ = &lock;
    return __retarget_lock_acquire_recursive(lock);
}
pub inline fn __lock_try_acquire(lock: anytype) @TypeOf(__retarget_lock_try_acquire(lock)) {
    _ = &lock;
    return __retarget_lock_try_acquire(lock);
}
pub inline fn __lock_try_acquire_recursive(lock: anytype) @TypeOf(__retarget_lock_try_acquire_recursive(lock)) {
    _ = &lock;
    return __retarget_lock_try_acquire_recursive(lock);
}
pub inline fn __lock_release(lock: anytype) @TypeOf(__retarget_lock_release(lock)) {
    _ = &lock;
    return __retarget_lock_release(lock);
}
pub inline fn __lock_release_recursive(lock: anytype) @TypeOf(__retarget_lock_release_recursive(lock)) {
    _ = &lock;
    return __retarget_lock_release_recursive(lock);
}
pub const _ATEXIT_SIZE = @as(c_int, 32);
pub const _ATEXIT_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:96:10
pub const _REENT_SMALL_CHECK_INIT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:145:9
pub const _RAND48_SEED_0 = @as(c_int, 0x330e);
pub const _RAND48_SEED_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xabcd, .hex);
pub const _RAND48_SEED_2 = @as(c_int, 0x1234);
pub const _RAND48_MULT_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe66d, .hex);
pub const _RAND48_MULT_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xdeec, .hex);
pub const _RAND48_MULT_2 = @as(c_int, 0x0005);
pub const _RAND48_ADD = @as(c_int, 0x000b);
pub const _REENT_EMERGENCY_SIZE = @as(c_int, 25);
pub const _REENT_ASCTIME_SIZE = @as(c_int, 26);
pub const _REENT_SIGNAL_SIZE = @as(c_int, 24);
pub const _REENT_INIT_RESERVED_0 = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:323:9
pub const _REENT_INIT_RESERVED_1 = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:324:9
pub const _REENT_INIT_RESERVED_2 = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:325:9
pub const _REENT_INIT_RESERVED_6_7 = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:326:9
pub const _REENT_INIT_RESERVED_8 = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:327:9
pub const _REENT_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:424:10
pub const _REENT_INIT_PTR_ZEROED = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:450:9
pub const assert = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/assert.h:16:10
pub const __ASSERT_FUNC = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/assert.h:26:12
pub const static_assert = @compileError("unable to translate C expr: unexpected token '_Static_assert'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/assert.h:45:10
pub const __reent_assert = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:459:9
pub const _REENT_CHECK = @compileError("unable to translate macro: undefined identifier `_r`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:469:9
pub const _REENT_CHECK_TM = @compileError("unable to translate macro: undefined identifier `_localtime_buf`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:478:9
pub const _REENT_CHECK_ASCTIME_BUF = @compileError("unable to translate macro: undefined identifier `_asctime_buf`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:482:9
pub const _REENT_INIT_RAND48 = @compileError("unable to translate macro: undefined identifier `_r`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:487:9
pub const _REENT_CHECK_RAND48 = @compileError("unable to translate macro: undefined identifier `_r48`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:498:9
pub const _REENT_INIT_MP = @compileError("unable to translate macro: undefined identifier `_r`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:501:9
pub const _REENT_CHECK_MP = @compileError("unable to translate macro: undefined identifier `_mp`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:507:9
pub const _REENT_CHECK_EMERGENCY = @compileError("unable to translate macro: undefined identifier `_emergency`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:510:9
pub const _REENT_INIT_MISC = @compileError("unable to translate macro: undefined identifier `_r`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:513:9
pub const _REENT_CHECK_MISC = @compileError("unable to translate macro: undefined identifier `_misc`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:535:9
pub const _REENT_CHECK_SIGNAL_BUF = @compileError("unable to translate macro: undefined identifier `_signal_buf`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:538:9
pub inline fn _REENT_SIGNGAM(ptr: anytype) @TypeOf(ptr.*._gamma_signgam) {
    _ = &ptr;
    return ptr.*._gamma_signgam;
}
pub inline fn _REENT_RAND_NEXT(ptr: anytype) @TypeOf(ptr.*._r48.*._rand_next) {
    _ = &ptr;
    return ptr.*._r48.*._rand_next;
}
pub inline fn _REENT_RAND48_SEED(ptr: anytype) @TypeOf(ptr.*._r48.*._seed) {
    _ = &ptr;
    return ptr.*._r48.*._seed;
}
pub inline fn _REENT_RAND48_MULT(ptr: anytype) @TypeOf(ptr.*._r48.*._mult) {
    _ = &ptr;
    return ptr.*._r48.*._mult;
}
pub inline fn _REENT_RAND48_ADD(ptr: anytype) @TypeOf(ptr.*._r48.*._add) {
    _ = &ptr;
    return ptr.*._r48.*._add;
}
pub inline fn _REENT_MP_RESULT(ptr: anytype) @TypeOf(ptr.*._mp.*._result) {
    _ = &ptr;
    return ptr.*._mp.*._result;
}
pub inline fn _REENT_MP_RESULT_K(ptr: anytype) @TypeOf(ptr.*._mp.*._result_k) {
    _ = &ptr;
    return ptr.*._mp.*._result_k;
}
pub inline fn _REENT_MP_P5S(ptr: anytype) @TypeOf(ptr.*._mp.*._p5s) {
    _ = &ptr;
    return ptr.*._mp.*._p5s;
}
pub inline fn _REENT_MP_FREELIST(ptr: anytype) @TypeOf(ptr.*._mp.*._freelist) {
    _ = &ptr;
    return ptr.*._mp.*._freelist;
}
pub inline fn _REENT_ASCTIME_BUF(ptr: anytype) @TypeOf(ptr.*._asctime_buf) {
    _ = &ptr;
    return ptr.*._asctime_buf;
}
pub inline fn _REENT_TM(ptr: anytype) @TypeOf(ptr.*._localtime_buf) {
    _ = &ptr;
    return ptr.*._localtime_buf;
}
pub inline fn _REENT_STRTOK_LAST(ptr: anytype) @TypeOf(ptr.*._misc.*._strtok_last) {
    _ = &ptr;
    return ptr.*._misc.*._strtok_last;
}
pub inline fn _REENT_MBLEN_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._mblen_state) {
    _ = &ptr;
    return ptr.*._misc.*._mblen_state;
}
pub inline fn _REENT_MBTOWC_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._mbtowc_state) {
    _ = &ptr;
    return ptr.*._misc.*._mbtowc_state;
}
pub inline fn _REENT_WCTOMB_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._wctomb_state) {
    _ = &ptr;
    return ptr.*._misc.*._wctomb_state;
}
pub inline fn _REENT_MBRLEN_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._mbrlen_state) {
    _ = &ptr;
    return ptr.*._misc.*._mbrlen_state;
}
pub inline fn _REENT_MBRTOWC_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._mbrtowc_state) {
    _ = &ptr;
    return ptr.*._misc.*._mbrtowc_state;
}
pub inline fn _REENT_MBSRTOWCS_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._mbsrtowcs_state) {
    _ = &ptr;
    return ptr.*._misc.*._mbsrtowcs_state;
}
pub inline fn _REENT_WCRTOMB_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._wcrtomb_state) {
    _ = &ptr;
    return ptr.*._misc.*._wcrtomb_state;
}
pub inline fn _REENT_WCSRTOMBS_STATE(ptr: anytype) @TypeOf(ptr.*._misc.*._wcsrtombs_state) {
    _ = &ptr;
    return ptr.*._misc.*._wcsrtombs_state;
}
pub inline fn _REENT_L64A_BUF(ptr: anytype) @TypeOf(ptr.*._misc.*._l64a_buf) {
    _ = &ptr;
    return ptr.*._misc.*._l64a_buf;
}
pub inline fn _REENT_GETDATE_ERR_P(ptr: anytype) @TypeOf(&ptr.*._misc.*._getdate_err) {
    _ = &ptr;
    return &ptr.*._misc.*._getdate_err;
}
pub inline fn _REENT_SIGNAL_BUF(ptr: anytype) @TypeOf(ptr.*._signal_buf) {
    _ = &ptr;
    return ptr.*._signal_buf;
}
pub inline fn _REENT_CLEANUP(_ptr: anytype) @TypeOf(_ptr.*.__cleanup) {
    _ = &_ptr;
    return _ptr.*.__cleanup;
}
pub inline fn _REENT_CVTBUF(_ptr: anytype) @TypeOf(_ptr.*._cvtbuf) {
    _ = &_ptr;
    return _ptr.*._cvtbuf;
}
pub inline fn _REENT_CVTLEN(_ptr: anytype) @TypeOf(_ptr.*._cvtlen) {
    _ = &_ptr;
    return _ptr.*._cvtlen;
}
pub inline fn _REENT_EMERGENCY(_ptr: anytype) @TypeOf(_ptr.*._emergency) {
    _ = &_ptr;
    return _ptr.*._emergency;
}
pub inline fn _REENT_ERRNO(_ptr: anytype) @TypeOf(_ptr.*._errno) {
    _ = &_ptr;
    return _ptr.*._errno;
}
pub inline fn _REENT_INC(_ptr: anytype) @TypeOf(_ptr.*._inc) {
    _ = &_ptr;
    return _ptr.*._inc;
}
pub inline fn _REENT_LOCALE(_ptr: anytype) @TypeOf(_ptr.*._locale) {
    _ = &_ptr;
    return _ptr.*._locale;
}
pub inline fn _REENT_SIG_FUNC(_ptr: anytype) @TypeOf(_ptr.*._sig_func) {
    _ = &_ptr;
    return _ptr.*._sig_func;
}
pub inline fn _REENT_STDIN(_ptr: anytype) @TypeOf(_ptr.*._stdin) {
    _ = &_ptr;
    return _ptr.*._stdin;
}
pub inline fn _REENT_STDOUT(_ptr: anytype) @TypeOf(_ptr.*._stdout) {
    _ = &_ptr;
    return _ptr.*._stdout;
}
pub inline fn _REENT_STDERR(_ptr: anytype) @TypeOf(_ptr.*._stderr) {
    _ = &_ptr;
    return _ptr.*._stderr;
}
pub const _REENT_INIT_PTR = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:751:9
pub const __ATTRIBUTE_IMPURE_PTR__ = "";
pub const __ATTRIBUTE_IMPURE_DATA__ = "";
pub const _REENT = __getreent();
pub inline fn _REENT_IS_NULL(_ptr: anytype) @TypeOf(_ptr == NULL) {
    _ = &_ptr;
    return _ptr == NULL;
}
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/reent.h:786:9: warning: macro '_GLOBAL_REENT' contains a runtime value, translated to function
pub inline fn _GLOBAL_REENT() @TypeOf(&_impure_data) {
    return &_impure_data;
}
pub const _Kmax = @import("std").zig.c_translation.sizeof(usize) << @as(c_int, 3);
pub const _SYS_CDEFS_H_ = "";
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __DOTS = @compileError("unable to translate C expr: unexpected token ','");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:50:9
pub const __THROW = "";
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ')'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:54:10
pub const __ptr_t = ?*anyopaque;
pub const __long_double_t = @compileError("unable to translate: TODO long double");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:58:9
pub const __attribute_malloc__ = "";
pub const __attribute_pure__ = "";
pub const __attribute_format_strfmon__ = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:62:9
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:63:9
pub const __bounded = "";
pub const __unbounded = "";
pub const __ptrvalue = "";
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __GNUCLIKE_ASM = @as(c_int, 3);
pub const __GNUCLIKE_MATH_BUILTIN_CONSTANTS = "";
pub const __GNUCLIKE___TYPEOF = @as(c_int, 1);
pub const __GNUCLIKE___SECTION = @as(c_int, 1);
pub const __GNUCLIKE_CTOR_SECTION_HANDLING = @as(c_int, 1);
pub const __GNUCLIKE_BUILTIN_CONSTANT_P = @as(c_int, 1);
pub const __GNUCLIKE_BUILTIN_VARARGS = @as(c_int, 1);
pub const __GNUCLIKE_BUILTIN_STDARG = @as(c_int, 1);
pub const __GNUCLIKE_BUILTIN_VAALIST = @as(c_int, 1);
pub const __GNUC_VA_LIST_COMPATIBILITY = @as(c_int, 1);
pub const __compiler_membar = @compileError("unable to translate C expr: unexpected token '__asm'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:130:9
pub const __GNUCLIKE_BUILTIN_NEXT_ARG = @as(c_int, 1);
pub const __GNUCLIKE_MATH_BUILTIN_RELOPS = "";
pub const __GNUCLIKE_BUILTIN_MEMCPY = @as(c_int, 1);
pub const __CC_SUPPORTS_INLINE = @as(c_int, 1);
pub const __CC_SUPPORTS___INLINE = @as(c_int, 1);
pub const __CC_SUPPORTS___INLINE__ = @as(c_int, 1);
pub const __CC_SUPPORTS___FUNC__ = @as(c_int, 1);
pub const __CC_SUPPORTS_WARNING = @as(c_int, 1);
pub const __CC_SUPPORTS_VARADIC_XXX = @as(c_int, 1);
pub const __CC_SUPPORTS_DYNAMIC_ARRAY_INIT = @as(c_int, 1);
pub inline fn __P(protos: anytype) @TypeOf(protos) {
    _ = &protos;
    return protos;
}
pub const __CONCAT1 = @compileError("unable to translate C expr: unexpected token '##'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:165:9
pub inline fn __CONCAT(x: anytype, y: anytype) @TypeOf(__CONCAT1(x, y)) {
    _ = &x;
    _ = &y;
    return __CONCAT1(x, y);
}
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:167:9
pub inline fn __XSTRING(x: anytype) @TypeOf(__STRING(x)) {
    _ = &x;
    return __STRING(x);
}
pub const __const = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:170:9
pub const __signed = c_int;
pub const __volatile = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:172:9
pub const __weak_symbol = @compileError("unable to translate macro: undefined identifier `__weak__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:217:9
pub const __dead2 = @compileError("unable to translate macro: undefined identifier `__noreturn__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:230:9
pub const __pure2 = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:231:9
pub const __unused = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:232:9
pub const __used = @compileError("unable to translate macro: undefined identifier `__used__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:233:9
pub const __packed = @compileError("unable to translate macro: undefined identifier `__packed__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:234:9
pub const __aligned = @compileError("unable to translate macro: undefined identifier `__aligned__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:235:9
pub const __section = @compileError("unable to translate macro: undefined identifier `__section__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:236:9
pub const __alloc_size = @compileError("unable to translate macro: undefined identifier `__alloc_size__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:239:9
pub const __alloc_size2 = @compileError("unable to translate macro: undefined identifier `__alloc_size__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:240:9
pub const __alloc_align = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:246:9
pub const __generic = @compileError("unable to translate C expr: unexpected token '_Generic'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:335:9
pub const __min_size = @compileError("unable to translate C expr: unexpected token 'static'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:353:9
pub const __malloc_like = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:359:9
pub const __pure = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:360:9
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:367:9
pub const __noinline = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:373:9
pub const __nonnull = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:379:9
pub const __nonnull_all = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:380:9
pub const __fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:387:9
pub const __result_use_check = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:388:9
pub const __returns_twice = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:395:9
pub inline fn __unreachable() @TypeOf(__builtin_unreachable()) {
    return __builtin_unreachable();
}
pub const __restrict = @compileError("unable to translate C expr: unexpected token 'restrict'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:421:9
pub inline fn __predict_true(exp: anytype) @TypeOf(__builtin_expect(exp, @as(c_int, 1))) {
    _ = &exp;
    return __builtin_expect(exp, @as(c_int, 1));
}
pub inline fn __predict_false(exp: anytype) @TypeOf(__builtin_expect(exp, @as(c_int, 0))) {
    _ = &exp;
    return __builtin_expect(exp, @as(c_int, 0));
}
pub const __null_sentinel = @compileError("unable to translate macro: undefined identifier `__sentinel__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:462:9
pub const __exported = @compileError("unable to translate macro: undefined identifier `__visibility__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:463:9
pub const __hidden = @compileError("unable to translate macro: undefined identifier `__visibility__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:466:9
pub inline fn __offsetof(@"type": anytype, field: anytype) @TypeOf(offsetof(@"type", field)) {
    _ = &@"type";
    _ = &field;
    return offsetof(@"type", field);
}
pub inline fn __rangeof(@"type": anytype, start: anytype, end: anytype) @TypeOf(__offsetof(@"type", end) - __offsetof(@"type", start)) {
    _ = &@"type";
    _ = &start;
    _ = &end;
    return __offsetof(@"type", end) - __offsetof(@"type", start);
}
pub const __containerof = @compileError("unable to translate macro: undefined identifier `__x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:487:9
pub const __printflike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:509:9
pub const __scanflike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:511:9
pub const __format_arg = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:513:9
pub const __strfmonlike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:514:9
pub const __strftimelike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:516:9
pub const __printf0like = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:526:9
pub const __strong_reference = @compileError("unable to translate macro: undefined identifier `__alias__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:530:9
pub const __weak_reference = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:534:9
pub const __warn_references = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:537:9
pub const __sym_compat = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:541:9
pub const __sym_default = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:543:9
pub const __FBSDID = @compileError("unable to translate macro: undefined identifier `__hack`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:578:9
pub const __RCSID = @compileError("unable to translate macro: undefined identifier `__hack`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:582:9
pub const __RCSID_SOURCE = @compileError("unable to translate macro: undefined identifier `__hack`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:586:9
pub const __SCCSID = @compileError("unable to translate macro: undefined identifier `__hack`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:590:9
pub const __COPYRIGHT = @compileError("unable to translate macro: undefined identifier `__hack`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:594:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:598:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:602:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:606:9
pub const __NULLABILITY_PRAGMA_PUSH = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:619:9
pub const __NULLABILITY_PRAGMA_POP = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:621:9
pub const __arg_type_tag = @compileError("unable to translate macro: undefined identifier `__argument_with_type_tag__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:633:9
pub const __datatype_type_tag = @compileError("unable to translate macro: undefined identifier `__type_tag_for_datatype__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:635:9
pub const __lock_annotate = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:655:9
pub const __lockable = @compileError("unable to translate macro: undefined identifier `lockable`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:663:9
pub const __locks_exclusive = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:666:9
pub const __locks_shared = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:668:9
pub const __trylocks_exclusive = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:672:9
pub const __trylocks_shared = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:674:9
pub const __unlocks = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:678:9
pub const __asserts_exclusive = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:681:9
pub const __asserts_shared = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:683:9
pub const __requires_exclusive = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:687:9
pub const __requires_shared = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:689:9
pub const __requires_unlocked = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:691:9
pub const __no_lock_analysis = @compileError("unable to translate macro: undefined identifier `no_thread_safety_analysis`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:695:9
pub const __nosanitizeaddress = @compileError("unable to translate macro: undefined identifier `no_sanitize`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:707:9
pub const __nosanitizememory = @compileError("unable to translate macro: undefined identifier `no_sanitize`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:708:9
pub const __nosanitizethread = @compileError("unable to translate macro: undefined identifier `no_sanitize`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:710:9
pub const __guarded_by = @compileError("unable to translate macro: undefined identifier `guarded_by`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:718:9
pub const __pt_guarded_by = @compileError("unable to translate macro: undefined identifier `pt_guarded_by`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:719:9
pub const __align_up = @compileError("unable to translate macro: undefined identifier `__builtin_align_up`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:736:9
pub const __align_down = @compileError("unable to translate macro: undefined identifier `__builtin_align_down`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:737:9
pub const __is_aligned = @compileError("unable to translate macro: undefined identifier `__builtin_is_aligned`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/cdefs.h:738:9
pub const _MACHSTDLIB_H_ = "";
pub const _NEWLIB_ALLOCA_H = "";
pub const alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/alloca.h:16:9
pub const __compar_fn_t_defined = "";
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const RAND_MAX = __RAND_MAX;
pub const MB_CUR_MAX = __locale_mb_cur_max();
pub const strtodf = strtof;
pub const _STDIO_H_ = "";
pub const _FSTDIO = "";
pub const __need___va_list = "";
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST_DEFINED = "";
pub const __FILE_defined = "";
pub const _OFF_T_DECLARED = "";
pub const _SSIZE_T_DECLARED = "";
pub const _NEWLIB_STDIO_H = "";
pub inline fn _flockfile(fp: anytype) @TypeOf(if (fp.*._flags & __SSTR) @as(c_int, 0) else __lock_acquire_recursive(fp.*._lock)) {
    _ = &fp;
    return if (fp.*._flags & __SSTR) @as(c_int, 0) else __lock_acquire_recursive(fp.*._lock);
}
pub inline fn _funlockfile(fp: anytype) @TypeOf(if (fp.*._flags & __SSTR) @as(c_int, 0) else __lock_release_recursive(fp.*._lock)) {
    _ = &fp;
    return if (fp.*._flags & __SSTR) @as(c_int, 0) else __lock_release_recursive(fp.*._lock);
}
pub const __SLBF = @as(c_int, 0x0001);
pub const __SNBF = @as(c_int, 0x0002);
pub const __SRD = @as(c_int, 0x0004);
pub const __SWR = @as(c_int, 0x0008);
pub const __SRW = @as(c_int, 0x0010);
pub const __SEOF = @as(c_int, 0x0020);
pub const __SERR = @as(c_int, 0x0040);
pub const __SMBF = @as(c_int, 0x0080);
pub const __SAPP = @as(c_int, 0x0100);
pub const __SSTR = @as(c_int, 0x0200);
pub const __SOPT = @as(c_int, 0x0400);
pub const __SNPT = @as(c_int, 0x0800);
pub const __SOFF = @as(c_int, 0x1000);
pub const __SORD = @as(c_int, 0x2000);
pub const __SL64 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __SNLK = @as(c_int, 0x0001);
pub const __SWID = @as(c_int, 0x2000);
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const EOF = -@as(c_int, 1);
pub const BUFSIZ = __BUFSIZ__;
pub const FOPEN_MAX = @as(c_int, 20);
pub const FILENAME_MAX = @as(c_int, 1024);
pub const L_tmpnam = FILENAME_MAX;
pub const P_tmpdir = "/tmp";
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const TMP_MAX = @as(c_int, 26);
pub const stdin = _REENT_STDIN(_REENT);
pub const stdout = _REENT_STDOUT(_REENT);
pub const stderr = _REENT_STDERR(_REENT);
pub inline fn _stdin_r(x: anytype) @TypeOf(_REENT_STDIN(x)) {
    _ = &x;
    return _REENT_STDIN(x);
}
pub inline fn _stdout_r(x: anytype) @TypeOf(_REENT_STDOUT(x)) {
    _ = &x;
    return _REENT_STDOUT(x);
}
pub inline fn _stderr_r(x: anytype) @TypeOf(_REENT_STDERR(x)) {
    _ = &x;
    return _REENT_STDERR(x);
}
pub const __VALIST = __gnuc_va_list;
pub inline fn fropen(__cookie: anytype, __fn: anytype) @TypeOf(funopen(__cookie, __fn, NULL, NULL, NULL)) {
    _ = &__cookie;
    _ = &__fn;
    return funopen(__cookie, __fn, NULL, NULL, NULL);
}
pub inline fn fwopen(__cookie: anytype, __fn: anytype) @TypeOf(funopen(__cookie, NULL, __fn, NULL, NULL)) {
    _ = &__cookie;
    _ = &__fn;
    return funopen(__cookie, NULL, __fn, NULL, NULL);
}
pub const __sgetc_raw_r = @compileError("TODO unary inc/dec expr");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/stdio.h:658:15
pub inline fn __sgetc_r(__ptr: anytype, __p: anytype) @TypeOf(__sgetc_raw_r(__ptr, __p)) {
    _ = &__ptr;
    _ = &__p;
    return __sgetc_raw_r(__ptr, __p);
}
pub inline fn __sfeof(p: anytype) c_int {
    _ = &p;
    return @import("std").zig.c_translation.cast(c_int, (p.*._flags & __SEOF) != @as(c_int, 0));
}
pub inline fn __sferror(p: anytype) c_int {
    _ = &p;
    return @import("std").zig.c_translation.cast(c_int, (p.*._flags & __SERR) != @as(c_int, 0));
}
pub const __sclearerr = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/stdio.h:725:9
pub inline fn __sfileno(p: anytype) @TypeOf(p.*._file) {
    _ = &p;
    return p.*._file;
}
pub const fast_putc = @compileError("TODO unary inc/dec expr");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/stdio.h:778:9
pub const L_ctermid = @as(c_int, 16);
pub const CONFIG_SOC_MPU_MIN_REGION_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const CONFIG_SOC_MPU_REGIONS_MAX_NUM = @as(c_int, 8);
pub const CONFIG_SOC_ADC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_UART_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_PCNT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_PHY_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_TWAI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_GDMA_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_AHB_GDMA_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_GPTIMER_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_LCDCAM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_MCPWM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_DEDICATED_GPIO_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_CACHE_SUPPORT_WRAP = @as(c_int, 1);
pub const CONFIG_SOC_ULP_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ULP_FSM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RISCV_COPROC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_BT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_USB_OTG_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_USB_SERIAL_JTAG_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_CCOMP_TIMER_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ASYNC_MEMCPY_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SUPPORTS_SECURE_DL_MODE = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_KEY_PURPOSE_FIELD = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SDMMC_HOST_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RTC_FAST_MEM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RTC_SLOW_MEM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RTC_MEM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_PSRAM_DMA_CAPABLE = @as(c_int, 1);
pub const CONFIG_SOC_XT_WDT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_I2S_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SDM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_GPSPI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_LEDC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SYSTIMER_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SUPPORT_COEXISTENCE = @as(c_int, 1);
pub const CONFIG_SOC_TEMP_SENSOR_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_AES_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_MPI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_HMAC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_DIG_SIGN_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_FLASH_ENC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SECURE_BOOT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_MEMPROT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_TOUCH_SENSOR_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_BOD_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_CLK_TREE_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_MPU_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_WDT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SPI_FLASH_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RNG_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_LIGHT_SLEEP_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_DEEP_SLEEP_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_LP_PERIPH_SHARE_INTERRUPT = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_XTAL_SUPPORT_40M = @as(c_int, 1);
pub const CONFIG_SOC_APPCPU_HAS_CLOCK_GATING_BUG = @as(c_int, 1);
pub const CONFIG_SOC_ADC_RTC_CTRL_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_DIG_CTRL_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_ARBITER_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_DIG_IIR_FILTER_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_MONITOR_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_DMA_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_PERIPH_NUM = @as(c_int, 2);
pub const CONFIG_SOC_ADC_MAX_CHANNEL_NUM = @as(c_int, 10);
pub const CONFIG_SOC_ADC_ATTEN_NUM = @as(c_int, 4);
pub const CONFIG_SOC_ADC_DIGI_CONTROLLER_NUM = @as(c_int, 2);
pub const CONFIG_SOC_ADC_PATT_LEN_MAX = @as(c_int, 24);
pub const CONFIG_SOC_ADC_DIGI_MIN_BITWIDTH = @as(c_int, 12);
pub const CONFIG_SOC_ADC_DIGI_MAX_BITWIDTH = @as(c_int, 12);
pub const CONFIG_SOC_ADC_DIGI_RESULT_BYTES = @as(c_int, 4);
pub const CONFIG_SOC_ADC_DIGI_DATA_BYTES_PER_CONV = @as(c_int, 4);
pub const CONFIG_SOC_ADC_DIGI_IIR_FILTER_NUM = @as(c_int, 2);
pub const CONFIG_SOC_ADC_DIGI_MONITOR_NUM = @as(c_int, 2);
pub const CONFIG_SOC_ADC_SAMPLE_FREQ_THRES_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 83333, .decimal);
pub const CONFIG_SOC_ADC_SAMPLE_FREQ_THRES_LOW = @as(c_int, 611);
pub const CONFIG_SOC_ADC_RTC_MIN_BITWIDTH = @as(c_int, 12);
pub const CONFIG_SOC_ADC_RTC_MAX_BITWIDTH = @as(c_int, 12);
pub const CONFIG_SOC_ADC_CALIBRATION_V1_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_SELF_HW_CALI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ADC_SHARED_POWER = @as(c_int, 1);
pub const CONFIG_SOC_APB_BACKUP_DMA = @as(c_int, 1);
pub const CONFIG_SOC_BROWNOUT_RESET_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_CACHE_WRITEBACK_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_CACHE_FREEZE_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_CPU_CORES_NUM = @as(c_int, 2);
pub const CONFIG_SOC_CPU_INTR_NUM = @as(c_int, 32);
pub const CONFIG_SOC_CPU_HAS_FPU = @as(c_int, 1);
pub const CONFIG_SOC_HP_CPU_HAS_MULTIPLE_CORES = @as(c_int, 1);
pub const CONFIG_SOC_CPU_BREAKPOINTS_NUM = @as(c_int, 2);
pub const CONFIG_SOC_CPU_WATCHPOINTS_NUM = @as(c_int, 2);
pub const CONFIG_SOC_CPU_WATCHPOINT_MAX_REGION_SIZE = @as(c_int, 64);
pub const CONFIG_SOC_DS_SIGNATURE_MAX_BIT_LEN = @as(c_int, 4096);
pub const CONFIG_SOC_DS_KEY_PARAM_MD_IV_LENGTH = @as(c_int, 16);
pub const CONFIG_SOC_DS_KEY_CHECK_MAX_WAIT_US = @as(c_int, 1100);
pub const CONFIG_SOC_AHB_GDMA_VERSION = @as(c_int, 1);
pub const CONFIG_SOC_GDMA_NUM_GROUPS_MAX = @as(c_int, 1);
pub const CONFIG_SOC_GDMA_PAIRS_PER_GROUP = @as(c_int, 5);
pub const CONFIG_SOC_GDMA_PAIRS_PER_GROUP_MAX = @as(c_int, 5);
pub const CONFIG_SOC_AHB_GDMA_SUPPORT_PSRAM = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_PORT = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_PIN_COUNT = @as(c_int, 49);
pub const CONFIG_SOC_GPIO_SUPPORT_PIN_GLITCH_FILTER = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_FILTER_CLK_SUPPORT_APB = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_SUPPORT_RTC_INDEPENDENT = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_SUPPORT_FORCE_HOLD = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_VALID_GPIO_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1FFFFFFFFFFFF, .hex);
pub const CONFIG_SOC_GPIO_IN_RANGE_MAX = @as(c_int, 48);
pub const CONFIG_SOC_GPIO_OUT_RANGE_MAX = @as(c_int, 48);
pub const CONFIG_SOC_GPIO_VALID_DIGITAL_IO_PAD_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0001FFFFFC000000, .hex);
pub const CONFIG_SOC_GPIO_CLOCKOUT_BY_IO_MUX = @as(c_int, 1);
pub const CONFIG_SOC_GPIO_CLOCKOUT_CHANNEL_NUM = @as(c_int, 3);
pub const CONFIG_SOC_DEDIC_GPIO_OUT_CHANNELS_NUM = @as(c_int, 8);
pub const CONFIG_SOC_DEDIC_GPIO_IN_CHANNELS_NUM = @as(c_int, 8);
pub const CONFIG_SOC_DEDIC_GPIO_OUT_AUTO_ENABLE = @as(c_int, 1);
pub const CONFIG_SOC_I2C_NUM = @as(c_int, 2);
pub const CONFIG_SOC_HP_I2C_NUM = @as(c_int, 2);
pub const CONFIG_SOC_I2C_FIFO_LEN = @as(c_int, 32);
pub const CONFIG_SOC_I2C_CMD_REG_NUM = @as(c_int, 8);
pub const CONFIG_SOC_I2C_SUPPORT_SLAVE = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SUPPORT_HW_CLR_BUS = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SUPPORT_XTAL = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SUPPORT_RTC = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SUPPORT_10BIT_ADDR = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SLAVE_SUPPORT_BROADCAST = @as(c_int, 1);
pub const CONFIG_SOC_I2C_SLAVE_SUPPORT_I2CRAM_ACCESS = @as(c_int, 1);
pub const CONFIG_SOC_I2S_NUM = @as(c_int, 2);
pub const CONFIG_SOC_I2S_HW_VERSION_2 = @as(c_int, 1);
pub const CONFIG_SOC_I2S_SUPPORTS_XTAL = @as(c_int, 1);
pub const CONFIG_SOC_I2S_SUPPORTS_PLL_F160M = @as(c_int, 1);
pub const CONFIG_SOC_I2S_SUPPORTS_PCM = @as(c_int, 1);
pub const CONFIG_SOC_I2S_SUPPORTS_PDM = @as(c_int, 1);
pub const CONFIG_SOC_I2S_SUPPORTS_PDM_TX = @as(c_int, 1);
pub const CONFIG_SOC_I2S_PDM_MAX_TX_LINES = @as(c_int, 2);
pub const CONFIG_SOC_I2S_SUPPORTS_PDM_RX = @as(c_int, 1);
pub const CONFIG_SOC_I2S_PDM_MAX_RX_LINES = @as(c_int, 4);
pub const CONFIG_SOC_I2S_SUPPORTS_TDM = @as(c_int, 1);
pub const CONFIG_SOC_LEDC_SUPPORT_APB_CLOCK = @as(c_int, 1);
pub const CONFIG_SOC_LEDC_SUPPORT_XTAL_CLOCK = @as(c_int, 1);
pub const CONFIG_SOC_LEDC_CHANNEL_NUM = @as(c_int, 8);
pub const CONFIG_SOC_LEDC_TIMER_BIT_WIDTH = @as(c_int, 14);
pub const CONFIG_SOC_LEDC_SUPPORT_FADE_STOP = @as(c_int, 1);
pub const CONFIG_SOC_MCPWM_GROUPS = @as(c_int, 2);
pub const CONFIG_SOC_MCPWM_TIMERS_PER_GROUP = @as(c_int, 3);
pub const CONFIG_SOC_MCPWM_OPERATORS_PER_GROUP = @as(c_int, 3);
pub const CONFIG_SOC_MCPWM_COMPARATORS_PER_OPERATOR = @as(c_int, 2);
pub const CONFIG_SOC_MCPWM_GENERATORS_PER_OPERATOR = @as(c_int, 2);
pub const CONFIG_SOC_MCPWM_TRIGGERS_PER_OPERATOR = @as(c_int, 2);
pub const CONFIG_SOC_MCPWM_GPIO_FAULTS_PER_GROUP = @as(c_int, 3);
pub const CONFIG_SOC_MCPWM_CAPTURE_TIMERS_PER_GROUP = @as(c_int, 1);
pub const CONFIG_SOC_MCPWM_CAPTURE_CHANNELS_PER_TIMER = @as(c_int, 3);
pub const CONFIG_SOC_MCPWM_GPIO_SYNCHROS_PER_GROUP = @as(c_int, 3);
pub const CONFIG_SOC_MCPWM_SWSYNC_CAN_PROPAGATE = @as(c_int, 1);
pub const CONFIG_SOC_MMU_LINEAR_ADDRESS_REGION_NUM = @as(c_int, 1);
pub const CONFIG_SOC_MMU_PERIPH_NUM = @as(c_int, 1);
pub const CONFIG_SOC_PCNT_GROUPS = @as(c_int, 1);
pub const CONFIG_SOC_PCNT_UNITS_PER_GROUP = @as(c_int, 4);
pub const CONFIG_SOC_PCNT_CHANNELS_PER_UNIT = @as(c_int, 2);
pub const CONFIG_SOC_PCNT_THRES_POINT_PER_UNIT = @as(c_int, 2);
pub const CONFIG_SOC_RMT_GROUPS = @as(c_int, 1);
pub const CONFIG_SOC_RMT_TX_CANDIDATES_PER_GROUP = @as(c_int, 4);
pub const CONFIG_SOC_RMT_RX_CANDIDATES_PER_GROUP = @as(c_int, 4);
pub const CONFIG_SOC_RMT_CHANNELS_PER_GROUP = @as(c_int, 8);
pub const CONFIG_SOC_RMT_MEM_WORDS_PER_CHANNEL = @as(c_int, 48);
pub const CONFIG_SOC_RMT_SUPPORT_RX_PINGPONG = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_RX_DEMODULATION = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_TX_ASYNC_STOP = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_TX_LOOP_COUNT = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_TX_LOOP_AUTO_STOP = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_TX_SYNCHRO = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_TX_CARRIER_DATA_ONLY = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_XTAL = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_RC_FAST = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_APB = @as(c_int, 1);
pub const CONFIG_SOC_RMT_SUPPORT_DMA = @as(c_int, 1);
pub const CONFIG_SOC_LCD_I80_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_LCD_RGB_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_LCD_I80_BUSES = @as(c_int, 1);
pub const CONFIG_SOC_LCD_RGB_PANELS = @as(c_int, 1);
pub const CONFIG_SOC_LCD_I80_BUS_WIDTH = @as(c_int, 16);
pub const CONFIG_SOC_LCD_RGB_DATA_WIDTH = @as(c_int, 16);
pub const CONFIG_SOC_LCD_SUPPORT_RGB_YUV_CONV = @as(c_int, 1);
pub const CONFIG_SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH = @as(c_int, 128);
pub const CONFIG_SOC_RTC_CNTL_CPU_PD_REG_FILE_NUM = @as(c_int, 549);
pub const CONFIG_SOC_RTC_CNTL_TAGMEM_PD_DMA_BUS_WIDTH = @as(c_int, 128);
pub const CONFIG_SOC_RTCIO_PIN_COUNT = @as(c_int, 22);
pub const CONFIG_SOC_RTCIO_INPUT_OUTPUT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RTCIO_HOLD_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RTCIO_WAKE_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SDM_GROUPS = @as(c_int, 1);
pub const CONFIG_SOC_SDM_CHANNELS_PER_GROUP = @as(c_int, 8);
pub const CONFIG_SOC_SDM_CLK_SUPPORT_APB = @as(c_int, 1);
pub const CONFIG_SOC_SPI_PERIPH_NUM = @as(c_int, 3);
pub const CONFIG_SOC_SPI_MAX_CS_NUM = @as(c_int, 6);
pub const CONFIG_SOC_SPI_MAXIMUM_BUFFER_SIZE = @as(c_int, 64);
pub const CONFIG_SOC_SPI_SUPPORT_DDRCLK = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SLAVE_SUPPORT_SEG_TRANS = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SUPPORT_CD_SIG = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SUPPORT_CONTINUOUS_TRANS = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SUPPORT_SLAVE_HD_VER2 = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SUPPORT_CLK_APB = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SUPPORT_CLK_XTAL = @as(c_int, 1);
pub const CONFIG_SOC_SPI_PERIPH_SUPPORT_CONTROL_DUMMY_OUT = @as(c_int, 1);
pub const CONFIG_SOC_MEMSPI_IS_INDEPENDENT = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MAX_PRE_DIVIDER = @as(c_int, 16);
pub const CONFIG_SOC_SPI_SUPPORT_OCT = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SCT_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SCT_REG_NUM = @as(c_int, 14);
pub const CONFIG_SOC_SPI_SCT_BUFFER_NUM_MAX = @as(c_int, 1);
pub const CONFIG_SOC_SPI_SCT_CONF_BITLEN_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FFFA, .hex);
pub const CONFIG_SOC_MEMSPI_SRC_FREQ_120M = @as(c_int, 1);
pub const CONFIG_SOC_MEMSPI_SRC_FREQ_80M_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_MEMSPI_SRC_FREQ_40M_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_MEMSPI_SRC_FREQ_20M_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SPIRAM_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SPIRAM_XIP_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_SYSTIMER_COUNTER_NUM = @as(c_int, 2);
pub const CONFIG_SOC_SYSTIMER_ALARM_NUM = @as(c_int, 3);
pub const CONFIG_SOC_SYSTIMER_BIT_WIDTH_LO = @as(c_int, 32);
pub const CONFIG_SOC_SYSTIMER_BIT_WIDTH_HI = @as(c_int, 20);
pub const CONFIG_SOC_SYSTIMER_FIXED_DIVIDER = @as(c_int, 1);
pub const CONFIG_SOC_SYSTIMER_INT_LEVEL = @as(c_int, 1);
pub const CONFIG_SOC_SYSTIMER_ALARM_MISS_COMPENSATE = @as(c_int, 1);
pub const CONFIG_SOC_TIMER_GROUPS = @as(c_int, 2);
pub const CONFIG_SOC_TIMER_GROUP_TIMERS_PER_GROUP = @as(c_int, 2);
pub const CONFIG_SOC_TIMER_GROUP_COUNTER_BIT_WIDTH = @as(c_int, 54);
pub const CONFIG_SOC_TIMER_GROUP_SUPPORT_XTAL = @as(c_int, 1);
pub const CONFIG_SOC_TIMER_GROUP_SUPPORT_APB = @as(c_int, 1);
pub const CONFIG_SOC_TIMER_GROUP_TOTAL_TIMERS = @as(c_int, 4);
pub const CONFIG_SOC_TOUCH_SENSOR_VERSION = @as(c_int, 2);
pub const CONFIG_SOC_TOUCH_SENSOR_NUM = @as(c_int, 15);
pub const CONFIG_SOC_TOUCH_SUPPORT_SLEEP_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_TOUCH_SUPPORT_WATERPROOF = @as(c_int, 1);
pub const CONFIG_SOC_TOUCH_SUPPORT_PROX_SENSING = @as(c_int, 1);
pub const CONFIG_SOC_TOUCH_PROXIMITY_CHANNEL_NUM = @as(c_int, 3);
pub const CONFIG_SOC_TOUCH_PROXIMITY_MEAS_DONE_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_TOUCH_SAMPLE_CFG_NUM = @as(c_int, 1);
pub const CONFIG_SOC_TWAI_CONTROLLER_NUM = @as(c_int, 1);
pub const CONFIG_SOC_TWAI_CLK_SUPPORT_APB = @as(c_int, 1);
pub const CONFIG_SOC_TWAI_BRP_MIN = @as(c_int, 2);
pub const CONFIG_SOC_TWAI_BRP_MAX = @as(c_int, 16384);
pub const CONFIG_SOC_TWAI_SUPPORTS_RX_STATUS = @as(c_int, 1);
pub const CONFIG_SOC_UART_NUM = @as(c_int, 3);
pub const CONFIG_SOC_UART_HP_NUM = @as(c_int, 3);
pub const CONFIG_SOC_UART_FIFO_LEN = @as(c_int, 128);
pub const CONFIG_SOC_UART_BITRATE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 5000000, .decimal);
pub const CONFIG_SOC_UART_SUPPORT_FSM_TX_WAIT_SEND = @as(c_int, 1);
pub const CONFIG_SOC_UART_SUPPORT_WAKEUP_INT = @as(c_int, 1);
pub const CONFIG_SOC_UART_SUPPORT_APB_CLK = @as(c_int, 1);
pub const CONFIG_SOC_UART_SUPPORT_RTC_CLK = @as(c_int, 1);
pub const CONFIG_SOC_UART_SUPPORT_XTAL_CLK = @as(c_int, 1);
pub const CONFIG_SOC_USB_OTG_PERIPH_NUM = @as(c_int, 1);
pub const CONFIG_SOC_SHA_DMA_MAX_BUFFER_SIZE = @as(c_int, 3968);
pub const CONFIG_SOC_SHA_SUPPORT_DMA = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_RESUME = @as(c_int, 1);
pub const CONFIG_SOC_SHA_GDMA = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA1 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA224 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA256 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA384 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA512 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA512_224 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA512_256 = @as(c_int, 1);
pub const CONFIG_SOC_SHA_SUPPORT_SHA512_T = @as(c_int, 1);
pub const CONFIG_SOC_MPI_MEM_BLOCKS_NUM = @as(c_int, 4);
pub const CONFIG_SOC_MPI_OPERATIONS_NUM = @as(c_int, 3);
pub const CONFIG_SOC_RSA_MAX_BIT_LEN = @as(c_int, 4096);
pub const CONFIG_SOC_AES_SUPPORT_DMA = @as(c_int, 1);
pub const CONFIG_SOC_AES_GDMA = @as(c_int, 1);
pub const CONFIG_SOC_AES_SUPPORT_AES_128 = @as(c_int, 1);
pub const CONFIG_SOC_AES_SUPPORT_AES_256 = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_EXT0_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_EXT1_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_EXT_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_WIFI_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_BT_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_TOUCH_SENSOR_WAKEUP = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_CPU_PD = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_TAGMEM_PD = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_RTC_PERIPH_PD = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_RC_FAST_PD = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_VDDSDIO_PD = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_MAC_BB_PD = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_MODEM_PD = @as(c_int, 1);
pub const CONFIG_SOC_CONFIGURABLE_VDDSDIO_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_PM_SUPPORT_DEEPSLEEP_CHECK_STUB_ONLY = @as(c_int, 1);
pub const CONFIG_SOC_PM_CPU_RETENTION_BY_RTCCNTL = @as(c_int, 1);
pub const CONFIG_SOC_PM_MODEM_RETENTION_BY_BACKUPDMA = @as(c_int, 1);
pub const CONFIG_SOC_CLK_RC_FAST_D256_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_RTC_SLOW_CLK_SUPPORT_RC_FAST_D256 = @as(c_int, 1);
pub const CONFIG_SOC_CLK_RC_FAST_SUPPORT_CALIBRATION = @as(c_int, 1);
pub const CONFIG_SOC_CLK_XTAL32K_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_DIS_DOWNLOAD_ICACHE = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_DIS_DOWNLOAD_DCACHE = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_HARD_DIS_JTAG = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_DIS_USB_JTAG = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_SOFT_DIS_JTAG = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_DIS_DIRECT_BOOT = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_DIS_ICACHE = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_BLOCK9_KEY_PURPOSE_QUIRK = @as(c_int, 1);
pub const CONFIG_SOC_SECURE_BOOT_V2_RSA = @as(c_int, 1);
pub const CONFIG_SOC_EFUSE_SECURE_BOOT_KEY_DIGESTS = @as(c_int, 3);
pub const CONFIG_SOC_EFUSE_REVOKE_BOOT_KEY_DIGESTS = @as(c_int, 1);
pub const CONFIG_SOC_SUPPORT_SECURE_BOOT_REVOKE_KEY = @as(c_int, 1);
pub const CONFIG_SOC_FLASH_ENCRYPTED_XTS_AES_BLOCK_MAX = @as(c_int, 64);
pub const CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES = @as(c_int, 1);
pub const CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_OPTIONS = @as(c_int, 1);
pub const CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_128 = @as(c_int, 1);
pub const CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_256 = @as(c_int, 1);
pub const CONFIG_SOC_MEMPROT_CPU_PREFETCH_PAD_SIZE = @as(c_int, 16);
pub const CONFIG_SOC_MEMPROT_MEM_ALIGN_SIZE = @as(c_int, 256);
pub const CONFIG_SOC_PHY_DIG_REGS_MEM_SIZE = @as(c_int, 21);
pub const CONFIG_SOC_MAC_BB_PD_MEM_SIZE = @as(c_int, 192);
pub const CONFIG_SOC_WIFI_LIGHT_SLEEP_CLK_WIDTH = @as(c_int, 12);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_WAIT_IDLE = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_SUSPEND = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_RESUME = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_SW_SUSPEND = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_OPI_MODE = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_TIMING_TUNING = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_CONFIG_GPIO_BY_EFUSE = @as(c_int, 1);
pub const CONFIG_SOC_SPI_MEM_SUPPORT_WRAP = @as(c_int, 1);
pub const CONFIG_SOC_MEMSPI_TIMING_TUNING_BY_MSPI_DELAY = @as(c_int, 1);
pub const CONFIG_SOC_MEMSPI_CORE_CLK_SHARED_WITH_PSRAM = @as(c_int, 1);
pub const CONFIG_SOC_COEX_HW_PTI = @as(c_int, 1);
pub const CONFIG_SOC_EXTERNAL_COEX_LEADER_TX_LINE = @as(c_int, 1);
pub const CONFIG_SOC_SDMMC_USE_GPIO_MATRIX = @as(c_int, 1);
pub const CONFIG_SOC_SDMMC_NUM_SLOTS = @as(c_int, 2);
pub const CONFIG_SOC_SDMMC_SUPPORT_XTAL_CLOCK = @as(c_int, 1);
pub const CONFIG_SOC_SDMMC_DELAY_PHASE_NUM = @as(c_int, 4);
pub const CONFIG_SOC_TEMPERATURE_SENSOR_SUPPORT_FAST_RC = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_HW_TSF = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_FTM_SUPPORT = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_GCMP_SUPPORT = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_WAPI_SUPPORT = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_CSI_SUPPORT = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_MESH_SUPPORT = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_SUPPORT_VARIABLE_BEACON_WINDOW = @as(c_int, 1);
pub const CONFIG_SOC_WIFI_PHY_NEEDS_USB_WORKAROUND = @as(c_int, 1);
pub const CONFIG_SOC_BLE_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_BLE_MESH_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_BLE_50_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_BLE_DEVICE_PRIVACY_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_BLUFI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SOC_ULP_HAS_ADC = @as(c_int, 1);
pub const CONFIG_SOC_PHY_COMBO_MODULE = @as(c_int, 1);
pub const CONFIG_IDF_CMAKE = @as(c_int, 1);
pub const CONFIG_IDF_TOOLCHAIN = "gcc";
pub const CONFIG_IDF_TARGET_ARCH_XTENSA = @as(c_int, 1);
pub const CONFIG_IDF_TARGET_ARCH = "xtensa";
pub const CONFIG_IDF_TARGET = "esp32s3";
pub const CONFIG_IDF_INIT_VERSION = "5.3.1";
pub const CONFIG_IDF_FIRMWARE_CHIP_ID = @as(c_int, 0x0009);
pub const CONFIG_APP_BUILD_TYPE_APP_2NDBOOT = @as(c_int, 1);
pub const CONFIG_APP_BUILD_GENERATE_BINARIES = @as(c_int, 1);
pub const CONFIG_APP_BUILD_BOOTLOADER = @as(c_int, 1);
pub const CONFIG_APP_BUILD_USE_FLASH_SECTIONS = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_COMPILE_TIME_DATE = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_PROJECT_VER = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_OFFSET_IN_FLASH = @as(c_int, 0x0);
pub const CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_SIZE = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_LOG_LEVEL_INFO = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_LOG_LEVEL = @as(c_int, 3);
pub const CONFIG_BOOTLOADER_FLASH_XMC_SUPPORT = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_VDDSDIO_BOOST_1_9V = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_REGION_PROTECTION_ENABLE = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_WDT_ENABLE = @as(c_int, 1);
pub const CONFIG_BOOTLOADER_WDT_TIME_MS = @as(c_int, 9000);
pub const CONFIG_BOOTLOADER_RESERVE_RTC_SIZE = @as(c_int, 0x0);
pub const CONFIG_SECURE_BOOT_V2_RSA_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SECURE_BOOT_V2_PREFERRED = @as(c_int, 1);
pub const CONFIG_SECURE_ROM_DL_MODE_ENABLED = @as(c_int, 1);
pub const CONFIG_APP_COMPILE_TIME_DATE = @as(c_int, 1);
pub const CONFIG_APP_RETRIEVE_LEN_ELF_SHA = @as(c_int, 9);
pub const CONFIG_ESP_ROM_HAS_CRC_LE = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_CRC_BE = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_MZ_CRC32 = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_JPEG_DECODE = @as(c_int, 1);
pub const CONFIG_ESP_ROM_UART_CLK_IS_XTAL = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_RETARGETABLE_LOCKING = @as(c_int, 1);
pub const CONFIG_ESP_ROM_USB_OTG_NUM = @as(c_int, 3);
pub const CONFIG_ESP_ROM_USB_SERIAL_DEVICE_NUM = @as(c_int, 4);
pub const CONFIG_ESP_ROM_HAS_ERASE_0_REGION_BUG = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_ENCRYPTED_WRITES_USING_LEGACY_DRV = @as(c_int, 1);
pub const CONFIG_ESP_ROM_GET_CLK_FREQ = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_HAL_WDT = @as(c_int, 1);
pub const CONFIG_ESP_ROM_NEEDS_SWSETUP_WORKAROUND = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_LAYOUT_TABLE = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_SPI_FLASH = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_ETS_PRINTF_BUG = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_NEWLIB = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_NEWLIB_NANO_FORMAT = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_NEWLIB_32BIT_TIME = @as(c_int, 1);
pub const CONFIG_ESP_ROM_NEEDS_SET_CACHE_MMU_SIZE = @as(c_int, 1);
pub const CONFIG_ESP_ROM_RAM_APP_NEEDS_MMU_INIT = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_FLASH_COUNT_PAGES_BUG = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_CACHE_SUSPEND_WAITI_BUG = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_CACHE_WRITEBACK_BUG = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_SW_FLOAT = @as(c_int, 1);
pub const CONFIG_ESP_ROM_HAS_VERSION = @as(c_int, 1);
pub const CONFIG_ESP_ROM_SUPPORT_DEEP_SLEEP_WAKEUP_STUB = @as(c_int, 1);
pub const CONFIG_BOOT_ROM_LOG_ALWAYS_ON = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASH_MODE_AUTO_DETECT = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASHMODE_DIO = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASH_SAMPLE_MODE_STR = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASHMODE = "dio";
pub const CONFIG_ESPTOOLPY_FLASHFREQ_80M = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASHFREQ_80M_DEFAULT = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASHFREQ = "80m";
pub const CONFIG_ESPTOOLPY_FLASHSIZE_2MB = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_FLASHSIZE = "2MB";
pub const CONFIG_ESPTOOLPY_BEFORE_RESET = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_BEFORE = "default_reset";
pub const CONFIG_ESPTOOLPY_AFTER_RESET = @as(c_int, 1);
pub const CONFIG_ESPTOOLPY_AFTER = "hard_reset";
pub const CONFIG_ESPTOOLPY_MONITOR_BAUD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 115200, .decimal);
pub const CONFIG_PARTITION_TABLE_SINGLE_APP = @as(c_int, 1);
pub const CONFIG_PARTITION_TABLE_CUSTOM_FILENAME = "partitions.csv";
pub const CONFIG_PARTITION_TABLE_FILENAME = "partitions_singleapp.csv";
pub const CONFIG_PARTITION_TABLE_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const CONFIG_PARTITION_TABLE_MD5 = @as(c_int, 1);
pub const CONFIG_COMPILER_OPTIMIZATION_DEBUG = @as(c_int, 1);
pub const CONFIG_COMPILER_OPTIMIZATION_ASSERTIONS_ENABLE = @as(c_int, 1);
pub const CONFIG_COMPILER_FLOAT_LIB_FROM_GCCLIB = @as(c_int, 1);
pub const CONFIG_COMPILER_OPTIMIZATION_ASSERTION_LEVEL = @as(c_int, 2);
pub const CONFIG_COMPILER_HIDE_PATHS_MACROS = @as(c_int, 1);
pub const CONFIG_COMPILER_STACK_CHECK_MODE_NONE = @as(c_int, 1);
pub const CONFIG_COMPILER_RT_LIB_GCCLIB = @as(c_int, 1);
pub const CONFIG_COMPILER_RT_LIB_NAME = "gcc";
pub const CONFIG_COMPILER_ORPHAN_SECTIONS_PLACE = @as(c_int, 1);
pub const CONFIG_APPTRACE_DEST_NONE = @as(c_int, 1);
pub const CONFIG_APPTRACE_DEST_UART_NONE = @as(c_int, 1);
pub const CONFIG_APPTRACE_UART_TASK_PRIO = @as(c_int, 1);
pub const CONFIG_APPTRACE_LOCK_ENABLE = @as(c_int, 1);
pub const CONFIG_BT_ALARM_MAX_NUM = @as(c_int, 50);
pub const CONFIG_TWAI_ERRATA_FIX_LISTEN_ONLY_DOM = @as(c_int, 1);
pub const CONFIG_EFUSE_MAX_BLK_LEN = @as(c_int, 256);
pub const CONFIG_ESP_TLS_USING_MBEDTLS = @as(c_int, 1);
pub const CONFIG_ESP_TLS_USE_DS_PERIPHERAL = @as(c_int, 1);
pub const CONFIG_ESP_COEX_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_ERR_TO_NAME_LOOKUP = @as(c_int, 1);
pub const CONFIG_GPTIMER_ISR_HANDLER_IN_IRAM = @as(c_int, 1);
pub const CONFIG_SPI_MASTER_ISR_IN_IRAM = @as(c_int, 1);
pub const CONFIG_SPI_SLAVE_ISR_IN_IRAM = @as(c_int, 1);
pub const CONFIG_USJ_ENABLE_USB_SERIAL_JTAG = @as(c_int, 1);
pub const CONFIG_ETH_ENABLED = @as(c_int, 1);
pub const CONFIG_ETH_USE_SPI_ETHERNET = @as(c_int, 1);
pub const CONFIG_ESP_EVENT_POST_FROM_ISR = @as(c_int, 1);
pub const CONFIG_ESP_EVENT_POST_FROM_IRAM_ISR = @as(c_int, 1);
pub const CONFIG_ESP_GDBSTUB_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_GDBSTUB_SUPPORT_TASKS = @as(c_int, 1);
pub const CONFIG_ESP_GDBSTUB_MAX_TASKS = @as(c_int, 32);
pub const CONFIG_ESP_HTTP_CLIENT_ENABLE_HTTPS = @as(c_int, 1);
pub const CONFIG_HTTPD_MAX_REQ_HDR_LEN = @as(c_int, 512);
pub const CONFIG_HTTPD_MAX_URI_LEN = @as(c_int, 512);
pub const CONFIG_HTTPD_ERR_RESP_NO_DELAY = @as(c_int, 1);
pub const CONFIG_HTTPD_PURGE_BUF_LEN = @as(c_int, 32);
pub const CONFIG_ESP32S3_REV_MIN_0 = @as(c_int, 1);
pub const CONFIG_ESP32S3_REV_MIN_FULL = @as(c_int, 0);
pub const CONFIG_ESP_REV_MIN_FULL = @as(c_int, 0);
pub const CONFIG_ESP32S3_REV_MAX_FULL = @as(c_int, 99);
pub const CONFIG_ESP_REV_MAX_FULL = @as(c_int, 99);
pub const CONFIG_ESP_MAC_ADDR_UNIVERSE_WIFI_STA = @as(c_int, 1);
pub const CONFIG_ESP_MAC_ADDR_UNIVERSE_WIFI_AP = @as(c_int, 1);
pub const CONFIG_ESP_MAC_ADDR_UNIVERSE_BT = @as(c_int, 1);
pub const CONFIG_ESP_MAC_ADDR_UNIVERSE_ETH = @as(c_int, 1);
pub const CONFIG_ESP_MAC_UNIVERSAL_MAC_ADDRESSES_FOUR = @as(c_int, 1);
pub const CONFIG_ESP_MAC_UNIVERSAL_MAC_ADDRESSES = @as(c_int, 4);
pub const CONFIG_ESP32S3_UNIVERSAL_MAC_ADDRESSES_FOUR = @as(c_int, 1);
pub const CONFIG_ESP32S3_UNIVERSAL_MAC_ADDRESSES = @as(c_int, 4);
pub const CONFIG_ESP_SLEEP_FLASH_LEAKAGE_WORKAROUND = @as(c_int, 1);
pub const CONFIG_ESP_SLEEP_MSPI_NEED_ALL_IO_PU = @as(c_int, 1);
pub const CONFIG_ESP_SLEEP_RTC_BUS_ISO_WORKAROUND = @as(c_int, 1);
pub const CONFIG_ESP_SLEEP_GPIO_RESET_WORKAROUND = @as(c_int, 1);
pub const CONFIG_ESP_SLEEP_WAIT_FLASH_READY_EXTRA_DELAY = @as(c_int, 2000);
pub const CONFIG_ESP_SLEEP_GPIO_ENABLE_INTERNAL_RESISTORS = @as(c_int, 1);
pub const CONFIG_RTC_CLK_SRC_INT_RC = @as(c_int, 1);
pub const CONFIG_RTC_CLK_CAL_CYCLES = @as(c_int, 1024);
pub const CONFIG_PERIPH_CTRL_FUNC_IN_IRAM = @as(c_int, 1);
pub const CONFIG_GDMA_CTRL_FUNC_IN_IRAM = @as(c_int, 1);
pub const CONFIG_XTAL_FREQ_40 = @as(c_int, 1);
pub const CONFIG_XTAL_FREQ = @as(c_int, 40);
pub const CONFIG_ESP_SPI_BUS_LOCK_ISR_FUNCS_IN_IRAM = @as(c_int, 1);
pub const CONFIG_LCD_PANEL_IO_FORMAT_BUF_SIZE = @as(c_int, 32);
pub const CONFIG_ESP_NETIF_IP_LOST_TIMER_INTERVAL = @as(c_int, 120);
pub const CONFIG_ESP_NETIF_TCPIP_LWIP = @as(c_int, 1);
pub const CONFIG_ESP_NETIF_USES_TCPIP_WITH_BSD_API = @as(c_int, 1);
pub const CONFIG_ESP_PHY_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_PHY_CALIBRATION_AND_DATA_STORAGE = @as(c_int, 1);
pub const CONFIG_ESP_PHY_MAX_WIFI_TX_POWER = @as(c_int, 20);
pub const CONFIG_ESP_PHY_MAX_TX_POWER = @as(c_int, 20);
pub const CONFIG_ESP_PHY_ENABLE_USB = @as(c_int, 1);
pub const CONFIG_ESP_PHY_RF_CAL_PARTIAL = @as(c_int, 1);
pub const CONFIG_ESP_PHY_CALIBRATION_MODE = @as(c_int, 0);
pub const CONFIG_PM_POWER_DOWN_CPU_IN_LIGHT_SLEEP = @as(c_int, 1);
pub const CONFIG_PM_RESTORE_CACHE_TAGMEM_AFTER_LIGHT_SLEEP = @as(c_int, 1);
pub const CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_160 = @as(c_int, 1);
pub const CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ = @as(c_int, 160);
pub const CONFIG_ESP32S3_INSTRUCTION_CACHE_16KB = @as(c_int, 1);
pub const CONFIG_ESP32S3_INSTRUCTION_CACHE_SIZE = @as(c_int, 0x4000);
pub const CONFIG_ESP32S3_INSTRUCTION_CACHE_8WAYS = @as(c_int, 1);
pub const CONFIG_ESP32S3_ICACHE_ASSOCIATED_WAYS = @as(c_int, 8);
pub const CONFIG_ESP32S3_INSTRUCTION_CACHE_LINE_32B = @as(c_int, 1);
pub const CONFIG_ESP32S3_INSTRUCTION_CACHE_LINE_SIZE = @as(c_int, 32);
pub const CONFIG_ESP32S3_DATA_CACHE_32KB = @as(c_int, 1);
pub const CONFIG_ESP32S3_DATA_CACHE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const CONFIG_ESP32S3_DATA_CACHE_8WAYS = @as(c_int, 1);
pub const CONFIG_ESP32S3_DCACHE_ASSOCIATED_WAYS = @as(c_int, 8);
pub const CONFIG_ESP32S3_DATA_CACHE_LINE_32B = @as(c_int, 1);
pub const CONFIG_ESP32S3_DATA_CACHE_LINE_SIZE = @as(c_int, 32);
pub const CONFIG_ESP32S3_TRACEMEM_RESERVE_DRAM = @as(c_int, 0x0);
pub const CONFIG_ESP_SYSTEM_PANIC_PRINT_REBOOT = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_PANIC_REBOOT_DELAY_SECONDS = @as(c_int, 0);
pub const CONFIG_ESP_SYSTEM_RTC_FAST_MEM_AS_HEAP_DEPCHECK = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_ALLOW_RTC_FAST_MEM_AS_HEAP = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_MEMPROT_FEATURE = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_MEMPROT_FEATURE_LOCK = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_EVENT_QUEUE_SIZE = @as(c_int, 32);
pub const CONFIG_ESP_SYSTEM_EVENT_TASK_STACK_SIZE = @as(c_int, 2304);
pub const CONFIG_ESP_MAIN_TASK_STACK_SIZE = @as(c_int, 3584);
pub const CONFIG_ESP_MAIN_TASK_AFFINITY_CPU0 = @as(c_int, 1);
pub const CONFIG_ESP_MAIN_TASK_AFFINITY = @as(c_int, 0x0);
pub const CONFIG_ESP_MINIMAL_SHARED_STACK_SIZE = @as(c_int, 2048);
pub const CONFIG_ESP_CONSOLE_UART_DEFAULT = @as(c_int, 1);
pub const CONFIG_ESP_CONSOLE_SECONDARY_USB_SERIAL_JTAG = @as(c_int, 1);
pub const CONFIG_ESP_CONSOLE_USB_SERIAL_JTAG_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_CONSOLE_UART = @as(c_int, 1);
pub const CONFIG_ESP_CONSOLE_UART_NUM = @as(c_int, 0);
pub const CONFIG_ESP_CONSOLE_ROM_SERIAL_PORT_NUM = @as(c_int, 0);
pub const CONFIG_ESP_CONSOLE_UART_BAUDRATE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 115200, .decimal);
pub const CONFIG_ESP_INT_WDT = @as(c_int, 1);
pub const CONFIG_ESP_INT_WDT_TIMEOUT_MS = @as(c_int, 300);
pub const CONFIG_ESP_INT_WDT_CHECK_CPU1 = @as(c_int, 1);
pub const CONFIG_ESP_TASK_WDT_EN = @as(c_int, 1);
pub const CONFIG_ESP_TASK_WDT_INIT = @as(c_int, 1);
pub const CONFIG_ESP_TASK_WDT_TIMEOUT_S = @as(c_int, 5);
pub const CONFIG_ESP_TASK_WDT_CHECK_IDLE_TASK_CPU0 = @as(c_int, 1);
pub const CONFIG_ESP_TASK_WDT_CHECK_IDLE_TASK_CPU1 = @as(c_int, 1);
pub const CONFIG_ESP_DEBUG_OCDAWARE = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_CHECK_INT_LEVEL_4 = @as(c_int, 1);
pub const CONFIG_ESP_BROWNOUT_DET = @as(c_int, 1);
pub const CONFIG_ESP_BROWNOUT_DET_LVL_SEL_7 = @as(c_int, 1);
pub const CONFIG_ESP_BROWNOUT_DET_LVL = @as(c_int, 7);
pub const CONFIG_ESP_SYSTEM_BROWNOUT_INTR = @as(c_int, 1);
pub const CONFIG_ESP_SYSTEM_BBPLL_RECALIB = @as(c_int, 1);
pub const CONFIG_ESP_IPC_TASK_STACK_SIZE = @as(c_int, 1280);
pub const CONFIG_ESP_IPC_USES_CALLERS_PRIORITY = @as(c_int, 1);
pub const CONFIG_ESP_IPC_ISR_ENABLE = @as(c_int, 1);
pub const CONFIG_ESP_TIME_FUNCS_USE_RTC_TIMER = @as(c_int, 1);
pub const CONFIG_ESP_TIME_FUNCS_USE_ESP_TIMER = @as(c_int, 1);
pub const CONFIG_ESP_TIMER_TASK_STACK_SIZE = @as(c_int, 3584);
pub const CONFIG_ESP_TIMER_INTERRUPT_LEVEL = @as(c_int, 1);
pub const CONFIG_ESP_TIMER_TASK_AFFINITY = @as(c_int, 0x0);
pub const CONFIG_ESP_TIMER_TASK_AFFINITY_CPU0 = @as(c_int, 1);
pub const CONFIG_ESP_TIMER_ISR_AFFINITY_CPU0 = @as(c_int, 1);
pub const CONFIG_ESP_TIMER_IMPL_SYSTIMER = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_STATIC_RX_BUFFER_NUM = @as(c_int, 10);
pub const CONFIG_ESP_WIFI_DYNAMIC_RX_BUFFER_NUM = @as(c_int, 32);
pub const CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_TX_BUFFER_TYPE = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER_NUM = @as(c_int, 32);
pub const CONFIG_ESP_WIFI_STATIC_RX_MGMT_BUFFER = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_DYNAMIC_RX_MGMT_BUF = @as(c_int, 0);
pub const CONFIG_ESP_WIFI_RX_MGMT_BUF_NUM_DEF = @as(c_int, 5);
pub const CONFIG_ESP_WIFI_AMPDU_TX_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_TX_BA_WIN = @as(c_int, 6);
pub const CONFIG_ESP_WIFI_AMPDU_RX_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_RX_BA_WIN = @as(c_int, 6);
pub const CONFIG_ESP_WIFI_NVS_ENABLED = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_TASK_PINNED_TO_CORE_0 = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_SOFTAP_BEACON_MAX_LEN = @as(c_int, 752);
pub const CONFIG_ESP_WIFI_MGMT_SBUF_NUM = @as(c_int, 32);
pub const CONFIG_ESP_WIFI_IRAM_OPT = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_RX_IRAM_OPT = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_ENABLE_WPA3_SAE = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_ENABLE_SAE_PK = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_SOFTAP_SAE_SUPPORT = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_ENABLE_WPA3_OWE_STA = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_SLP_DEFAULT_MIN_ACTIVE_TIME = @as(c_int, 50);
pub const CONFIG_ESP_WIFI_SLP_DEFAULT_MAX_ACTIVE_TIME = @as(c_int, 10);
pub const CONFIG_ESP_WIFI_SLP_DEFAULT_WAIT_BROADCAST_DATA_TIME = @as(c_int, 15);
pub const CONFIG_ESP_WIFI_STA_DISCONNECTED_PM_ENABLE = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_GMAC_SUPPORT = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_SOFTAP_SUPPORT = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_ESPNOW_MAX_ENCRYPT_NUM = @as(c_int, 7);
pub const CONFIG_ESP_WIFI_MBEDTLS_CRYPTO = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_MBEDTLS_TLS_CLIENT = @as(c_int, 1);
pub const CONFIG_ESP_WIFI_ENTERPRISE_SUPPORT = @as(c_int, 1);
pub const CONFIG_ESP_COREDUMP_ENABLE_TO_NONE = @as(c_int, 1);
pub const CONFIG_FATFS_VOLUME_COUNT = @as(c_int, 2);
pub const CONFIG_FATFS_LFN_NONE = @as(c_int, 1);
pub const CONFIG_FATFS_SECTOR_4096 = @as(c_int, 1);
pub const CONFIG_FATFS_CODEPAGE_437 = @as(c_int, 1);
pub const CONFIG_FATFS_CODEPAGE = @as(c_int, 437);
pub const CONFIG_FATFS_FS_LOCK = @as(c_int, 0);
pub const CONFIG_FATFS_TIMEOUT_MS = @as(c_int, 10000);
pub const CONFIG_FATFS_PER_FILE_CACHE = @as(c_int, 1);
pub const CONFIG_FATFS_VFS_FSTAT_BLKSIZE = @as(c_int, 0);
pub const CONFIG_FATFS_LINK_LOCK = @as(c_int, 1);
pub const CONFIG_FREERTOS_HZ = @as(c_int, 100);
pub const CONFIG_FREERTOS_CHECK_STACKOVERFLOW_CANARY = @as(c_int, 1);
pub const CONFIG_FREERTOS_THREAD_LOCAL_STORAGE_POINTERS = @as(c_int, 1);
pub const CONFIG_FREERTOS_IDLE_TASK_STACKSIZE = @as(c_int, 1536);
pub const CONFIG_FREERTOS_MAX_TASK_NAME_LEN = @as(c_int, 16);
pub const CONFIG_FREERTOS_TIMER_SERVICE_TASK_NAME = "Tmr Svc";
pub const CONFIG_FREERTOS_TIMER_TASK_NO_AFFINITY = @as(c_int, 1);
pub const CONFIG_FREERTOS_TIMER_SERVICE_TASK_CORE_AFFINITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex);
pub const CONFIG_FREERTOS_TIMER_TASK_PRIORITY = @as(c_int, 1);
pub const CONFIG_FREERTOS_TIMER_TASK_STACK_DEPTH = @as(c_int, 2048);
pub const CONFIG_FREERTOS_TIMER_QUEUE_LENGTH = @as(c_int, 10);
pub const CONFIG_FREERTOS_QUEUE_REGISTRY_SIZE = @as(c_int, 0);
pub const CONFIG_FREERTOS_TASK_NOTIFICATION_ARRAY_ENTRIES = @as(c_int, 1);
pub const CONFIG_FREERTOS_TASK_FUNCTION_WRAPPER = @as(c_int, 1);
pub const CONFIG_FREERTOS_TLSP_DELETION_CALLBACKS = @as(c_int, 1);
pub const CONFIG_FREERTOS_CHECK_MUTEX_GIVEN_BY_OWNER = @as(c_int, 1);
pub const CONFIG_FREERTOS_ISR_STACKSIZE = @as(c_int, 1536);
pub const CONFIG_FREERTOS_INTERRUPT_BACKTRACE = @as(c_int, 1);
pub const CONFIG_FREERTOS_TICK_SUPPORT_SYSTIMER = @as(c_int, 1);
pub const CONFIG_FREERTOS_CORETIMER_SYSTIMER_LVL1 = @as(c_int, 1);
pub const CONFIG_FREERTOS_SYSTICK_USES_SYSTIMER = @as(c_int, 1);
pub const CONFIG_FREERTOS_PORT = @as(c_int, 1);
pub const CONFIG_FREERTOS_NO_AFFINITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex);
pub const CONFIG_FREERTOS_SUPPORT_STATIC_ALLOCATION = @as(c_int, 1);
pub const CONFIG_FREERTOS_DEBUG_OCDAWARE = @as(c_int, 1);
pub const CONFIG_FREERTOS_ENABLE_TASK_SNAPSHOT = @as(c_int, 1);
pub const CONFIG_FREERTOS_PLACE_SNAPSHOT_FUNS_INTO_FLASH = @as(c_int, 1);
pub const CONFIG_FREERTOS_NUMBER_OF_CORES = @as(c_int, 2);
pub const CONFIG_HAL_ASSERTION_EQUALS_SYSTEM = @as(c_int, 1);
pub const CONFIG_HAL_DEFAULT_ASSERTION_LEVEL = @as(c_int, 2);
pub const CONFIG_HAL_WDT_USE_ROM_IMPL = @as(c_int, 1);
pub const CONFIG_HAL_SPI_MASTER_FUNC_IN_IRAM = @as(c_int, 1);
pub const CONFIG_HAL_SPI_SLAVE_FUNC_IN_IRAM = @as(c_int, 1);
pub const CONFIG_HEAP_POISONING_DISABLED = @as(c_int, 1);
pub const CONFIG_HEAP_TRACING_OFF = @as(c_int, 1);
pub const CONFIG_LOG_DEFAULT_LEVEL_INFO = @as(c_int, 1);
pub const CONFIG_LOG_DEFAULT_LEVEL = @as(c_int, 3);
pub const CONFIG_LOG_MAXIMUM_EQUALS_DEFAULT = @as(c_int, 1);
pub const CONFIG_LOG_MAXIMUM_LEVEL = @as(c_int, 3);
pub const CONFIG_LOG_COLORS = @as(c_int, 1);
pub const CONFIG_LOG_TIMESTAMP_SOURCE_RTOS = @as(c_int, 1);
pub const CONFIG_LWIP_ENABLE = @as(c_int, 1);
pub const CONFIG_LWIP_LOCAL_HOSTNAME = "espressif";
pub const CONFIG_LWIP_TCPIP_TASK_PRIO = @as(c_int, 18);
pub const CONFIG_LWIP_DNS_SUPPORT_MDNS_QUERIES = @as(c_int, 1);
pub const CONFIG_LWIP_TIMERS_ONDEMAND = @as(c_int, 1);
pub const CONFIG_LWIP_ND6 = @as(c_int, 1);
pub const CONFIG_LWIP_MAX_SOCKETS = @as(c_int, 10);
pub const CONFIG_LWIP_SO_REUSE = @as(c_int, 1);
pub const CONFIG_LWIP_SO_REUSE_RXTOALL = @as(c_int, 1);
pub const CONFIG_LWIP_IP_DEFAULT_TTL = @as(c_int, 64);
pub const CONFIG_LWIP_IP4_FRAG = @as(c_int, 1);
pub const CONFIG_LWIP_IP6_FRAG = @as(c_int, 1);
pub const CONFIG_LWIP_IP_REASS_MAX_PBUFS = @as(c_int, 10);
pub const CONFIG_LWIP_ESP_GRATUITOUS_ARP = @as(c_int, 1);
pub const CONFIG_LWIP_GARP_TMR_INTERVAL = @as(c_int, 60);
pub const CONFIG_LWIP_ESP_MLDV6_REPORT = @as(c_int, 1);
pub const CONFIG_LWIP_MLDV6_TMR_INTERVAL = @as(c_int, 40);
pub const CONFIG_LWIP_TCPIP_RECVMBOX_SIZE = @as(c_int, 32);
pub const CONFIG_LWIP_DHCP_DOES_ARP_CHECK = @as(c_int, 1);
pub const CONFIG_LWIP_DHCP_DISABLE_VENDOR_CLASS_ID = @as(c_int, 1);
pub const CONFIG_LWIP_DHCP_OPTIONS_LEN = @as(c_int, 68);
pub const CONFIG_LWIP_NUM_NETIF_CLIENT_DATA = @as(c_int, 0);
pub const CONFIG_LWIP_DHCP_COARSE_TIMER_SECS = @as(c_int, 1);
pub const CONFIG_LWIP_DHCPS = @as(c_int, 1);
pub const CONFIG_LWIP_DHCPS_LEASE_UNIT = @as(c_int, 60);
pub const CONFIG_LWIP_DHCPS_MAX_STATION_NUM = @as(c_int, 8);
pub const CONFIG_LWIP_DHCPS_STATIC_ENTRIES = @as(c_int, 1);
pub const CONFIG_LWIP_IPV4 = @as(c_int, 1);
pub const CONFIG_LWIP_IPV6 = @as(c_int, 1);
pub const CONFIG_LWIP_IPV6_NUM_ADDRESSES = @as(c_int, 3);
pub const CONFIG_LWIP_NETIF_LOOPBACK = @as(c_int, 1);
pub const CONFIG_LWIP_LOOPBACK_MAX_PBUFS = @as(c_int, 8);
pub const CONFIG_LWIP_MAX_ACTIVE_TCP = @as(c_int, 16);
pub const CONFIG_LWIP_MAX_LISTENING_TCP = @as(c_int, 16);
pub const CONFIG_LWIP_TCP_HIGH_SPEED_RETRANSMISSION = @as(c_int, 1);
pub const CONFIG_LWIP_TCP_MAXRTX = @as(c_int, 12);
pub const CONFIG_LWIP_TCP_SYNMAXRTX = @as(c_int, 12);
pub const CONFIG_LWIP_TCP_MSS = @as(c_int, 1440);
pub const CONFIG_LWIP_TCP_TMR_INTERVAL = @as(c_int, 250);
pub const CONFIG_LWIP_TCP_MSL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const CONFIG_LWIP_TCP_FIN_WAIT_TIMEOUT = @as(c_int, 20000);
pub const CONFIG_LWIP_TCP_SND_BUF_DEFAULT = @as(c_int, 5760);
pub const CONFIG_LWIP_TCP_WND_DEFAULT = @as(c_int, 5760);
pub const CONFIG_LWIP_TCP_RECVMBOX_SIZE = @as(c_int, 6);
pub const CONFIG_LWIP_TCP_ACCEPTMBOX_SIZE = @as(c_int, 6);
pub const CONFIG_LWIP_TCP_QUEUE_OOSEQ = @as(c_int, 1);
pub const CONFIG_LWIP_TCP_OOSEQ_TIMEOUT = @as(c_int, 6);
pub const CONFIG_LWIP_TCP_OOSEQ_MAX_PBUFS = @as(c_int, 4);
pub const CONFIG_LWIP_TCP_OVERSIZE_MSS = @as(c_int, 1);
pub const CONFIG_LWIP_TCP_RTO_TIME = @as(c_int, 1500);
pub const CONFIG_LWIP_MAX_UDP_PCBS = @as(c_int, 16);
pub const CONFIG_LWIP_UDP_RECVMBOX_SIZE = @as(c_int, 6);
pub const CONFIG_LWIP_CHECKSUM_CHECK_ICMP = @as(c_int, 1);
pub const CONFIG_LWIP_TCPIP_TASK_STACK_SIZE = @as(c_int, 3072);
pub const CONFIG_LWIP_TCPIP_TASK_AFFINITY_NO_AFFINITY = @as(c_int, 1);
pub const CONFIG_LWIP_TCPIP_TASK_AFFINITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex);
pub const CONFIG_LWIP_IPV6_MEMP_NUM_ND6_QUEUE = @as(c_int, 3);
pub const CONFIG_LWIP_IPV6_ND6_NUM_NEIGHBORS = @as(c_int, 5);
pub const CONFIG_LWIP_ICMP = @as(c_int, 1);
pub const CONFIG_LWIP_MAX_RAW_PCBS = @as(c_int, 16);
pub const CONFIG_LWIP_SNTP_MAX_SERVERS = @as(c_int, 1);
pub const CONFIG_LWIP_SNTP_UPDATE_DELAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 3600000, .decimal);
pub const CONFIG_LWIP_SNTP_STARTUP_DELAY = @as(c_int, 1);
pub const CONFIG_LWIP_SNTP_MAXIMUM_STARTUP_DELAY = @as(c_int, 5000);
pub const CONFIG_LWIP_DNS_MAX_SERVERS = @as(c_int, 3);
pub const CONFIG_LWIP_BRIDGEIF_MAX_PORTS = @as(c_int, 7);
pub const CONFIG_LWIP_ESP_LWIP_ASSERT = @as(c_int, 1);
pub const CONFIG_LWIP_HOOK_TCP_ISN_DEFAULT = @as(c_int, 1);
pub const CONFIG_LWIP_HOOK_IP6_ROUTE_NONE = @as(c_int, 1);
pub const CONFIG_LWIP_HOOK_ND6_GET_GW_NONE = @as(c_int, 1);
pub const CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_NONE = @as(c_int, 1);
pub const CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_NONE = @as(c_int, 1);
pub const CONFIG_LWIP_HOOK_IP6_INPUT_NONE = @as(c_int, 1);
pub const CONFIG_MBEDTLS_INTERNAL_MEM_ALLOC = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ASYMMETRIC_CONTENT_LEN = @as(c_int, 1);
pub const CONFIG_MBEDTLS_SSL_IN_CONTENT_LEN = @as(c_int, 16384);
pub const CONFIG_MBEDTLS_SSL_OUT_CONTENT_LEN = @as(c_int, 4096);
pub const CONFIG_MBEDTLS_SSL_KEEP_PEER_CERTIFICATE = @as(c_int, 1);
pub const CONFIG_MBEDTLS_PKCS7_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_CERTIFICATE_BUNDLE = @as(c_int, 1);
pub const CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_FULL = @as(c_int, 1);
pub const CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_MAX_CERTS = @as(c_int, 200);
pub const CONFIG_MBEDTLS_CMAC_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_HARDWARE_AES = @as(c_int, 1);
pub const CONFIG_MBEDTLS_AES_USE_INTERRUPT = @as(c_int, 1);
pub const CONFIG_MBEDTLS_AES_INTERRUPT_LEVEL = @as(c_int, 0);
pub const CONFIG_MBEDTLS_GCM_SUPPORT_NON_AES_CIPHER = @as(c_int, 1);
pub const CONFIG_MBEDTLS_HARDWARE_MPI = @as(c_int, 1);
pub const CONFIG_MBEDTLS_MPI_USE_INTERRUPT = @as(c_int, 1);
pub const CONFIG_MBEDTLS_MPI_INTERRUPT_LEVEL = @as(c_int, 0);
pub const CONFIG_MBEDTLS_HARDWARE_SHA = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ROM_MD5 = @as(c_int, 1);
pub const CONFIG_MBEDTLS_HAVE_TIME = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECDSA_DETERMINISTIC = @as(c_int, 1);
pub const CONFIG_MBEDTLS_SHA512_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_TLS_SERVER_AND_CLIENT = @as(c_int, 1);
pub const CONFIG_MBEDTLS_TLS_SERVER = @as(c_int, 1);
pub const CONFIG_MBEDTLS_TLS_CLIENT = @as(c_int, 1);
pub const CONFIG_MBEDTLS_TLS_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_KEY_EXCHANGE_RSA = @as(c_int, 1);
pub const CONFIG_MBEDTLS_KEY_EXCHANGE_ELLIPTIC_CURVE = @as(c_int, 1);
pub const CONFIG_MBEDTLS_KEY_EXCHANGE_ECDHE_RSA = @as(c_int, 1);
pub const CONFIG_MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA = @as(c_int, 1);
pub const CONFIG_MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA = @as(c_int, 1);
pub const CONFIG_MBEDTLS_KEY_EXCHANGE_ECDH_RSA = @as(c_int, 1);
pub const CONFIG_MBEDTLS_SSL_RENEGOTIATION = @as(c_int, 1);
pub const CONFIG_MBEDTLS_SSL_PROTO_TLS1_2 = @as(c_int, 1);
pub const CONFIG_MBEDTLS_SSL_ALPN = @as(c_int, 1);
pub const CONFIG_MBEDTLS_CLIENT_SSL_SESSION_TICKETS = @as(c_int, 1);
pub const CONFIG_MBEDTLS_SERVER_SSL_SESSION_TICKETS = @as(c_int, 1);
pub const CONFIG_MBEDTLS_AES_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_CCM_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_GCM_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_PEM_PARSE_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_PEM_WRITE_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_X509_CRL_PARSE_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_X509_CSR_PARSE_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECDH_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECDSA_C = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP192R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP224R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP256R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP384R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP521R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP192K1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP224K1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_SECP256K1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_BP256R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_BP384R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_BP512R1_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_DP_CURVE25519_ENABLED = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_NIST_OPTIM = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ECP_FIXED_POINT_OPTIM = @as(c_int, 1);
pub const CONFIG_MBEDTLS_ERROR_STRINGS = @as(c_int, 1);
pub const CONFIG_MQTT_PROTOCOL_311 = @as(c_int, 1);
pub const CONFIG_MQTT_TRANSPORT_SSL = @as(c_int, 1);
pub const CONFIG_MQTT_TRANSPORT_WEBSOCKET = @as(c_int, 1);
pub const CONFIG_MQTT_TRANSPORT_WEBSOCKET_SECURE = @as(c_int, 1);
pub const CONFIG_NEWLIB_STDOUT_LINE_ENDING_CRLF = @as(c_int, 1);
pub const CONFIG_NEWLIB_STDIN_LINE_ENDING_CR = @as(c_int, 1);
pub const CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC_HRT = @as(c_int, 1);
pub const CONFIG_OPENTHREAD_NETWORK_NAME = "OpenThread-ESP";
pub const CONFIG_OPENTHREAD_MESH_LOCAL_PREFIX = "fd00:db8:a0:0::/64";
pub const CONFIG_OPENTHREAD_NETWORK_CHANNEL = @as(c_int, 15);
pub const CONFIG_OPENTHREAD_NETWORK_PANID = @as(c_int, 0x1234);
pub const CONFIG_OPENTHREAD_NETWORK_EXTPANID = "dead00beef00cafe";
pub const CONFIG_OPENTHREAD_NETWORK_MASTERKEY = "00112233445566778899aabbccddeeff";
pub const CONFIG_OPENTHREAD_NETWORK_PSKC = "104810e2315100afd6bc9215a6bfac53";
pub const CONFIG_OPENTHREAD_XTAL_ACCURACY = @as(c_int, 130);
pub const CONFIG_OPENTHREAD_RX_ON_WHEN_IDLE = @as(c_int, 1);
pub const CONFIG_ESP_PROTOCOMM_SUPPORT_SECURITY_VERSION_0 = @as(c_int, 1);
pub const CONFIG_ESP_PROTOCOMM_SUPPORT_SECURITY_VERSION_1 = @as(c_int, 1);
pub const CONFIG_ESP_PROTOCOMM_SUPPORT_SECURITY_VERSION_2 = @as(c_int, 1);
pub const CONFIG_PTHREAD_TASK_PRIO_DEFAULT = @as(c_int, 5);
pub const CONFIG_PTHREAD_TASK_STACK_SIZE_DEFAULT = @as(c_int, 3072);
pub const CONFIG_PTHREAD_STACK_MIN = @as(c_int, 768);
pub const CONFIG_PTHREAD_DEFAULT_CORE_NO_AFFINITY = @as(c_int, 1);
pub const CONFIG_PTHREAD_TASK_CORE_DEFAULT = -@as(c_int, 1);
pub const CONFIG_PTHREAD_TASK_NAME_DEFAULT = "pthread";
pub const CONFIG_MMU_PAGE_SIZE_64KB = @as(c_int, 1);
pub const CONFIG_MMU_PAGE_MODE = "64KB";
pub const CONFIG_MMU_PAGE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex);
pub const CONFIG_SPI_FLASH_BROWNOUT_RESET_XMC = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_BROWNOUT_RESET = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_HPM_AUTO = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_HPM_ON = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_HPM_DC_AUTO = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUSPEND_QVL_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUSPEND_TSUS_VAL_US = @as(c_int, 50);
pub const CONFIG_SPI_FLASH_ROM_DRIVER_PATCH = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_DANGEROUS_WRITE_ABORTS = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_YIELD_DURING_ERASE = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_ERASE_YIELD_DURATION_MS = @as(c_int, 20);
pub const CONFIG_SPI_FLASH_ERASE_YIELD_TICKS = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_WRITE_CHUNK_SIZE = @as(c_int, 8192);
pub const CONFIG_SPI_FLASH_VENDOR_XMC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_VENDOR_GD_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_VENDOR_ISSI_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_VENDOR_MXIC_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_VENDOR_WINBOND_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_VENDOR_BOYA_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_VENDOR_TH_SUPPORTED = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_ISSI_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_MXIC_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_GD_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_WINBOND_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_BOYA_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_TH_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_SUPPORT_MXIC_OPI_CHIP = @as(c_int, 1);
pub const CONFIG_SPI_FLASH_ENABLE_ENCRYPTED_READ_WRITE = @as(c_int, 1);
pub const CONFIG_SPIFFS_MAX_PARTITIONS = @as(c_int, 3);
pub const CONFIG_SPIFFS_CACHE = @as(c_int, 1);
pub const CONFIG_SPIFFS_CACHE_WR = @as(c_int, 1);
pub const CONFIG_SPIFFS_PAGE_CHECK = @as(c_int, 1);
pub const CONFIG_SPIFFS_GC_MAX_RUNS = @as(c_int, 10);
pub const CONFIG_SPIFFS_PAGE_SIZE = @as(c_int, 256);
pub const CONFIG_SPIFFS_OBJ_NAME_LEN = @as(c_int, 32);
pub const CONFIG_SPIFFS_USE_MAGIC = @as(c_int, 1);
pub const CONFIG_SPIFFS_USE_MAGIC_LENGTH = @as(c_int, 1);
pub const CONFIG_SPIFFS_META_LENGTH = @as(c_int, 4);
pub const CONFIG_SPIFFS_USE_MTIME = @as(c_int, 1);
pub const CONFIG_WS_TRANSPORT = @as(c_int, 1);
pub const CONFIG_WS_BUFFER_SIZE = @as(c_int, 1024);
pub const CONFIG_UNITY_ENABLE_FLOAT = @as(c_int, 1);
pub const CONFIG_UNITY_ENABLE_DOUBLE = @as(c_int, 1);
pub const CONFIG_UNITY_ENABLE_IDF_TEST_RUNNER = @as(c_int, 1);
pub const CONFIG_USB_HOST_CONTROL_TRANSFER_MAX_SIZE = @as(c_int, 256);
pub const CONFIG_USB_HOST_HW_BUFFER_BIAS_BALANCED = @as(c_int, 1);
pub const CONFIG_USB_HOST_DEBOUNCE_DELAY_MS = @as(c_int, 250);
pub const CONFIG_USB_HOST_RESET_HOLD_MS = @as(c_int, 30);
pub const CONFIG_USB_HOST_RESET_RECOVERY_MS = @as(c_int, 30);
pub const CONFIG_USB_HOST_SET_ADDR_RECOVERY_MS = @as(c_int, 10);
pub const CONFIG_USB_OTG_SUPPORTED = @as(c_int, 1);
pub const CONFIG_VFS_SUPPORT_IO = @as(c_int, 1);
pub const CONFIG_VFS_SUPPORT_DIR = @as(c_int, 1);
pub const CONFIG_VFS_SUPPORT_SELECT = @as(c_int, 1);
pub const CONFIG_VFS_SUPPRESS_SELECT_DEBUG_OUTPUT = @as(c_int, 1);
pub const CONFIG_VFS_SUPPORT_TERMIOS = @as(c_int, 1);
pub const CONFIG_VFS_MAX_COUNT = @as(c_int, 8);
pub const CONFIG_VFS_SEMIHOSTFS_MAX_MOUNT_POINTS = @as(c_int, 1);
pub const CONFIG_WL_SECTOR_SIZE_4096 = @as(c_int, 1);
pub const CONFIG_WL_SECTOR_SIZE = @as(c_int, 4096);
pub const CONFIG_WIFI_PROV_SCAN_MAX_ENTRIES = @as(c_int, 16);
pub const CONFIG_WIFI_PROV_AUTOSTOP_TIMEOUT = @as(c_int, 30);
pub const CONFIG_WIFI_PROV_STA_ALL_CHANNEL_SCAN = @as(c_int, 1);
pub const CONFIG_BROWNOUT_DET = CONFIG_ESP_BROWNOUT_DET;
pub const CONFIG_BROWNOUT_DET_LVL = CONFIG_ESP_BROWNOUT_DET_LVL;
pub const CONFIG_BROWNOUT_DET_LVL_SEL_7 = CONFIG_ESP_BROWNOUT_DET_LVL_SEL_7;
pub const CONFIG_COMPILER_OPTIMIZATION_DEFAULT = CONFIG_COMPILER_OPTIMIZATION_DEBUG;
pub const CONFIG_COMPILER_OPTIMIZATION_LEVEL_DEBUG = CONFIG_COMPILER_OPTIMIZATION_DEBUG;
pub const CONFIG_CONSOLE_UART = CONFIG_ESP_CONSOLE_UART;
pub const CONFIG_CONSOLE_UART_BAUDRATE = CONFIG_ESP_CONSOLE_UART_BAUDRATE;
pub const CONFIG_CONSOLE_UART_DEFAULT = CONFIG_ESP_CONSOLE_UART_DEFAULT;
pub const CONFIG_CONSOLE_UART_NUM = CONFIG_ESP_CONSOLE_UART_NUM;
pub const CONFIG_ESP32S3_BROWNOUT_DET = CONFIG_ESP_BROWNOUT_DET;
pub const CONFIG_ESP32S3_BROWNOUT_DET_LVL = CONFIG_ESP_BROWNOUT_DET_LVL;
pub const CONFIG_ESP32S3_BROWNOUT_DET_LVL_SEL_7 = CONFIG_ESP_BROWNOUT_DET_LVL_SEL_7;
pub const CONFIG_ESP32S3_DEBUG_OCDAWARE = CONFIG_ESP_DEBUG_OCDAWARE;
pub const CONFIG_ESP32S3_DEEP_SLEEP_WAKEUP_DELAY = CONFIG_ESP_SLEEP_WAIT_FLASH_READY_EXTRA_DELAY;
pub const CONFIG_ESP32S3_DEFAULT_CPU_FREQ_160 = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_160;
pub const CONFIG_ESP32S3_DEFAULT_CPU_FREQ_MHZ = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ;
pub const CONFIG_ESP32S3_RTC_CLK_CAL_CYCLES = CONFIG_RTC_CLK_CAL_CYCLES;
pub const CONFIG_ESP32S3_RTC_CLK_SRC_INT_RC = CONFIG_RTC_CLK_SRC_INT_RC;
pub const CONFIG_ESP32S3_TIME_SYSCALL_USE_RTC_FRC1 = CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC_HRT;
pub const CONFIG_ESP32S3_TIME_SYSCALL_USE_RTC_SYSTIMER = CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC_HRT;
pub const CONFIG_ESP32_APPTRACE_DEST_NONE = CONFIG_APPTRACE_DEST_NONE;
pub const CONFIG_ESP32_APPTRACE_LOCK_ENABLE = CONFIG_APPTRACE_LOCK_ENABLE;
pub const CONFIG_ESP32_DEFAULT_PTHREAD_CORE_NO_AFFINITY = CONFIG_PTHREAD_DEFAULT_CORE_NO_AFFINITY;
pub const CONFIG_ESP32_ENABLE_COREDUMP_TO_NONE = CONFIG_ESP_COREDUMP_ENABLE_TO_NONE;
pub const CONFIG_ESP32_PHY_CALIBRATION_AND_DATA_STORAGE = CONFIG_ESP_PHY_CALIBRATION_AND_DATA_STORAGE;
pub const CONFIG_ESP32_PHY_MAX_TX_POWER = CONFIG_ESP_PHY_MAX_TX_POWER;
pub const CONFIG_ESP32_PHY_MAX_WIFI_TX_POWER = CONFIG_ESP_PHY_MAX_WIFI_TX_POWER;
pub const CONFIG_ESP32_PTHREAD_STACK_MIN = CONFIG_PTHREAD_STACK_MIN;
pub const CONFIG_ESP32_PTHREAD_TASK_CORE_DEFAULT = CONFIG_PTHREAD_TASK_CORE_DEFAULT;
pub const CONFIG_ESP32_PTHREAD_TASK_NAME_DEFAULT = CONFIG_PTHREAD_TASK_NAME_DEFAULT;
pub const CONFIG_ESP32_PTHREAD_TASK_PRIO_DEFAULT = CONFIG_PTHREAD_TASK_PRIO_DEFAULT;
pub const CONFIG_ESP32_PTHREAD_TASK_STACK_SIZE_DEFAULT = CONFIG_PTHREAD_TASK_STACK_SIZE_DEFAULT;
pub const CONFIG_ESP32_WIFI_AMPDU_RX_ENABLED = CONFIG_ESP_WIFI_AMPDU_RX_ENABLED;
pub const CONFIG_ESP32_WIFI_AMPDU_TX_ENABLED = CONFIG_ESP_WIFI_AMPDU_TX_ENABLED;
pub const CONFIG_ESP32_WIFI_DYNAMIC_RX_BUFFER_NUM = CONFIG_ESP_WIFI_DYNAMIC_RX_BUFFER_NUM;
pub const CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER = CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER;
pub const CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER_NUM = CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER_NUM;
pub const CONFIG_ESP32_WIFI_ENABLED = CONFIG_ESP_WIFI_ENABLED;
pub const CONFIG_ESP32_WIFI_ENABLE_WPA3_OWE_STA = CONFIG_ESP_WIFI_ENABLE_WPA3_OWE_STA;
pub const CONFIG_ESP32_WIFI_ENABLE_WPA3_SAE = CONFIG_ESP_WIFI_ENABLE_WPA3_SAE;
pub const CONFIG_ESP32_WIFI_IRAM_OPT = CONFIG_ESP_WIFI_IRAM_OPT;
pub const CONFIG_ESP32_WIFI_MGMT_SBUF_NUM = CONFIG_ESP_WIFI_MGMT_SBUF_NUM;
pub const CONFIG_ESP32_WIFI_NVS_ENABLED = CONFIG_ESP_WIFI_NVS_ENABLED;
pub const CONFIG_ESP32_WIFI_RX_BA_WIN = CONFIG_ESP_WIFI_RX_BA_WIN;
pub const CONFIG_ESP32_WIFI_RX_IRAM_OPT = CONFIG_ESP_WIFI_RX_IRAM_OPT;
pub const CONFIG_ESP32_WIFI_SOFTAP_BEACON_MAX_LEN = CONFIG_ESP_WIFI_SOFTAP_BEACON_MAX_LEN;
pub const CONFIG_ESP32_WIFI_STATIC_RX_BUFFER_NUM = CONFIG_ESP_WIFI_STATIC_RX_BUFFER_NUM;
pub const CONFIG_ESP32_WIFI_TASK_PINNED_TO_CORE_0 = CONFIG_ESP_WIFI_TASK_PINNED_TO_CORE_0;
pub const CONFIG_ESP32_WIFI_TX_BA_WIN = CONFIG_ESP_WIFI_TX_BA_WIN;
pub const CONFIG_ESP32_WIFI_TX_BUFFER_TYPE = CONFIG_ESP_WIFI_TX_BUFFER_TYPE;
pub const CONFIG_ESP_GRATUITOUS_ARP = CONFIG_LWIP_ESP_GRATUITOUS_ARP;
pub const CONFIG_ESP_SLEEP_DEEP_SLEEP_WAKEUP_DELAY = CONFIG_ESP_SLEEP_WAIT_FLASH_READY_EXTRA_DELAY;
pub const CONFIG_ESP_SYSTEM_PM_POWER_DOWN_CPU = CONFIG_PM_POWER_DOWN_CPU_IN_LIGHT_SLEEP;
pub const CONFIG_ESP_TASK_WDT = CONFIG_ESP_TASK_WDT_INIT;
pub const CONFIG_FLASHMODE_DIO = CONFIG_ESPTOOLPY_FLASHMODE_DIO;
pub const CONFIG_GARP_TMR_INTERVAL = CONFIG_LWIP_GARP_TMR_INTERVAL;
pub const CONFIG_GDBSTUB_MAX_TASKS = CONFIG_ESP_GDBSTUB_MAX_TASKS;
pub const CONFIG_GDBSTUB_SUPPORT_TASKS = CONFIG_ESP_GDBSTUB_SUPPORT_TASKS;
pub const CONFIG_INT_WDT = CONFIG_ESP_INT_WDT;
pub const CONFIG_INT_WDT_CHECK_CPU1 = CONFIG_ESP_INT_WDT_CHECK_CPU1;
pub const CONFIG_INT_WDT_TIMEOUT_MS = CONFIG_ESP_INT_WDT_TIMEOUT_MS;
pub const CONFIG_IPC_TASK_STACK_SIZE = CONFIG_ESP_IPC_TASK_STACK_SIZE;
pub const CONFIG_LOG_BOOTLOADER_LEVEL = CONFIG_BOOTLOADER_LOG_LEVEL;
pub const CONFIG_LOG_BOOTLOADER_LEVEL_INFO = CONFIG_BOOTLOADER_LOG_LEVEL_INFO;
pub const CONFIG_MAIN_TASK_STACK_SIZE = CONFIG_ESP_MAIN_TASK_STACK_SIZE;
pub const CONFIG_MONITOR_BAUD = CONFIG_ESPTOOLPY_MONITOR_BAUD;
pub const CONFIG_OPTIMIZATION_ASSERTIONS_ENABLED = CONFIG_COMPILER_OPTIMIZATION_ASSERTIONS_ENABLE;
pub const CONFIG_OPTIMIZATION_ASSERTION_LEVEL = CONFIG_COMPILER_OPTIMIZATION_ASSERTION_LEVEL;
pub const CONFIG_OPTIMIZATION_LEVEL_DEBUG = CONFIG_COMPILER_OPTIMIZATION_DEBUG;
pub const CONFIG_PM_POWER_DOWN_TAGMEM_IN_LIGHT_SLEEP = CONFIG_PM_RESTORE_CACHE_TAGMEM_AFTER_LIGHT_SLEEP;
pub const CONFIG_POST_EVENTS_FROM_IRAM_ISR = CONFIG_ESP_EVENT_POST_FROM_IRAM_ISR;
pub const CONFIG_POST_EVENTS_FROM_ISR = CONFIG_ESP_EVENT_POST_FROM_ISR;
pub const CONFIG_SEMIHOSTFS_MAX_MOUNT_POINTS = CONFIG_VFS_SEMIHOSTFS_MAX_MOUNT_POINTS;
pub const CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_ABORTS = CONFIG_SPI_FLASH_DANGEROUS_WRITE_ABORTS;
pub const CONFIG_STACK_CHECK_NONE = CONFIG_COMPILER_STACK_CHECK_MODE_NONE;
pub const CONFIG_SUPPORT_TERMIOS = CONFIG_VFS_SUPPORT_TERMIOS;
pub const CONFIG_SUPPRESS_SELECT_DEBUG_OUTPUT = CONFIG_VFS_SUPPRESS_SELECT_DEBUG_OUTPUT;
pub const CONFIG_SYSTEM_EVENT_QUEUE_SIZE = CONFIG_ESP_SYSTEM_EVENT_QUEUE_SIZE;
pub const CONFIG_SYSTEM_EVENT_TASK_STACK_SIZE = CONFIG_ESP_SYSTEM_EVENT_TASK_STACK_SIZE;
pub const CONFIG_TASK_WDT = CONFIG_ESP_TASK_WDT_INIT;
pub const CONFIG_TASK_WDT_CHECK_IDLE_TASK_CPU0 = CONFIG_ESP_TASK_WDT_CHECK_IDLE_TASK_CPU0;
pub const CONFIG_TASK_WDT_CHECK_IDLE_TASK_CPU1 = CONFIG_ESP_TASK_WDT_CHECK_IDLE_TASK_CPU1;
pub const CONFIG_TASK_WDT_TIMEOUT_S = CONFIG_ESP_TASK_WDT_TIMEOUT_S;
pub const CONFIG_TCPIP_RECVMBOX_SIZE = CONFIG_LWIP_TCPIP_RECVMBOX_SIZE;
pub const CONFIG_TCPIP_TASK_AFFINITY = CONFIG_LWIP_TCPIP_TASK_AFFINITY;
pub const CONFIG_TCPIP_TASK_AFFINITY_NO_AFFINITY = CONFIG_LWIP_TCPIP_TASK_AFFINITY_NO_AFFINITY;
pub const CONFIG_TCPIP_TASK_STACK_SIZE = CONFIG_LWIP_TCPIP_TASK_STACK_SIZE;
pub const CONFIG_TCP_MAXRTX = CONFIG_LWIP_TCP_MAXRTX;
pub const CONFIG_TCP_MSL = CONFIG_LWIP_TCP_MSL;
pub const CONFIG_TCP_MSS = CONFIG_LWIP_TCP_MSS;
pub const CONFIG_TCP_OVERSIZE_MSS = CONFIG_LWIP_TCP_OVERSIZE_MSS;
pub const CONFIG_TCP_QUEUE_OOSEQ = CONFIG_LWIP_TCP_QUEUE_OOSEQ;
pub const CONFIG_TCP_RECVMBOX_SIZE = CONFIG_LWIP_TCP_RECVMBOX_SIZE;
pub const CONFIG_TCP_SND_BUF_DEFAULT = CONFIG_LWIP_TCP_SND_BUF_DEFAULT;
pub const CONFIG_TCP_SYNMAXRTX = CONFIG_LWIP_TCP_SYNMAXRTX;
pub const CONFIG_TCP_WND_DEFAULT = CONFIG_LWIP_TCP_WND_DEFAULT;
pub const CONFIG_TIMER_QUEUE_LENGTH = CONFIG_FREERTOS_TIMER_QUEUE_LENGTH;
pub const CONFIG_TIMER_TASK_PRIORITY = CONFIG_FREERTOS_TIMER_TASK_PRIORITY;
pub const CONFIG_TIMER_TASK_STACK_DEPTH = CONFIG_FREERTOS_TIMER_TASK_STACK_DEPTH;
pub const CONFIG_TIMER_TASK_STACK_SIZE = CONFIG_ESP_TIMER_TASK_STACK_SIZE;
pub const CONFIG_UDP_RECVMBOX_SIZE = CONFIG_LWIP_UDP_RECVMBOX_SIZE;
pub const CONFIG_WPA_MBEDTLS_CRYPTO = CONFIG_ESP_WIFI_MBEDTLS_CRYPTO;
pub const CONFIG_WPA_MBEDTLS_TLS_CLIENT = CONFIG_ESP_WIFI_MBEDTLS_TLS_CLIENT;
pub const INC_FREERTOS_H = "";
pub const _STDINT_H = "";
pub const _SYS__INTSUP_H = "";
pub const __STDINT_EXP = @compileError("unable to translate macro: undefined identifier `__`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/_intsup.h:16:9
pub const signed = @as(c_int, 0);
pub const char = @as(c_int, 0);
pub const short = @as(c_int, 1);
pub const __int20 = @as(c_int, 2);
pub const __int20__ = @as(c_int, 2);
pub const int = @as(c_int, 2);
pub const long = @as(c_int, 4);
pub const _INTPTR_EQ_INT = "";
pub const __INT8 = "hh";
pub const __INT16 = "h";
pub const __INT32 = "";
pub const __INT64 = "ll";
pub const __FAST8 = "hh";
pub const __FAST16 = "h";
pub const __FAST32 = "";
pub const __FAST64 = "ll";
pub const __LEAST8 = "hh";
pub const __LEAST16 = "h";
pub const __LEAST32 = "";
pub const __LEAST64 = "ll";
pub const _SYS__STDINT_H = "";
pub const _INT8_T_DECLARED = "";
pub const _UINT8_T_DECLARED = "";
pub const __int8_t_defined = @as(c_int, 1);
pub const _INT16_T_DECLARED = "";
pub const _UINT16_T_DECLARED = "";
pub const __int16_t_defined = @as(c_int, 1);
pub const _INT32_T_DECLARED = "";
pub const _UINT32_T_DECLARED = "";
pub const __int32_t_defined = @as(c_int, 1);
pub const _INT64_T_DECLARED = "";
pub const _UINT64_T_DECLARED = "";
pub const __int64_t_defined = @as(c_int, 1);
pub const _INTMAX_T_DECLARED = "";
pub const _UINTMAX_T_DECLARED = "";
pub const _INTPTR_T_DECLARED = "";
pub const _UINTPTR_T_DECLARED = "";
pub const __int_least8_t_defined = @as(c_int, 1);
pub const __int_least16_t_defined = @as(c_int, 1);
pub const __int_least32_t_defined = @as(c_int, 1);
pub const __int_least64_t_defined = @as(c_int, 1);
pub const __int_fast8_t_defined = @as(c_int, 1);
pub const __int_fast16_t_defined = @as(c_int, 1);
pub const __int_fast32_t_defined = @as(c_int, 1);
pub const __int_fast64_t_defined = @as(c_int, 1);
pub const INTPTR_MIN = -__INTPTR_MAX__ - @as(c_int, 1);
pub const INTPTR_MAX = __INTPTR_MAX__;
pub const UINTPTR_MAX = __UINTPTR_MAX__;
pub const INT8_MIN = -__INT8_MAX__ - @as(c_int, 1);
pub const INT8_MAX = __INT8_MAX__;
pub const UINT8_MAX = __UINT8_MAX__;
pub const INT_LEAST8_MIN = -__INT_LEAST8_MAX__ - @as(c_int, 1);
pub const INT_LEAST8_MAX = __INT_LEAST8_MAX__;
pub const UINT_LEAST8_MAX = __UINT_LEAST8_MAX__;
pub const INT16_MIN = -__INT16_MAX__ - @as(c_int, 1);
pub const INT16_MAX = __INT16_MAX__;
pub const UINT16_MAX = __UINT16_MAX__;
pub const INT_LEAST16_MIN = -__INT_LEAST16_MAX__ - @as(c_int, 1);
pub const INT_LEAST16_MAX = __INT_LEAST16_MAX__;
pub const UINT_LEAST16_MAX = __UINT_LEAST16_MAX__;
pub const INT32_MIN = -__INT32_MAX__ - @as(c_int, 1);
pub const INT32_MAX = __INT32_MAX__;
pub const UINT32_MAX = __UINT32_MAX__;
pub const INT_LEAST32_MIN = -__INT_LEAST32_MAX__ - @as(c_int, 1);
pub const INT_LEAST32_MAX = __INT_LEAST32_MAX__;
pub const UINT_LEAST32_MAX = __UINT_LEAST32_MAX__;
pub const INT64_MIN = -__INT64_MAX__ - @as(c_int, 1);
pub const INT64_MAX = __INT64_MAX__;
pub const UINT64_MAX = __UINT64_MAX__;
pub const INT_LEAST64_MIN = -__INT_LEAST64_MAX__ - @as(c_int, 1);
pub const INT_LEAST64_MAX = __INT_LEAST64_MAX__;
pub const UINT_LEAST64_MAX = __UINT_LEAST64_MAX__;
pub const INT_FAST8_MIN = -__INT_FAST8_MAX__ - @as(c_int, 1);
pub const INT_FAST8_MAX = __INT_FAST8_MAX__;
pub const UINT_FAST8_MAX = __UINT_FAST8_MAX__;
pub const INT_FAST16_MIN = -__INT_FAST16_MAX__ - @as(c_int, 1);
pub const INT_FAST16_MAX = __INT_FAST16_MAX__;
pub const UINT_FAST16_MAX = __UINT_FAST16_MAX__;
pub const INT_FAST32_MIN = -__INT_FAST32_MAX__ - @as(c_int, 1);
pub const INT_FAST32_MAX = __INT_FAST32_MAX__;
pub const UINT_FAST32_MAX = __UINT_FAST32_MAX__;
pub const INT_FAST64_MIN = -__INT_FAST64_MAX__ - @as(c_int, 1);
pub const INT_FAST64_MAX = __INT_FAST64_MAX__;
pub const UINT_FAST64_MAX = __UINT_FAST64_MAX__;
pub const INTMAX_MAX = __INTMAX_MAX__;
pub const INTMAX_MIN = -INTMAX_MAX - @as(c_int, 1);
pub const UINTMAX_MAX = __UINTMAX_MAX__;
pub const SIZE_MAX = __SIZE_MAX__;
pub const SIG_ATOMIC_MIN = -__STDINT_EXP(INT_MAX) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = __STDINT_EXP(INT_MAX);
pub const PTRDIFF_MAX = __PTRDIFF_MAX__;
pub const PTRDIFF_MIN = -PTRDIFF_MAX - @as(c_int, 1);
pub const WCHAR_MIN = (-@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex) - @as(c_int, 1)) + '\x00';
pub const WCHAR_MAX = __WCHAR_MAX__;
pub const WINT_MAX = __WINT_MAX__;
pub const WINT_MIN = @as(c_uint, 0);
pub inline fn INT8_C(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn UINT8_C(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn INT16_C(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn UINT16_C(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn INT32_C(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const STACK_OVERHEAD_CHECKER = @as(c_int, 0);
pub const STACK_OVERHEAD_OPTIMIZATION = @as(c_int, 0);
pub const STACK_OVERHEAD_APPTRACE = @as(c_int, 0);
pub const STACK_OVERHEAD_WATCHPOINT = @as(c_int, 0);
pub const configSTACK_OVERHEAD_TOTAL = ((STACK_OVERHEAD_CHECKER + STACK_OVERHEAD_OPTIMIZATION) + STACK_OVERHEAD_APPTRACE) + STACK_OVERHEAD_WATCHPOINT;
pub const XTENSA_CONFIG_H = "";
pub const XTENSA_HAL_H = "";
pub const XTHAL_RELEASE_MAJOR = @as(c_int, 12000);
pub const XTHAL_RELEASE_MINOR = @as(c_int, 9);
pub const XTHAL_RELEASE_NAME = "12.0.9";
pub const XTHAL_REL_12 = @as(c_int, 1);
pub const XTHAL_REL_12_0 = @as(c_int, 1);
pub const XTHAL_REL_12_0_9 = @as(c_int, 1);
pub const XTHAL_MAJOR_REV = XTHAL_RELEASE_MAJOR;
pub const XTHAL_MINOR_REV = XTHAL_RELEASE_MINOR;
pub inline fn XTHAL_REL_GE(maja: anytype, mina: anytype, majb: anytype, minb: anytype) @TypeOf((maja > majb) or ((maja == majb) and (mina >= minb))) {
    _ = &maja;
    _ = &mina;
    _ = &majb;
    _ = &minb;
    return (maja > majb) or ((maja == majb) and (mina >= minb));
}
pub inline fn XTHAL_REL_GT(maja: anytype, mina: anytype, majb: anytype, minb: anytype) @TypeOf((maja > majb) or ((maja == majb) and (mina > minb))) {
    _ = &maja;
    _ = &mina;
    _ = &majb;
    _ = &minb;
    return (maja > majb) or ((maja == majb) and (mina > minb));
}
pub inline fn XTHAL_REL_LE(maja: anytype, mina: anytype, majb: anytype, minb: anytype) @TypeOf((maja < majb) or ((maja == majb) and (mina <= minb))) {
    _ = &maja;
    _ = &mina;
    _ = &majb;
    _ = &minb;
    return (maja < majb) or ((maja == majb) and (mina <= minb));
}
pub inline fn XTHAL_REL_LT(maja: anytype, mina: anytype, majb: anytype, minb: anytype) @TypeOf((maja < majb) or ((maja == majb) and (mina < minb))) {
    _ = &maja;
    _ = &mina;
    _ = &majb;
    _ = &minb;
    return (maja < majb) or ((maja == majb) and (mina < minb));
}
pub inline fn XTHAL_REL_EQ(maja: anytype, mina: anytype, majb: anytype, minb: anytype) @TypeOf((maja == majb) and (mina == minb)) {
    _ = &maja;
    _ = &mina;
    _ = &majb;
    _ = &minb;
    return (maja == majb) and (mina == minb);
}
pub const XTHAL_MAYBE = -@as(c_int, 1);
pub inline fn XTHAL_FUZZY_AND(a: anytype, b: anytype) @TypeOf(if ((a == @as(c_int, 0)) or (b == @as(c_int, 0))) @as(c_int, 0) else if ((a == @as(c_int, 1)) and (b == @as(c_int, 1))) @as(c_int, 1) else XTHAL_MAYBE) {
    _ = &a;
    _ = &b;
    return if ((a == @as(c_int, 0)) or (b == @as(c_int, 0))) @as(c_int, 0) else if ((a == @as(c_int, 1)) and (b == @as(c_int, 1))) @as(c_int, 1) else XTHAL_MAYBE;
}
pub inline fn XTHAL_FUZZY_OR(a: anytype, b: anytype) @TypeOf(if ((a == @as(c_int, 1)) or (b == @as(c_int, 1))) @as(c_int, 1) else if ((a == @as(c_int, 0)) and (b == @as(c_int, 0))) @as(c_int, 0) else XTHAL_MAYBE) {
    _ = &a;
    _ = &b;
    return if ((a == @as(c_int, 1)) or (b == @as(c_int, 1))) @as(c_int, 1) else if ((a == @as(c_int, 0)) and (b == @as(c_int, 0))) @as(c_int, 0) else XTHAL_MAYBE;
}
pub inline fn XTHAL_FUZZY_NOT(a: anytype) @TypeOf(if ((a == @as(c_int, 0)) or (a == @as(c_int, 1))) @as(c_int, 1) - a else XTHAL_MAYBE) {
    _ = &a;
    return if ((a == @as(c_int, 0)) or (a == @as(c_int, 1))) @as(c_int, 1) - a else XTHAL_MAYBE;
}
pub const XTHAL_MAX_CPS = @as(c_int, 8);
pub const XTHAL_LITTLEENDIAN = @as(c_int, 0);
pub const XTHAL_BIGENDIAN = @as(c_int, 1);
pub const XTHAL_PREFETCH_ENABLE = -@as(c_int, 1);
pub const XTHAL_PREFETCH_DISABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF0000, .hex);
pub inline fn XTHAL_DCACHE_PREFETCH(n: anytype) @TypeOf(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800F0000, .hex) + (n & @as(c_int, 0xF))) {
    _ = &n;
    return @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800F0000, .hex) + (n & @as(c_int, 0xF));
}
pub const XTHAL_DCACHE_PREFETCH_OFF = XTHAL_DCACHE_PREFETCH(@as(c_int, 0));
pub const XTHAL_DCACHE_PREFETCH_LOW = XTHAL_DCACHE_PREFETCH(@as(c_int, 4));
pub const XTHAL_DCACHE_PREFETCH_MEDIUM = XTHAL_DCACHE_PREFETCH(@as(c_int, 5));
pub const XTHAL_DCACHE_PREFETCH_HIGH = XTHAL_DCACHE_PREFETCH(@as(c_int, 8));
pub const XTHAL_DCACHE_PREFETCH_L1_OFF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x90000000, .hex);
pub const XTHAL_DCACHE_PREFETCH_L1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x90001000, .hex);
pub inline fn XTHAL_ICACHE_PREFETCH(n: anytype) @TypeOf(@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80F00000, .hex) + ((n & @as(c_int, 0xF)) << @as(c_int, 4))) {
    _ = &n;
    return @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80F00000, .hex) + ((n & @as(c_int, 0xF)) << @as(c_int, 4));
}
pub const XTHAL_ICACHE_PREFETCH_OFF = XTHAL_ICACHE_PREFETCH(@as(c_int, 0));
pub const XTHAL_ICACHE_PREFETCH_LOW = XTHAL_ICACHE_PREFETCH(@as(c_int, 4));
pub const XTHAL_ICACHE_PREFETCH_MEDIUM = XTHAL_ICACHE_PREFETCH(@as(c_int, 5));
pub const XTHAL_ICACHE_PREFETCH_HIGH = XTHAL_ICACHE_PREFETCH(@as(c_int, 8));
pub const XTHAL_ICACHE_PREFETCH_L1_OFF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XTHAL_ICACHE_PREFETCH_L1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0002000, .hex);
pub inline fn _XTHAL_PREFETCH_BLOCKS(n: anytype) @TypeOf(if (n < @as(c_int, 0)) @as(c_int, 0) else if (n < @as(c_int, 5)) n else if (n < @as(c_int, 15)) (n >> @as(c_int, 1)) + @as(c_int, 2) else @as(c_int, 9)) {
    _ = &n;
    return if (n < @as(c_int, 0)) @as(c_int, 0) else if (n < @as(c_int, 5)) n else if (n < @as(c_int, 15)) (n >> @as(c_int, 1)) + @as(c_int, 2) else @as(c_int, 9);
}
pub inline fn XTHAL_PREFETCH_BLOCKS(n: anytype) @TypeOf(@as(c_ulonglong, 0x0000000F80000000) + (@import("std").zig.c_translation.cast(c_ulonglong, _XTHAL_PREFETCH_BLOCKS(n)) << @as(c_int, 48))) {
    _ = &n;
    return @as(c_ulonglong, 0x0000000F80000000) + (@import("std").zig.c_translation.cast(c_ulonglong, _XTHAL_PREFETCH_BLOCKS(n)) << @as(c_int, 48));
}
pub const xthal_set_cache_prefetch_nw = @compileError("unable to translate macro: undefined identifier `xthal_set_cache_prefetch_long_nw`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/hal.h:339:9
pub const XTHAL_DISASM_BUFSIZE = @as(c_int, 80);
pub const XTHAL_DISASM_OPT_ADDR = @as(c_int, 0x0001);
pub const XTHAL_DISASM_OPT_OPHEX = @as(c_int, 0x0002);
pub const XTHAL_DISASM_OPT_OPCODE = @as(c_int, 0x0004);
pub const XTHAL_DISASM_OPT_PARMS = @as(c_int, 0x0008);
pub const XTHAL_DISASM_OPT_ALL = @as(c_int, 0x0FFF);
pub const XTHAL_MAX_INTERRUPTS = @as(c_int, 32);
pub const XTHAL_MAX_INTLEVELS = @as(c_int, 16);
pub const XTHAL_MAX_TIMERS = @as(c_int, 4);
pub const XTHAL_INTTYPE_UNCONFIGURED = @as(c_int, 0);
pub const XTHAL_INTTYPE_SOFTWARE = @as(c_int, 1);
pub const XTHAL_INTTYPE_EXTERN_EDGE = @as(c_int, 2);
pub const XTHAL_INTTYPE_EXTERN_LEVEL = @as(c_int, 3);
pub const XTHAL_INTTYPE_TIMER = @as(c_int, 4);
pub const XTHAL_INTTYPE_NMI = @as(c_int, 5);
pub const XTHAL_INTTYPE_WRITE_ERROR = @as(c_int, 6);
pub const XTHAL_INTTYPE_PROFILING = @as(c_int, 7);
pub const XTHAL_INTTYPE_IDMA_DONE = @as(c_int, 8);
pub const XTHAL_INTTYPE_IDMA_ERR = @as(c_int, 9);
pub const XTHAL_INTTYPE_GS_ERR = @as(c_int, 10);
pub const XTHAL_INTTYPE_SG_ERR = @as(c_int, 10);
pub const XTHAL_MAX_INTTYPES = @as(c_int, 11);
pub const XTHAL_TIMER_UNCONFIGURED = -@as(c_int, 1);
pub const XTHAL_TIMER_UNASSIGNED = XTHAL_TIMER_UNCONFIGURED;
pub const XTHAL_MEMEP_PARITY = @as(c_int, 1);
pub const XTHAL_MEMEP_ECC = @as(c_int, 2);
pub const XTHAL_MEMEP_F_LOCAL = @as(c_int, 0);
pub const XTHAL_MEMEP_F_DCACHE_DATA = @as(c_int, 4);
pub const XTHAL_MEMEP_F_DCACHE_TAG = @as(c_int, 5);
pub const XTHAL_MEMEP_F_ICACHE_DATA = @as(c_int, 6);
pub const XTHAL_MEMEP_F_ICACHE_TAG = @as(c_int, 7);
pub const XTHAL_MEMEP_F_CORRECTABLE = @as(c_int, 16);
pub const XTHAL_AMB_EXCEPTION = @as(c_int, 0);
pub const XTHAL_AMB_HITCACHE = @as(c_int, 1);
pub const XTHAL_AMB_ALLOCATE = @as(c_int, 2);
pub const XTHAL_AMB_WRITETHRU = @as(c_int, 3);
pub const XTHAL_AMB_ISOLATE = @as(c_int, 4);
pub const XTHAL_AMB_GUARD = @as(c_int, 5);
pub const XTHAL_AMB_COHERENT = @as(c_int, 6);
pub const XTHAL_AM_EXCEPTION = @as(c_int, 1) << XTHAL_AMB_EXCEPTION;
pub const XTHAL_AM_HITCACHE = @as(c_int, 1) << XTHAL_AMB_HITCACHE;
pub const XTHAL_AM_ALLOCATE = @as(c_int, 1) << XTHAL_AMB_ALLOCATE;
pub const XTHAL_AM_WRITETHRU = @as(c_int, 1) << XTHAL_AMB_WRITETHRU;
pub const XTHAL_AM_ISOLATE = @as(c_int, 1) << XTHAL_AMB_ISOLATE;
pub const XTHAL_AM_GUARD = @as(c_int, 1) << XTHAL_AMB_GUARD;
pub const XTHAL_AM_COHERENT = @as(c_int, 1) << XTHAL_AMB_COHERENT;
pub const XTHAL_FAM_EXCEPTION = @as(c_int, 0x001);
pub const XTHAL_FAM_BYPASS = @as(c_int, 0x000);
pub const XTHAL_FAM_CACHED = @as(c_int, 0x006);
pub const XTHAL_LAM_EXCEPTION = @as(c_int, 0x001);
pub const XTHAL_LAM_ISOLATE = @as(c_int, 0x012);
pub const XTHAL_LAM_BYPASS = @as(c_int, 0x000);
pub const XTHAL_LAM_BYPASSG = @as(c_int, 0x020);
pub const XTHAL_LAM_CACHED_NOALLOC = @as(c_int, 0x002);
pub const XTHAL_LAM_NACACHED = XTHAL_LAM_CACHED_NOALLOC;
pub const XTHAL_LAM_NACACHEDG = @as(c_int, 0x022);
pub const XTHAL_LAM_CACHED = @as(c_int, 0x006);
pub const XTHAL_LAM_COHCACHED = @as(c_int, 0x046);
pub const XTHAL_SAM_EXCEPTION = @as(c_int, 0x001);
pub const XTHAL_SAM_ISOLATE = @as(c_int, 0x032);
pub const XTHAL_SAM_BYPASS = @as(c_int, 0x028);
pub const XTHAL_SAM_WRITETHRU = @as(c_int, 0x02A);
pub const XTHAL_SAM_WRITEBACK = @as(c_int, 0x026);
pub const XTHAL_SAM_WRITEBACK_NOALLOC = @as(c_int, 0x022);
pub const XTHAL_SAM_COHWRITEBACK = @as(c_int, 0x066);
pub const XTHAL_PAM_BYPASS = @as(c_int, 0x000);
pub const XTHAL_PAM_BYPASS_BUF = @as(c_int, 0x010);
pub const XTHAL_PAM_CACHED_NOALLOC = @as(c_int, 0x030);
pub const XTHAL_PAM_WRITETHRU = @as(c_int, 0x0B0);
pub const XTHAL_PAM_WRITEBACK_NOALLOC = @as(c_int, 0x0F0);
pub const XTHAL_PAM_WRITEBACK = @as(c_int, 0x1F0);
pub const xthal_get_intread = xthal_get_interrupt;
pub const XTHAL_CAFLAG_EXPAND = @as(c_int, 0x000100);
pub const XTHAL_CAFLAG_EXACT = @as(c_int, 0x000200);
pub const XTHAL_CAFLAG_NO_PARTIAL = @as(c_int, 0x000400);
pub const XTHAL_CAFLAG_NO_AUTO_WB = @as(c_int, 0x000800);
pub const XTHAL_CAFLAG_NO_AUTO_INV = @as(c_int, 0x001000);
pub const XTHAL_SUCCESS = @as(c_int, 0);
pub const XTHAL_NO_REGIONS_COVERED = -@as(c_int, 1);
pub const XTHAL_INEXACT = -@as(c_int, 2);
pub const XTHAL_INVALID_ADDRESS = -@as(c_int, 3);
pub const XTHAL_UNSUPPORTED = -@as(c_int, 4);
pub const XTHAL_ADDRESS_MISALIGNED = -@as(c_int, 5);
pub const XTHAL_NO_MAPPING = -@as(c_int, 6);
pub const XTHAL_BAD_ACCESS_RIGHTS = -@as(c_int, 7);
pub const XTHAL_BAD_MEMORY_TYPE = -@as(c_int, 8);
pub const XTHAL_MAP_NOT_ALIGNED = -@as(c_int, 9);
pub const XTHAL_OUT_OF_ENTRIES = -@as(c_int, 10);
pub const XTHAL_OUT_OF_ORDER_MAP = -@as(c_int, 11);
pub const XTHAL_INVALID = -@as(c_int, 12);
pub const XTHAL_ZERO_SIZED_REGION = -@as(c_int, 13);
pub const XTHAL_INVALID_ADDRESS_RANGE = -@as(c_int, 14);
pub const XCHAL_SUCCESS = XTHAL_SUCCESS;
pub const XCHAL_ADDRESS_MISALIGNED = XTHAL_ADDRESS_MISALIGNED;
pub const XCHAL_INEXACT = XTHAL_INEXACT;
pub const XCHAL_INVALID_ADDRESS = XTHAL_INVALID_ADDRESS;
pub const XCHAL_UNSUPPORTED_ON_THIS_ARCH = XTHAL_UNSUPPORTED;
pub const XCHAL_NO_PAGES_MAPPED = XTHAL_NO_REGIONS_COVERED;
pub const XTHAL_AR_NONE = @as(c_int, 0);
pub const XTHAL_AR_R = @as(c_int, 4);
pub const XTHAL_AR_RX = @as(c_int, 5);
pub const XTHAL_AR_RW = @as(c_int, 6);
pub const XTHAL_AR_RWX = @as(c_int, 7);
pub const XTHAL_AR_Ww = @as(c_int, 8);
pub const XTHAL_AR_RWrwx = @as(c_int, 9);
pub const XTHAL_AR_RWr = @as(c_int, 10);
pub const XTHAL_AR_RWXrx = @as(c_int, 11);
pub const XTHAL_AR_Rr = @as(c_int, 12);
pub const XTHAL_AR_RXrx = @as(c_int, 13);
pub const XTHAL_AR_RWrw = @as(c_int, 14);
pub const XTHAL_AR_RWXrwx = @as(c_int, 15);
pub const XTHAL_AR_WIDTH = @as(c_int, 4);
pub const XTHAL_MPU_USE_EXISTING_ACCESS_RIGHTS = @as(c_int, 0x00002000);
pub const XTHAL_MPU_USE_EXISTING_MEMORY_TYPE = @as(c_int, 0x00004000);
pub const XTHAL_MEM_DEVICE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const XTHAL_MEM_NON_CACHEABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00090000, .hex);
pub const XTHAL_MEM_WRITETHRU_NOALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const XTHAL_MEM_WRITETHRU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const XTHAL_MEM_WRITETHRU_WRITEALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00060000, .hex);
pub const XTHAL_MEM_WRITEBACK_NOALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00050000, .hex);
pub const XTHAL_MEM_WRITEBACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00070000, .hex);
pub const XTHAL_MEM_INTERRUPTIBLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const XTHAL_MEM_BUFFERABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const XTHAL_MEM_NON_SHAREABLE = @as(c_int, 0x00000000);
pub const XTHAL_MEM_INNER_SHAREABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const XTHAL_MEM_OUTER_SHAREABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const XTHAL_MEM_SYSTEM_SHAREABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x06000000, .hex);
pub inline fn XTHAL_MEM_PROC_CACHE(system_1: anytype, processor: anytype) @TypeOf(((system_1 & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x000f0000, .hex)) | ((processor & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x000f0000, .hex)) << @as(c_int, 4))) | ((system_1 & XTHAL_MEM_DEVICE) | (processor & XTHAL_MEM_DEVICE))) {
    _ = &system_1;
    _ = &processor;
    return ((system_1 & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x000f0000, .hex)) | ((processor & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x000f0000, .hex)) << @as(c_int, 4))) | ((system_1 & XTHAL_MEM_DEVICE) | (processor & XTHAL_MEM_DEVICE));
}
pub inline fn XTHAL_ENCODE_MEMORY_TYPE(x: anytype) @TypeOf(if (x & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffe000, .hex)) if (_XTHAL_MEM_IS_DEVICE(x)) _XTHAL_ENCODE_DEVICE(x) else if (_XTHAL_IS_SYSTEM_NONCACHEABLE(x)) _XTHAL_ENCODE_SYSTEM_NONCACHEABLE(x) else _XTHAL_ENCODE_SYSTEM_CACHEABLE(x) else x) {
    _ = &x;
    return if (x & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffe000, .hex)) if (_XTHAL_MEM_IS_DEVICE(x)) _XTHAL_ENCODE_DEVICE(x) else if (_XTHAL_IS_SYSTEM_NONCACHEABLE(x)) _XTHAL_ENCODE_SYSTEM_NONCACHEABLE(x) else _XTHAL_ENCODE_SYSTEM_CACHEABLE(x) else x;
}
pub const XTHAL_MPU_ENTRY = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/hal.h:1172:9
pub inline fn XTHAL_MPU_ENTRY_GET_VSTARTADDR(x: anytype) @TypeOf(x.as & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffe0, .hex)) {
    _ = &x;
    return x.as & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffe0, .hex);
}
pub const XTHAL_MPU_ENTRY_SET_VSTARTADDR = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/hal.h:1181:9
pub inline fn XTHAL_MPU_ENTRY_GET_VALID(x: anytype) @TypeOf(x.as & @as(c_int, 0x1)) {
    _ = &x;
    return x.as & @as(c_int, 0x1);
}
pub const XTHAL_MPU_ENTRY_SET_VALID = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/hal.h:1186:9
pub inline fn XTHAL_MPU_ENTRY_GET_ACCESS(x: anytype) @TypeOf((x.at >> @as(c_int, 8)) & @as(c_int, 0xf)) {
    _ = &x;
    return (x.at >> @as(c_int, 8)) & @as(c_int, 0xf);
}
pub const XTHAL_MPU_ENTRY_SET_ACCESS = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/hal.h:1190:9
pub inline fn XTHAL_MPU_ENTRY_GET_MEMORY_TYPE(x: anytype) @TypeOf((x.at >> @as(c_int, 12)) & @as(c_int, 0x1ff)) {
    _ = &x;
    return (x.at >> @as(c_int, 12)) & @as(c_int, 0x1ff);
}
pub const XTHAL_MPU_ENTRY_SET_MEMORY_TYPE = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/hal.h:1195:9
pub const _XTHAL_SYSTEM_CACHE_BITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x000f0000, .hex);
pub const _XTHAL_LOCAL_CACHE_BITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00f00000, .hex);
pub const _XTHAL_MEM_SYSTEM_RWC_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00070000, .hex);
pub const _XTHAL_MEM_LOCAL_RWC_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00700000, .hex);
pub const _XTHAL_SHIFT_RWC = @as(c_int, 16);
pub inline fn _XTHAL_MEM_ANY_SHAREABLE(x: anytype) @TypeOf(if (x & XTHAL_MEM_SYSTEM_SHAREABLE) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &x;
    return if (x & XTHAL_MEM_SYSTEM_SHAREABLE) @as(c_int, 1) else @as(c_int, 0);
}
pub inline fn _XTHAL_MEM_INNER_SHAREABLE(x: anytype) @TypeOf(if ((x & XTHAL_MEM_SYSTEM_SHAREABLE) == XTHAL_MEM_INNER_SHAREABLE) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &x;
    return if ((x & XTHAL_MEM_SYSTEM_SHAREABLE) == XTHAL_MEM_INNER_SHAREABLE) @as(c_int, 1) else @as(c_int, 0);
}
pub inline fn _XTHAL_MEM_IS_BUFFERABLE(x: anytype) @TypeOf(if (x & XTHAL_MEM_BUFFERABLE) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &x;
    return if (x & XTHAL_MEM_BUFFERABLE) @as(c_int, 1) else @as(c_int, 0);
}
pub inline fn _XTHAL_MEM_IS_DEVICE(x: anytype) @TypeOf(if (x & XTHAL_MEM_DEVICE) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &x;
    return if (x & XTHAL_MEM_DEVICE) @as(c_int, 1) else @as(c_int, 0);
}
pub inline fn _XTHAL_NON_CACHEABLE_DOMAIN(x: anytype) @TypeOf(if ((_XTHAL_MEM_IS_DEVICE(x) != 0) or (_XTHAL_MEM_ANY_SHAREABLE(x) != 0)) @as(c_int, 0x3) else @as(c_int, 0)) {
    _ = &x;
    return if ((_XTHAL_MEM_IS_DEVICE(x) != 0) or (_XTHAL_MEM_ANY_SHAREABLE(x) != 0)) @as(c_int, 0x3) else @as(c_int, 0);
}
pub inline fn _XTHAL_CACHEABLE_DOMAIN(x: anytype) @TypeOf(if (_XTHAL_MEM_ANY_SHAREABLE(x)) @as(c_int, 0x3) else @as(c_int, 0x1)) {
    _ = &x;
    return if (_XTHAL_MEM_ANY_SHAREABLE(x)) @as(c_int, 0x3) else @as(c_int, 0x1);
}
pub inline fn _XTHAL_MEM_CACHE_MASK(x: anytype) @TypeOf(x & _XTHAL_SYSTEM_CACHE_BITS) {
    _ = &x;
    return x & _XTHAL_SYSTEM_CACHE_BITS;
}
pub inline fn _XTHAL_IS_SYSTEM_NONCACHEABLE(x: anytype) @TypeOf(if ((_XTHAL_MEM_CACHE_MASK(x) & XTHAL_MEM_NON_CACHEABLE) == XTHAL_MEM_NON_CACHEABLE) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &x;
    return if ((_XTHAL_MEM_CACHE_MASK(x) & XTHAL_MEM_NON_CACHEABLE) == XTHAL_MEM_NON_CACHEABLE) @as(c_int, 1) else @as(c_int, 0);
}
pub inline fn _XTHAL_ENCODE_DEVICE(x: anytype) @TypeOf((((if (x & XTHAL_MEM_INTERRUPTIBLE) @as(c_int, 1) else @as(c_int, 0)) << @as(c_int, 3)) | (_XTHAL_NON_CACHEABLE_DOMAIN(x) << @as(c_int, 1))) | _XTHAL_MEM_IS_BUFFERABLE(x)) {
    _ = &x;
    return (((if (x & XTHAL_MEM_INTERRUPTIBLE) @as(c_int, 1) else @as(c_int, 0)) << @as(c_int, 3)) | (_XTHAL_NON_CACHEABLE_DOMAIN(x) << @as(c_int, 1))) | _XTHAL_MEM_IS_BUFFERABLE(x);
}
pub inline fn _XTHAL_ENCODE_SYSTEM_NONCACHEABLE(x: anytype) @TypeOf((@as(c_int, 0x18) | (_XTHAL_NON_CACHEABLE_DOMAIN(x) << @as(c_int, 1))) | _XTHAL_MEM_IS_BUFFERABLE(x)) {
    _ = &x;
    return (@as(c_int, 0x18) | (_XTHAL_NON_CACHEABLE_DOMAIN(x) << @as(c_int, 1))) | _XTHAL_MEM_IS_BUFFERABLE(x);
}
pub inline fn _XTHAL_ENCODE_SYSTEM_CACHEABLE(x: anytype) @TypeOf((if (if ((((x & _XTHAL_LOCAL_CACHE_BITS) >> @as(c_int, 4)) & XTHAL_MEM_NON_CACHEABLE) == XTHAL_MEM_NON_CACHEABLE) @as(c_int, 1) else @as(c_int, 0)) _XTHAL_CACHEABLE_DOMAIN(x) << @as(c_int, 4) else _XTHAL_ENCODE_SYSTEM_CACHEABLE_LOCAL_CACHEABLE(x)) | ((_XTHAL_MEM_INNER_SHAREABLE(x) << @as(c_int, 3)) | ((_XTHAL_MEM_CACHE_MASK(x) & _XTHAL_MEM_SYSTEM_RWC_MASK) >> _XTHAL_SHIFT_RWC))) {
    _ = &x;
    return (if (if ((((x & _XTHAL_LOCAL_CACHE_BITS) >> @as(c_int, 4)) & XTHAL_MEM_NON_CACHEABLE) == XTHAL_MEM_NON_CACHEABLE) @as(c_int, 1) else @as(c_int, 0)) _XTHAL_CACHEABLE_DOMAIN(x) << @as(c_int, 4) else _XTHAL_ENCODE_SYSTEM_CACHEABLE_LOCAL_CACHEABLE(x)) | ((_XTHAL_MEM_INNER_SHAREABLE(x) << @as(c_int, 3)) | ((_XTHAL_MEM_CACHE_MASK(x) & _XTHAL_MEM_SYSTEM_RWC_MASK) >> _XTHAL_SHIFT_RWC));
}
pub inline fn _XTHAL_ENCODE_SYSTEM_CACHEABLE_LOCAL_CACHEABLE(x: anytype) @TypeOf((_XTHAL_CACHEABLE_DOMAIN(x) << @as(c_int, 7)) | (((if (x & _XTHAL_LOCAL_CACHE_BITS) x & _XTHAL_LOCAL_CACHE_BITS else _XTHAL_MEM_CACHE_MASK(x) << @as(c_int, 4)) & _XTHAL_MEM_LOCAL_RWC_MASK) >> _XTHAL_SHIFT_RWC)) {
    _ = &x;
    return (_XTHAL_CACHEABLE_DOMAIN(x) << @as(c_int, 7)) | (((if (x & _XTHAL_LOCAL_CACHE_BITS) x & _XTHAL_LOCAL_CACHE_BITS else _XTHAL_MEM_CACHE_MASK(x) << @as(c_int, 4)) & _XTHAL_MEM_LOCAL_RWC_MASK) >> _XTHAL_SHIFT_RWC);
}
pub const XTHAL_MEM_NON_CACHED = XTHAL_MEM_NON_CACHEABLE;
pub const XTHAL_MEM_NON_SHARED = XTHAL_MEM_NON_SHAREABLE;
pub const XTHAL_MEM_INNER_SHARED = XTHAL_MEM_INNER_SHAREABLE;
pub const XTHAL_MEM_OUTER_SHARED = XTHAL_MEM_OUTER_SHAREABLE;
pub const XTHAL_MEM_SYSTEM_SHARED = XTHAL_MEM_SYSTEM_SHAREABLE;
pub const XTHAL_MEM_SW_SHAREABLE = @as(c_int, 0);
pub inline fn xthal_is_cached(memoryType: anytype) @TypeOf(xthal_is_cacheable(memoryType)) {
    _ = &memoryType;
    return xthal_is_cacheable(memoryType);
}
pub const XTENSA_CONFIG_CORE_H = "";
pub const XTENSA_VERSIONS_H = "";
pub const XTENSA_HWVERSION_T1020_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102000, .decimal);
pub const XTENSA_HWCIDSCHEME_T1020_0 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1020_0 = @as(c_int, 2);
pub const XTENSA_HWVERSION_T1020_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102001, .decimal);
pub const XTENSA_HWCIDSCHEME_T1020_1 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1020_1 = @as(c_int, 3);
pub const XTENSA_HWVERSION_T1020_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102002, .decimal);
pub const XTENSA_HWCIDSCHEME_T1020_2 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1020_2 = @as(c_int, 4);
pub const XTENSA_HWVERSION_T1020_2B = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102002, .decimal);
pub const XTENSA_HWCIDSCHEME_T1020_2B = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1020_2B = @as(c_int, 5);
pub const XTENSA_HWVERSION_T1020_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102003, .decimal);
pub const XTENSA_HWCIDSCHEME_T1020_3 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1020_3 = @as(c_int, 6);
pub const XTENSA_HWVERSION_T1020_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102004, .decimal);
pub const XTENSA_HWCIDSCHEME_T1020_4 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1020_4 = @as(c_int, 7);
pub const XTENSA_HWVERSION_T1030_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103000, .decimal);
pub const XTENSA_HWCIDSCHEME_T1030_0 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1030_0 = @as(c_int, 9);
pub const XTENSA_HWVERSION_T1030_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103001, .decimal);
pub const XTENSA_HWCIDSCHEME_T1030_1 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1030_1 = @as(c_int, 10);
pub const XTENSA_HWVERSION_T1030_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103002, .decimal);
pub const XTENSA_HWCIDSCHEME_T1030_2 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1030_2 = @as(c_int, 11);
pub const XTENSA_HWVERSION_T1030_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103003, .decimal);
pub const XTENSA_HWCIDSCHEME_T1030_3 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1030_3 = @as(c_int, 12);
pub const XTENSA_HWVERSION_T1040_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104000, .decimal);
pub const XTENSA_HWCIDSCHEME_T1040_0 = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1040_0 = @as(c_int, 15);
pub const XTENSA_HWVERSION_T1040_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104001, .decimal);
pub const XTENSA_HWCIDSCHEME_T1040_1 = @as(c_int, 1);
pub const XTENSA_HWCIDVERS_T1040_1 = @as(c_int, 32);
pub const XTENSA_HWVERSION_T1040_1P = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104001, .decimal);
pub const XTENSA_HWCIDSCHEME_T1040_1P = @as(c_int, 10);
pub const XTENSA_HWCIDVERS_T1040_1P = @as(c_int, 16);
pub const XTENSA_HWVERSION_T1040_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104002, .decimal);
pub const XTENSA_HWCIDSCHEME_T1040_2 = @as(c_int, 1);
pub const XTENSA_HWCIDVERS_T1040_2 = @as(c_int, 33);
pub const XTENSA_HWVERSION_T1040_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104003, .decimal);
pub const XTENSA_HWCIDSCHEME_T1040_3 = @as(c_int, 1);
pub const XTENSA_HWCIDVERS_T1040_3 = @as(c_int, 34);
pub const XTENSA_HWVERSION_T1050_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105000, .decimal);
pub const XTENSA_HWCIDSCHEME_T1050_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_T1050_0 = @as(c_int, 1);
pub const XTENSA_HWVERSION_T1050_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105001, .decimal);
pub const XTENSA_HWCIDSCHEME_T1050_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_T1050_1 = @as(c_int, 2);
pub const XTENSA_HWVERSION_T1050_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105002, .decimal);
pub const XTENSA_HWCIDSCHEME_T1050_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_T1050_2 = @as(c_int, 4);
pub const XTENSA_HWVERSION_T1050_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105003, .decimal);
pub const XTENSA_HWCIDSCHEME_T1050_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_T1050_3 = @as(c_int, 6);
pub const XTENSA_HWVERSION_T1050_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105004, .decimal);
pub const XTENSA_HWCIDSCHEME_T1050_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_T1050_4 = @as(c_int, 7);
pub const XTENSA_HWVERSION_T1050_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105005, .decimal);
pub const XTENSA_HWCIDSCHEME_T1050_5 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_T1050_5 = @as(c_int, 8);
pub const XTENSA_HWVERSION_RA_2004_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210000, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2004_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2004_1 = @as(c_int, 3);
pub const XTENSA_HWVERSION_RA_2005_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210001, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2005_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2005_1 = @as(c_int, 20);
pub const XTENSA_HWVERSION_RA_2005_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210002, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2005_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2005_2 = @as(c_int, 21);
pub const XTENSA_HWVERSION_RA_2005_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210003, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2005_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2005_3 = @as(c_int, 22);
pub const XTENSA_HWVERSION_RA_2006_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210004, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2006_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2006_4 = @as(c_int, 23);
pub const XTENSA_HWVERSION_RA_2006_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210005, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2006_5 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2006_5 = @as(c_int, 24);
pub const XTENSA_HWVERSION_RA_2006_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210006, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2006_6 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2006_6 = @as(c_int, 25);
pub const XTENSA_HWVERSION_RA_2007_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210007, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2007_7 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2007_7 = @as(c_int, 26);
pub const XTENSA_HWVERSION_RA_2008_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210008, .decimal);
pub const XTENSA_HWCIDSCHEME_RA_2008_8 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RA_2008_8 = @as(c_int, 27);
pub const XTENSA_HWVERSION_RB_2006_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 220000, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2006_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2006_0 = @as(c_int, 48);
pub const XTENSA_HWVERSION_RB_2007_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 220001, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2007_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2007_1 = @as(c_int, 49);
pub const XTENSA_HWVERSION_RB_2007_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 221000, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2007_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2007_2 = @as(c_int, 52);
pub const XTENSA_HWVERSION_RB_2008_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 221001, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2008_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2008_3 = @as(c_int, 53);
pub const XTENSA_HWVERSION_RB_2008_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 221002, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2008_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2008_4 = @as(c_int, 54);
pub const XTENSA_HWVERSION_RB_2009_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 221003, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2009_5 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2009_5 = @as(c_int, 55);
pub const XTENSA_HWVERSION_RB_2007_2_MP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 221100, .decimal);
pub const XTENSA_HWCIDSCHEME_RB_2007_2_MP = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RB_2007_2_MP = @as(c_int, 64);
pub const XTENSA_HWVERSION_RC_2009_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230000, .decimal);
pub const XTENSA_HWCIDSCHEME_RC_2009_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RC_2009_0 = @as(c_int, 65);
pub const XTENSA_HWVERSION_RC_2010_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230001, .decimal);
pub const XTENSA_HWCIDSCHEME_RC_2010_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RC_2010_1 = @as(c_int, 66);
pub const XTENSA_HWVERSION_RC_2010_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230002, .decimal);
pub const XTENSA_HWCIDSCHEME_RC_2010_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RC_2010_2 = @as(c_int, 67);
pub const XTENSA_HWVERSION_RC_2011_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230003, .decimal);
pub const XTENSA_HWCIDSCHEME_RC_2011_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RC_2011_3 = @as(c_int, 68);
pub const XTENSA_HWVERSION_RD_2010_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240000, .decimal);
pub const XTENSA_HWCIDSCHEME_RD_2010_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RD_2010_0 = @as(c_int, 80);
pub const XTENSA_HWVERSION_RD_2011_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240001, .decimal);
pub const XTENSA_HWCIDSCHEME_RD_2011_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RD_2011_1 = @as(c_int, 81);
pub const XTENSA_HWVERSION_RD_2011_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240002, .decimal);
pub const XTENSA_HWCIDSCHEME_RD_2011_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RD_2011_2 = @as(c_int, 82);
pub const XTENSA_HWVERSION_RD_2011_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240003, .decimal);
pub const XTENSA_HWCIDSCHEME_RD_2011_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RD_2011_3 = @as(c_int, 83);
pub const XTENSA_HWVERSION_RD_2012_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240004, .decimal);
pub const XTENSA_HWCIDSCHEME_RD_2012_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RD_2012_4 = @as(c_int, 84);
pub const XTENSA_HWVERSION_RD_2012_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240005, .decimal);
pub const XTENSA_HWCIDSCHEME_RD_2012_5 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RD_2012_5 = @as(c_int, 85);
pub const XTENSA_HWVERSION_RE_2012_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250000, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2012_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2012_0 = @as(c_int, 96);
pub const XTENSA_HWVERSION_RE_2012_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250001, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2012_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2012_1 = @as(c_int, 97);
pub const XTENSA_HWVERSION_RE_2013_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250002, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2013_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2013_2 = @as(c_int, 98);
pub const XTENSA_HWVERSION_RE_2013_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250003, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2013_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2013_3 = @as(c_int, 99);
pub const XTENSA_HWVERSION_RE_2013_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250004, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2013_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2013_4 = @as(c_int, 100);
pub const XTENSA_HWVERSION_RE_2014_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250005, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2014_5 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2014_5 = @as(c_int, 101);
pub const XTENSA_HWVERSION_RE_2015_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 250006, .decimal);
pub const XTENSA_HWCIDSCHEME_RE_2015_6 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RE_2015_6 = @as(c_int, 102);
pub const XTENSA_HWVERSION_RF_2014_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 260000, .decimal);
pub const XTENSA_HWCIDSCHEME_RF_2014_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RF_2014_0 = @as(c_int, 112);
pub const XTENSA_HWVERSION_RF_2014_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 260001, .decimal);
pub const XTENSA_HWCIDSCHEME_RF_2014_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RF_2014_1 = @as(c_int, 113);
pub const XTENSA_HWVERSION_RF_2015_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 260002, .decimal);
pub const XTENSA_HWCIDSCHEME_RF_2015_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RF_2015_2 = @as(c_int, 114);
pub const XTENSA_HWVERSION_RF_2015_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 260003, .decimal);
pub const XTENSA_HWCIDSCHEME_RF_2015_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RF_2015_3 = @as(c_int, 115);
pub const XTENSA_HWVERSION_RF_2016_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 260004, .decimal);
pub const XTENSA_HWCIDSCHEME_RF_2016_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RF_2016_4 = @as(c_int, 116);
pub const XTENSA_HWVERSION_RG_2015_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270000, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2015_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2015_0 = @as(c_int, 128);
pub const XTENSA_HWVERSION_RG_2015_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270001, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2015_1 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2015_1 = @as(c_int, 129);
pub const XTENSA_HWVERSION_RG_2015_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270002, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2015_2 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2015_2 = @as(c_int, 130);
pub const XTENSA_HWVERSION_RG_2016_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270003, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2016_3 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2016_3 = @as(c_int, 131);
pub const XTENSA_HWVERSION_RG_2016_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270004, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2016_4 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2016_4 = @as(c_int, 132);
pub const XTENSA_HWVERSION_RG_2017_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270005, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2017_5 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2017_5 = @as(c_int, 133);
pub const XTENSA_HWVERSION_RG_2017_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270006, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2017_6 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2017_6 = @as(c_int, 134);
pub const XTENSA_HWVERSION_RG_2017_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270007, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2017_7 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2017_7 = @as(c_int, 135);
pub const XTENSA_HWVERSION_RG_2017_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270008, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2017_8 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2017_8 = @as(c_int, 136);
pub const XTENSA_HWVERSION_RG_2018_9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 270009, .decimal);
pub const XTENSA_HWCIDSCHEME_RG_2018_9 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RG_2018_9 = @as(c_int, 137);
pub const XTENSA_HWVERSION_RH_2016_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 280000, .decimal);
pub const XTENSA_HWCIDSCHEME_RH_2016_0 = @as(c_int, 1100);
pub const XTENSA_HWCIDVERS_RH_2016_0 = @as(c_int, 144);
pub const XTENSA_SWVERSION_T1020_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102000, .decimal);
pub const XTENSA_SWVERSION_T1020_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102001, .decimal);
pub const XTENSA_SWVERSION_T1020_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102002, .decimal);
pub const XTENSA_SWVERSION_T1020_2B = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102002, .decimal);
pub const XTENSA_SWVERSION_T1020_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102003, .decimal);
pub const XTENSA_SWVERSION_T1020_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 102004, .decimal);
pub const XTENSA_SWVERSION_T1030_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103000, .decimal);
pub const XTENSA_SWVERSION_T1030_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103001, .decimal);
pub const XTENSA_SWVERSION_T1030_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103002, .decimal);
pub const XTENSA_SWVERSION_T1030_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 103003, .decimal);
pub const XTENSA_SWVERSION_T1040_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104000, .decimal);
pub const XTENSA_SWVERSION_T1040_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104001, .decimal);
pub const XTENSA_SWVERSION_T1040_1P = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104001, .decimal);
pub const XTENSA_SWVERSION_T1040_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104002, .decimal);
pub const XTENSA_SWVERSION_T1040_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 104003, .decimal);
pub const XTENSA_SWVERSION_T1050_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105000, .decimal);
pub const XTENSA_SWVERSION_T1050_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105001, .decimal);
pub const XTENSA_SWVERSION_T1050_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105002, .decimal);
pub const XTENSA_SWVERSION_T1050_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105003, .decimal);
pub const XTENSA_SWVERSION_T1050_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105004, .decimal);
pub const XTENSA_SWVERSION_T1050_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 105005, .decimal);
pub const XTENSA_SWVERSION_RA_2004_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600000, .decimal);
pub const XTENSA_SWVERSION_RA_2005_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600001, .decimal);
pub const XTENSA_SWVERSION_RA_2005_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600002, .decimal);
pub const XTENSA_SWVERSION_RA_2005_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600003, .decimal);
pub const XTENSA_SWVERSION_RA_2006_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600004, .decimal);
pub const XTENSA_SWVERSION_RA_2006_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600005, .decimal);
pub const XTENSA_SWVERSION_RA_2006_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600006, .decimal);
pub const XTENSA_SWVERSION_RA_2007_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600007, .decimal);
pub const XTENSA_SWVERSION_RA_2008_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 600008, .decimal);
pub const XTENSA_SWVERSION_RB_2006_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 700000, .decimal);
pub const XTENSA_SWVERSION_RB_2007_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 700001, .decimal);
pub const XTENSA_SWVERSION_RB_2007_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 701000, .decimal);
pub const XTENSA_SWVERSION_RB_2008_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 701001, .decimal);
pub const XTENSA_SWVERSION_RB_2008_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 701002, .decimal);
pub const XTENSA_SWVERSION_RB_2009_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 701003, .decimal);
pub const XTENSA_SWVERSION_RB_2007_2_MP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 701100, .decimal);
pub const XTENSA_SWVERSION_RC_2009_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 800000, .decimal);
pub const XTENSA_SWVERSION_RC_2010_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 800001, .decimal);
pub const XTENSA_SWVERSION_RC_2010_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 800002, .decimal);
pub const XTENSA_SWVERSION_RC_2011_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 800003, .decimal);
pub const XTENSA_SWVERSION_RD_2010_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 900000, .decimal);
pub const XTENSA_SWVERSION_RD_2011_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 900001, .decimal);
pub const XTENSA_SWVERSION_RD_2011_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 900002, .decimal);
pub const XTENSA_SWVERSION_RD_2011_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 900003, .decimal);
pub const XTENSA_SWVERSION_RD_2012_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 900004, .decimal);
pub const XTENSA_SWVERSION_RD_2012_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 900005, .decimal);
pub const XTENSA_SWVERSION_RE_2012_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const XTENSA_SWVERSION_RE_2012_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000001, .decimal);
pub const XTENSA_SWVERSION_RE_2013_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000002, .decimal);
pub const XTENSA_SWVERSION_RE_2013_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000003, .decimal);
pub const XTENSA_SWVERSION_RE_2013_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000004, .decimal);
pub const XTENSA_SWVERSION_RE_2014_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000005, .decimal);
pub const XTENSA_SWVERSION_RE_2015_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000006, .decimal);
pub const XTENSA_SWVERSION_RF_2014_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1100000, .decimal);
pub const XTENSA_SWVERSION_RF_2014_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1100001, .decimal);
pub const XTENSA_SWVERSION_RF_2015_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1100002, .decimal);
pub const XTENSA_SWVERSION_RF_2015_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1100003, .decimal);
pub const XTENSA_SWVERSION_RF_2016_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1100004, .decimal);
pub const XTENSA_SWVERSION_RG_2015_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200000, .decimal);
pub const XTENSA_SWVERSION_RG_2015_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200001, .decimal);
pub const XTENSA_SWVERSION_RG_2015_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200002, .decimal);
pub const XTENSA_SWVERSION_RG_2016_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200003, .decimal);
pub const XTENSA_SWVERSION_RG_2016_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200004, .decimal);
pub const XTENSA_SWVERSION_RG_2017_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200005, .decimal);
pub const XTENSA_SWVERSION_RG_2017_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200006, .decimal);
pub const XTENSA_SWVERSION_RG_2017_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200007, .decimal);
pub const XTENSA_SWVERSION_RG_2017_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200008, .decimal);
pub const XTENSA_SWVERSION_RG_2018_9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1200009, .decimal);
pub const XTENSA_SWVERSION_RH_2016_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1300000, .decimal);
pub const XTENSA_SWVERSION_T1040_1_PREHOTFIX = XTENSA_SWVERSION_T1040_1P;
pub const XTENSA_SWVERSION_6_0_0 = XTENSA_SWVERSION_RA_2004_1;
pub const XTENSA_SWVERSION_6_0_1 = XTENSA_SWVERSION_RA_2005_1;
pub const XTENSA_SWVERSION_6_0_2 = XTENSA_SWVERSION_RA_2005_2;
pub const XTENSA_SWVERSION_6_0_3 = XTENSA_SWVERSION_RA_2005_3;
pub const XTENSA_SWVERSION_6_0_4 = XTENSA_SWVERSION_RA_2006_4;
pub const XTENSA_SWVERSION_6_0_5 = XTENSA_SWVERSION_RA_2006_5;
pub const XTENSA_SWVERSION_6_0_6 = XTENSA_SWVERSION_RA_2006_6;
pub const XTENSA_SWVERSION_6_0_7 = XTENSA_SWVERSION_RA_2007_7;
pub const XTENSA_SWVERSION_6_0_8 = XTENSA_SWVERSION_RA_2008_8;
pub const XTENSA_SWVERSION_7_0_0 = XTENSA_SWVERSION_RB_2006_0;
pub const XTENSA_SWVERSION_7_0_1 = XTENSA_SWVERSION_RB_2007_1;
pub const XTENSA_SWVERSION_7_1_0 = XTENSA_SWVERSION_RB_2007_2;
pub const XTENSA_SWVERSION_7_1_1 = XTENSA_SWVERSION_RB_2008_3;
pub const XTENSA_SWVERSION_7_1_2 = XTENSA_SWVERSION_RB_2008_4;
pub const XTENSA_SWVERSION_7_1_3 = XTENSA_SWVERSION_RB_2009_5;
pub const XTENSA_SWVERSION_7_1_8_MP = XTENSA_SWVERSION_RB_2007_2_MP;
pub const XTENSA_SWVERSION_8_0_0 = XTENSA_SWVERSION_RC_2009_0;
pub const XTENSA_SWVERSION_8_0_1 = XTENSA_SWVERSION_RC_2010_1;
pub const XTENSA_SWVERSION_8_0_2 = XTENSA_SWVERSION_RC_2010_2;
pub const XTENSA_SWVERSION_8_0_3 = XTENSA_SWVERSION_RC_2011_3;
pub const XTENSA_SWVERSION_9_0_0 = XTENSA_SWVERSION_RD_2010_0;
pub const XTENSA_SWVERSION_9_0_1 = XTENSA_SWVERSION_RD_2011_1;
pub const XTENSA_SWVERSION_9_0_2 = XTENSA_SWVERSION_RD_2011_2;
pub const XTENSA_SWVERSION_9_0_3 = XTENSA_SWVERSION_RD_2011_3;
pub const XTENSA_SWVERSION_9_0_4 = XTENSA_SWVERSION_RD_2012_4;
pub const XTENSA_SWVERSION_9_0_5 = XTENSA_SWVERSION_RD_2012_5;
pub const XTENSA_SWVERSION_10_0_0 = XTENSA_SWVERSION_RE_2012_0;
pub const XTENSA_SWVERSION_10_0_1 = XTENSA_SWVERSION_RE_2012_1;
pub const XTENSA_SWVERSION_10_0_2 = XTENSA_SWVERSION_RE_2013_2;
pub const XTENSA_SWVERSION_10_0_3 = XTENSA_SWVERSION_RE_2013_3;
pub const XTENSA_SWVERSION_10_0_4 = XTENSA_SWVERSION_RE_2013_4;
pub const XTENSA_SWVERSION_10_0_5 = XTENSA_SWVERSION_RE_2014_5;
pub const XTENSA_SWVERSION_10_0_6 = XTENSA_SWVERSION_RE_2015_6;
pub const XTENSA_SWVERSION_11_0_0 = XTENSA_SWVERSION_RF_2014_0;
pub const XTENSA_SWVERSION_11_0_1 = XTENSA_SWVERSION_RF_2014_1;
pub const XTENSA_SWVERSION_11_0_2 = XTENSA_SWVERSION_RF_2015_2;
pub const XTENSA_SWVERSION_11_0_3 = XTENSA_SWVERSION_RF_2015_3;
pub const XTENSA_SWVERSION_11_0_4 = XTENSA_SWVERSION_RF_2016_4;
pub const XTENSA_SWVERSION_12_0_0 = XTENSA_SWVERSION_RG_2015_0;
pub const XTENSA_SWVERSION_12_0_1 = XTENSA_SWVERSION_RG_2015_1;
pub const XTENSA_SWVERSION_12_0_2 = XTENSA_SWVERSION_RG_2015_2;
pub const XTENSA_SWVERSION_12_0_3 = XTENSA_SWVERSION_RG_2016_3;
pub const XTENSA_SWVERSION_12_0_4 = XTENSA_SWVERSION_RG_2016_4;
pub const XTENSA_SWVERSION_12_0_5 = XTENSA_SWVERSION_RG_2017_5;
pub const XTENSA_SWVERSION_12_0_6 = XTENSA_SWVERSION_RG_2017_6;
pub const XTENSA_SWVERSION_12_0_7 = XTENSA_SWVERSION_RG_2017_7;
pub const XTENSA_SWVERSION_12_0_8 = XTENSA_SWVERSION_RG_2017_8;
pub const XTENSA_SWVERSION_12_0_9 = XTENSA_SWVERSION_RG_2018_9;
pub const XTENSA_SWVERSION_13_0_0 = XTENSA_SWVERSION_RH_2016_0;
pub const XTENSA_RELEASE_NAME = "RG-2018.9";
pub const XTENSA_RELEASE_CANONICAL_NAME = "RG-2018.9";
pub const XTENSA_SWVERSION = XTENSA_SWVERSION_RG_2018_9;
pub const XTENSA_SWVERSION_NAME = "12.0.9";
pub const XTENSA_SWVERSION_NAME_IDENT = @compileError("invalid number suffix: '_0_9'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtensa-versions.h:390:9
pub const XTENSA_SWVERSION_CANONICAL_NAME = "12.0.9";
pub const XTENSA_SWVERSION_MAJORMID_NAME = "12.0";
pub const XTENSA_SWVERSION_MAJOR_NAME = "12";
pub const XTENSA_SWVERSION_LICENSE_NAME = "12.0";
pub const _XTENSA_CORE_CONFIGURATION_H = "";
pub const XTENSA_CONFIG_CORE_MATMAP_H = "";
pub const XCHAL_FCA_LIST = XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_BYPASS ++ XCHAL_SEP ++ XTHAL_FAM_BYPASS ++ XCHAL_SEP ++ XTHAL_FAM_BYPASS ++ XCHAL_SEP ++ XTHAL_FAM_BYPASS ++ XCHAL_SEP ++ XTHAL_FAM_BYPASS ++ XCHAL_SEP ++ XTHAL_FAM_BYPASS ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_FAM_EXCEPTION;
pub const XCHAL_LCA_LIST = XTHAL_LAM_BYPASSG ++ XCHAL_SEP ++ XTHAL_LAM_BYPASSG ++ XCHAL_SEP ++ XTHAL_LAM_BYPASSG ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_BYPASSG ++ XCHAL_SEP ++ XTHAL_LAM_BYPASSG ++ XCHAL_SEP ++ XTHAL_LAM_BYPASSG ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_LAM_EXCEPTION;
pub const XCHAL_SCA_LIST = XTHAL_SAM_BYPASS ++ XCHAL_SEP ++ XTHAL_SAM_BYPASS ++ XCHAL_SEP ++ XTHAL_SAM_BYPASS ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_BYPASS ++ XCHAL_SEP ++ XTHAL_SAM_BYPASS ++ XCHAL_SEP ++ XTHAL_SAM_BYPASS ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION ++ XCHAL_SEP ++ XTHAL_SAM_EXCEPTION;
pub const XCHAL_CA_R = @as(c_int, 0xC0) | @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_CA_RX = @as(c_int, 0xD0) | @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_CA_RW = @as(c_int, 0xE0) | @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_CA_RWX = @as(c_int, 0xF0) | @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_CA_BYPASS = @as(c_int, 2);
pub const XCHAL_CA_BYPASSBUF = @as(c_int, 6);
pub const XCHAL_CA_WRITETHRU = @as(c_int, 1);
pub const XCHAL_CA_WRITEBACK = @as(c_int, 2);
pub const XCHAL_HAVE_CA_WRITEBACK_NOALLOC = @as(c_int, 0);
pub const XCHAL_CA_WRITEBACK_NOALLOC = @as(c_int, 2);
pub const XCHAL_CA_BYPASS_RW = @as(c_int, 0);
pub const XCHAL_CA_WRITETHRU_RW = @as(c_int, 0);
pub const XCHAL_CA_WRITEBACK_RW = @as(c_int, 0);
pub const XCHAL_CA_WRITEBACK_NOALLOC_RW = @as(c_int, 0);
pub const XCHAL_CA_ILLEGAL = @as(c_int, 15);
pub const XCHAL_CA_ISOLATE = @as(c_int, 0);
pub const XCHAL_MMU_ASID_INVALID = @as(c_int, 0);
pub const XCHAL_MMU_ASID_KERNEL = @as(c_int, 0);
pub const XCHAL_MMU_SR_BITS = @as(c_int, 0);
pub const XCHAL_MMU_CA_BITS = @as(c_int, 4);
pub const XCHAL_MMU_MAX_PTE_PAGE_SIZE = @as(c_int, 29);
pub const XCHAL_MMU_MIN_PTE_PAGE_SIZE = @as(c_int, 29);
pub const XCHAL_ITLB_WAY_BITS = @as(c_int, 0);
pub const XCHAL_ITLB_WAYS = @as(c_int, 1);
pub const XCHAL_ITLB_ARF_WAYS = @as(c_int, 0);
pub const XCHAL_ITLB_SETS = @as(c_int, 1);
pub const XCHAL_ITLB_WAY0_SET = @as(c_int, 0);
pub const XCHAL_ITLB_ARF_SETS = @as(c_int, 0);
pub const XCHAL_ITLB_MINWIRED_SETS = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_WAY = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_WAYS = @as(c_int, 1);
pub const XCHAL_ITLB_SET0_ENTRIES_LOG2 = @as(c_int, 3);
pub const XCHAL_ITLB_SET0_ENTRIES = @as(c_int, 8);
pub const XCHAL_ITLB_SET0_ARF = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_PAGESIZES = @as(c_int, 1);
pub const XCHAL_ITLB_SET0_PAGESZ_BITS = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_PAGESZ_LOG2_MIN = @as(c_int, 29);
pub const XCHAL_ITLB_SET0_PAGESZ_LOG2_MAX = @as(c_int, 29);
pub const XCHAL_ITLB_SET0_PAGESZ_LOG2_LIST = @as(c_int, 29);
pub const XCHAL_ITLB_SET0_ASID_CONSTMASK = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_VPN_CONSTMASK = @as(c_int, 0x00000000);
pub const XCHAL_ITLB_SET0_PPN_CONSTMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xE0000000, .hex);
pub const XCHAL_ITLB_SET0_CA_CONSTMASK = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_ASID_RESET = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_VPN_RESET = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_PPN_RESET = @as(c_int, 0);
pub const XCHAL_ITLB_SET0_CA_RESET = @as(c_int, 1);
pub const XCHAL_ITLB_SET0_E0_VPN_CONST = @as(c_int, 0x00000000);
pub const XCHAL_ITLB_SET0_E1_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XCHAL_ITLB_SET0_E2_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_ITLB_SET0_E3_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XCHAL_ITLB_SET0_E4_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const XCHAL_ITLB_SET0_E5_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XCHAL_ITLB_SET0_E6_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XCHAL_ITLB_SET0_E7_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xE0000000, .hex);
pub const XCHAL_ITLB_SET0_E0_PPN_CONST = @as(c_int, 0x00000000);
pub const XCHAL_ITLB_SET0_E1_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XCHAL_ITLB_SET0_E2_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_ITLB_SET0_E3_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XCHAL_ITLB_SET0_E4_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const XCHAL_ITLB_SET0_E5_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XCHAL_ITLB_SET0_E6_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XCHAL_ITLB_SET0_E7_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xE0000000, .hex);
pub const XCHAL_ITLB_SET0_E0_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E1_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E2_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E3_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E4_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E5_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E6_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_ITLB_SET0_E7_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_WAY_BITS = @as(c_int, 0);
pub const XCHAL_DTLB_WAYS = @as(c_int, 1);
pub const XCHAL_DTLB_ARF_WAYS = @as(c_int, 0);
pub const XCHAL_DTLB_SETS = @as(c_int, 1);
pub const XCHAL_DTLB_WAY0_SET = @as(c_int, 0);
pub const XCHAL_DTLB_ARF_SETS = @as(c_int, 0);
pub const XCHAL_DTLB_MINWIRED_SETS = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_WAY = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_WAYS = @as(c_int, 1);
pub const XCHAL_DTLB_SET0_ENTRIES_LOG2 = @as(c_int, 3);
pub const XCHAL_DTLB_SET0_ENTRIES = @as(c_int, 8);
pub const XCHAL_DTLB_SET0_ARF = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_PAGESIZES = @as(c_int, 1);
pub const XCHAL_DTLB_SET0_PAGESZ_BITS = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_PAGESZ_LOG2_MIN = @as(c_int, 29);
pub const XCHAL_DTLB_SET0_PAGESZ_LOG2_MAX = @as(c_int, 29);
pub const XCHAL_DTLB_SET0_PAGESZ_LOG2_LIST = @as(c_int, 29);
pub const XCHAL_DTLB_SET0_ASID_CONSTMASK = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_VPN_CONSTMASK = @as(c_int, 0x00000000);
pub const XCHAL_DTLB_SET0_PPN_CONSTMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xE0000000, .hex);
pub const XCHAL_DTLB_SET0_CA_CONSTMASK = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_ASID_RESET = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_VPN_RESET = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_PPN_RESET = @as(c_int, 0);
pub const XCHAL_DTLB_SET0_CA_RESET = @as(c_int, 1);
pub const XCHAL_DTLB_SET0_E0_VPN_CONST = @as(c_int, 0x00000000);
pub const XCHAL_DTLB_SET0_E1_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XCHAL_DTLB_SET0_E2_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_DTLB_SET0_E3_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XCHAL_DTLB_SET0_E4_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const XCHAL_DTLB_SET0_E5_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XCHAL_DTLB_SET0_E6_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XCHAL_DTLB_SET0_E7_VPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xE0000000, .hex);
pub const XCHAL_DTLB_SET0_E0_PPN_CONST = @as(c_int, 0x00000000);
pub const XCHAL_DTLB_SET0_E1_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XCHAL_DTLB_SET0_E2_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_DTLB_SET0_E3_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XCHAL_DTLB_SET0_E4_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const XCHAL_DTLB_SET0_E5_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XCHAL_DTLB_SET0_E6_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XCHAL_DTLB_SET0_E7_PPN_CONST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xE0000000, .hex);
pub const XCHAL_DTLB_SET0_E0_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E1_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E2_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E3_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E4_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E5_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E6_CA_RESET = @as(c_int, 0x02);
pub const XCHAL_DTLB_SET0_E7_CA_RESET = @as(c_int, 0x02);
pub const _XTENSA_CORE_TIE_H = "";
pub const XCHAL_CP_NUM = @as(c_int, 2);
pub const XCHAL_CP_MAX = @as(c_int, 4);
pub const XCHAL_CP_MASK = @as(c_int, 0x09);
pub const XCHAL_CP_PORT_MASK = @as(c_int, 0x00);
pub const XCHAL_CP0_NAME = "FPU";
pub const XCHAL_CP0_IDENT = @compileError("unable to translate macro: undefined identifier `FPU`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:42:9
pub const XCHAL_CP0_SA_SIZE = @as(c_int, 72);
pub const XCHAL_CP0_SA_ALIGN = @as(c_int, 4);
pub const XCHAL_CP_ID_FPU = @as(c_int, 0);
pub const XCHAL_CP3_NAME = "cop_ai";
pub const XCHAL_CP3_IDENT = @compileError("unable to translate macro: undefined identifier `cop_ai`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:47:9
pub const XCHAL_CP3_SA_SIZE = @as(c_int, 208);
pub const XCHAL_CP3_SA_ALIGN = @as(c_int, 16);
pub const XCHAL_CP_ID_COP_AI = @as(c_int, 3);
pub const XCHAL_CP1_SA_SIZE = @as(c_int, 0);
pub const XCHAL_CP1_SA_ALIGN = @as(c_int, 1);
pub const XCHAL_CP2_SA_SIZE = @as(c_int, 0);
pub const XCHAL_CP2_SA_ALIGN = @as(c_int, 1);
pub const XCHAL_CP4_SA_SIZE = @as(c_int, 0);
pub const XCHAL_CP4_SA_ALIGN = @as(c_int, 1);
pub const XCHAL_CP5_SA_SIZE = @as(c_int, 0);
pub const XCHAL_CP5_SA_ALIGN = @as(c_int, 1);
pub const XCHAL_CP6_SA_SIZE = @as(c_int, 0);
pub const XCHAL_CP6_SA_ALIGN = @as(c_int, 1);
pub const XCHAL_CP7_SA_SIZE = @as(c_int, 0);
pub const XCHAL_CP7_SA_ALIGN = @as(c_int, 1);
pub const XCHAL_NCP_SA_SIZE = @as(c_int, 36);
pub const XCHAL_NCP_SA_ALIGN = @as(c_int, 4);
pub const XCHAL_TOTAL_SA_SIZE = @as(c_int, 336);
pub const XCHAL_TOTAL_SA_ALIGN = @as(c_int, 16);
pub const XCHAL_NCP_SA_NUM = @as(c_int, 9);
pub const XCHAL_NCP_SA_LIST = @compileError("unable to translate macro: undefined identifier `XCHAL_SA_REG`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:115:9
pub const XCHAL_CP0_SA_NUM = @as(c_int, 18);
pub const XCHAL_CP0_SA_LIST = @compileError("unable to translate macro: undefined identifier `XCHAL_SA_REG`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:127:9
pub const XCHAL_CP1_SA_NUM = @as(c_int, 0);
pub const XCHAL_CP1_SA_LIST = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:148:9
pub const XCHAL_CP2_SA_NUM = @as(c_int, 0);
pub const XCHAL_CP2_SA_LIST = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:151:9
pub const XCHAL_CP3_SA_NUM = @as(c_int, 26);
pub const XCHAL_CP3_SA_LIST = @compileError("unable to translate macro: undefined identifier `XCHAL_SA_REG`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:154:9
pub const XCHAL_CP4_SA_NUM = @as(c_int, 0);
pub const XCHAL_CP4_SA_LIST = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:183:9
pub const XCHAL_CP5_SA_NUM = @as(c_int, 0);
pub const XCHAL_CP5_SA_LIST = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:186:9
pub const XCHAL_CP6_SA_NUM = @as(c_int, 0);
pub const XCHAL_CP6_SA_LIST = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:189:9
pub const XCHAL_CP7_SA_NUM = @as(c_int, 0);
pub const XCHAL_CP7_SA_LIST = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/tie.h:192:9
pub const XCHAL_OP0_FORMAT_LENGTHS = blk: {
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    break :blk @as(c_int, 4);
};
pub const XCHAL_BYTE0_FORMAT_LENGTHS = blk: {
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    _ = @as(c_int, 4);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 3);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 2);
    _ = @as(c_int, 4);
    break :blk @as(c_int, 4);
};
pub const XCHAL_SEP = @compileError("unable to translate C expr: unexpected token ','");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:79:9
pub const XCHAL_SEP2 = @compileError("unable to translate C expr: unexpected token '}'");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:83:9
pub const XCHAL_MAYHAVE_ERRATUM_XEA1KWIN = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_XEA1`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:95:9
pub const XCHAL_ERRATUM_453 = @as(c_int, 0);
pub const XCHAL_ERRATUM_497 = @as(c_int, 0);
pub const XCHAL_ERRATUM_572 = @as(c_int, 0);
pub const XCHAL_HAVE_LE = @as(c_int, 1);
pub const XCHAL_MEMORY_ORDER = XTHAL_LITTLEENDIAN;
pub const _XCHAL_INTLEVEL_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:165:9
pub inline fn XCHAL_INTLEVEL_MASK(n: anytype) @TypeOf(_XCHAL_INTLEVEL_MASK(n)) {
    _ = &n;
    return _XCHAL_INTLEVEL_MASK(n);
}
pub const _XCHAL_INTLEVEL_ANDBELOWMASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:167:9
pub inline fn XCHAL_INTLEVEL_ANDBELOW_MASK(n: anytype) @TypeOf(_XCHAL_INTLEVEL_ANDBELOWMASK(n)) {
    _ = &n;
    return _XCHAL_INTLEVEL_ANDBELOWMASK(n);
}
pub const _XCHAL_INTLEVEL_NUM = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:169:9
pub inline fn XCHAL_INTLEVEL_NUM(n: anytype) @TypeOf(_XCHAL_INTLEVEL_NUM(n)) {
    _ = &n;
    return _XCHAL_INTLEVEL_NUM(n);
}
pub const _XCHAL_INT_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_INT`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:171:9
pub inline fn XCHAL_INT_LEVEL(n: anytype) @TypeOf(_XCHAL_INT_LEVEL(n)) {
    _ = &n;
    return _XCHAL_INT_LEVEL(n);
}
pub const _XCHAL_INT_TYPE = @compileError("unable to translate macro: undefined identifier `XCHAL_INT`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:173:9
pub inline fn XCHAL_INT_TYPE(n: anytype) @TypeOf(_XCHAL_INT_TYPE(n)) {
    _ = &n;
    return _XCHAL_INT_TYPE(n);
}
pub const _XCHAL_TIMER_INTERRUPT = @compileError("unable to translate macro: undefined identifier `XCHAL_TIMER`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:175:9
pub inline fn XCHAL_TIMER_INTERRUPT(n: anytype) @TypeOf(_XCHAL_TIMER_INTERRUPT(n)) {
    _ = &n;
    return _XCHAL_TIMER_INTERRUPT(n);
}
pub const XCHAL_HAVE_HIGHLEVEL_INTERRUPTS = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_HIGHPRI_INTERRUPTS`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:179:9
pub const XCHAL_NUM_LOWPRI_LEVELS = @as(c_int, 1);
pub const XCHAL_FIRST_HIGHPRI_LEVEL = XCHAL_NUM_LOWPRI_LEVELS + @as(c_int, 1);
pub const XCHAL_INTLEVEL0_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL8_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL9_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL10_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL11_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL12_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL13_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL14_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL15_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL_MASKS = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL1_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:196:9
pub const XCHAL_INTLEVEL0_ANDBELOW_MASK = @as(c_int, 0x00000000);
pub const XCHAL_INTLEVEL8_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:215:9
pub const XCHAL_INTLEVEL9_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:216:9
pub const XCHAL_INTLEVEL10_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:217:9
pub const XCHAL_INTLEVEL11_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:218:9
pub const XCHAL_INTLEVEL12_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:219:9
pub const XCHAL_INTLEVEL13_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:220:9
pub const XCHAL_INTLEVEL14_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:221:9
pub const XCHAL_INTLEVEL15_ANDBELOW_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL7_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:222:9
pub const XCHAL_LOWPRI_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL1_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:225:9
pub const XCHAL_EXCM_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXCM_LEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:228:9
pub const XCHAL_INTLEVEL_ANDBELOW_MASKS = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL1_ANDBELOW_MASK`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:231:9
pub const XCHAL_INT_LEVELS = XCHAL_INT0_LEVEL ++ XCHAL_SEP ++ XCHAL_INT1_LEVEL ++ XCHAL_SEP ++ XCHAL_INT2_LEVEL ++ XCHAL_SEP ++ XCHAL_INT3_LEVEL ++ XCHAL_SEP ++ XCHAL_INT4_LEVEL ++ XCHAL_SEP ++ XCHAL_INT5_LEVEL ++ XCHAL_SEP ++ XCHAL_INT6_LEVEL ++ XCHAL_SEP ++ XCHAL_INT7_LEVEL ++ XCHAL_SEP ++ XCHAL_INT8_LEVEL ++ XCHAL_SEP ++ XCHAL_INT9_LEVEL ++ XCHAL_SEP ++ XCHAL_INT10_LEVEL ++ XCHAL_SEP ++ XCHAL_INT11_LEVEL ++ XCHAL_SEP ++ XCHAL_INT12_LEVEL ++ XCHAL_SEP ++ XCHAL_INT13_LEVEL ++ XCHAL_SEP ++ XCHAL_INT14_LEVEL ++ XCHAL_SEP ++ XCHAL_INT15_LEVEL ++ XCHAL_SEP ++ XCHAL_INT16_LEVEL ++ XCHAL_SEP ++ XCHAL_INT17_LEVEL ++ XCHAL_SEP ++ XCHAL_INT18_LEVEL ++ XCHAL_SEP ++ XCHAL_INT19_LEVEL ++ XCHAL_SEP ++ XCHAL_INT20_LEVEL ++ XCHAL_SEP ++ XCHAL_INT21_LEVEL ++ XCHAL_SEP ++ XCHAL_INT22_LEVEL ++ XCHAL_SEP ++ XCHAL_INT23_LEVEL ++ XCHAL_SEP ++ XCHAL_INT24_LEVEL ++ XCHAL_SEP ++ XCHAL_INT25_LEVEL ++ XCHAL_SEP ++ XCHAL_INT26_LEVEL ++ XCHAL_SEP ++ XCHAL_INT27_LEVEL ++ XCHAL_SEP ++ XCHAL_INT28_LEVEL ++ XCHAL_SEP ++ XCHAL_INT29_LEVEL ++ XCHAL_SEP ++ XCHAL_INT30_LEVEL ++ XCHAL_SEP ++ XCHAL_INT31_LEVEL;
pub const XCHAL_INT_TYPES = XCHAL_INT0_TYPE ++ XCHAL_SEP ++ XCHAL_INT1_TYPE ++ XCHAL_SEP ++ XCHAL_INT2_TYPE ++ XCHAL_SEP ++ XCHAL_INT3_TYPE ++ XCHAL_SEP ++ XCHAL_INT4_TYPE ++ XCHAL_SEP ++ XCHAL_INT5_TYPE ++ XCHAL_SEP ++ XCHAL_INT6_TYPE ++ XCHAL_SEP ++ XCHAL_INT7_TYPE ++ XCHAL_SEP ++ XCHAL_INT8_TYPE ++ XCHAL_SEP ++ XCHAL_INT9_TYPE ++ XCHAL_SEP ++ XCHAL_INT10_TYPE ++ XCHAL_SEP ++ XCHAL_INT11_TYPE ++ XCHAL_SEP ++ XCHAL_INT12_TYPE ++ XCHAL_SEP ++ XCHAL_INT13_TYPE ++ XCHAL_SEP ++ XCHAL_INT14_TYPE ++ XCHAL_SEP ++ XCHAL_INT15_TYPE ++ XCHAL_SEP ++ XCHAL_INT16_TYPE ++ XCHAL_SEP ++ XCHAL_INT17_TYPE ++ XCHAL_SEP ++ XCHAL_INT18_TYPE ++ XCHAL_SEP ++ XCHAL_INT19_TYPE ++ XCHAL_SEP ++ XCHAL_INT20_TYPE ++ XCHAL_SEP ++ XCHAL_INT21_TYPE ++ XCHAL_SEP ++ XCHAL_INT22_TYPE ++ XCHAL_SEP ++ XCHAL_INT23_TYPE ++ XCHAL_SEP ++ XCHAL_INT24_TYPE ++ XCHAL_SEP ++ XCHAL_INT25_TYPE ++ XCHAL_SEP ++ XCHAL_INT26_TYPE ++ XCHAL_SEP ++ XCHAL_INT27_TYPE ++ XCHAL_SEP ++ XCHAL_INT28_TYPE ++ XCHAL_SEP ++ XCHAL_INT29_TYPE ++ XCHAL_SEP ++ XCHAL_INT30_TYPE ++ XCHAL_SEP ++ XCHAL_INT31_TYPE;
pub const XCHAL_INTTYPE_MASKS = @compileError("unable to translate macro: undefined identifier `XCHAL_INTTYPE_MASK_UNCONFIGURED`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:322:9
pub const XCHAL_INTCLEARABLE_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTTYPE_MASK_SOFTWARE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:334:9
pub const XCHAL_INTSETTABLE_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_INTTYPE_MASK_SOFTWARE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:336:9
pub const XCHAL_TIMER_INTERRUPTS = @compileError("unable to translate macro: undefined identifier `XCHAL_TIMER0_INTERRUPT`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:339:9
pub const XCHAL_INT0_LEVEL = @as(c_int, 0);
pub const XCHAL_INT0_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT1_LEVEL = @as(c_int, 0);
pub const XCHAL_INT1_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT2_LEVEL = @as(c_int, 0);
pub const XCHAL_INT2_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT3_LEVEL = @as(c_int, 0);
pub const XCHAL_INT3_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT4_LEVEL = @as(c_int, 0);
pub const XCHAL_INT4_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT5_LEVEL = @as(c_int, 0);
pub const XCHAL_INT5_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT6_LEVEL = @as(c_int, 0);
pub const XCHAL_INT6_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT7_LEVEL = @as(c_int, 0);
pub const XCHAL_INT7_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT8_LEVEL = @as(c_int, 0);
pub const XCHAL_INT8_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT9_LEVEL = @as(c_int, 0);
pub const XCHAL_INT9_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT10_LEVEL = @as(c_int, 0);
pub const XCHAL_INT10_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT11_LEVEL = @as(c_int, 0);
pub const XCHAL_INT11_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT12_LEVEL = @as(c_int, 0);
pub const XCHAL_INT12_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT13_LEVEL = @as(c_int, 0);
pub const XCHAL_INT13_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT14_LEVEL = @as(c_int, 0);
pub const XCHAL_INT14_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT15_LEVEL = @as(c_int, 0);
pub const XCHAL_INT15_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT16_LEVEL = @as(c_int, 0);
pub const XCHAL_INT16_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT17_LEVEL = @as(c_int, 0);
pub const XCHAL_INT17_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT18_LEVEL = @as(c_int, 0);
pub const XCHAL_INT18_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT19_LEVEL = @as(c_int, 0);
pub const XCHAL_INT19_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT20_LEVEL = @as(c_int, 0);
pub const XCHAL_INT20_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT21_LEVEL = @as(c_int, 0);
pub const XCHAL_INT21_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT22_LEVEL = @as(c_int, 0);
pub const XCHAL_INT22_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT23_LEVEL = @as(c_int, 0);
pub const XCHAL_INT23_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT24_LEVEL = @as(c_int, 0);
pub const XCHAL_INT24_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT25_LEVEL = @as(c_int, 0);
pub const XCHAL_INT25_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT26_LEVEL = @as(c_int, 0);
pub const XCHAL_INT26_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT27_LEVEL = @as(c_int, 0);
pub const XCHAL_INT27_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT28_LEVEL = @as(c_int, 0);
pub const XCHAL_INT28_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT29_LEVEL = @as(c_int, 0);
pub const XCHAL_INT29_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT30_LEVEL = @as(c_int, 0);
pub const XCHAL_INT30_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_INT31_LEVEL = @as(c_int, 0);
pub const XCHAL_INT31_TYPE = XTHAL_INTTYPE_UNCONFIGURED;
pub const XCHAL_EXTINT0_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT0_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:483:9
pub const XCHAL_EXTINT0_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT0_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:484:9
pub const XCHAL_EXTINT1_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT1_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:485:9
pub const XCHAL_EXTINT1_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT1_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:486:9
pub const XCHAL_EXTINT2_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT2_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:487:9
pub const XCHAL_EXTINT2_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT2_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:488:9
pub const XCHAL_EXTINT3_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT3_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:489:9
pub const XCHAL_EXTINT3_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT3_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:490:9
pub const XCHAL_EXTINT4_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT4_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:491:9
pub const XCHAL_EXTINT4_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT4_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:492:9
pub const XCHAL_EXTINT5_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT5_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:493:9
pub const XCHAL_EXTINT5_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT5_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:494:9
pub const XCHAL_EXTINT6_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT6_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:495:9
pub const XCHAL_EXTINT6_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT6_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:496:9
pub const XCHAL_EXTINT7_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT7_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:497:9
pub const XCHAL_EXTINT7_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT7_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:498:9
pub const XCHAL_EXTINT8_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT8_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:499:9
pub const XCHAL_EXTINT8_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT8_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:500:9
pub const XCHAL_EXTINT9_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT9_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:501:9
pub const XCHAL_EXTINT9_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT9_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:502:9
pub const XCHAL_EXTINT10_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT10_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:503:9
pub const XCHAL_EXTINT10_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT10_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:504:9
pub const XCHAL_EXTINT11_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT11_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:505:9
pub const XCHAL_EXTINT11_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT11_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:506:9
pub const XCHAL_EXTINT12_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT12_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:507:9
pub const XCHAL_EXTINT12_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT12_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:508:9
pub const XCHAL_EXTINT13_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT13_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:509:9
pub const XCHAL_EXTINT13_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT13_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:510:9
pub const XCHAL_EXTINT14_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT14_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:511:9
pub const XCHAL_EXTINT14_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT14_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:512:9
pub const XCHAL_EXTINT15_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT15_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:513:9
pub const XCHAL_EXTINT15_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT15_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:514:9
pub const XCHAL_EXTINT16_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT16_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:515:9
pub const XCHAL_EXTINT16_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT16_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:516:9
pub const XCHAL_EXTINT17_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT17_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:517:9
pub const XCHAL_EXTINT17_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT17_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:518:9
pub const XCHAL_EXTINT18_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT18_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:519:9
pub const XCHAL_EXTINT18_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT18_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:520:9
pub const XCHAL_EXTINT19_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT19_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:521:9
pub const XCHAL_EXTINT19_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT19_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:522:9
pub const XCHAL_EXTINT20_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT20_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:523:9
pub const XCHAL_EXTINT20_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT20_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:524:9
pub const XCHAL_EXTINT21_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT21_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:525:9
pub const XCHAL_EXTINT21_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT21_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:526:9
pub const XCHAL_EXTINT22_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT22_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:527:9
pub const XCHAL_EXTINT22_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT22_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:528:9
pub const XCHAL_EXTINT23_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT23_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:529:9
pub const XCHAL_EXTINT23_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT23_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:530:9
pub const XCHAL_EXTINT24_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT24_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:531:9
pub const XCHAL_EXTINT24_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT24_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:532:9
pub const XCHAL_EXTINT25_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT25_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:533:9
pub const XCHAL_EXTINT25_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT25_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:534:9
pub const XCHAL_EXTINT26_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT26_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:535:9
pub const XCHAL_EXTINT26_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT26_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:536:9
pub const XCHAL_EXTINT27_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT27_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:537:9
pub const XCHAL_EXTINT27_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT27_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:538:9
pub const XCHAL_EXTINT28_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT28_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:539:9
pub const XCHAL_EXTINT28_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT28_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:540:9
pub const XCHAL_EXTINT29_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT29_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:541:9
pub const XCHAL_EXTINT29_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT29_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:542:9
pub const XCHAL_EXTINT30_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT30_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:543:9
pub const XCHAL_EXTINT30_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT30_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:544:9
pub const XCHAL_EXTINT31_MASK = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT31_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:545:9
pub const XCHAL_EXTINT31_LEVEL = @compileError("unable to translate macro: undefined identifier `XCHAL_EXTINT31_NUM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:546:9
pub const XCHAL_HAVE_OLD_EXC_ARCH = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_XEA1`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:554:9
pub const XCHAL_HAVE_EXCM = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_XEA2`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:555:9
pub const _XCHAL_INTLEVEL_VECTOR_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INTLEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:582:9
pub inline fn XCHAL_INTLEVEL_VECTOR_VADDR(n: anytype) @TypeOf(_XCHAL_INTLEVEL_VECTOR_VADDR(n)) {
    _ = &n;
    return _XCHAL_INTLEVEL_VECTOR_VADDR(n);
}
pub const XCHAL_EXCCAUSE_ILLEGAL_INSTRUCTION = @as(c_int, 0);
pub const XCHAL_EXCCAUSE_SYSTEM_CALL = @as(c_int, 1);
pub const XCHAL_EXCCAUSE_INSTRUCTION_FETCH_ERROR = @as(c_int, 2);
pub const XCHAL_EXCCAUSE_LOAD_STORE_ERROR = @as(c_int, 3);
pub const XCHAL_EXCCAUSE_LEVEL1_INTERRUPT = @as(c_int, 4);
pub const XCHAL_EXCCAUSE_ALLOCA = @as(c_int, 5);
pub const XCHAL_EXCCAUSE_INTEGER_DIVIDE_BY_ZERO = @as(c_int, 6);
pub const XCHAL_EXCCAUSE_SPECULATION = @as(c_int, 7);
pub const XCHAL_EXCCAUSE_PRIVILEGED = @as(c_int, 8);
pub const XCHAL_EXCCAUSE_UNALIGNED = @as(c_int, 9);
pub const XCHAL_EXCCAUSE_ITLB_MISS = @as(c_int, 16);
pub const XCHAL_EXCCAUSE_ITLB_MULTIHIT = @as(c_int, 17);
pub const XCHAL_EXCCAUSE_ITLB_PRIVILEGE = @as(c_int, 18);
pub const XCHAL_EXCCAUSE_ITLB_SIZE_RESTRICTION = @as(c_int, 19);
pub const XCHAL_EXCCAUSE_FETCH_CACHE_ATTRIBUTE = @as(c_int, 20);
pub const XCHAL_EXCCAUSE_DTLB_MISS = @as(c_int, 24);
pub const XCHAL_EXCCAUSE_DTLB_MULTIHIT = @as(c_int, 25);
pub const XCHAL_EXCCAUSE_DTLB_PRIVILEGE = @as(c_int, 26);
pub const XCHAL_EXCCAUSE_DTLB_SIZE_RESTRICTION = @as(c_int, 27);
pub const XCHAL_EXCCAUSE_LOAD_CACHE_ATTRIBUTE = @as(c_int, 28);
pub const XCHAL_EXCCAUSE_STORE_CACHE_ATTRIBUTE = @as(c_int, 29);
pub const XCHAL_EXCCAUSE_COPROCESSOR0_DISABLED = @as(c_int, 32);
pub const XCHAL_EXCCAUSE_COPROCESSOR1_DISABLED = @as(c_int, 33);
pub const XCHAL_EXCCAUSE_COPROCESSOR2_DISABLED = @as(c_int, 34);
pub const XCHAL_EXCCAUSE_COPROCESSOR3_DISABLED = @as(c_int, 35);
pub const XCHAL_EXCCAUSE_COPROCESSOR4_DISABLED = @as(c_int, 36);
pub const XCHAL_EXCCAUSE_COPROCESSOR5_DISABLED = @as(c_int, 37);
pub const XCHAL_EXCCAUSE_COPROCESSOR6_DISABLED = @as(c_int, 38);
pub const XCHAL_EXCCAUSE_COPROCESSOR7_DISABLED = @as(c_int, 39);
pub const XCHAL_DBREAKC_VALIDMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC000003F, .hex);
pub const XCHAL_DBREAKC_MASK_BITS = @as(c_int, 6);
pub const XCHAL_DBREAKC_MASK_NUM = @as(c_int, 64);
pub const XCHAL_DBREAKC_MASK_SHIFT = @as(c_int, 0);
pub const XCHAL_DBREAKC_MASK_MASK = @as(c_int, 0x0000003F);
pub const XCHAL_DBREAKC_LOADBREAK_BITS = @as(c_int, 1);
pub const XCHAL_DBREAKC_LOADBREAK_NUM = @as(c_int, 2);
pub const XCHAL_DBREAKC_LOADBREAK_SHIFT = @as(c_int, 30);
pub const XCHAL_DBREAKC_LOADBREAK_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const XCHAL_DBREAKC_STOREBREAK_BITS = @as(c_int, 1);
pub const XCHAL_DBREAKC_STOREBREAK_NUM = @as(c_int, 2);
pub const XCHAL_DBREAKC_STOREBREAK_SHIFT = @as(c_int, 31);
pub const XCHAL_DBREAKC_STOREBREAK_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const XCHAL_PS_VALIDMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00070F3F, .hex);
pub const XCHAL_PS_INTLEVEL_BITS = @as(c_int, 4);
pub const XCHAL_PS_INTLEVEL_NUM = @as(c_int, 16);
pub const XCHAL_PS_INTLEVEL_SHIFT = @as(c_int, 0);
pub const XCHAL_PS_INTLEVEL_MASK = @as(c_int, 0x0000000F);
pub const XCHAL_PS_EXCM_BITS = @as(c_int, 1);
pub const XCHAL_PS_EXCM_NUM = @as(c_int, 2);
pub const XCHAL_PS_EXCM_SHIFT = @as(c_int, 4);
pub const XCHAL_PS_EXCM_MASK = @as(c_int, 0x00000010);
pub const XCHAL_PS_UM_BITS = @as(c_int, 1);
pub const XCHAL_PS_UM_NUM = @as(c_int, 2);
pub const XCHAL_PS_UM_SHIFT = @as(c_int, 5);
pub const XCHAL_PS_UM_MASK = @as(c_int, 0x00000020);
pub const XCHAL_PS_RING_BITS = @as(c_int, 2);
pub const XCHAL_PS_RING_NUM = @as(c_int, 4);
pub const XCHAL_PS_RING_SHIFT = @as(c_int, 6);
pub const XCHAL_PS_RING_MASK = @as(c_int, 0x000000C0);
pub const XCHAL_PS_OWB_BITS = @as(c_int, 4);
pub const XCHAL_PS_OWB_NUM = @as(c_int, 16);
pub const XCHAL_PS_OWB_SHIFT = @as(c_int, 8);
pub const XCHAL_PS_OWB_MASK = @as(c_int, 0x00000F00);
pub const XCHAL_PS_CALLINC_BITS = @as(c_int, 2);
pub const XCHAL_PS_CALLINC_NUM = @as(c_int, 4);
pub const XCHAL_PS_CALLINC_SHIFT = @as(c_int, 16);
pub const XCHAL_PS_CALLINC_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00030000, .hex);
pub const XCHAL_PS_WOE_BITS = @as(c_int, 1);
pub const XCHAL_PS_WOE_NUM = @as(c_int, 2);
pub const XCHAL_PS_WOE_SHIFT = @as(c_int, 18);
pub const XCHAL_PS_WOE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const XCHAL_EXCCAUSE_VALIDMASK = @as(c_int, 0x0000003F);
pub const XCHAL_EXCCAUSE_BITS = @as(c_int, 6);
pub const XCHAL_EXCCAUSE_NUM = @as(c_int, 64);
pub const XCHAL_EXCCAUSE_SHIFT = @as(c_int, 0);
pub const XCHAL_EXCCAUSE_MASK = @as(c_int, 0x0000003F);
pub const XCHAL_DEBUGCAUSE_VALIDMASK = @as(c_int, 0x0000003F);
pub const XCHAL_DEBUGCAUSE_ICOUNT_BITS = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_ICOUNT_NUM = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_ICOUNT_SHIFT = @as(c_int, 0);
pub const XCHAL_DEBUGCAUSE_ICOUNT_MASK = @as(c_int, 0x00000001);
pub const XCHAL_DEBUGCAUSE_IBREAK_BITS = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_IBREAK_NUM = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_IBREAK_SHIFT = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_IBREAK_MASK = @as(c_int, 0x00000002);
pub const XCHAL_DEBUGCAUSE_DBREAK_BITS = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_DBREAK_NUM = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_DBREAK_SHIFT = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_DBREAK_MASK = @as(c_int, 0x00000004);
pub const XCHAL_DEBUGCAUSE_BREAK_BITS = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_BREAK_NUM = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_BREAK_SHIFT = @as(c_int, 3);
pub const XCHAL_DEBUGCAUSE_BREAK_MASK = @as(c_int, 0x00000008);
pub const XCHAL_DEBUGCAUSE_BREAKN_BITS = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_BREAKN_NUM = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_BREAKN_SHIFT = @as(c_int, 4);
pub const XCHAL_DEBUGCAUSE_BREAKN_MASK = @as(c_int, 0x00000010);
pub const XCHAL_DEBUGCAUSE_DEBUGINT_BITS = @as(c_int, 1);
pub const XCHAL_DEBUGCAUSE_DEBUGINT_NUM = @as(c_int, 2);
pub const XCHAL_DEBUGCAUSE_DEBUGINT_SHIFT = @as(c_int, 5);
pub const XCHAL_DEBUGCAUSE_DEBUGINT_MASK = @as(c_int, 0x00000020);
pub const XCHAL_NUM_IROM = @compileError("unable to translate macro: undefined identifier `XCHAL_NUM_INSTROM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:736:10
pub const XCHAL_NUM_IRAM = @compileError("unable to translate macro: undefined identifier `XCHAL_NUM_INSTRAM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:737:10
pub const XCHAL_NUM_DROM = @compileError("unable to translate macro: undefined identifier `XCHAL_NUM_DATAROM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:738:10
pub const XCHAL_NUM_DRAM = @compileError("unable to translate macro: undefined identifier `XCHAL_NUM_DATARAM`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:739:10
pub const XCHAL_IROM0_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTROM0_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:741:9
pub const XCHAL_IROM0_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTROM0_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:742:9
pub const XCHAL_IROM0_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTROM0_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:743:9
pub const XCHAL_IROM1_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTROM1_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:744:9
pub const XCHAL_IROM1_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTROM1_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:745:9
pub const XCHAL_IROM1_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTROM1_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:746:9
pub const XCHAL_IRAM0_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTRAM0_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:747:9
pub const XCHAL_IRAM0_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTRAM0_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:748:9
pub const XCHAL_IRAM0_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTRAM0_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:749:9
pub const XCHAL_IRAM1_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTRAM1_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:750:9
pub const XCHAL_IRAM1_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTRAM1_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:751:9
pub const XCHAL_IRAM1_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_INSTRAM1_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:752:9
pub const XCHAL_DROM0_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATAROM0_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:753:9
pub const XCHAL_DROM0_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATAROM0_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:754:9
pub const XCHAL_DROM0_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_DATAROM0_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:755:9
pub const XCHAL_DROM1_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATAROM1_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:756:9
pub const XCHAL_DROM1_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATAROM1_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:757:9
pub const XCHAL_DROM1_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_DATAROM1_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:758:9
pub const XCHAL_DRAM0_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATARAM0_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:759:9
pub const XCHAL_DRAM0_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATARAM0_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:760:9
pub const XCHAL_DRAM0_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_DATARAM0_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:761:9
pub const XCHAL_DRAM1_VADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATARAM1_VADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:762:9
pub const XCHAL_DRAM1_PADDR = @compileError("unable to translate macro: undefined identifier `XCHAL_DATARAM1_PADDR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:763:9
pub const XCHAL_DRAM1_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_DATARAM1_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:764:9
pub const XCHAL_CACHE_PREFCTL_DEFAULT = @as(c_int, 0x00044);
pub const XCHAL_CACHE_LINEWIDTH_MAX = @compileError("unable to translate macro: undefined identifier `XCHAL_DCACHE_LINEWIDTH`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:792:10
pub const XCHAL_CACHE_LINESIZE_MAX = @compileError("unable to translate macro: undefined identifier `XCHAL_DCACHE_LINESIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:793:10
pub const XCHAL_ICACHE_SETSIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_ICACHE_SETWIDTH`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:796:9
pub const XCHAL_DCACHE_SETSIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_DCACHE_SETWIDTH`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:797:9
pub const XCHAL_CACHE_SETWIDTH_MAX = @compileError("unable to translate macro: undefined identifier `XCHAL_DCACHE_SETWIDTH`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:803:10
pub const XCHAL_CACHE_SETSIZE_MAX = XCHAL_DCACHE_SETSIZE;
pub const XCHAL_ICACHE_TAG_V_SHIFT = @as(c_int, 0);
pub const XCHAL_ICACHE_TAG_V = @as(c_int, 0x1);
pub const XCHAL_ICACHE_TAG_F_SHIFT = @as(c_int, 0);
pub const XCHAL_ICACHE_TAG_F = @as(c_int, 0);
pub const XCHAL_ICACHE_TAG_L_SHIFT = XCHAL_ICACHE_TAG_F_SHIFT;
pub const XCHAL_ICACHE_TAG_L = @as(c_int, 0);
pub const XCHAL_DCACHE_TAG_V_SHIFT = @as(c_int, 0);
pub const XCHAL_DCACHE_TAG_V = @as(c_int, 0x1);
pub const XCHAL_DCACHE_TAG_F_SHIFT = @as(c_int, 0);
pub const XCHAL_DCACHE_TAG_F = @as(c_int, 0);
pub const XCHAL_DCACHE_TAG_D_SHIFT = XCHAL_DCACHE_TAG_F_SHIFT;
pub const XCHAL_DCACHE_TAG_D = @as(c_int, 0);
pub const XCHAL_DCACHE_TAG_L_SHIFT = XCHAL_DCACHE_TAG_D_SHIFT;
pub const XCHAL_DCACHE_TAG_L = @as(c_int, 0);
pub const XCHAL_USE_MEMCTL = @compileError("unable to translate macro: undefined identifier `XCHAL_LOOP_BUFFER_SIZE`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:850:9
pub const _MEMCTL_SNOOP_EN = @as(c_int, 0x00);
pub const _MEMCTL_L0IBUF_EN = @as(c_int, 0x00);
pub const XCHAL_CACHE_MEMCTL_DEFAULT = @as(c_int, 0x00000000) | _MEMCTL_L0IBUF_EN;
pub const XCHAL_SNOOP_LB_MEMCTL_DEFAULT = _MEMCTL_SNOOP_EN | _MEMCTL_L0IBUF_EN;
pub const _XCHAL_ITLB_SET = @compileError("unable to translate C expr: unexpected token '##'");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:890:9
pub const XCHAL_ITLB_SET = @compileError("unable to translate macro: undefined identifier `_`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:891:9
pub const _XCHAL_ITLB_SET_E = @compileError("unable to translate macro: undefined identifier `_E`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:892:9
pub const XCHAL_ITLB_SET_E = @compileError("unable to translate macro: undefined identifier `_`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:893:9
pub const _XCHAL_DTLB_SET = @compileError("unable to translate C expr: unexpected token '##'");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:894:9
pub const XCHAL_DTLB_SET = @compileError("unable to translate macro: undefined identifier `_`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:895:9
pub const _XCHAL_DTLB_SET_E = @compileError("unable to translate macro: undefined identifier `_E`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:896:9
pub const XCHAL_DTLB_SET_E = @compileError("unable to translate macro: undefined identifier `_`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:897:9
pub const XCHAL_ITLB_ARF_ENTRIES = @compileError("unable to translate macro: undefined identifier `XCHAL_ITLB_ARF_ENTRIES_LOG2`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:904:9
pub const XCHAL_DTLB_ARF_ENTRIES = @compileError("unable to translate macro: undefined identifier `XCHAL_DTLB_ARF_ENTRIES_LOG2`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:905:9
pub const XCHAL_ALIGN_MAX = @compileError("unable to translate macro: undefined identifier `XCHAL_DATA_WIDTH`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:951:10
pub const XCHAL_HW_RELEASE_MAJOR = @compileError("unable to translate macro: undefined identifier `XCHAL_HW_VERSION_MAJOR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:959:9
pub const XCHAL_HW_RELEASE_MINOR = @compileError("unable to translate macro: undefined identifier `XCHAL_HW_VERSION_MINOR`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:960:9
pub const XCHAL_HW_RELEASE_NAME = @compileError("unable to translate macro: undefined identifier `XCHAL_HW_VERSION_NAME`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:961:9
pub const XCHAL_EXTRA_SA_SIZE = XCHAL_NCP_SA_SIZE;
pub const XCHAL_EXTRA_SA_ALIGN = XCHAL_NCP_SA_ALIGN;
pub const XCHAL_CPEXTRA_SA_SIZE = XCHAL_TOTAL_SA_SIZE;
pub const XCHAL_CPEXTRA_SA_ALIGN = XCHAL_TOTAL_SA_ALIGN;
pub const XCHAL_CP1_NAME = @as(c_int, 0);
pub const XCHAL_CP1_SA_CONTENTS_LIBDB_NUM = @as(c_int, 0);
pub const XCHAL_CP1_SA_CONTENTS_LIBDB = "";
pub const XCHAL_CP2_NAME = @as(c_int, 0);
pub const XCHAL_CP2_SA_CONTENTS_LIBDB_NUM = @as(c_int, 0);
pub const XCHAL_CP2_SA_CONTENTS_LIBDB = "";
pub const XCHAL_CP4_NAME = @as(c_int, 0);
pub const XCHAL_CP4_SA_CONTENTS_LIBDB_NUM = @as(c_int, 0);
pub const XCHAL_CP4_SA_CONTENTS_LIBDB = "";
pub const XCHAL_CP5_NAME = @as(c_int, 0);
pub const XCHAL_CP5_SA_CONTENTS_LIBDB_NUM = @as(c_int, 0);
pub const XCHAL_CP5_SA_CONTENTS_LIBDB = "";
pub const XCHAL_CP6_NAME = @as(c_int, 0);
pub const XCHAL_CP6_SA_CONTENTS_LIBDB_NUM = @as(c_int, 0);
pub const XCHAL_CP6_SA_CONTENTS_LIBDB = "";
pub const XCHAL_CP7_NAME = @as(c_int, 0);
pub const XCHAL_CP7_SA_CONTENTS_LIBDB_NUM = @as(c_int, 0);
pub const XCHAL_CP7_SA_CONTENTS_LIBDB = "";
pub const _XCHAL_CP_SA_SIZE = @compileError("unable to translate macro: undefined identifier `XCHAL_CP`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:1326:9
pub inline fn XCHAL_CP_SA_SIZE(n: anytype) @TypeOf(_XCHAL_CP_SA_SIZE(n)) {
    _ = &n;
    return _XCHAL_CP_SA_SIZE(n);
}
pub const _XCHAL_CP_SA_ALIGN = @compileError("unable to translate macro: undefined identifier `XCHAL_CP`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:1328:9
pub inline fn XCHAL_CP_SA_ALIGN(n: anytype) @TypeOf(_XCHAL_CP_SA_ALIGN(n)) {
    _ = &n;
    return _XCHAL_CP_SA_ALIGN(n);
}
pub const XCHAL_CPEXTRA_SA_SIZE_TOR2 = XCHAL_CPEXTRA_SA_SIZE;
pub const _XCJOIN = @compileError("unable to translate C expr: unexpected token '##'");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:1336:10
pub inline fn XCJOIN(a: anytype, b: anytype) @TypeOf(_XCJOIN(a, b)) {
    _ = &a;
    _ = &b;
    return _XCJOIN(a, b);
}
pub const XCHAL_INST_ILLN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xF06D, .hex);
pub const XCHAL_INST_ILLN_BYTE0 = @as(c_int, 0x6D);
pub const XCHAL_INST_ILLN_BYTE1 = @as(c_int, 0xF0);
pub const XTHAL_INST_ILL = @as(c_int, 0x000000);
pub const XCHAL_HW_RELEASE_AT_OR_BELOW = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_XEA2`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:1405:10
pub const XCHAL_HW_RELEASE_AT_OR_ABOVE = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_XEA1`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:1408:10
pub const XCHAL_HW_RELEASE_AT = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_XEA2`");
// /home/wiiggee1/esp-idf/components/xtensa/esp32s3/include/xtensa/config/core.h:1411:10
pub inline fn XCHAL_HW_RELEASE_MAJOR_AT(major: anytype) @TypeOf(XCHAL_HW_RELEASE_AT(major, @as(c_int, 0))) {
    _ = &major;
    return XCHAL_HW_RELEASE_AT(major, @as(c_int, 0));
}
pub const XTENSA_CONFIG_SYSTEM_H = "";
pub const XSHAL_USE_ABSOLUTE_LITERALS = @as(c_int, 0);
pub const XSHAL_HAVE_TEXT_SECTION_LITERALS = @as(c_int, 1);
pub const XSHAL_ABI = XTHAL_ABI_WINDOWED;
pub const XTHAL_ABI_WINDOWED = @as(c_int, 0);
pub const XTHAL_ABI_CALL0 = @as(c_int, 1);
pub const XSHAL_CLIB = XTHAL_CLIB_NEWLIB;
pub const XTHAL_CLIB_NEWLIB = @as(c_int, 0);
pub const XTHAL_CLIB_UCLIBC = @as(c_int, 1);
pub const XTHAL_CLIB_XCLIB = @as(c_int, 2);
pub const XSHAL_USE_FLOATING_POINT = @as(c_int, 1);
pub const XSHAL_FLOATING_POINT_ABI = @as(c_int, 0);
pub const XSHAL_FUNC_SAFETY_ENABLED = @as(c_int, 0);
pub const XSHAL_IOBLOCK_CACHED_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x70000000, .hex);
pub const XSHAL_IOBLOCK_CACHED_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x70000000, .hex);
pub const XSHAL_IOBLOCK_CACHED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0E000000, .hex);
pub const XSHAL_IOBLOCK_BYPASS_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x90000000, .hex);
pub const XSHAL_IOBLOCK_BYPASS_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x90000000, .hex);
pub const XSHAL_IOBLOCK_BYPASS_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0E000000, .hex);
pub const XSHAL_ROM_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x50000000, .hex);
pub const XSHAL_ROM_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x50000000, .hex);
pub const XSHAL_ROM_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const XSHAL_ROM_AVAIL_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x50000000, .hex);
pub const XSHAL_ROM_AVAIL_VSIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const XSHAL_RAM_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XSHAL_RAM_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XSHAL_RAM_VSIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XSHAL_RAM_PSIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XSHAL_RAM_SIZE = XSHAL_RAM_PSIZE;
pub const XSHAL_RAM_AVAIL_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const XSHAL_RAM_AVAIL_VSIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XSHAL_RAM_BYPASS_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XSHAL_RAM_BYPASS_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA0000000, .hex);
pub const XSHAL_RAM_BYPASS_PSIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XSHAL_SIMIO_CACHED_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XSHAL_SIMIO_BYPASS_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XSHAL_SIMIO_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xC0000000, .hex);
pub const XSHAL_SIMIO_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const XSHAL_MAGIC_EXIT = @as(c_int, 0x0);
pub const XSHAL_CACHEATTR_BYPASS = XSHAL_XT2000_CACHEATTR_BYPASS;
pub const XSHAL_CACHEATTR_DEFAULT = XSHAL_XT2000_CACHEATTR_DEFAULT;
pub const XSHAL_ALLVALID_CACHEATTR_WRITEBACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x22221112, .hex);
pub const XSHAL_ALLVALID_CACHEATTR_WRITEALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x22221112, .hex);
pub const XSHAL_ALLVALID_CACHEATTR_WRITETHRU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x22221112, .hex);
pub const XSHAL_ALLVALID_CACHEATTR_BYPASS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x22222222, .hex);
pub const XSHAL_ALLVALID_CACHEATTR_DEFAULT = XSHAL_ALLVALID_CACHEATTR_WRITEBACK;
pub const XSHAL_STRICT_CACHEATTR_WRITEBACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF111F, .hex);
pub const XSHAL_STRICT_CACHEATTR_WRITEALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF111F, .hex);
pub const XSHAL_STRICT_CACHEATTR_WRITETHRU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF111F, .hex);
pub const XSHAL_STRICT_CACHEATTR_BYPASS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF222F, .hex);
pub const XSHAL_STRICT_CACHEATTR_DEFAULT = XSHAL_STRICT_CACHEATTR_WRITEBACK;
pub const XSHAL_TRAPNULL_CACHEATTR_WRITEBACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2222111F, .hex);
pub const XSHAL_TRAPNULL_CACHEATTR_WRITEALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2222111F, .hex);
pub const XSHAL_TRAPNULL_CACHEATTR_WRITETHRU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2222111F, .hex);
pub const XSHAL_TRAPNULL_CACHEATTR_BYPASS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2222222F, .hex);
pub const XSHAL_TRAPNULL_CACHEATTR_DEFAULT = XSHAL_TRAPNULL_CACHEATTR_WRITEBACK;
pub const XSHAL_ISS_CACHEATTR_WRITEBACK = XSHAL_TRAPNULL_CACHEATTR_WRITEBACK;
pub const XSHAL_ISS_CACHEATTR_WRITEALLOC = XSHAL_TRAPNULL_CACHEATTR_WRITEALLOC;
pub const XSHAL_ISS_CACHEATTR_WRITETHRU = XSHAL_TRAPNULL_CACHEATTR_WRITETHRU;
pub const XSHAL_ISS_CACHEATTR_BYPASS = XSHAL_TRAPNULL_CACHEATTR_BYPASS;
pub const XSHAL_ISS_CACHEATTR_DEFAULT = XSHAL_TRAPNULL_CACHEATTR_WRITEBACK;
pub const XSHAL_ISS_PIPE_REGIONS = @as(c_int, 0);
pub const XSHAL_ISS_SDRAM_REGIONS = @as(c_int, 0);
pub const XSHAL_XT2000_CACHEATTR_WRITEBACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFF22111F, .hex);
pub const XSHAL_XT2000_CACHEATTR_WRITEALLOC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFF22111F, .hex);
pub const XSHAL_XT2000_CACHEATTR_WRITETHRU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFF22111F, .hex);
pub const XSHAL_XT2000_CACHEATTR_BYPASS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFF22222F, .hex);
pub const XSHAL_XT2000_CACHEATTR_DEFAULT = XSHAL_XT2000_CACHEATTR_WRITEBACK;
pub const XSHAL_XT2000_PIPE_REGIONS = @as(c_int, 0x00000000);
pub const XSHAL_XT2000_SDRAM_REGIONS = @as(c_int, 0x00000440);
pub const XSHAL_VECTORS_PACKED = @as(c_int, 0);
pub const XSHAL_STATIC_VECTOR_SELECT = @as(c_int, 1);
pub const XSHAL_RESET_VECTOR_VADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000400, .hex);
pub const XSHAL_RESET_VECTOR_PADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000400, .hex);
pub const XSHAL_RESET_VECTOR_SIZE = @as(c_int, 0x00000300);
pub const XSHAL_RESET_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_USER_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_USER_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_PROGRAMEXC_VECTOR_SIZE = XSHAL_USER_VECTOR_SIZE;
pub const XSHAL_USEREXC_VECTOR_SIZE = XSHAL_USER_VECTOR_SIZE;
pub const XSHAL_KERNEL_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_KERNEL_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_STACKEDEXC_VECTOR_SIZE = XSHAL_KERNEL_VECTOR_SIZE;
pub const XSHAL_KERNELEXC_VECTOR_SIZE = XSHAL_KERNEL_VECTOR_SIZE;
pub const XSHAL_DOUBLEEXC_VECTOR_SIZE = @as(c_int, 0x00000040);
pub const XSHAL_DOUBLEEXC_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_WINDOW_VECTORS_SIZE = @as(c_int, 0x00000178);
pub const XSHAL_WINDOW_VECTORS_ISROM = @as(c_int, 0);
pub const XSHAL_INTLEVEL2_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_INTLEVEL2_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_INTLEVEL3_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_INTLEVEL3_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_INTLEVEL4_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_INTLEVEL4_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_INTLEVEL5_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_INTLEVEL5_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_INTLEVEL6_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_INTLEVEL6_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_DEBUG_VECTOR_SIZE = XSHAL_INTLEVEL6_VECTOR_SIZE;
pub const XSHAL_DEBUG_VECTOR_ISROM = XSHAL_INTLEVEL6_VECTOR_ISROM;
pub const XSHAL_NMI_VECTOR_SIZE = @as(c_int, 0x00000038);
pub const XSHAL_NMI_VECTOR_ISROM = @as(c_int, 0);
pub const XSHAL_INTLEVEL7_VECTOR_SIZE = XSHAL_NMI_VECTOR_SIZE;
pub const XTENSA_CONTEXT_H = "";
pub const XTENSA_COREBITS_H = "";
pub const EXCCAUSE_EXCCAUSE_SHIFT = @as(c_int, 0);
pub const EXCCAUSE_EXCCAUSE_MASK = @as(c_int, 0x3F);
pub const EXCCAUSE_ILLEGAL = @as(c_int, 0);
pub const EXCCAUSE_SYSCALL = @as(c_int, 1);
pub const EXCCAUSE_INSTR_ERROR = @as(c_int, 2);
pub const EXCCAUSE_IFETCHERROR = @as(c_int, 2);
pub const EXCCAUSE_LOAD_STORE_ERROR = @as(c_int, 3);
pub const EXCCAUSE_LOADSTOREERROR = @as(c_int, 3);
pub const EXCCAUSE_LEVEL1_INTERRUPT = @as(c_int, 4);
pub const EXCCAUSE_LEVEL1INTERRUPT = @as(c_int, 4);
pub const EXCCAUSE_ALLOCA = @as(c_int, 5);
pub const EXCCAUSE_DIVIDE_BY_ZERO = @as(c_int, 6);
pub const EXCCAUSE_SPECULATION = @as(c_int, 7);
pub const EXCCAUSE_PC_ERROR = @as(c_int, 7);
pub const EXCCAUSE_PRIVILEGED = @as(c_int, 8);
pub const EXCCAUSE_UNALIGNED = @as(c_int, 9);
pub const EXCCAUSE_EXTREG_PRIVILEGE = @as(c_int, 10);
pub const EXCCAUSE_EXCLUSIVE_ERROR = @as(c_int, 11);
pub const EXCCAUSE_INSTR_DATA_ERROR = @as(c_int, 12);
pub const EXCCAUSE_LOAD_STORE_DATA_ERROR = @as(c_int, 13);
pub const EXCCAUSE_INSTR_ADDR_ERROR = @as(c_int, 14);
pub const EXCCAUSE_LOAD_STORE_ADDR_ERROR = @as(c_int, 15);
pub const EXCCAUSE_ITLB_MISS = @as(c_int, 16);
pub const EXCCAUSE_ITLB_MULTIHIT = @as(c_int, 17);
pub const EXCCAUSE_INSTR_RING = @as(c_int, 18);
pub const EXCCAUSE_INSTR_PROHIBITED = @as(c_int, 20);
pub const EXCCAUSE_DTLB_MISS = @as(c_int, 24);
pub const EXCCAUSE_DTLB_MULTIHIT = @as(c_int, 25);
pub const EXCCAUSE_LOAD_STORE_RING = @as(c_int, 26);
pub const EXCCAUSE_LOAD_PROHIBITED = @as(c_int, 28);
pub const EXCCAUSE_STORE_PROHIBITED = @as(c_int, 29);
pub inline fn EXCCAUSE_CP_DISABLED(n: anytype) @TypeOf(@as(c_int, 32) + n) {
    _ = &n;
    return @as(c_int, 32) + n;
}
pub const EXCCAUSE_CP0_DISABLED = @as(c_int, 32);
pub const EXCCAUSE_CP1_DISABLED = @as(c_int, 33);
pub const EXCCAUSE_CP2_DISABLED = @as(c_int, 34);
pub const EXCCAUSE_CP3_DISABLED = @as(c_int, 35);
pub const EXCCAUSE_CP4_DISABLED = @as(c_int, 36);
pub const EXCCAUSE_CP5_DISABLED = @as(c_int, 37);
pub const EXCCAUSE_CP6_DISABLED = @as(c_int, 38);
pub const EXCCAUSE_CP7_DISABLED = @as(c_int, 39);
pub const PS_WOE_SHIFT = @as(c_int, 18);
pub const PS_WOE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const PS_WOE = PS_WOE_MASK;
pub const PS_CALLINC_SHIFT = @as(c_int, 16);
pub const PS_CALLINC_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00030000, .hex);
pub inline fn PS_CALLINC(n: anytype) @TypeOf((n & @as(c_int, 3)) << PS_CALLINC_SHIFT) {
    _ = &n;
    return (n & @as(c_int, 3)) << PS_CALLINC_SHIFT;
}
pub const PS_OWB_SHIFT = @as(c_int, 8);
pub const PS_OWB_MASK = @as(c_int, 0x00000F00);
pub inline fn PS_OWB(n: anytype) @TypeOf((n & @as(c_int, 15)) << PS_OWB_SHIFT) {
    _ = &n;
    return (n & @as(c_int, 15)) << PS_OWB_SHIFT;
}
pub const PS_RING_SHIFT = @as(c_int, 6);
pub const PS_RING_MASK = @as(c_int, 0x000000C0);
pub inline fn PS_RING(n: anytype) @TypeOf((n & @as(c_int, 3)) << PS_RING_SHIFT) {
    _ = &n;
    return (n & @as(c_int, 3)) << PS_RING_SHIFT;
}
pub const PS_UM_SHIFT = @as(c_int, 5);
pub const PS_UM_MASK = @as(c_int, 0x00000020);
pub const PS_UM = PS_UM_MASK;
pub const PS_EXCM_SHIFT = @as(c_int, 4);
pub const PS_EXCM_MASK = @as(c_int, 0x00000010);
pub const PS_EXCM = PS_EXCM_MASK;
pub const PS_INTLEVEL_SHIFT = @as(c_int, 0);
pub const PS_INTLEVEL_MASK = @as(c_int, 0x0000000F);
pub inline fn PS_INTLEVEL(n: anytype) @TypeOf(n & PS_INTLEVEL_MASK) {
    _ = &n;
    return n & PS_INTLEVEL_MASK;
}
pub const PS_WOE_ABI = @as(c_int, 0);
pub const PS_WOECALL4_ABI = @as(c_int, 0);
pub const PS_PROGSTACK_SHIFT = PS_UM_SHIFT;
pub const PS_PROGSTACK_MASK = PS_UM_MASK;
pub const PS_PROG_SHIFT = PS_UM_SHIFT;
pub const PS_PROG_MASK = PS_UM_MASK;
pub const PS_PROG = PS_UM;
pub const DBREAKC_MASK_SHIFT = @as(c_int, 0);
pub const DBREAKC_MASK_MASK = @as(c_int, 0x0000003F);
pub const DBREAKC_LOADBREAK_SHIFT = @as(c_int, 30);
pub const DBREAKC_LOADBREAK_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const DBREAKC_STOREBREAK_SHIFT = @as(c_int, 31);
pub const DBREAKC_STOREBREAK_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const DEBUGCAUSE_DEBUGINT_SHIFT = @as(c_int, 5);
pub const DEBUGCAUSE_DEBUGINT_MASK = @as(c_int, 0x20);
pub const DEBUGCAUSE_BREAKN_SHIFT = @as(c_int, 4);
pub const DEBUGCAUSE_BREAKN_MASK = @as(c_int, 0x10);
pub const DEBUGCAUSE_BREAK_SHIFT = @as(c_int, 3);
pub const DEBUGCAUSE_BREAK_MASK = @as(c_int, 0x08);
pub const DEBUGCAUSE_DBREAK_SHIFT = @as(c_int, 2);
pub const DEBUGCAUSE_DBREAK_MASK = @as(c_int, 0x04);
pub const DEBUGCAUSE_IBREAK_SHIFT = @as(c_int, 1);
pub const DEBUGCAUSE_IBREAK_MASK = @as(c_int, 0x02);
pub const DEBUGCAUSE_ICOUNT_SHIFT = @as(c_int, 0);
pub const DEBUGCAUSE_ICOUNT_MASK = @as(c_int, 0x01);
pub const MESR_MEME = @as(c_int, 0x00000001);
pub const MESR_MEME_SHIFT = @as(c_int, 0);
pub const MESR_DME = @as(c_int, 0x00000002);
pub const MESR_DME_SHIFT = @as(c_int, 1);
pub const MESR_RCE = @as(c_int, 0x00000010);
pub const MESR_RCE_SHIFT = @as(c_int, 4);
pub const MESR_LCE = "";
pub const MESR_LCE_SHIFT = @compileError("unable to translate C expr: unexpected token '?'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/corebits.h:156:9
pub const MESR_LCE_L = "";
pub const MESR_ERRENAB = @as(c_int, 0x00000100);
pub const MESR_ERRENAB_SHIFT = @as(c_int, 8);
pub const MESR_ERRTEST = @as(c_int, 0x00000200);
pub const MESR_ERRTEST_SHIFT = @as(c_int, 9);
pub const MESR_DATEXC = @as(c_int, 0x00000400);
pub const MESR_DATEXC_SHIFT = @as(c_int, 10);
pub const MESR_INSEXC = @as(c_int, 0x00000800);
pub const MESR_INSEXC_SHIFT = @as(c_int, 11);
pub const MESR_WAYNUM_SHIFT = @as(c_int, 16);
pub const MESR_ACCTYPE_SHIFT = @as(c_int, 20);
pub const MESR_MEMTYPE_SHIFT = @as(c_int, 24);
pub const MESR_ERRTYPE_SHIFT = @as(c_int, 30);
pub const MEMCTL_SNOOP_EN_SHIFT = @as(c_int, 1);
pub const MEMCTL_SNOOP_EN = @as(c_int, 0x02);
pub const MEMCTL_L0IBUF_EN_SHIFT = @as(c_int, 0);
pub const MEMCTL_L0IBUF_EN = @as(c_int, 0x01);
pub const MEMCTL_INV_EN_SHIFT = @as(c_int, 23);
pub const MEMCTL_INV_EN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const MEMCTL_DCWU_SHIFT = @as(c_int, 8);
pub const MEMCTL_DCWU_BITS = @as(c_int, 5);
pub const MEMCTL_DCWA_SHIFT = @as(c_int, 13);
pub const MEMCTL_DCWA_BITS = @as(c_int, 5);
pub const MEMCTL_ICWU_SHIFT = @as(c_int, 18);
pub const MEMCTL_ICWU_BITS = @as(c_int, 5);
pub const MEMCTL_DCWU_MASK = @as(c_int, 0x00001F00);
pub const MEMCTL_DCWA_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0003E000, .hex);
pub const MEMCTL_ICWU_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x007C0000, .hex);
pub const MEMCTL_DCWU_CLR_MASK = ~MEMCTL_DCWU_MASK;
pub const MEMCTL_DCWA_CLR_MASK = ~MEMCTL_DCWA_MASK;
pub const MEMCTL_ICWU_CLR_MASK = ~MEMCTL_ICWU_MASK;
pub const MEMCTL_DCW_CLR_MASK = MEMCTL_DCWU_CLR_MASK | MEMCTL_DCWA_CLR_MASK;
pub const MEMCTL_IDCW_CLR_MASK = MEMCTL_DCW_CLR_MASK | MEMCTL_ICWU_CLR_MASK;
pub const _XTRUNTIME_FRAMES_H_ = "";
pub const STRUCT_BEGIN = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime-frames.h:53:9
pub const STRUCT_FIELD = @compileError("unable to translate C expr: unexpected token ';'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime-frames.h:54:9
pub const STRUCT_AFIELD = @compileError("unable to translate C expr: unexpected token ';'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime-frames.h:55:9
pub const STRUCT_AFIELD_A = @compileError("unable to translate macro: undefined identifier `aligned`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime-frames.h:56:9
pub const STRUCT_END = @compileError("unable to translate C expr: unexpected token '}'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime-frames.h:57:9
pub const CALL0_ABI = @as(c_int, 1);
pub const ALIGNPAD = @compileError("unable to translate macro: undefined identifier `XCHAL_HAVE_LOOPS`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime-frames.h:134:9
pub const KERNELSTACKSIZE = @as(c_int, 1024);
pub inline fn ALIGNUP(n: anytype, val: anytype) @TypeOf(((val + n) - @as(c_int, 1)) & -n) {
    _ = &n;
    _ = &val;
    return ((val + n) - @as(c_int, 1)) & -n;
}
pub const XT_STK_NEXT1 = @import("std").zig.c_translation.sizeof(XtExcFrame);
pub const XT_STK_EXTRA = ALIGNUP(XCHAL_EXTRA_SA_ALIGN, XT_STK_NEXT1);
pub const XT_STK_NEXT2 = XT_STK_EXTRA + XCHAL_EXTRA_SA_SIZE;
pub const XT_STK_FRMSZ = ALIGNUP(@as(c_int, 0x10), XT_STK_NEXT2) + @as(c_int, 0x20);
pub const XT_SOL_FRMSZ = @compileError("unable to translate macro: undefined identifier `XtSolFrameSize`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa_context.h:260:9
pub const XT_CP0_SA = @as(c_int, 0);
pub const XT_CP1_SA = ALIGNUP(XCHAL_CP1_SA_ALIGN, XT_CP0_SA + XCHAL_CP0_SA_SIZE);
pub const XT_CP2_SA = ALIGNUP(XCHAL_CP2_SA_ALIGN, XT_CP1_SA + XCHAL_CP1_SA_SIZE);
pub const XT_CP3_SA = ALIGNUP(XCHAL_CP3_SA_ALIGN, XT_CP2_SA + XCHAL_CP2_SA_SIZE);
pub const XT_CP4_SA = ALIGNUP(XCHAL_CP4_SA_ALIGN, XT_CP3_SA + XCHAL_CP3_SA_SIZE);
pub const XT_CP5_SA = ALIGNUP(XCHAL_CP5_SA_ALIGN, XT_CP4_SA + XCHAL_CP4_SA_SIZE);
pub const XT_CP6_SA = ALIGNUP(XCHAL_CP6_SA_ALIGN, XT_CP5_SA + XCHAL_CP5_SA_SIZE);
pub const XT_CP7_SA = ALIGNUP(XCHAL_CP7_SA_ALIGN, XT_CP6_SA + XCHAL_CP6_SA_SIZE);
pub const XT_CP_SA_SIZE = ALIGNUP(@as(c_int, 16), XT_CP7_SA + XCHAL_CP7_SA_SIZE);
pub const XT_CPENABLE = @as(c_int, 0);
pub const XT_CPSTORED = @as(c_int, 2);
pub const XT_CP_CS_ST = @as(c_int, 4);
pub const XT_CP_ASA = @as(c_int, 8);
pub const XT_CP_SIZE = (@as(c_int, 12) + XT_CP_SA_SIZE) + XCHAL_TOTAL_SA_ALIGN;
pub const CORE_ID_REGVAL_PRO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xCDCD, .hex);
pub const CORE_ID_REGVAL_APP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xABAB, .hex);
pub const CORE_ID_PRO = CORE_ID_REGVAL_PRO;
pub const CORE_ID_APP = CORE_ID_REGVAL_APP;
pub const STK_INTEXC_EXTRA = @as(c_int, 0);
pub const XT_USE_THREAD_SAFE_CLIB = @as(c_int, 1);
pub const XT_HAVE_THREAD_SAFE_CLIB = @as(c_int, 1);
pub const XT_CLIB_CONTEXT_AREA_SIZE = (@import("std").zig.c_translation.sizeof(struct__reent) + @as(c_int, 15)) + -@as(c_int, 16);
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa_config.h:142:15: warning: macro 'XT_CLIB_GLOBAL_PTR' contains a runtime value, translated to function
pub inline fn XT_CLIB_GLOBAL_PTR() @TypeOf(_impure_ptr) {
    return _impure_ptr;
}
pub const XT_XTRA_SIZE = ((XT_STK_FRMSZ + STK_INTEXC_EXTRA) + @as(c_int, 0x10)) + XT_CP_SIZE;
pub const XT_USER_SIZE = @as(c_int, 0x200);
pub const XT_STACK_MIN_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(XT_XTRA_SIZE + XT_USER_SIZE, @import("std").zig.c_translation.sizeof(u8));
pub const XT_STACK_EXTRA = XT_XTRA_SIZE;
pub const XT_STACK_EXTRA_CLIB = XT_XTRA_SIZE + XT_CLIB_CONTEXT_AREA_SIZE;
pub const configXT_SIMULATOR = @as(c_int, 0);
pub const configXT_BOARD = @as(c_int, 1);
pub const configXT_INTEXC_HOOKS = @as(c_int, 0);
pub const configBENCHMARK = @as(c_int, 0);
pub const configUSE_PORT_OPTIMISED_TASK_SELECTION = @as(c_int, 0);
pub const configMINIMAL_STACK_SIZE = CONFIG_FREERTOS_IDLE_TASK_STACKSIZE + configSTACK_OVERHEAD_TOTAL;
pub const configMAX_API_CALL_INTERRUPT_PRIORITY = @compileError("unable to translate macro: undefined identifier `XCHAL_EXCM_LEVEL`");
// /home/wiiggee1/esp-idf/components/freertos/config/xtensa/include/freertos/FreeRTOSConfig_arch.h:52:9
pub const configUSE_NEWLIB_REENTRANT = @as(c_int, 1);
pub inline fn configINIT_TLS_BLOCK(xTLSBlock: anytype) @TypeOf(esp_reent_init(&xTLSBlock)) {
    _ = &xTLSBlock;
    return esp_reent_init(&xTLSBlock);
}
pub const configSET_TLS_BLOCK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/config/xtensa/include/freertos/FreeRTOSConfig_arch.h:76:9
pub inline fn configDEINIT_TLS_BLOCK(xTLSBlock: anytype) @TypeOf(_reclaim_reent(&xTLSBlock)) {
    _ = &xTLSBlock;
    return _reclaim_reent(&xTLSBlock);
}
pub const configINCLUDE_FREERTOS_TASK_C_ADDITIONS_H = @as(c_int, 1);
pub const configTOTAL_HEAP_SIZE = @compileError("unable to translate macro: undefined identifier `_heap_end`");
// /home/wiiggee1/esp-idf/components/freertos/config/xtensa/include/freertos/FreeRTOSConfig_arch.h:86:9
pub const INCLUDE_xTaskDelayUntil = @as(c_int, 1);
pub const INCLUDE_uxTaskGetStackHighWaterMark2 = @as(c_int, 1);
pub const configSTACK_ALIGNMENT = @as(c_int, 16);
pub const configISR_STACK_SIZE = ((CONFIG_FREERTOS_ISR_STACKSIZE + configSTACK_ALIGNMENT) - @as(c_int, 1)) & ~(configSTACK_ALIGNMENT - @as(c_int, 1));
pub const configUSE_PREEMPTION = @as(c_int, 1);
pub const configUSE_TICKLESS_IDLE = @compileError("unable to translate macro: undefined identifier `CONFIG_FREERTOS_USE_TICKLESS_IDLE`");
// /home/wiiggee1/esp-idf/components/freertos/config/include/freertos/FreeRTOSConfig.h:87:9
pub const configCPU_CLOCK_HZ = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const configTICK_RATE_HZ = CONFIG_FREERTOS_HZ;
pub const configMAX_PRIORITIES = @as(c_int, 25);
pub const configUSE_TIME_SLICING = @as(c_int, 1);
pub const configUSE_16_BIT_TICKS = @as(c_int, 0);
pub const configIDLE_SHOULD_YIELD = @as(c_int, 0);
pub const configKERNEL_INTERRUPT_PRIORITY = @as(c_int, 1);
pub const configNUMBER_OF_CORES = CONFIG_FREERTOS_NUMBER_OF_CORES;
pub const configNUM_CORES = configNUMBER_OF_CORES;
pub const configUSE_MUTEXES = @as(c_int, 1);
pub const configUSE_RECURSIVE_MUTEXES = @as(c_int, 1);
pub const configUSE_COUNTING_SEMAPHORES = @as(c_int, 1);
pub const configUSE_QUEUE_SETS = @as(c_int, 1);
pub const configQUEUE_REGISTRY_SIZE = CONFIG_FREERTOS_QUEUE_REGISTRY_SIZE;
pub const configUSE_TASK_NOTIFICATIONS = @as(c_int, 1);
pub const configTASK_NOTIFICATION_ARRAY_ENTRIES = CONFIG_FREERTOS_TASK_NOTIFICATION_ARRAY_ENTRIES;
pub const configMAX_TASK_NAME_LEN = CONFIG_FREERTOS_MAX_TASK_NAME_LEN;
pub const configNUM_THREAD_LOCAL_STORAGE_POINTERS = CONFIG_FREERTOS_THREAD_LOCAL_STORAGE_POINTERS * @as(c_int, 2);
pub const configSTACK_DEPTH_TYPE = u32;
pub const configENABLE_BACKWARD_COMPATIBILITY = @as(c_int, 0);
pub inline fn configASSERT(a: anytype) @TypeOf(assert(a)) {
    _ = &a;
    return assert(a);
}
pub const configSUPPORT_STATIC_ALLOCATION = @as(c_int, 1);
pub const configSUPPORT_DYNAMIC_ALLOCATION = @as(c_int, 1);
pub const configAPPLICATION_ALLOCATED_HEAP = @as(c_int, 1);
pub const configSTACK_ALLOCATION_FROM_SEPARATE_HEAP = @as(c_int, 0);
pub const configUSE_IDLE_HOOK = @as(c_int, 0);
pub const configUSE_TICK_HOOK = @as(c_int, 0);
pub const configCHECK_FOR_STACK_OVERFLOW = @as(c_int, 2);
pub const configRECORD_STACK_HIGH_ADDRESS = @as(c_int, 1);
pub const configUSE_CO_ROUTINES = @as(c_int, 0);
pub const configMAX_CO_ROUTINE_PRIORITIES = @as(c_int, 2);
pub const configUSE_TIMERS = @as(c_int, 1);
pub const configTIMER_TASK_PRIORITY = CONFIG_FREERTOS_TIMER_TASK_PRIORITY;
pub const configTIMER_QUEUE_LENGTH = CONFIG_FREERTOS_TIMER_QUEUE_LENGTH;
pub const configTIMER_TASK_STACK_DEPTH = CONFIG_FREERTOS_TIMER_TASK_STACK_DEPTH;
pub const configTIMER_SERVICE_TASK_NAME = CONFIG_FREERTOS_TIMER_SERVICE_TASK_NAME;
pub const configTIMER_SERVICE_TASK_CORE_AFFINITY = CONFIG_FREERTOS_TIMER_SERVICE_TASK_CORE_AFFINITY;
pub const configLIST_VOLATILE = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /home/wiiggee1/esp-idf/components/freertos/config/include/freertos/FreeRTOSConfig.h:195:9
pub const INCLUDE_vTaskPrioritySet = @as(c_int, 1);
pub const INCLUDE_uxTaskPriorityGet = @as(c_int, 1);
pub const INCLUDE_vTaskDelete = @as(c_int, 1);
pub const INCLUDE_vTaskSuspend = @as(c_int, 1);
pub const INCLUDE_vTaskDelay = @as(c_int, 1);
pub const INCLUDE_xTaskGetIdleTaskHandle = @as(c_int, 1);
pub const INCLUDE_xTaskAbortDelay = @as(c_int, 1);
pub const INCLUDE_xSemaphoreGetMutexHolder = @as(c_int, 1);
pub const INCLUDE_xTaskGetHandle = @as(c_int, 1);
pub const INCLUDE_uxTaskGetStackHighWaterMark = @as(c_int, 1);
pub const INCLUDE_eTaskGetState = @as(c_int, 1);
pub const INCLUDE_xTaskResumeFromISR = @as(c_int, 1);
pub const INCLUDE_xTimerPendFunctionCall = @as(c_int, 1);
pub const INCLUDE_xTaskGetSchedulerState = @as(c_int, 1);
pub const INCLUDE_xTaskGetCurrentTaskHandle = @as(c_int, 1);
pub const configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES = @compileError("unable to translate macro: undefined identifier `CONFIG_FREERTOS_USE_LIST_DATA_INTEGRITY_CHECK_BYTES`");
// /home/wiiggee1/esp-idf/components/freertos/config/include/freertos/FreeRTOSConfig.h:263:9
pub const configTHREAD_LOCAL_STORAGE_DELETE_CALLBACKS = @as(c_int, 1);
pub const configCHECK_MUTEX_GIVEN_BY_OWNER = @as(c_int, 1);
pub const portNUM_PROCESSORS = configNUMBER_OF_CORES;
pub const PROJDEFS_H = "";
pub inline fn pdMS_TO_TICKS(xTimeInMs: anytype) TickType_t {
    _ = &xTimeInMs;
    return @import("std").zig.c_translation.cast(TickType_t, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.cast(TickType_t, xTimeInMs) * @import("std").zig.c_translation.cast(TickType_t, configTICK_RATE_HZ), @import("std").zig.c_translation.cast(TickType_t, @as(c_uint, 1000))));
}
pub inline fn pdTICKS_TO_MS(xTicks: anytype) TickType_t {
    _ = &xTicks;
    return @import("std").zig.c_translation.cast(TickType_t, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.cast(u64, xTicks) * @as(c_int, 1000), configTICK_RATE_HZ));
}
pub const pdFALSE = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 0));
pub const pdTRUE = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 1));
pub const pdPASS = pdTRUE;
pub const pdFAIL = pdFALSE;
pub const errQUEUE_EMPTY = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 0));
pub const errQUEUE_FULL = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 0));
pub const errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -@as(c_int, 1);
pub const errQUEUE_BLOCKED = -@as(c_int, 4);
pub const errQUEUE_YIELD = -@as(c_int, 5);
pub const pdINTEGRITY_CHECK_VALUE = @as(c_ulong, 0x5a5a5a5a);
pub const pdFREERTOS_ERRNO_NONE = @as(c_int, 0);
pub const pdFREERTOS_ERRNO_ENOENT = @as(c_int, 2);
pub const pdFREERTOS_ERRNO_EINTR = @as(c_int, 4);
pub const pdFREERTOS_ERRNO_EIO = @as(c_int, 5);
pub const pdFREERTOS_ERRNO_ENXIO = @as(c_int, 6);
pub const pdFREERTOS_ERRNO_EBADF = @as(c_int, 9);
pub const pdFREERTOS_ERRNO_EAGAIN = @as(c_int, 11);
pub const pdFREERTOS_ERRNO_EWOULDBLOCK = @as(c_int, 11);
pub const pdFREERTOS_ERRNO_ENOMEM = @as(c_int, 12);
pub const pdFREERTOS_ERRNO_EACCES = @as(c_int, 13);
pub const pdFREERTOS_ERRNO_EFAULT = @as(c_int, 14);
pub const pdFREERTOS_ERRNO_EBUSY = @as(c_int, 16);
pub const pdFREERTOS_ERRNO_EEXIST = @as(c_int, 17);
pub const pdFREERTOS_ERRNO_EXDEV = @as(c_int, 18);
pub const pdFREERTOS_ERRNO_ENODEV = @as(c_int, 19);
pub const pdFREERTOS_ERRNO_ENOTDIR = @as(c_int, 20);
pub const pdFREERTOS_ERRNO_EISDIR = @as(c_int, 21);
pub const pdFREERTOS_ERRNO_EINVAL = @as(c_int, 22);
pub const pdFREERTOS_ERRNO_ENOSPC = @as(c_int, 28);
pub const pdFREERTOS_ERRNO_ESPIPE = @as(c_int, 29);
pub const pdFREERTOS_ERRNO_EROFS = @as(c_int, 30);
pub const pdFREERTOS_ERRNO_EUNATCH = @as(c_int, 42);
pub const pdFREERTOS_ERRNO_EBADE = @as(c_int, 50);
pub const pdFREERTOS_ERRNO_EFTYPE = @as(c_int, 79);
pub const pdFREERTOS_ERRNO_ENMFILE = @as(c_int, 89);
pub const pdFREERTOS_ERRNO_ENOTEMPTY = @as(c_int, 90);
pub const pdFREERTOS_ERRNO_ENAMETOOLONG = @as(c_int, 91);
pub const pdFREERTOS_ERRNO_EOPNOTSUPP = @as(c_int, 95);
pub const pdFREERTOS_ERRNO_ENOBUFS = @as(c_int, 105);
pub const pdFREERTOS_ERRNO_ENOPROTOOPT = @as(c_int, 109);
pub const pdFREERTOS_ERRNO_EADDRINUSE = @as(c_int, 112);
pub const pdFREERTOS_ERRNO_ETIMEDOUT = @as(c_int, 116);
pub const pdFREERTOS_ERRNO_EINPROGRESS = @as(c_int, 119);
pub const pdFREERTOS_ERRNO_EALREADY = @as(c_int, 120);
pub const pdFREERTOS_ERRNO_EADDRNOTAVAIL = @as(c_int, 125);
pub const pdFREERTOS_ERRNO_EISCONN = @as(c_int, 127);
pub const pdFREERTOS_ERRNO_ENOTCONN = @as(c_int, 128);
pub const pdFREERTOS_ERRNO_ENOMEDIUM = @as(c_int, 135);
pub const pdFREERTOS_ERRNO_EILSEQ = @as(c_int, 138);
pub const pdFREERTOS_ERRNO_ECANCELED = @as(c_int, 140);
pub const pdFREERTOS_LITTLE_ENDIAN = @as(c_int, 0);
pub const pdFREERTOS_BIG_ENDIAN = @as(c_int, 1);
pub const pdLITTLE_ENDIAN = pdFREERTOS_LITTLE_ENDIAN;
pub const pdBIG_ENDIAN = pdFREERTOS_BIG_ENDIAN;
pub const PORTABLE_H = "";
pub const DEPRECATED_DEFINITIONS_H = "";
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SOC_ADC_SUPPORTED = @as(c_int, 1);
pub const SOC_UART_SUPPORTED = @as(c_int, 1);
pub const SOC_PCNT_SUPPORTED = @as(c_int, 1);
pub const SOC_PHY_SUPPORTED = @as(c_int, 1);
pub const SOC_WIFI_SUPPORTED = @as(c_int, 1);
pub const SOC_TWAI_SUPPORTED = @as(c_int, 1);
pub const SOC_GDMA_SUPPORTED = @as(c_int, 1);
pub const SOC_AHB_GDMA_SUPPORTED = @as(c_int, 1);
pub const SOC_GPTIMER_SUPPORTED = @as(c_int, 1);
pub const SOC_LCDCAM_SUPPORTED = @as(c_int, 1);
pub const SOC_MCPWM_SUPPORTED = @as(c_int, 1);
pub const SOC_DEDICATED_GPIO_SUPPORTED = @as(c_int, 1);
pub const SOC_CACHE_SUPPORT_WRAP = @as(c_int, 1);
pub const SOC_ULP_SUPPORTED = @as(c_int, 1);
pub const SOC_ULP_FSM_SUPPORTED = @as(c_int, 1);
pub const SOC_RISCV_COPROC_SUPPORTED = @as(c_int, 1);
pub const SOC_BT_SUPPORTED = @as(c_int, 1);
pub const SOC_USB_OTG_SUPPORTED = @as(c_int, 1);
pub const SOC_USB_SERIAL_JTAG_SUPPORTED = @as(c_int, 1);
pub const SOC_CCOMP_TIMER_SUPPORTED = @as(c_int, 1);
pub const SOC_ASYNC_MEMCPY_SUPPORTED = @as(c_int, 1);
pub const SOC_SUPPORTS_SECURE_DL_MODE = @as(c_int, 1);
pub const SOC_EFUSE_KEY_PURPOSE_FIELD = @as(c_int, 1);
pub const SOC_EFUSE_SUPPORTED = @as(c_int, 1);
pub const SOC_SDMMC_HOST_SUPPORTED = @as(c_int, 1);
pub const SOC_RTC_FAST_MEM_SUPPORTED = @as(c_int, 1);
pub const SOC_RTC_SLOW_MEM_SUPPORTED = @as(c_int, 1);
pub const SOC_RTC_MEM_SUPPORTED = @as(c_int, 1);
pub const SOC_PSRAM_DMA_CAPABLE = @as(c_int, 1);
pub const SOC_XT_WDT_SUPPORTED = @as(c_int, 1);
pub const SOC_I2S_SUPPORTED = @as(c_int, 1);
pub const SOC_RMT_SUPPORTED = @as(c_int, 1);
pub const SOC_SDM_SUPPORTED = @as(c_int, 1);
pub const SOC_GPSPI_SUPPORTED = @as(c_int, 1);
pub const SOC_LEDC_SUPPORTED = @as(c_int, 1);
pub const SOC_I2C_SUPPORTED = @as(c_int, 1);
pub const SOC_SYSTIMER_SUPPORTED = @as(c_int, 1);
pub const SOC_SUPPORT_COEXISTENCE = @as(c_int, 1);
pub const SOC_TEMP_SENSOR_SUPPORTED = @as(c_int, 1);
pub const SOC_AES_SUPPORTED = @as(c_int, 1);
pub const SOC_MPI_SUPPORTED = @as(c_int, 1);
pub const SOC_SHA_SUPPORTED = @as(c_int, 1);
pub const SOC_HMAC_SUPPORTED = @as(c_int, 1);
pub const SOC_DIG_SIGN_SUPPORTED = @as(c_int, 1);
pub const SOC_FLASH_ENC_SUPPORTED = @as(c_int, 1);
pub const SOC_SECURE_BOOT_SUPPORTED = @as(c_int, 1);
pub const SOC_MEMPROT_SUPPORTED = @as(c_int, 1);
pub const SOC_TOUCH_SENSOR_SUPPORTED = @as(c_int, 1);
pub const SOC_BOD_SUPPORTED = @as(c_int, 1);
pub const SOC_CLK_TREE_SUPPORTED = @as(c_int, 1);
pub const SOC_MPU_SUPPORTED = @as(c_int, 1);
pub const SOC_WDT_SUPPORTED = @as(c_int, 1);
pub const SOC_SPI_FLASH_SUPPORTED = @as(c_int, 1);
pub const SOC_RNG_SUPPORTED = @as(c_int, 1);
pub const SOC_LIGHT_SLEEP_SUPPORTED = @as(c_int, 1);
pub const SOC_DEEP_SLEEP_SUPPORTED = @as(c_int, 1);
pub const SOC_LP_PERIPH_SHARE_INTERRUPT = @as(c_int, 1);
pub const SOC_PM_SUPPORTED = @as(c_int, 1);
pub const SOC_XTAL_SUPPORT_40M = @as(c_int, 1);
pub const SOC_APPCPU_HAS_CLOCK_GATING_BUG = @as(c_int, 1);
pub const SOC_ADC_RTC_CTRL_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_DIG_CTRL_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_ARBITER_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_DIG_IIR_FILTER_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_MONITOR_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_DMA_SUPPORTED = @as(c_int, 1);
pub inline fn SOC_ADC_DIG_SUPPORTED_UNIT(UNIT: anytype) @TypeOf(if (UNIT == @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &UNIT;
    return if (UNIT == @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 0);
}
pub const SOC_ADC_PERIPH_NUM = @as(c_int, 2);
pub inline fn SOC_ADC_CHANNEL_NUM(PERIPH_NUM: anytype) @TypeOf(@as(c_int, 10)) {
    _ = &PERIPH_NUM;
    return @as(c_int, 10);
}
pub const SOC_ADC_MAX_CHANNEL_NUM = @as(c_int, 10);
pub const SOC_ADC_ATTEN_NUM = @as(c_int, 4);
pub const SOC_ADC_DIGI_CONTROLLER_NUM = @as(c_int, 2);
pub const SOC_ADC_PATT_LEN_MAX = @as(c_int, 24);
pub const SOC_ADC_DIGI_MIN_BITWIDTH = @as(c_int, 12);
pub const SOC_ADC_DIGI_MAX_BITWIDTH = @as(c_int, 12);
pub const SOC_ADC_DIGI_RESULT_BYTES = @as(c_int, 4);
pub const SOC_ADC_DIGI_DATA_BYTES_PER_CONV = @as(c_int, 4);
pub const SOC_ADC_DIGI_IIR_FILTER_NUM = @as(c_int, 2);
pub const SOC_ADC_DIGI_MONITOR_NUM = @as(c_int, 2);
pub const SOC_ADC_SAMPLE_FREQ_THRES_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 83333, .decimal);
pub const SOC_ADC_SAMPLE_FREQ_THRES_LOW = @as(c_int, 611);
pub const SOC_ADC_RTC_MIN_BITWIDTH = @as(c_int, 12);
pub const SOC_ADC_RTC_MAX_BITWIDTH = @as(c_int, 12);
pub const SOC_ADC_CALIBRATION_V1_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_SELF_HW_CALI_SUPPORTED = @as(c_int, 1);
pub const SOC_ADC_SHARED_POWER = @as(c_int, 1);
pub const SOC_APB_BACKUP_DMA = @as(c_int, 1);
pub const SOC_BROWNOUT_RESET_SUPPORTED = @as(c_int, 1);
pub const SOC_CACHE_WRITEBACK_SUPPORTED = @as(c_int, 1);
pub const SOC_CACHE_FREEZE_SUPPORTED = @as(c_int, 1);
pub const SOC_CPU_CORES_NUM = @as(c_int, 2);
pub const SOC_CPU_INTR_NUM = @as(c_int, 32);
pub const SOC_CPU_HAS_FPU = @as(c_int, 1);
pub const SOC_HP_CPU_HAS_MULTIPLE_CORES = @as(c_int, 1);
pub const SOC_CPU_BREAKPOINTS_NUM = @as(c_int, 2);
pub const SOC_CPU_WATCHPOINTS_NUM = @as(c_int, 2);
pub const SOC_CPU_WATCHPOINT_MAX_REGION_SIZE = @as(c_int, 64);
pub const SOC_DS_SIGNATURE_MAX_BIT_LEN = @as(c_int, 4096);
pub const SOC_DS_KEY_PARAM_MD_IV_LENGTH = @as(c_int, 16);
pub const SOC_DS_KEY_CHECK_MAX_WAIT_US = @as(c_int, 1100);
pub const SOC_AHB_GDMA_VERSION = @as(c_uint, 1);
pub const SOC_GDMA_NUM_GROUPS_MAX = @as(c_uint, 1);
pub const SOC_GDMA_PAIRS_PER_GROUP = @as(c_int, 5);
pub const SOC_GDMA_PAIRS_PER_GROUP_MAX = @as(c_int, 5);
pub const SOC_AHB_GDMA_SUPPORT_PSRAM = @as(c_int, 1);
pub const SOC_GPIO_PORT = @as(c_uint, 1);
pub const SOC_GPIO_PIN_COUNT = @as(c_int, 49);
pub const SOC_GPIO_SUPPORT_PIN_GLITCH_FILTER = @as(c_int, 1);
pub const SOC_GPIO_FILTER_CLK_SUPPORT_APB = @as(c_int, 1);
pub const SOC_GPIO_SUPPORT_RTC_INDEPENDENT = @as(c_int, 1);
pub const SOC_GPIO_SUPPORT_FORCE_HOLD = @as(c_int, 1);
pub const SOC_GPIO_VALID_GPIO_MASK = @as(c_ulonglong, 0x1FFFFFFFFFFFF) & ~((((@as(c_ulonglong, 0) | BIT22) | BIT23) | BIT24) | BIT25);
pub const SOC_GPIO_VALID_OUTPUT_GPIO_MASK = SOC_GPIO_VALID_GPIO_MASK;
pub const SOC_GPIO_IN_RANGE_MAX = @as(c_int, 48);
pub const SOC_GPIO_OUT_RANGE_MAX = @as(c_int, 48);
pub const SOC_GPIO_VALID_DIGITAL_IO_PAD_MASK = @as(c_ulonglong, 0x0001FFFFFC000000);
pub const SOC_GPIO_CLOCKOUT_BY_IO_MUX = @as(c_int, 1);
pub const SOC_GPIO_CLOCKOUT_CHANNEL_NUM = @as(c_int, 3);
pub const SOC_DEDIC_GPIO_OUT_CHANNELS_NUM = @as(c_int, 8);
pub const SOC_DEDIC_GPIO_IN_CHANNELS_NUM = @as(c_int, 8);
pub const SOC_DEDIC_GPIO_OUT_AUTO_ENABLE = @as(c_int, 1);
pub const SOC_I2C_NUM = @as(c_uint, 2);
pub const SOC_HP_I2C_NUM = @as(c_uint, 2);
pub const SOC_I2C_FIFO_LEN = @as(c_int, 32);
pub const SOC_I2C_CMD_REG_NUM = @as(c_int, 8);
pub const SOC_I2C_SUPPORT_SLAVE = @as(c_int, 1);
pub const SOC_I2C_SUPPORT_HW_CLR_BUS = @as(c_int, 1);
pub const SOC_I2C_SUPPORT_XTAL = @as(c_int, 1);
pub const SOC_I2C_SUPPORT_RTC = @as(c_int, 1);
pub const SOC_I2C_SUPPORT_10BIT_ADDR = @as(c_int, 1);
pub const SOC_I2C_SLAVE_SUPPORT_BROADCAST = @as(c_int, 1);
pub const SOC_I2C_SLAVE_SUPPORT_I2CRAM_ACCESS = @as(c_int, 1);
pub const SOC_I2S_NUM = @as(c_uint, 2);
pub const SOC_I2S_HW_VERSION_2 = @as(c_int, 1);
pub const SOC_I2S_SUPPORTS_XTAL = @as(c_int, 1);
pub const SOC_I2S_SUPPORTS_PLL_F160M = @as(c_int, 1);
pub const SOC_I2S_SUPPORTS_PCM = @as(c_int, 1);
pub const SOC_I2S_SUPPORTS_PDM = @as(c_int, 1);
pub const SOC_I2S_SUPPORTS_PDM_TX = @as(c_int, 1);
pub const SOC_I2S_PDM_MAX_TX_LINES = @as(c_int, 2);
pub const SOC_I2S_SUPPORTS_PDM_RX = @as(c_int, 1);
pub const SOC_I2S_PDM_MAX_RX_LINES = @as(c_int, 4);
pub const SOC_I2S_SUPPORTS_TDM = @as(c_int, 1);
pub const SOC_LEDC_SUPPORT_APB_CLOCK = @as(c_int, 1);
pub const SOC_LEDC_SUPPORT_XTAL_CLOCK = @as(c_int, 1);
pub const SOC_LEDC_CHANNEL_NUM = @as(c_int, 8);
pub const SOC_LEDC_TIMER_BIT_WIDTH = @as(c_int, 14);
pub const SOC_LEDC_SUPPORT_FADE_STOP = @as(c_int, 1);
pub const SOC_MCPWM_GROUPS = @as(c_int, 2);
pub const SOC_MCPWM_TIMERS_PER_GROUP = @as(c_int, 3);
pub const SOC_MCPWM_OPERATORS_PER_GROUP = @as(c_int, 3);
pub const SOC_MCPWM_COMPARATORS_PER_OPERATOR = @as(c_int, 2);
pub const SOC_MCPWM_GENERATORS_PER_OPERATOR = @as(c_int, 2);
pub const SOC_MCPWM_TRIGGERS_PER_OPERATOR = @as(c_int, 2);
pub const SOC_MCPWM_GPIO_FAULTS_PER_GROUP = @as(c_int, 3);
pub const SOC_MCPWM_CAPTURE_TIMERS_PER_GROUP = @as(c_int, 1);
pub const SOC_MCPWM_CAPTURE_CHANNELS_PER_TIMER = @as(c_int, 3);
pub const SOC_MCPWM_GPIO_SYNCHROS_PER_GROUP = @as(c_int, 3);
pub const SOC_MCPWM_SWSYNC_CAN_PROPAGATE = @as(c_int, 1);
pub const SOC_MMU_LINEAR_ADDRESS_REGION_NUM = @as(c_uint, 1);
pub const SOC_MMU_PERIPH_NUM = @as(c_uint, 1);
pub const SOC_MPU_CONFIGURABLE_REGIONS_SUPPORTED = @as(c_int, 0);
pub const SOC_MPU_MIN_REGION_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000000, .hex);
pub const SOC_MPU_REGIONS_MAX_NUM = @as(c_int, 8);
pub const SOC_MPU_REGION_RO_SUPPORTED = @as(c_int, 0);
pub const SOC_MPU_REGION_WO_SUPPORTED = @as(c_int, 0);
pub const SOC_PCNT_GROUPS = @as(c_uint, 1);
pub const SOC_PCNT_UNITS_PER_GROUP = @as(c_int, 4);
pub const SOC_PCNT_CHANNELS_PER_UNIT = @as(c_int, 2);
pub const SOC_PCNT_THRES_POINT_PER_UNIT = @as(c_int, 2);
pub const SOC_RMT_GROUPS = @as(c_uint, 1);
pub const SOC_RMT_TX_CANDIDATES_PER_GROUP = @as(c_int, 4);
pub const SOC_RMT_RX_CANDIDATES_PER_GROUP = @as(c_int, 4);
pub const SOC_RMT_CHANNELS_PER_GROUP = @as(c_int, 8);
pub const SOC_RMT_MEM_WORDS_PER_CHANNEL = @as(c_int, 48);
pub const SOC_RMT_SUPPORT_RX_PINGPONG = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_RX_DEMODULATION = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_TX_ASYNC_STOP = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_TX_LOOP_COUNT = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_TX_LOOP_AUTO_STOP = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_TX_SYNCHRO = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_TX_CARRIER_DATA_ONLY = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_XTAL = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_RC_FAST = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_APB = @as(c_int, 1);
pub const SOC_RMT_SUPPORT_DMA = @as(c_int, 1);
pub const SOC_LCD_I80_SUPPORTED = @as(c_int, 1);
pub const SOC_LCD_RGB_SUPPORTED = @as(c_int, 1);
pub const SOC_LCD_I80_BUSES = @as(c_uint, 1);
pub const SOC_LCD_RGB_PANELS = @as(c_uint, 1);
pub const SOC_LCD_I80_BUS_WIDTH = @as(c_int, 16);
pub const SOC_LCD_RGB_DATA_WIDTH = @as(c_int, 16);
pub const SOC_LCD_SUPPORT_RGB_YUV_CONV = @as(c_int, 1);
pub const SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH = @as(c_int, 128);
pub const SOC_RTC_CNTL_CPU_PD_REG_FILE_NUM = @as(c_int, 549);
pub const SOC_RTC_CNTL_CPU_PD_DMA_ADDR_ALIGN = SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH >> @as(c_int, 3);
pub const SOC_RTC_CNTL_CPU_PD_DMA_BLOCK_SIZE = SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH >> @as(c_int, 3);
pub const SOC_RTC_CNTL_CPU_PD_RETENTION_MEM_SIZE = SOC_RTC_CNTL_CPU_PD_REG_FILE_NUM * (SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH >> @as(c_int, 3));
pub const SOC_RTC_CNTL_TAGMEM_PD_DMA_BUS_WIDTH = @as(c_int, 128);
pub const SOC_RTC_CNTL_TAGMEM_PD_DMA_ADDR_ALIGN = SOC_RTC_CNTL_TAGMEM_PD_DMA_BUS_WIDTH >> @as(c_int, 3);
pub const SOC_RTCIO_PIN_COUNT = @as(c_int, 22);
pub const SOC_RTCIO_INPUT_OUTPUT_SUPPORTED = @as(c_int, 1);
pub const SOC_RTCIO_HOLD_SUPPORTED = @as(c_int, 1);
pub const SOC_RTCIO_WAKE_SUPPORTED = @as(c_int, 1);
pub const SOC_SDM_GROUPS = @as(c_int, 1);
pub const SOC_SDM_CHANNELS_PER_GROUP = @as(c_int, 8);
pub const SOC_SDM_CLK_SUPPORT_APB = @as(c_int, 1);
pub const SOC_SPI_PERIPH_NUM = @as(c_int, 3);
pub inline fn SOC_SPI_PERIPH_CS_NUM(i: anytype) @TypeOf(if (i == @as(c_int, 0)) @as(c_int, 2) else if (i == @as(c_int, 1)) @as(c_int, 6) else @as(c_int, 3)) {
    _ = &i;
    return if (i == @as(c_int, 0)) @as(c_int, 2) else if (i == @as(c_int, 1)) @as(c_int, 6) else @as(c_int, 3);
}
pub const SOC_SPI_MAX_CS_NUM = @as(c_int, 6);
pub const SOC_SPI_MAXIMUM_BUFFER_SIZE = @as(c_int, 64);
pub const SOC_SPI_SUPPORT_DDRCLK = @as(c_int, 1);
pub const SOC_SPI_SLAVE_SUPPORT_SEG_TRANS = @as(c_int, 1);
pub const SOC_SPI_SUPPORT_CD_SIG = @as(c_int, 1);
pub const SOC_SPI_SUPPORT_CONTINUOUS_TRANS = @as(c_int, 1);
pub const SOC_SPI_SUPPORT_SLAVE_HD_VER2 = @as(c_int, 1);
pub const SOC_SPI_SUPPORT_CLK_APB = @as(c_int, 1);
pub const SOC_SPI_SUPPORT_CLK_XTAL = @as(c_int, 1);
pub const SOC_SPI_PERIPH_SUPPORT_MULTILINE_MODE = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc_caps.h:332:9
pub const SOC_SPI_PERIPH_SUPPORT_CONTROL_DUMMY_OUT = @as(c_int, 1);
pub const SOC_MEMSPI_IS_INDEPENDENT = @as(c_int, 1);
pub const SOC_SPI_MAX_PRE_DIVIDER = @as(c_int, 16);
pub const SOC_SPI_SUPPORT_OCT = @as(c_int, 1);
pub const SOC_SPI_SCT_SUPPORTED = @as(c_int, 1);
pub inline fn SOC_SPI_SCT_SUPPORTED_PERIPH(PERIPH_NUM: anytype) @TypeOf(if (PERIPH_NUM == @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0)) {
    _ = &PERIPH_NUM;
    return if (PERIPH_NUM == @as(c_int, 1)) @as(c_int, 1) else @as(c_int, 0);
}
pub const SOC_SPI_SCT_REG_NUM = @as(c_int, 14);
pub const SOC_SPI_SCT_BUFFER_NUM_MAX = @as(c_int, 1) + SOC_SPI_SCT_REG_NUM;
pub const SOC_SPI_SCT_CONF_BITLEN_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FFFA, .hex);
pub const SOC_MEMSPI_SRC_FREQ_120M = @as(c_int, 1);
pub const SOC_MEMSPI_SRC_FREQ_80M_SUPPORTED = @as(c_int, 1);
pub const SOC_MEMSPI_SRC_FREQ_40M_SUPPORTED = @as(c_int, 1);
pub const SOC_MEMSPI_SRC_FREQ_20M_SUPPORTED = @as(c_int, 1);
pub const SOC_SPIRAM_SUPPORTED = @as(c_int, 1);
pub const SOC_SPIRAM_XIP_SUPPORTED = @as(c_int, 1);
pub const SOC_SYSTIMER_COUNTER_NUM = @as(c_int, 2);
pub const SOC_SYSTIMER_ALARM_NUM = @as(c_int, 3);
pub const SOC_SYSTIMER_BIT_WIDTH_LO = @as(c_int, 32);
pub const SOC_SYSTIMER_BIT_WIDTH_HI = @as(c_int, 20);
pub const SOC_SYSTIMER_FIXED_DIVIDER = @as(c_int, 1);
pub const SOC_SYSTIMER_INT_LEVEL = @as(c_int, 1);
pub const SOC_SYSTIMER_ALARM_MISS_COMPENSATE = @as(c_int, 1);
pub const SOC_TIMER_GROUPS = @as(c_int, 2);
pub const SOC_TIMER_GROUP_TIMERS_PER_GROUP = @as(c_int, 2);
pub const SOC_TIMER_GROUP_COUNTER_BIT_WIDTH = @as(c_int, 54);
pub const SOC_TIMER_GROUP_SUPPORT_XTAL = @as(c_int, 1);
pub const SOC_TIMER_GROUP_SUPPORT_APB = @as(c_int, 1);
pub const SOC_TIMER_GROUP_TOTAL_TIMERS = @as(c_int, 4);
pub const SOC_TOUCH_SENSOR_VERSION = @as(c_int, 2);
pub const SOC_TOUCH_SENSOR_NUM = @as(c_int, 15);
pub const SOC_TOUCH_SUPPORT_SLEEP_WAKEUP = @as(c_int, 1);
pub const SOC_TOUCH_SUPPORT_WATERPROOF = @as(c_int, 1);
pub const SOC_TOUCH_SUPPORT_PROX_SENSING = @as(c_int, 1);
pub const SOC_TOUCH_PROXIMITY_CHANNEL_NUM = @as(c_int, 3);
pub const SOC_TOUCH_PROXIMITY_MEAS_DONE_SUPPORTED = @as(c_int, 1);
pub const SOC_TOUCH_SAMPLE_CFG_NUM = @as(c_uint, 1);
pub const SOC_TWAI_CONTROLLER_NUM = @as(c_ulong, 1);
pub const SOC_TWAI_CLK_SUPPORT_APB = @as(c_int, 1);
pub const SOC_TWAI_BRP_MIN = @as(c_int, 2);
pub const SOC_TWAI_BRP_MAX = @as(c_int, 16384);
pub const SOC_TWAI_SUPPORTS_RX_STATUS = @as(c_int, 1);
pub const SOC_UART_NUM = @as(c_int, 3);
pub const SOC_UART_HP_NUM = @as(c_int, 3);
pub const SOC_UART_FIFO_LEN = @as(c_int, 128);
pub const SOC_UART_BITRATE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 5000000, .decimal);
pub const SOC_UART_SUPPORT_FSM_TX_WAIT_SEND = @as(c_int, 1);
pub const SOC_UART_SUPPORT_WAKEUP_INT = @as(c_int, 1);
pub const SOC_UART_SUPPORT_APB_CLK = @as(c_int, 1);
pub const SOC_UART_SUPPORT_RTC_CLK = @as(c_int, 1);
pub const SOC_UART_SUPPORT_XTAL_CLK = @as(c_int, 1);
pub const SOC_USB_OTG_PERIPH_NUM = @as(c_uint, 1);
pub const SOC_SHA_DMA_MAX_BUFFER_SIZE = @as(c_int, 3968);
pub const SOC_SHA_SUPPORT_DMA = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_RESUME = @as(c_int, 1);
pub const SOC_SHA_GDMA = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA1 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA224 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA256 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA384 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA512 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA512_224 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA512_256 = @as(c_int, 1);
pub const SOC_SHA_SUPPORT_SHA512_T = @as(c_int, 1);
pub const SOC_MPI_MEM_BLOCKS_NUM = @as(c_int, 4);
pub const SOC_MPI_OPERATIONS_NUM = @as(c_int, 3);
pub const SOC_RSA_MAX_BIT_LEN = @as(c_int, 4096);
pub const SOC_AES_SUPPORT_DMA = @as(c_int, 1);
pub const SOC_AES_GDMA = @as(c_int, 1);
pub const SOC_AES_SUPPORT_AES_128 = @as(c_int, 1);
pub const SOC_AES_SUPPORT_AES_256 = @as(c_int, 1);
pub const SOC_PM_SUPPORT_EXT0_WAKEUP = @as(c_int, 1);
pub const SOC_PM_SUPPORT_EXT1_WAKEUP = @as(c_int, 1);
pub const SOC_PM_SUPPORT_EXT_WAKEUP = @as(c_int, 1);
pub const SOC_PM_SUPPORT_WIFI_WAKEUP = @as(c_int, 1);
pub const SOC_PM_SUPPORT_BT_WAKEUP = @as(c_int, 1);
pub const SOC_PM_SUPPORT_TOUCH_SENSOR_WAKEUP = @as(c_int, 1);
pub const SOC_PM_SUPPORT_CPU_PD = @as(c_int, 1);
pub const SOC_PM_SUPPORT_TAGMEM_PD = @as(c_int, 1);
pub const SOC_PM_SUPPORT_RTC_PERIPH_PD = @as(c_int, 1);
pub const SOC_PM_SUPPORT_RC_FAST_PD = @as(c_int, 1);
pub const SOC_PM_SUPPORT_VDDSDIO_PD = @as(c_int, 1);
pub const SOC_PM_SUPPORT_MAC_BB_PD = @as(c_int, 1);
pub const SOC_PM_SUPPORT_MODEM_PD = @as(c_int, 1);
pub const SOC_CONFIGURABLE_VDDSDIO_SUPPORTED = @as(c_int, 1);
pub const SOC_PM_SUPPORT_DEEPSLEEP_CHECK_STUB_ONLY = @as(c_int, 1);
pub const SOC_PM_CPU_RETENTION_BY_RTCCNTL = @as(c_int, 1);
pub const SOC_PM_MODEM_RETENTION_BY_BACKUPDMA = @as(c_int, 1);
pub const SOC_CLK_RC_FAST_D256_SUPPORTED = @as(c_int, 1);
pub const SOC_RTC_SLOW_CLK_SUPPORT_RC_FAST_D256 = @as(c_int, 1);
pub const SOC_CLK_RC_FAST_SUPPORT_CALIBRATION = @as(c_int, 1);
pub const SOC_CLK_XTAL32K_SUPPORTED = @as(c_int, 1);
pub const SOC_EFUSE_DIS_DOWNLOAD_ICACHE = @as(c_int, 1);
pub const SOC_EFUSE_DIS_DOWNLOAD_DCACHE = @as(c_int, 1);
pub const SOC_EFUSE_HARD_DIS_JTAG = @as(c_int, 1);
pub const SOC_EFUSE_DIS_USB_JTAG = @as(c_int, 1);
pub const SOC_EFUSE_SOFT_DIS_JTAG = @as(c_int, 1);
pub const SOC_EFUSE_DIS_DIRECT_BOOT = @as(c_int, 1);
pub const SOC_EFUSE_DIS_ICACHE = @as(c_int, 1);
pub const SOC_EFUSE_BLOCK9_KEY_PURPOSE_QUIRK = @as(c_int, 1);
pub const SOC_SECURE_BOOT_V2_RSA = @as(c_int, 1);
pub const SOC_EFUSE_SECURE_BOOT_KEY_DIGESTS = @as(c_int, 3);
pub const SOC_EFUSE_REVOKE_BOOT_KEY_DIGESTS = @as(c_int, 1);
pub const SOC_SUPPORT_SECURE_BOOT_REVOKE_KEY = @as(c_int, 1);
pub const SOC_FLASH_ENCRYPTED_XTS_AES_BLOCK_MAX = @as(c_int, 64);
pub const SOC_FLASH_ENCRYPTION_XTS_AES = @as(c_int, 1);
pub const SOC_FLASH_ENCRYPTION_XTS_AES_OPTIONS = @as(c_int, 1);
pub const SOC_FLASH_ENCRYPTION_XTS_AES_128 = @as(c_int, 1);
pub const SOC_FLASH_ENCRYPTION_XTS_AES_256 = @as(c_int, 1);
pub const SOC_MEMPROT_CPU_PREFETCH_PAD_SIZE = @as(c_int, 16);
pub const SOC_MEMPROT_MEM_ALIGN_SIZE = @as(c_int, 256);
pub const SOC_PHY_DIG_REGS_MEM_SIZE = @as(c_int, 21) * @as(c_int, 4);
pub const SOC_MAC_BB_PD_MEM_SIZE = @as(c_int, 192) * @as(c_int, 4);
pub const SOC_WIFI_LIGHT_SLEEP_CLK_WIDTH = @as(c_int, 12);
pub const SOC_SPI_MEM_SUPPORT_AUTO_WAIT_IDLE = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_AUTO_SUSPEND = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_AUTO_RESUME = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_SW_SUSPEND = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_OPI_MODE = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_TIMING_TUNING = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_CONFIG_GPIO_BY_EFUSE = @as(c_int, 1);
pub const SOC_SPI_MEM_SUPPORT_WRAP = @as(c_int, 1);
pub const SOC_MEMSPI_TIMING_TUNING_BY_MSPI_DELAY = @as(c_int, 1);
pub const SOC_MEMSPI_CORE_CLK_SHARED_WITH_PSRAM = @as(c_int, 1);
pub const SOC_COEX_HW_PTI = @as(c_int, 1);
pub const SOC_EXTERNAL_COEX_ADVANCE = @as(c_int, 0);
pub const SOC_EXTERNAL_COEX_LEADER_TX_LINE = @as(c_int, 1);
pub const SOC_SDMMC_USE_GPIO_MATRIX = @as(c_int, 1);
pub const SOC_SDMMC_NUM_SLOTS = @as(c_int, 2);
pub const SOC_SDMMC_SUPPORT_XTAL_CLOCK = @as(c_int, 1);
pub const SOC_SDMMC_DELAY_PHASE_NUM = @as(c_int, 4);
pub const SOC_TEMPERATURE_SENSOR_SUPPORT_FAST_RC = @as(c_int, 1);
pub const SOC_WIFI_HW_TSF = @as(c_int, 1);
pub const SOC_WIFI_FTM_SUPPORT = @as(c_int, 1);
pub const SOC_WIFI_GCMP_SUPPORT = @as(c_int, 1);
pub const SOC_WIFI_WAPI_SUPPORT = @as(c_int, 1);
pub const SOC_WIFI_CSI_SUPPORT = @as(c_int, 1);
pub const SOC_WIFI_MESH_SUPPORT = @as(c_int, 1);
pub const SOC_WIFI_SUPPORT_VARIABLE_BEACON_WINDOW = @as(c_int, 1);
pub const SOC_WIFI_PHY_NEEDS_USB_WORKAROUND = @as(c_int, 1);
pub const SOC_BLE_SUPPORTED = @as(c_int, 1);
pub const SOC_BLE_MESH_SUPPORTED = @as(c_int, 1);
pub const SOC_BLE_50_SUPPORTED = @as(c_int, 1);
pub const SOC_BLE_DEVICE_PRIVACY_SUPPORTED = @as(c_int, 1);
pub const SOC_BLUFI_SUPPORTED = @as(c_int, 1);
pub const SOC_ULP_HAS_ADC = @as(c_int, 1);
pub const SOC_PHY_COMBO_MODULE = @as(c_int, 1);
pub const __XTENSA_API_H__ = "";
pub const DSRSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10200C, .hex);
pub const XTENSA_SPECREG_H = "";
pub const LBEG = @as(c_int, 0);
pub const LEND = @as(c_int, 1);
pub const LCOUNT = @as(c_int, 2);
pub const SAR = @as(c_int, 3);
pub const BR = @as(c_int, 4);
pub const SCOMPARE1 = @as(c_int, 12);
pub const ACCLO = @as(c_int, 16);
pub const ACCHI = @as(c_int, 17);
pub const MR_0 = @as(c_int, 32);
pub const MR_1 = @as(c_int, 33);
pub const MR_2 = @as(c_int, 34);
pub const MR_3 = @as(c_int, 35);
pub const WINDOWBASE = @as(c_int, 72);
pub const WINDOWSTART = @as(c_int, 73);
pub const IBREAKENABLE = @as(c_int, 96);
pub const MEMCTL = @as(c_int, 97);
pub const ATOMCTL = @as(c_int, 99);
pub const DDR = @as(c_int, 104);
pub const IBREAKA_0 = @as(c_int, 128);
pub const IBREAKA_1 = @as(c_int, 129);
pub const DBREAKA_0 = @as(c_int, 144);
pub const DBREAKA_1 = @as(c_int, 145);
pub const DBREAKC_0 = @as(c_int, 160);
pub const DBREAKC_1 = @as(c_int, 161);
pub const CONFIGID0 = @as(c_int, 176);
pub const EPC_1 = @as(c_int, 177);
pub const EPC_2 = @as(c_int, 178);
pub const EPC_3 = @as(c_int, 179);
pub const EPC_4 = @as(c_int, 180);
pub const EPC_5 = @as(c_int, 181);
pub const EPC_6 = @as(c_int, 182);
pub const EPC_7 = @as(c_int, 183);
pub const DEPC = @as(c_int, 192);
pub const EPS_2 = @as(c_int, 194);
pub const EPS_3 = @as(c_int, 195);
pub const EPS_4 = @as(c_int, 196);
pub const EPS_5 = @as(c_int, 197);
pub const EPS_6 = @as(c_int, 198);
pub const EPS_7 = @as(c_int, 199);
pub const CONFIGID1 = @as(c_int, 208);
pub const EXCSAVE_1 = @as(c_int, 209);
pub const EXCSAVE_2 = @as(c_int, 210);
pub const EXCSAVE_3 = @as(c_int, 211);
pub const EXCSAVE_4 = @as(c_int, 212);
pub const EXCSAVE_5 = @as(c_int, 213);
pub const EXCSAVE_6 = @as(c_int, 214);
pub const EXCSAVE_7 = @as(c_int, 215);
pub const CPENABLE = @as(c_int, 224);
pub const INTERRUPT = @as(c_int, 226);
pub const INTENABLE = @as(c_int, 228);
pub const PS = @as(c_int, 230);
pub const VECBASE = @as(c_int, 231);
pub const EXCCAUSE = @as(c_int, 232);
pub const DEBUGCAUSE = @as(c_int, 233);
pub const CCOUNT = @as(c_int, 234);
pub const PRID = @as(c_int, 235);
pub const ICOUNT = @as(c_int, 236);
pub const ICOUNTLEVEL = @as(c_int, 237);
pub const EXCVADDR = @as(c_int, 238);
pub const CCOMPARE_0 = @as(c_int, 240);
pub const CCOMPARE_1 = @as(c_int, 241);
pub const CCOMPARE_2 = @as(c_int, 242);
pub const MISC_REG_0 = @as(c_int, 244);
pub const MISC_REG_1 = @as(c_int, 245);
pub const MISC_REG_2 = @as(c_int, 246);
pub const MISC_REG_3 = @as(c_int, 247);
pub const MR = @as(c_int, 32);
pub const IBREAKA = @as(c_int, 128);
pub const DBREAKA = @as(c_int, 144);
pub const DBREAKC = @as(c_int, 160);
pub const EPC = @as(c_int, 176);
pub const EPS = @as(c_int, 192);
pub const EXCSAVE = @as(c_int, 208);
pub const CCOMPARE = @as(c_int, 240);
pub const INTREAD = @as(c_int, 226);
pub const INTSET = @as(c_int, 226);
pub const INTCLEAR = @as(c_int, 227);
pub const XTRUNTIME_H = "";
pub const _XTOS_CORE_STATE_H_ = "";
pub const CORE_STATE_SIGNATURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xB1C5AFED, .hex);
pub const _XTSTR = @compileError("unable to translate C expr: unexpected token '#'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime.h:34:9
pub inline fn XTSTR(x: anytype) @TypeOf(_XTSTR(x)) {
    _ = &x;
    return _XTSTR(x);
}
pub const XTOS_KEEPON_MEM = @as(c_int, 0x00000100);
pub const XTOS_KEEPON_MEM_SHIFT = @as(c_int, 8);
pub const XTOS_KEEPON_DEBUG = @as(c_int, 0x00001000);
pub const XTOS_KEEPON_DEBUG_SHIFT = @as(c_int, 12);
pub const XTOS_IDMA_NO_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const XTOS_IDMA_WAIT_STANDBY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const XTOS_COREF_PSO = @as(c_int, 0x00000001);
pub const XTOS_COREF_PSO_SHIFT = @as(c_int, 0);
pub const _xtos_set_execption_handler = _xtos_set_exception_handler;
pub const _xtos_set_saved_intenable = _xtos_ints_on;
pub const _xtos_clear_saved_intenable = _xtos_ints_off;
pub inline fn XTOS_SET_INTLEVEL(intlevel: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &intlevel;
    return @as(c_int, 0);
}
pub inline fn XTOS_SET_MIN_INTLEVEL(intlevel: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &intlevel;
    return @as(c_int, 0);
}
pub const XTOS_RESTORE_INTLEVEL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime.h:82:10
pub const XTOS_RESTORE_JUST_INTLEVEL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime.h:83:10
pub const XTOS_ENABLE_INTERRUPTS = XTOS_SET_INTLEVEL(@as(c_int, 0));
pub const XTOS_DISABLE_LOWPRI_INTERRUPTS = XTOS_SET_INTLEVEL(XCHAL_NUM_LOWPRI_LEVELS);
pub const XTOS_MASK_LOWPRI_INTERRUPTS = XTOS_SET_MIN_INTLEVEL(XCHAL_NUM_LOWPRI_LEVELS);
pub const XTOS_DISABLE_EXCM_INTERRUPTS = @compileError("unable to translate macro: undefined identifier `XCHAL_EXCM_LEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime.h:143:9
pub const XTOS_MASK_EXCM_INTERRUPTS = @compileError("unable to translate macro: undefined identifier `XCHAL_EXCM_LEVEL`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xtensa/xtruntime.h:144:9
pub const XTOS_DISABLE_ALL_INTERRUPTS = XTOS_SET_INTLEVEL(@as(c_int, 15));
pub const RSR = @compileError("unable to translate C expr: unexpected token 'asm'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:11:9
pub const WSR = @compileError("unable to translate C expr: unexpected token 'asm'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:12:9
pub const XSR = @compileError("unable to translate C expr: unexpected token 'asm'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:13:9
pub const RER = @compileError("unable to translate C expr: unexpected token 'asm'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:15:9
pub const WITLB = @compileError("unable to translate C expr: unexpected token 'asm'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:17:9
pub const WDTLB = @compileError("unable to translate C expr: unexpected token 'asm'");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:18:9
pub const EXTRA_SAVE_AREA_SIZE = @as(c_int, 32);
pub const BASE_SAVE_AREA_SIZE = @as(c_int, 16);
pub const SAVE_AREA_OFFSET = EXTRA_SAVE_AREA_SIZE + BASE_SAVE_AREA_SIZE;
pub const BASE_AREA_SP_OFFSET = @as(c_int, 12);
pub const SET_STACK = @compileError("unable to translate macro: undefined identifier `sp`");
// /home/wiiggee1/esp-idf/components/xtensa/include/xt_instr_macros.h:83:9
pub const BIT31 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const BIT30 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const BIT29 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const BIT28 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const BIT27 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const BIT26 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const BIT25 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const BIT24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const BIT23 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const BIT22 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const BIT21 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const BIT20 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const BIT19 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const BIT18 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const BIT17 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const BIT16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const BIT15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const BIT14 = @as(c_int, 0x00004000);
pub const BIT13 = @as(c_int, 0x00002000);
pub const BIT12 = @as(c_int, 0x00001000);
pub const BIT11 = @as(c_int, 0x00000800);
pub const BIT10 = @as(c_int, 0x00000400);
pub const BIT9 = @as(c_int, 0x00000200);
pub const BIT8 = @as(c_int, 0x00000100);
pub const BIT7 = @as(c_int, 0x00000080);
pub const BIT6 = @as(c_int, 0x00000040);
pub const BIT5 = @as(c_int, 0x00000020);
pub const BIT4 = @as(c_int, 0x00000010);
pub const BIT3 = @as(c_int, 0x00000008);
pub const BIT2 = @as(c_int, 0x00000004);
pub const BIT1 = @as(c_int, 0x00000002);
pub const BIT0 = @as(c_int, 0x00000001);
pub const BIT63 = @as(c_ulonglong, 0x80000000) << @as(c_int, 32);
pub const BIT62 = @as(c_ulonglong, 0x40000000) << @as(c_int, 32);
pub const BIT61 = @as(c_ulonglong, 0x20000000) << @as(c_int, 32);
pub const BIT60 = @as(c_ulonglong, 0x10000000) << @as(c_int, 32);
pub const BIT59 = @as(c_ulonglong, 0x08000000) << @as(c_int, 32);
pub const BIT58 = @as(c_ulonglong, 0x04000000) << @as(c_int, 32);
pub const BIT57 = @as(c_ulonglong, 0x02000000) << @as(c_int, 32);
pub const BIT56 = @as(c_ulonglong, 0x01000000) << @as(c_int, 32);
pub const BIT55 = @as(c_ulonglong, 0x00800000) << @as(c_int, 32);
pub const BIT54 = @as(c_ulonglong, 0x00400000) << @as(c_int, 32);
pub const BIT53 = @as(c_ulonglong, 0x00200000) << @as(c_int, 32);
pub const BIT52 = @as(c_ulonglong, 0x00100000) << @as(c_int, 32);
pub const BIT51 = @as(c_ulonglong, 0x00080000) << @as(c_int, 32);
pub const BIT50 = @as(c_ulonglong, 0x00040000) << @as(c_int, 32);
pub const BIT49 = @as(c_ulonglong, 0x00020000) << @as(c_int, 32);
pub const BIT48 = @as(c_ulonglong, 0x00010000) << @as(c_int, 32);
pub const BIT47 = @as(c_ulonglong, 0x00008000) << @as(c_int, 32);
pub const BIT46 = @as(c_ulonglong, 0x00004000) << @as(c_int, 32);
pub const BIT45 = @as(c_ulonglong, 0x00002000) << @as(c_int, 32);
pub const BIT44 = @as(c_ulonglong, 0x00001000) << @as(c_int, 32);
pub const BIT43 = @as(c_ulonglong, 0x00000800) << @as(c_int, 32);
pub const BIT42 = @as(c_ulonglong, 0x00000400) << @as(c_int, 32);
pub const BIT41 = @as(c_ulonglong, 0x00000200) << @as(c_int, 32);
pub const BIT40 = @as(c_ulonglong, 0x00000100) << @as(c_int, 32);
pub const BIT39 = @as(c_ulonglong, 0x00000080) << @as(c_int, 32);
pub const BIT38 = @as(c_ulonglong, 0x00000040) << @as(c_int, 32);
pub const BIT37 = @as(c_ulonglong, 0x00000020) << @as(c_int, 32);
pub const BIT36 = @as(c_ulonglong, 0x00000010) << @as(c_int, 32);
pub const BIT35 = @as(c_ulonglong, 0x00000008) << @as(c_int, 32);
pub const BIT34 = @as(c_ulonglong, 0x00000004) << @as(c_int, 32);
pub const BIT33 = @as(c_ulonglong, 0x00000002) << @as(c_int, 32);
pub const BIT32 = @as(c_ulonglong, 0x00000001) << @as(c_int, 32);
pub inline fn BIT(nr: anytype) @TypeOf(@as(c_ulong, 1) << nr) {
    _ = &nr;
    return @as(c_ulong, 1) << nr;
}
pub inline fn BIT64(nr: anytype) @TypeOf(@as(c_ulonglong, 1) << nr) {
    _ = &nr;
    return @as(c_ulonglong, 1) << nr;
}
pub const __ESP_ATTR_H__ = "";
pub const ROMFN_ATTR = "";
pub const IRAM_ATTR = _SECTION_ATTR_IMPL(".iram1", __COUNTER__);
pub const DRAM_ATTR = _SECTION_ATTR_IMPL(".dram1", __COUNTER__);
pub const TCM_IRAM_ATTR = _SECTION_ATTR_IMPL(".tcm.text", __COUNTER__);
pub const TCM_DRAM_ATTR = _SECTION_ATTR_IMPL(".tcm.data", __COUNTER__);
pub const IRAM_8BIT_ACCESSIBLE = @compileError("unable to translate macro: undefined identifier `CONFIG_IDF_TARGET_ESP32`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:35:9
pub const COREDUMP_IRAM_DATA_ATTR = COREDUMP_DRAM_ATTR;
pub const IRAM_DATA_ATTR = "";
pub const IRAM_BSS_ATTR = "";
pub const WORD_ALIGNED_ATTR = @compileError("unable to translate macro: undefined identifier `aligned`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:58:9
pub const DMA_ATTR = WORD_ALIGNED_ATTR ++ DRAM_ATTR;
pub const DRAM_DMA_ALIGNED_ATTR = WORD_ALIGNED_ATTR ++ DRAM_ATTR;
pub const PACKED_ATTR = @compileError("unable to translate macro: undefined identifier `packed`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:71:9
pub const FORCE_INLINE_ATTR = @compileError("unable to translate macro: undefined identifier `always_inline`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:74:9
pub const DRAM_STR = @compileError("unable to translate macro: undefined identifier `__c`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:78:9
pub const RTC_DATA_ATTR = _SECTION_ATTR_IMPL(".rtc.data", __COUNTER__);
pub const RTC_NOINIT_ATTR = _SECTION_ATTR_IMPL(".rtc_noinit", __COUNTER__);
pub const RTC_RODATA_ATTR = _SECTION_ATTR_IMPL(".rtc.rodata", __COUNTER__);
pub const COREDUMP_RTC_DATA_ATTR = _SECTION_ATTR_IMPL(".rtc.coredump", __COUNTER__);
pub const RTC_SLOW_ATTR = _SECTION_ATTR_IMPL(".rtc.force_slow", __COUNTER__);
pub const RTC_IRAM_ATTR = _SECTION_ATTR_IMPL(".rtc.text", __COUNTER__);
pub const RTC_FAST_ATTR = _SECTION_ATTR_IMPL(".rtc.force_fast", __COUNTER__);
pub const COREDUMP_RTC_FAST_ATTR = _SECTION_ATTR_IMPL(".rtc.fast.coredump", __COUNTER__);
pub const EXT_RAM_BSS_ATTR = "";
pub const EXT_RAM_ATTR = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:133:9
pub const __NOINIT_ATTR = _SECTION_ATTR_IMPL(".noinit", __COUNTER__);
pub const EXT_RAM_NOINIT_ATTR = __NOINIT_ATTR;
pub const COREDUMP_DRAM_ATTR = _SECTION_ATTR_IMPL(".dram2.coredump", __COUNTER__);
pub const NOINLINE_ATTR = @compileError("unable to translate macro: undefined identifier `noinline`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:153:9
pub const FLAG_ATTR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:177:9
pub const _SECTION_ATTR_IMPL = @compileError("unable to translate macro: undefined identifier `section`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:188:9
pub const _COUNTER_STRINGIFY = @compileError("unable to translate C expr: unexpected token '#'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:189:9
pub const IDF_DEPRECATED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_attr.h:202:9
pub inline fn likely(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn unlikely(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const ESP_COMPILER_DESIGNATED_INIT_AGGREGATE_TYPE_STR = @compileError("unable to translate C expr: unexpected token '.'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_compiler.h:52:9
pub const ESP_COMPILER_DESIGNATED_INIT_AGGREGATE_TYPE_EMPTY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_compiler.h:53:9
pub const ESP_OK = @as(c_int, 0);
pub const ESP_FAIL = -@as(c_int, 1);
pub const ESP_ERR_NO_MEM = @as(c_int, 0x101);
pub const ESP_ERR_INVALID_ARG = @as(c_int, 0x102);
pub const ESP_ERR_INVALID_STATE = @as(c_int, 0x103);
pub const ESP_ERR_INVALID_SIZE = @as(c_int, 0x104);
pub const ESP_ERR_NOT_FOUND = @as(c_int, 0x105);
pub const ESP_ERR_NOT_SUPPORTED = @as(c_int, 0x106);
pub const ESP_ERR_TIMEOUT = @as(c_int, 0x107);
pub const ESP_ERR_INVALID_RESPONSE = @as(c_int, 0x108);
pub const ESP_ERR_INVALID_CRC = @as(c_int, 0x109);
pub const ESP_ERR_INVALID_VERSION = @as(c_int, 0x10A);
pub const ESP_ERR_INVALID_MAC = @as(c_int, 0x10B);
pub const ESP_ERR_NOT_FINISHED = @as(c_int, 0x10C);
pub const ESP_ERR_NOT_ALLOWED = @as(c_int, 0x10D);
pub const ESP_ERR_WIFI_BASE = @as(c_int, 0x3000);
pub const ESP_ERR_MESH_BASE = @as(c_int, 0x4000);
pub const ESP_ERR_FLASH_BASE = @as(c_int, 0x6000);
pub const ESP_ERR_HW_CRYPTO_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc000, .hex);
pub const ESP_ERR_MEMPROT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xd000, .hex);
pub const ESP_ERROR_CHECK = @compileError("unable to translate macro: undefined identifier `err_rc_`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_err.h:115:9
pub const ESP_ERROR_CHECK_WITHOUT_ABORT = @compileError("unable to translate macro: undefined identifier `err_rc_`");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_err.h:135:9
pub inline fn ESP_INTR_CPU_AFFINITY_TO_CORE_ID(cpu_affinity: anytype) @TypeOf(cpu_affinity - @as(c_int, 1)) {
    _ = &cpu_affinity;
    return cpu_affinity - @as(c_int, 1);
}
pub const ESP_INTR_FLAG_LEVEL1 = @as(c_int, 1) << @as(c_int, 1);
pub const ESP_INTR_FLAG_LEVEL2 = @as(c_int, 1) << @as(c_int, 2);
pub const ESP_INTR_FLAG_LEVEL3 = @as(c_int, 1) << @as(c_int, 3);
pub const ESP_INTR_FLAG_LEVEL4 = @as(c_int, 1) << @as(c_int, 4);
pub const ESP_INTR_FLAG_LEVEL5 = @as(c_int, 1) << @as(c_int, 5);
pub const ESP_INTR_FLAG_LEVEL6 = @as(c_int, 1) << @as(c_int, 6);
pub const ESP_INTR_FLAG_NMI = @as(c_int, 1) << @as(c_int, 7);
pub const ESP_INTR_FLAG_SHARED = @as(c_int, 1) << @as(c_int, 8);
pub const ESP_INTR_FLAG_EDGE = @as(c_int, 1) << @as(c_int, 9);
pub const ESP_INTR_FLAG_IRAM = @as(c_int, 1) << @as(c_int, 10);
pub const ESP_INTR_FLAG_INTRDISABLED = @as(c_int, 1) << @as(c_int, 11);
pub const ESP_INTR_FLAG_LOWMED = (ESP_INTR_FLAG_LEVEL1 | ESP_INTR_FLAG_LEVEL2) | ESP_INTR_FLAG_LEVEL3;
pub const ESP_INTR_FLAG_HIGH = ((ESP_INTR_FLAG_LEVEL4 | ESP_INTR_FLAG_LEVEL5) | ESP_INTR_FLAG_LEVEL6) | ESP_INTR_FLAG_NMI;
pub const ESP_INTR_FLAG_LEVELMASK = (((((ESP_INTR_FLAG_LEVEL1 | ESP_INTR_FLAG_LEVEL2) | ESP_INTR_FLAG_LEVEL3) | ESP_INTR_FLAG_LEVEL4) | ESP_INTR_FLAG_LEVEL5) | ESP_INTR_FLAG_LEVEL6) | ESP_INTR_FLAG_NMI;
pub const ETS_INTERNAL_TIMER0_INTR_SOURCE = -@as(c_int, 1);
pub const ETS_INTERNAL_TIMER1_INTR_SOURCE = -@as(c_int, 2);
pub const ETS_INTERNAL_TIMER2_INTR_SOURCE = -@as(c_int, 3);
pub const ETS_INTERNAL_SW0_INTR_SOURCE = -@as(c_int, 4);
pub const ETS_INTERNAL_SW1_INTR_SOURCE = -@as(c_int, 5);
pub const ETS_INTERNAL_PROFILING_INTR_SOURCE = -@as(c_int, 6);
pub const ETS_INTERNAL_UNUSED_INTR_SOURCE = -@as(c_int, 99);
pub const ETS_INTERNAL_INTR_SOURCE_OFF = -ETS_INTERNAL_PROFILING_INTR_SOURCE;
pub inline fn ESP_INTR_ENABLE(inum: anytype) @TypeOf(esp_intr_enable_source(inum)) {
    _ = &inum;
    return esp_intr_enable_source(inum);
}
pub inline fn ESP_INTR_DISABLE(inum: anytype) @TypeOf(esp_intr_disable_source(inum)) {
    _ = &inum;
    return esp_intr_disable_source(inum);
}
pub const ESP_CPU_INTR_DESC_FLAG_SPECIAL = @as(c_int, 0x01);
pub const ESP_CPU_INTR_DESC_FLAG_RESVD = @as(c_int, 0x02);
pub const NEED_VOLATILE_MUX = "";
pub const SPINLOCK_FREE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xB33FFFFF, .hex);
pub const SPINLOCK_WAIT_FOREVER = -@as(c_int, 1);
pub const SPINLOCK_NO_WAIT = @as(c_int, 0);
pub const SPINLOCK_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_hw_support/include/spinlock.h:34:9
pub const SPINLOCK_OWNER_ID_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xCDCD, .hex);
pub const SPINLOCK_OWNER_ID_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xABAB, .hex);
pub const CORE_ID_REGVAL_XOR_SWAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xCDCD, .hex) ^ @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xABAB, .hex);
pub const SPINLOCK_OWNER_ID_XOR_SWAP = CORE_ID_REGVAL_XOR_SWAP;
pub const PORTBENCHMARK_H = "";
pub const portbenchmarkINTERRUPT_DISABLE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portbenchmark.h:45:9
pub const portbenchmarkINTERRUPT_RESTORE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portbenchmark.h:46:9
pub const portbenchmarkIntLatency = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portbenchmark.h:47:9
pub const portbenchmarkIntWait = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portbenchmark.h:48:9
pub const portbenchmarkReset = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portbenchmark.h:49:9
pub const portbenchmarkPrint = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portbenchmark.h:50:9
pub const __ESP_ASSERT_H__ = "";
pub const ESP_STATIC_ASSERT = static_assert;
pub const TRY_STATIC_ASSERT = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_assert.h:18:9
pub const CHOOSE_MACRO_VA_ARG_INN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:45:9
pub const CHOOSE_MACRO_VA_ARG = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:46:9
pub const __VA_NARG__ = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:57:10
pub const __NARG__ = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:59:10
pub const __GET_NTH_ARG__ = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:60:10
pub inline fn __RSEQ_N__() @TypeOf(@as(c_int, 0)) {
    return blk: {
        _ = @as(c_int, 62);
        _ = @as(c_int, 61);
        _ = @as(c_int, 60);
        _ = @as(c_int, 59);
        _ = @as(c_int, 58);
        _ = @as(c_int, 57);
        _ = @as(c_int, 56);
        _ = @as(c_int, 55);
        _ = @as(c_int, 54);
        _ = @as(c_int, 53);
        _ = @as(c_int, 52);
        _ = @as(c_int, 51);
        _ = @as(c_int, 50);
        _ = @as(c_int, 49);
        _ = @as(c_int, 48);
        _ = @as(c_int, 47);
        _ = @as(c_int, 46);
        _ = @as(c_int, 45);
        _ = @as(c_int, 44);
        _ = @as(c_int, 43);
        _ = @as(c_int, 42);
        _ = @as(c_int, 41);
        _ = @as(c_int, 40);
        _ = @as(c_int, 39);
        _ = @as(c_int, 38);
        _ = @as(c_int, 37);
        _ = @as(c_int, 36);
        _ = @as(c_int, 35);
        _ = @as(c_int, 34);
        _ = @as(c_int, 33);
        _ = @as(c_int, 32);
        _ = @as(c_int, 31);
        _ = @as(c_int, 30);
        _ = @as(c_int, 29);
        _ = @as(c_int, 28);
        _ = @as(c_int, 27);
        _ = @as(c_int, 26);
        _ = @as(c_int, 25);
        _ = @as(c_int, 24);
        _ = @as(c_int, 23);
        _ = @as(c_int, 22);
        _ = @as(c_int, 21);
        _ = @as(c_int, 20);
        _ = @as(c_int, 19);
        _ = @as(c_int, 18);
        _ = @as(c_int, 17);
        _ = @as(c_int, 16);
        _ = @as(c_int, 15);
        _ = @as(c_int, 14);
        _ = @as(c_int, 13);
        _ = @as(c_int, 12);
        _ = @as(c_int, 11);
        _ = @as(c_int, 10);
        _ = @as(c_int, 9);
        _ = @as(c_int, 8);
        _ = @as(c_int, 7);
        _ = @as(c_int, 6);
        _ = @as(c_int, 5);
        _ = @as(c_int, 4);
        _ = @as(c_int, 3);
        _ = @as(c_int, 2);
        _ = @as(c_int, 1);
        break :blk @as(c_int, 0);
    };
}
pub const ESP_UNUSED = @import("std").zig.c_translation.Macros.DISCARD;
pub const foo_args = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:83:9
pub inline fn foo_no_args() @TypeOf(@as(c_int, 2)) {
    return @as(c_int, 2);
}
pub const foo = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/esp_common/include/esp_macros.h:88:9
pub const __ESP_CROSSCORE_INT_H = "";
pub const DR_REG_UART_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex);
pub const DR_REG_SPI1_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60002000, .hex);
pub const DR_REG_SPI0_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60003000, .hex);
pub const DR_REG_GPIO_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60004000, .hex);
pub const DR_REG_GPIO_SD_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60004f00, .hex);
pub const DR_REG_FE2_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60005000, .hex);
pub const DR_REG_FE_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60006000, .hex);
pub const DR_REG_EFUSE_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60007000, .hex);
pub const DR_REG_RTCCNTL_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60008000, .hex);
pub const DR_REG_RTCIO_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60008400, .hex);
pub const DR_REG_SENS_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60008800, .hex);
pub const DR_REG_RTC_I2C_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60008C00, .hex);
pub const DR_REG_IO_MUX_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60009000, .hex);
pub const DR_REG_HINF_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6000B000, .hex);
pub const DR_REG_UHCI1_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6000C000, .hex);
pub const DR_REG_I2S_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6000F000, .hex);
pub const DR_REG_UART1_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60010000, .hex);
pub const DR_REG_BT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60011000, .hex);
pub const DR_REG_I2C_EXT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60013000, .hex);
pub const DR_REG_UHCI0_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60014000, .hex);
pub const DR_REG_SLCHOST_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60015000, .hex);
pub const DR_REG_RMT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60016000, .hex);
pub const DR_REG_PCNT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60017000, .hex);
pub const DR_REG_SLC_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60018000, .hex);
pub const DR_REG_LEDC_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60019000, .hex);
pub const DR_REG_NRX_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6001CC00, .hex);
pub const DR_REG_BB_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6001D000, .hex);
pub const DR_REG_PWM0_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6001E000, .hex);
pub const DR_REG_TIMERGROUP0_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6001F000, .hex);
pub const DR_REG_TIMERGROUP1_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60020000, .hex);
pub const DR_REG_RTC_SLOWMEM_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60021000, .hex);
pub const DR_REG_SYSTIMER_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60023000, .hex);
pub const DR_REG_SPI2_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60024000, .hex);
pub const DR_REG_SPI3_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60025000, .hex);
pub const DR_REG_SYSCON_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60026000, .hex);
pub const DR_REG_APB_CTRL_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60026000, .hex);
pub const DR_REG_I2C1_EXT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60027000, .hex);
pub const DR_REG_SDMMC_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60028000, .hex);
pub const DR_REG_PERI_BACKUP_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6002A000, .hex);
pub const DR_REG_TWAI_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6002B000, .hex);
pub const DR_REG_PWM1_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6002C000, .hex);
pub const DR_REG_I2S1_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6002D000, .hex);
pub const DR_REG_UART2_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6002E000, .hex);
pub const DR_REG_USB_SERIAL_JTAG_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60038000, .hex);
pub const DR_REG_USB_WRAP_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60039000, .hex);
pub const DR_REG_AES_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6003A000, .hex);
pub const DR_REG_SHA_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6003B000, .hex);
pub const DR_REG_RSA_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6003C000, .hex);
pub const DR_REG_HMAC_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6003E000, .hex);
pub const DR_REG_DIGITAL_SIGNATURE_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6003D000, .hex);
pub const DR_REG_GDMA_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6003F000, .hex);
pub const DR_REG_APB_SARADC_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60040000, .hex);
pub const DR_REG_LCD_CAM_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60041000, .hex);
pub const DR_REG_SYSTEM_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C0000, .hex);
pub const DR_REG_SENSITIVE_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C1000, .hex);
pub const DR_REG_INTERRUPT_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C2000, .hex);
pub const DR_REG_EXTMEM_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C4000, .hex);
pub const DR_REG_ASSIST_DEBUG_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600CE000, .hex);
pub const DR_REG_WCL_BASE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600D0000, .hex);
pub const PRO_CPU_NUM = @as(c_int, 0);
pub const APP_CPU_NUM = @as(c_int, 1);
pub const PRO_CPUID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xcdcd, .hex);
pub const APP_CPUID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xabab, .hex);
pub const DR_REG_MMU_TABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C5000, .hex);
pub const DR_REG_ITAG_TABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C6000, .hex);
pub const DR_REG_DTAG_TABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600C8000, .hex);
pub const DR_REG_EXT_MEM_ENC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600CC000, .hex);
pub inline fn REG_UHCI_BASE(i: anytype) @TypeOf(DR_REG_UHCI0_BASE - (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex))) {
    _ = &i;
    return DR_REG_UHCI0_BASE - (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex));
}
pub inline fn REG_UART_BASE(i: anytype) @TypeOf((DR_REG_UART_BASE + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex))) + (if (i > @as(c_int, 1)) @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe000, .hex) else @as(c_int, 0))) {
    _ = &i;
    return (DR_REG_UART_BASE + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex))) + (if (i > @as(c_int, 1)) @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe000, .hex) else @as(c_int, 0));
}
pub inline fn REG_UART_AHB_BASE(i: anytype) @TypeOf((@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex) + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex))) + (if (i > @as(c_int, 1)) @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe000, .hex) else @as(c_int, 0))) {
    _ = &i;
    return (@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60000000, .hex) + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex))) + (if (i > @as(c_int, 1)) @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe000, .hex) else @as(c_int, 0));
}
pub inline fn UART_FIFO_AHB_REG(i: anytype) @TypeOf(REG_UART_AHB_BASE(i) + @as(c_int, 0x0)) {
    _ = &i;
    return REG_UART_AHB_BASE(i) + @as(c_int, 0x0);
}
pub inline fn REG_I2S_BASE(i: anytype) @TypeOf(DR_REG_I2S_BASE + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1E000, .hex))) {
    _ = &i;
    return DR_REG_I2S_BASE + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1E000, .hex));
}
pub inline fn REG_TIMG_BASE(i: anytype) @TypeOf(DR_REG_TIMERGROUP0_BASE + (i * @as(c_int, 0x1000))) {
    _ = &i;
    return DR_REG_TIMERGROUP0_BASE + (i * @as(c_int, 0x1000));
}
pub inline fn REG_SPI_MEM_BASE(i: anytype) @TypeOf(DR_REG_SPI0_BASE - (i * @as(c_int, 0x1000))) {
    _ = &i;
    return DR_REG_SPI0_BASE - (i * @as(c_int, 0x1000));
}
pub inline fn REG_SPI_BASE(i: anytype) @TypeOf(if (i >= @as(c_int, 2)) DR_REG_SPI2_BASE + ((i - @as(c_int, 2)) * @as(c_int, 0x1000)) else @as(c_int, 0)) {
    _ = &i;
    return if (i >= @as(c_int, 2)) DR_REG_SPI2_BASE + ((i - @as(c_int, 2)) * @as(c_int, 0x1000)) else @as(c_int, 0);
}
pub inline fn REG_I2C_BASE(i: anytype) @TypeOf(DR_REG_I2C_EXT_BASE + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x14000, .hex))) {
    _ = &i;
    return DR_REG_I2C_EXT_BASE + (i * @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x14000, .hex));
}
pub inline fn ETS_UNCACHED_ADDR(addr: anytype) @TypeOf(addr) {
    _ = &addr;
    return addr;
}
pub inline fn ETS_CACHED_ADDR(addr: anytype) @TypeOf(addr) {
    _ = &addr;
    return addr;
}
pub const REG_WRITE = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:51:9
pub const REG_READ = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:56:9
pub const REG_GET_BIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:61:9
pub const REG_SET_BIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:66:9
pub const REG_CLR_BIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:71:9
pub const REG_SET_BITS = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:76:9
pub const REG_GET_FIELD = @compileError("unable to translate macro: undefined identifier `_V`");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:81:9
pub const REG_SET_FIELD = @compileError("unable to translate macro: undefined identifier `_V`");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:86:9
pub const VALUE_GET_FIELD = @compileError("unable to translate C expr: expected ')' instead got '##'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:91:9
pub const VALUE_GET_FIELD2 = @compileError("unable to translate C expr: expected ')' instead got '##'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:94:9
pub const VALUE_SET_FIELD = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:97:9
pub const VALUE_SET_FIELD2 = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:100:9
pub const FIELD_TO_VALUE = @compileError("unable to translate C expr: expected ')' instead got '##'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:103:9
pub const FIELD_TO_VALUE2 = @compileError("unable to translate C expr: expected ')' instead got '##'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:106:9
pub const READ_PERI_REG = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:109:9
pub const WRITE_PERI_REG = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:114:9
pub const CLEAR_PERI_REG_MASK = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:119:9
pub const SET_PERI_REG_MASK = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:124:9
pub const GET_PERI_REG_MASK = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:129:9
pub const GET_PERI_REG_BITS = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:134:9
pub const SET_PERI_REG_BITS = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:139:9
pub const GET_PERI_REG_BITS2 = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/soc/esp32s3/include/soc/soc.h:144:9
pub const APB_CLK_FREQ_ROM = @as(c_int, 40) * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const CPU_CLK_FREQ_ROM = APB_CLK_FREQ_ROM;
pub const CPU_CLK_FREQ_MHZ_BTLD = @as(c_int, 80);
pub const APB_CLK_FREQ = @as(c_int, 80) * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const MODEM_REQUIRED_MIN_APB_CLK_FREQ = @as(c_int, 80) * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const REF_CLK_FREQ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const XTAL_CLK_FREQ = @as(c_int, 40) * @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const UART_CLK_FREQ = APB_CLK_FREQ;
pub const WDT_CLK_FREQ = APB_CLK_FREQ;
pub const TIMER_CLK_FREQ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000000, .decimal) >> @as(c_int, 4);
pub const SPI_CLK_DIV = @as(c_int, 4);
pub const TICKS_PER_US_ROM = @as(c_int, 40);
pub const GPIO_MATRIX_DELAY_NS = @as(c_int, 0);
pub const SOC_DROM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3C000000, .hex);
pub const SOC_DROM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3E000000, .hex);
pub const SOC_IROM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x42000000, .hex);
pub const SOC_IROM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x44000000, .hex);
pub const SOC_IRAM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40370000, .hex);
pub const SOC_IRAM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x403E0000, .hex);
pub const SOC_DRAM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FC88000, .hex);
pub const SOC_DRAM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FD00000, .hex);
pub const SOC_RTC_IRAM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600FE000, .hex);
pub const SOC_RTC_IRAM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60100000, .hex);
pub const SOC_RTC_DRAM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x600FE000, .hex);
pub const SOC_RTC_DRAM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x60100000, .hex);
pub const SOC_RTC_DATA_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x50000000, .hex);
pub const SOC_RTC_DATA_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x50002000, .hex);
pub const SOC_EXTRAM_DATA_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3C000000, .hex);
pub const SOC_EXTRAM_DATA_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3E000000, .hex);
pub const SOC_IROM_MASK_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const SOC_IROM_MASK_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40060000, .hex);
pub const SOC_EXTRAM_DATA_SIZE = SOC_EXTRAM_DATA_HIGH - SOC_EXTRAM_DATA_LOW;
pub const SOC_MAX_CONTIGUOUS_RAM_SIZE = SOC_EXTRAM_DATA_HIGH - SOC_EXTRAM_DATA_LOW;
pub const SOC_DIRAM_IRAM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40378000, .hex);
pub const SOC_DIRAM_IRAM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x403E0000, .hex);
pub const SOC_DIRAM_DRAM_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FC88000, .hex);
pub const SOC_DIRAM_DRAM_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FCF0000, .hex);
pub const SOC_I_D_OFFSET = SOC_DIRAM_IRAM_LOW - SOC_DIRAM_DRAM_LOW;
pub inline fn MAP_DRAM_TO_IRAM(addr: anytype) @TypeOf(addr + SOC_I_D_OFFSET) {
    _ = &addr;
    return addr + SOC_I_D_OFFSET;
}
pub inline fn MAP_IRAM_TO_DRAM(addr: anytype) @TypeOf(addr - SOC_I_D_OFFSET) {
    _ = &addr;
    return addr - SOC_I_D_OFFSET;
}
pub const SOC_DMA_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FC88000, .hex);
pub const SOC_DMA_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FD00000, .hex);
pub const SOC_DMA_EXT_LOW = SOC_EXTRAM_DATA_LOW;
pub const SOC_DMA_EXT_HIGH = SOC_EXTRAM_DATA_HIGH;
pub const SOC_BYTE_ACCESSIBLE_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FC88000, .hex);
pub const SOC_BYTE_ACCESSIBLE_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FD00000, .hex);
pub const SOC_MEM_INTERNAL_LOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3FC88000, .hex);
pub const SOC_MEM_INTERNAL_HIGH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x403E0000, .hex);
pub const SOC_ROM_STACK_START = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3fceb710, .hex);
pub const SOC_ROM_STACK_SIZE = @as(c_int, 0x2000);
pub const ETS_WMAC_INUM = @as(c_int, 0);
pub const ETS_WBB_INUM = @as(c_int, 4);
pub const ETS_T1_WDT_INUM = @as(c_int, 24);
pub const ETS_MEMACCESS_ERR_INUM = @as(c_int, 25);
pub const ETS_CACHEERR_INUM = ETS_MEMACCESS_ERR_INUM;
pub const ETS_IPC_ISR_INUM = @as(c_int, 28);
pub const ETS_SLC_INUM = @as(c_int, 1);
pub const ETS_UART0_INUM = @as(c_int, 5);
pub const ETS_UART1_INUM = @as(c_int, 5);
pub const ETS_SPI2_INUM = @as(c_int, 1);
pub const ETS_FRC_TIMER2_INUM = @as(c_int, 10);
pub const ETS_GPIO_INUM = @as(c_int, 4);
pub const ETS_INVALID_INUM = @as(c_int, 6);
pub const ETS_INT_WDT_INUM = ETS_T1_WDT_INUM;
pub const portCHAR = i8;
pub const portFLOAT = f32;
pub const portDOUBLE = f64;
pub const portLONG = i32;
pub const portSHORT = i16;
pub const portSTACK_TYPE = u8;
pub const portBASE_TYPE = c_int;
pub const portMAX_DELAY = @import("std").zig.c_translation.cast(TickType_t, @as(c_ulong, 0xffffffff));
pub inline fn portTASK_FUNCTION_PROTO(vFunction: anytype, pvParameters: anytype) @TypeOf(anyopaque ++ vFunction(?*anyopaque ++ pvParameters)) {
    _ = &vFunction;
    _ = &pvParameters;
    return anyopaque ++ vFunction(?*anyopaque ++ pvParameters);
}
pub inline fn portTASK_FUNCTION(vFunction: anytype, pvParameters: anytype) @TypeOf(anyopaque ++ vFunction(?*anyopaque ++ pvParameters)) {
    _ = &vFunction;
    _ = &pvParameters;
    return anyopaque ++ vFunction(?*anyopaque ++ pvParameters);
}
pub const portCRITICAL_NESTING_IN_TCB = @as(c_int, 1);
pub const portSTACK_GROWTH = -@as(c_int, 1);
pub const portTICK_PERIOD_MS = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.cast(TickType_t, @as(c_int, 1000)), configTICK_RATE_HZ);
pub const portBYTE_ALIGNMENT = @as(c_int, 16);
pub const portNOP = @compileError("unable to translate macro: undefined identifier `XT_NOP`");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:76:9
pub const portMUX_INITIALIZER_UNLOCKED = SPINLOCK_INITIALIZER;
pub const portMUX_FREE_VAL = SPINLOCK_FREE;
pub const portMUX_NO_TIMEOUT = SPINLOCK_WAIT_FOREVER;
pub const portMUX_TRY_LOCK = SPINLOCK_NO_WAIT;
pub inline fn portMUX_INITIALIZE(mux: anytype) @TypeOf(spinlock_initialize(mux)) {
    _ = &mux;
    return spinlock_initialize(mux);
}
pub const portYIELD_FROM_ISR_CHECK = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:127:9
pub inline fn portYIELD_FROM_ISR_NO_CHECK() @TypeOf(vPortYieldFromISR()) {
    return vPortYieldFromISR();
}
pub const portSET_INTERRUPT_MASK = @compileError("unable to translate macro: undefined identifier `prev_level`");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:162:9
pub inline fn portSET_INTERRUPT_MASK_FROM_ISR() @TypeOf(portSET_INTERRUPT_MASK()) {
    return portSET_INTERRUPT_MASK();
}
pub inline fn portDISABLE_INTERRUPTS() @TypeOf(portSET_INTERRUPT_MASK()) {
    return portSET_INTERRUPT_MASK();
}
pub const portCLEAR_INTERRUPT_MASK = @compileError("unable to translate macro: undefined identifier `ps_reg`");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:182:9
pub inline fn portCLEAR_INTERRUPT_MASK_FROM_ISR(x: anytype) @TypeOf(portCLEAR_INTERRUPT_MASK(x)) {
    _ = &x;
    return portCLEAR_INTERRUPT_MASK(x);
}
pub const portENABLE_INTERRUPTS = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:190:9
pub inline fn portRESTORE_INTERRUPTS(x: anytype) @TypeOf(portCLEAR_INTERRUPT_MASK(x)) {
    _ = &x;
    return portCLEAR_INTERRUPT_MASK(x);
}
pub inline fn portGET_TASK_LOCK() @TypeOf(vPortTakeLock(&port_xTaskLock)) {
    return vPortTakeLock(&port_xTaskLock);
}
pub inline fn portRELEASE_TASK_LOCK() @TypeOf(vPortReleaseLock(&port_xTaskLock)) {
    return vPortReleaseLock(&port_xTaskLock);
}
pub inline fn portGET_ISR_LOCK() @TypeOf(vPortTakeLock(&port_xISRLock)) {
    return vPortTakeLock(&port_xISRLock);
}
pub inline fn portRELEASE_ISR_LOCK() @TypeOf(vPortReleaseLock(&port_xISRLock)) {
    return vPortReleaseLock(&port_xISRLock);
}
pub const portENTER_CRITICAL_SMP = @compileError("unable to translate C expr: unexpected token ';'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:210:9
pub const portEXIT_CRITICAL_SMP = @compileError("unable to translate C expr: unexpected token ';'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:211:9
pub const portENTER_CRITICAL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:217:9
pub const portEXIT_CRITICAL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:218:9
pub inline fn portENTER_CRITICAL_FROM_ISR() @TypeOf(vTaskEnterCriticalFromISR()) {
    return vTaskEnterCriticalFromISR();
}
pub inline fn portEXIT_CRITICAL_FROM_ISR(x: anytype) @TypeOf(vTaskExitCriticalFromISR(x)) {
    _ = &x;
    return vTaskExitCriticalFromISR(x);
}
pub inline fn portYIELD() @TypeOf(vPortYield()) {
    return vPortYield();
}
pub const portYIELD_FROM_ISR = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:232:9
pub inline fn portYIELD_CORE(x: anytype) @TypeOf(vPortYieldCore(x)) {
    _ = &x;
    return vPortYieldCore(x);
}
pub inline fn portGET_CORE_ID() @TypeOf(xPortGetCoreID()) {
    return xPortGetCoreID();
}
pub inline fn portCHECK_IF_IN_ISR() @TypeOf(xPortCheckIfInISR()) {
    return xPortCheckIfInISR();
}
pub const portCONFIGURE_TIMER_FOR_RUN_TIME_STATS = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos/portmacro.h:244:9
pub inline fn portGET_RUN_TIME_COUNTER_VALUE() @TypeOf(configRUN_TIME_COUNTER_TYPE ++ xthal_get_ccount()) {
    return configRUN_TIME_COUNTER_TYPE ++ xthal_get_ccount();
}
pub inline fn portCLEAN_UP_TCB(pxTCB: anytype) @TypeOf(vPortTCBPreDeleteHook(pxTCB)) {
    _ = &pxTCB;
    return vPortTCBPreDeleteHook(pxTCB);
}
pub inline fn portTRY_ENTER_CRITICAL(lock: anytype, timeout: anytype) @TypeOf(xPortEnterCriticalTimeout(lock, timeout)) {
    _ = &lock;
    _ = &timeout;
    return xPortEnterCriticalTimeout(lock, timeout);
}
pub inline fn portENTER_CRITICAL_IDF(lock: anytype) @TypeOf(vPortEnterCriticalIDF(lock)) {
    _ = &lock;
    return vPortEnterCriticalIDF(lock);
}
pub inline fn portEXIT_CRITICAL_IDF(lock: anytype) @TypeOf(vPortExitCriticalIDF(lock)) {
    _ = &lock;
    return vPortExitCriticalIDF(lock);
}
pub inline fn portTRY_ENTER_CRITICAL_ISR(lock: anytype, timeout: anytype) @TypeOf(xPortEnterCriticalTimeout(lock, timeout)) {
    _ = &lock;
    _ = &timeout;
    return xPortEnterCriticalTimeout(lock, timeout);
}
pub inline fn portENTER_CRITICAL_ISR(lock: anytype) @TypeOf(vPortEnterCriticalIDF(lock)) {
    _ = &lock;
    return vPortEnterCriticalIDF(lock);
}
pub inline fn portEXIT_CRITICAL_ISR(lock: anytype) @TypeOf(vPortExitCriticalIDF(lock)) {
    _ = &lock;
    return vPortExitCriticalIDF(lock);
}
pub inline fn portENTER_CRITICAL_SAFE(lock: anytype) @TypeOf(vPortEnterCriticalIDF(lock)) {
    _ = &lock;
    return vPortEnterCriticalIDF(lock);
}
pub inline fn portEXIT_CRITICAL_SAFE(lock: anytype) @TypeOf(vPortExitCriticalIDF(lock)) {
    _ = &lock;
    return vPortExitCriticalIDF(lock);
}
pub inline fn portYIELD_WITHIN_API() @TypeOf(esp_crosscore_int_send_yield(xPortGetCoreID())) {
    return esp_crosscore_int_send_yield(xPortGetCoreID());
}
pub inline fn portVALID_LIST_MEM(ptr: anytype) @TypeOf(xPortCheckValidListMem(ptr)) {
    _ = &ptr;
    return xPortCheckValidListMem(ptr);
}
pub inline fn portVALID_TCB_MEM(ptr: anytype) @TypeOf(xPortCheckValidTCBMem(ptr)) {
    _ = &ptr;
    return xPortCheckValidTCBMem(ptr);
}
pub inline fn portVALID_STACK_MEM(ptr: anytype) @TypeOf(xPortcheckValidStackMem(ptr)) {
    _ = &ptr;
    return xPortcheckValidStackMem(ptr);
}
pub inline fn os_task_switch_is_pended(_cpu_: anytype) @TypeOf(@"false") {
    _ = &_cpu_;
    return @"false";
}
pub const __need_va_list = "";
pub const __need_va_arg = "";
pub const __need___va_copy = "";
pub const __need_va_copy = "";
pub const __STDARG_H = "";
pub const _VA_LIST = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/wiiggee1/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/lib/include/__stdarg_va_arg.h:17:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /home/wiiggee1/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/lib/include/__stdarg_va_arg.h:19:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /home/wiiggee1/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/lib/include/__stdarg_va_arg.h:20:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /home/wiiggee1/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/lib/include/__stdarg___va_copy.h:11:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /home/wiiggee1/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/lib/include/__stdarg_va_copy.h:11:9
pub const esp_sync_counters_rtc_and_frc = esp_sync_timekeeping_timers;
pub const HEAP_IRAM_ATTR = IRAM_ATTR;
pub const MALLOC_CAP_EXEC = @as(c_int, 1) << @as(c_int, 0);
pub const MALLOC_CAP_32BIT = @as(c_int, 1) << @as(c_int, 1);
pub const MALLOC_CAP_8BIT = @as(c_int, 1) << @as(c_int, 2);
pub const MALLOC_CAP_DMA = @as(c_int, 1) << @as(c_int, 3);
pub const MALLOC_CAP_PID2 = @as(c_int, 1) << @as(c_int, 4);
pub const MALLOC_CAP_PID3 = @as(c_int, 1) << @as(c_int, 5);
pub const MALLOC_CAP_PID4 = @as(c_int, 1) << @as(c_int, 6);
pub const MALLOC_CAP_PID5 = @as(c_int, 1) << @as(c_int, 7);
pub const MALLOC_CAP_PID6 = @as(c_int, 1) << @as(c_int, 8);
pub const MALLOC_CAP_PID7 = @as(c_int, 1) << @as(c_int, 9);
pub const MALLOC_CAP_SPIRAM = @as(c_int, 1) << @as(c_int, 10);
pub const MALLOC_CAP_INTERNAL = @as(c_int, 1) << @as(c_int, 11);
pub const MALLOC_CAP_DEFAULT = @as(c_int, 1) << @as(c_int, 12);
pub const MALLOC_CAP_IRAM_8BIT = @as(c_int, 1) << @as(c_int, 13);
pub const MALLOC_CAP_RETENTION = @as(c_int, 1) << @as(c_int, 14);
pub const MALLOC_CAP_RTCRAM = @as(c_int, 1) << @as(c_int, 15);
pub const MALLOC_CAP_TCM = @as(c_int, 1) << @as(c_int, 16);
pub const MALLOC_CAP_DMA_DESC_AHB = @as(c_int, 1) << @as(c_int, 17);
pub const MALLOC_CAP_DMA_DESC_AXI = @as(c_int, 1) << @as(c_int, 18);
pub const MALLOC_CAP_CACHE_ALIGNED = @as(c_int, 1) << @as(c_int, 19);
pub const MALLOC_CAP_INVALID = @as(c_int, 1) << @as(c_int, 31);
pub const _INTTYPES_H = "";
pub const _SYS__LOCALE_H = "";
pub const __STRINGIFY = @compileError("unable to translate C expr: unexpected token '#'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:28:9
pub inline fn __PRI8(x: anytype) @TypeOf(__INT8 ++ __STRINGIFY(x)) {
    _ = &x;
    return __INT8 ++ __STRINGIFY(x);
}
pub inline fn __PRI8LEAST(x: anytype) @TypeOf(__LEAST8 ++ __STRINGIFY(x)) {
    _ = &x;
    return __LEAST8 ++ __STRINGIFY(x);
}
pub inline fn __PRI8FAST(x: anytype) @TypeOf(__FAST8 ++ __STRINGIFY(x)) {
    _ = &x;
    return __FAST8 ++ __STRINGIFY(x);
}
pub inline fn __SCN8(x: anytype) @TypeOf(__INT8 ++ __STRINGIFY(x)) {
    _ = &x;
    return __INT8 ++ __STRINGIFY(x);
}
pub inline fn __SCN8LEAST(x: anytype) @TypeOf(__LEAST8 ++ __STRINGIFY(x)) {
    _ = &x;
    return __LEAST8 ++ __STRINGIFY(x);
}
pub inline fn __SCN8FAST(x: anytype) @TypeOf(__FAST8 ++ __STRINGIFY(x)) {
    _ = &x;
    return __FAST8 ++ __STRINGIFY(x);
}
pub const PRId8 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:52:9
pub const PRIi8 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:53:9
pub const PRIo8 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:54:9
pub const PRIu8 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:55:9
pub const PRIx8 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:56:9
pub const PRIX8 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:57:9
pub const SCNd8 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:62:9
pub const SCNi8 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:63:9
pub const SCNo8 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:64:9
pub const SCNu8 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:65:9
pub const SCNx8 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:66:9
pub const PRIdLEAST8 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:71:9
pub const PRIiLEAST8 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:72:9
pub const PRIoLEAST8 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:73:9
pub const PRIuLEAST8 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:74:9
pub const PRIxLEAST8 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:75:9
pub const PRIXLEAST8 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:76:9
pub const SCNdLEAST8 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:81:11
pub const SCNiLEAST8 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:82:11
pub const SCNoLEAST8 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:83:11
pub const SCNuLEAST8 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:84:11
pub const SCNxLEAST8 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:85:11
pub const PRIdFAST8 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:89:9
pub const PRIiFAST8 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:90:9
pub const PRIoFAST8 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:91:9
pub const PRIuFAST8 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:92:9
pub const PRIxFAST8 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:93:9
pub const PRIXFAST8 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:94:9
pub const SCNdFAST8 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:99:11
pub const SCNiFAST8 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:100:11
pub const SCNoFAST8 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:101:11
pub const SCNuFAST8 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:102:11
pub const SCNxFAST8 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:103:11
pub inline fn __PRI16(x: anytype) @TypeOf(__INT16 ++ __STRINGIFY(x)) {
    _ = &x;
    return __INT16 ++ __STRINGIFY(x);
}
pub inline fn __PRI16LEAST(x: anytype) @TypeOf(__LEAST16 ++ __STRINGIFY(x)) {
    _ = &x;
    return __LEAST16 ++ __STRINGIFY(x);
}
pub inline fn __PRI16FAST(x: anytype) @TypeOf(__FAST16 ++ __STRINGIFY(x)) {
    _ = &x;
    return __FAST16 ++ __STRINGIFY(x);
}
pub inline fn __SCN16(x: anytype) @TypeOf(__INT16 ++ __STRINGIFY(x)) {
    _ = &x;
    return __INT16 ++ __STRINGIFY(x);
}
pub inline fn __SCN16LEAST(x: anytype) @TypeOf(__LEAST16 ++ __STRINGIFY(x)) {
    _ = &x;
    return __LEAST16 ++ __STRINGIFY(x);
}
pub inline fn __SCN16FAST(x: anytype) @TypeOf(__FAST16 ++ __STRINGIFY(x)) {
    _ = &x;
    return __FAST16 ++ __STRINGIFY(x);
}
pub const PRId16 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:116:9
pub const PRIi16 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:117:9
pub const PRIo16 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:118:9
pub const PRIu16 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:119:9
pub const PRIx16 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:120:9
pub const PRIX16 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:121:9
pub const SCNd16 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:123:9
pub const SCNi16 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:124:9
pub const SCNo16 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:125:9
pub const SCNu16 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:126:9
pub const SCNx16 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:127:9
pub const PRIdLEAST16 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:130:9
pub const PRIiLEAST16 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:131:9
pub const PRIoLEAST16 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:132:9
pub const PRIuLEAST16 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:133:9
pub const PRIxLEAST16 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:134:9
pub const PRIXLEAST16 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:135:9
pub const SCNdLEAST16 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:137:9
pub const SCNiLEAST16 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:138:9
pub const SCNoLEAST16 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:139:9
pub const SCNuLEAST16 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:140:9
pub const SCNxLEAST16 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:141:9
pub const PRIdFAST16 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:144:9
pub const PRIiFAST16 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:145:9
pub const PRIoFAST16 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:146:9
pub const PRIuFAST16 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:147:9
pub const PRIxFAST16 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:148:9
pub const PRIXFAST16 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:149:9
pub const SCNdFAST16 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:151:9
pub const SCNiFAST16 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:152:9
pub const SCNoFAST16 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:153:9
pub const SCNuFAST16 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:154:9
pub const SCNxFAST16 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:155:9
pub inline fn __PRI32(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub inline fn __SCN32(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub inline fn __PRI32LEAST(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub inline fn __SCN32LEAST(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub inline fn __PRI32FAST(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub inline fn __SCN32FAST(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub const PRId32 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:165:9
pub const PRIi32 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:166:9
pub const PRIo32 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:167:9
pub const PRIu32 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:168:9
pub const PRIx32 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:169:9
pub const PRIX32 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:170:9
pub const SCNd32 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:172:9
pub const SCNi32 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:173:9
pub const SCNo32 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:174:9
pub const SCNu32 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:175:9
pub const SCNx32 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:176:9
pub const PRIdLEAST32 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:179:9
pub const PRIiLEAST32 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:180:9
pub const PRIoLEAST32 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:181:9
pub const PRIuLEAST32 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:182:9
pub const PRIxLEAST32 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:183:9
pub const PRIXLEAST32 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:184:9
pub const SCNdLEAST32 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:186:9
pub const SCNiLEAST32 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:187:9
pub const SCNoLEAST32 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:188:9
pub const SCNuLEAST32 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:189:9
pub const SCNxLEAST32 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:190:9
pub const PRIdFAST32 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:193:9
pub const PRIiFAST32 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:194:9
pub const PRIoFAST32 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:195:9
pub const PRIuFAST32 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:196:9
pub const PRIxFAST32 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:197:9
pub const PRIXFAST32 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:198:9
pub const SCNdFAST32 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:200:9
pub const SCNiFAST32 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:201:9
pub const SCNoFAST32 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:202:9
pub const SCNuFAST32 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:203:9
pub const SCNxFAST32 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:204:9
pub inline fn __PRI64(x: anytype) @TypeOf(__INT64 ++ __STRINGIFY(x)) {
    _ = &x;
    return __INT64 ++ __STRINGIFY(x);
}
pub inline fn __SCN64(x: anytype) @TypeOf(__INT64 ++ __STRINGIFY(x)) {
    _ = &x;
    return __INT64 ++ __STRINGIFY(x);
}
pub inline fn __PRI64LEAST(x: anytype) @TypeOf(__LEAST64 ++ __STRINGIFY(x)) {
    _ = &x;
    return __LEAST64 ++ __STRINGIFY(x);
}
pub inline fn __SCN64LEAST(x: anytype) @TypeOf(__LEAST64 ++ __STRINGIFY(x)) {
    _ = &x;
    return __LEAST64 ++ __STRINGIFY(x);
}
pub inline fn __PRI64FAST(x: anytype) @TypeOf(__FAST64 ++ __STRINGIFY(x)) {
    _ = &x;
    return __FAST64 ++ __STRINGIFY(x);
}
pub inline fn __SCN64FAST(x: anytype) @TypeOf(__FAST64 ++ __STRINGIFY(x)) {
    _ = &x;
    return __FAST64 ++ __STRINGIFY(x);
}
pub const PRId64 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:217:9
pub const PRIi64 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:218:9
pub const PRIo64 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:219:9
pub const PRIu64 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:220:9
pub const PRIx64 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:221:9
pub const PRIX64 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:222:9
pub const SCNd64 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:224:9
pub const SCNi64 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:225:9
pub const SCNo64 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:226:9
pub const SCNu64 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:227:9
pub const SCNx64 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:228:9
pub const PRIdLEAST64 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:232:9
pub const PRIiLEAST64 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:233:9
pub const PRIoLEAST64 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:234:9
pub const PRIuLEAST64 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:235:9
pub const PRIxLEAST64 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:236:9
pub const PRIXLEAST64 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:237:9
pub const SCNdLEAST64 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:239:9
pub const SCNiLEAST64 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:240:9
pub const SCNoLEAST64 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:241:9
pub const SCNuLEAST64 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:242:9
pub const SCNxLEAST64 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:243:9
pub const PRIdFAST64 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:247:9
pub const PRIiFAST64 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:248:9
pub const PRIoFAST64 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:249:9
pub const PRIuFAST64 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:250:9
pub const PRIxFAST64 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:251:9
pub const PRIXFAST64 = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:252:9
pub const SCNdFAST64 = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:254:9
pub const SCNiFAST64 = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:255:9
pub const SCNoFAST64 = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:256:9
pub const SCNuFAST64 = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:257:9
pub const SCNxFAST64 = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:258:9
pub const __PRIMAX = @compileError("unable to translate macro: undefined identifier `ll`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:266:9
pub const __SCNMAX = @compileError("unable to translate macro: undefined identifier `ll`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:267:9
pub const PRIdMAX = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:273:9
pub const PRIiMAX = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:274:9
pub const PRIoMAX = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:275:9
pub const PRIuMAX = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:276:9
pub const PRIxMAX = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:277:9
pub const PRIXMAX = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:278:9
pub const SCNdMAX = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:280:9
pub const SCNiMAX = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:281:9
pub const SCNoMAX = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:282:9
pub const SCNuMAX = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:283:9
pub const SCNxMAX = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:284:9
pub inline fn __PRIPTR(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub inline fn __SCNPTR(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub const PRIdPTR = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:298:9
pub const PRIiPTR = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:299:9
pub const PRIoPTR = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:300:9
pub const PRIuPTR = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:301:9
pub const PRIxPTR = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:302:9
pub const PRIXPTR = @compileError("unable to translate macro: undefined identifier `X`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:303:9
pub const SCNdPTR = @compileError("unable to translate macro: undefined identifier `d`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:305:9
pub const SCNiPTR = @compileError("unable to translate macro: undefined identifier `i`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:306:9
pub const SCNoPTR = @compileError("unable to translate macro: undefined identifier `o`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:307:9
pub const SCNuPTR = @compileError("unable to translate macro: undefined identifier `u`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:308:9
pub const SCNxPTR = @compileError("unable to translate macro: undefined identifier `x`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/inttypes.h:309:9
pub const __ESP_SYSTEM_H__ = "";
pub const ESP_IDF_VERSION_MAJOR = @as(c_int, 5);
pub const ESP_IDF_VERSION_MINOR = @as(c_int, 3);
pub const ESP_IDF_VERSION_PATCH = @as(c_int, 1);
pub inline fn ESP_IDF_VERSION_VAL(major: anytype, minor: anytype, patch: anytype) @TypeOf(((major << @as(c_int, 16)) | (minor << @as(c_int, 8))) | patch) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((major << @as(c_int, 16)) | (minor << @as(c_int, 8))) | patch;
}
pub const ESP_IDF_VERSION = ESP_IDF_VERSION_VAL(ESP_IDF_VERSION_MAJOR, ESP_IDF_VERSION_MINOR, ESP_IDF_VERSION_PATCH);
pub const _LIBC_LIMITS_H_ = @as(c_int, 1);
pub const _SYS_SYSLIMITS_H_ = "";
pub const ARG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const CHILD_MAX = @as(c_int, 40);
pub const LINK_MAX = @as(c_int, 32767);
pub const MAX_CANON = @as(c_int, 255);
pub const MAX_INPUT = @as(c_int, 255);
pub const NAME_MAX = @as(c_int, 255);
pub const NGROUPS_MAX = @as(c_int, 16);
pub const OPEN_MAX = @as(c_int, 64);
pub const PATH_MAX = @as(c_int, 1024);
pub const PIPE_BUF = @as(c_int, 512);
pub const IOV_MAX = @as(c_int, 1024);
pub const BC_BASE_MAX = @as(c_int, 99);
pub const BC_DIM_MAX = @as(c_int, 2048);
pub const BC_SCALE_MAX = @as(c_int, 99);
pub const BC_STRING_MAX = @as(c_int, 1000);
pub const COLL_WEIGHTS_MAX = @as(c_int, 0);
pub const EXPR_NEST_MAX = @as(c_int, 32);
pub const LINE_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 255);
pub const MB_LEN_MAX = _MB_LEN_MAX;
pub const NL_ARGMAX = @as(c_int, 32);
pub const __CLANG_LIMITS_H = "";
pub const _GCC_LIMITS_H_ = "";
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = __SCHAR_MAX__;
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const LLONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULLONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const portBYTE_ALIGNMENT_MASK = @as(c_int, 0x000f);
pub const portUSING_MPU_WRAPPERS = @as(c_int, 0);
pub const portNUM_CONFIGURABLE_REGIONS = @as(c_int, 1);
pub const portHAS_STACK_OVERFLOW_CHECKING = @as(c_int, 0);
pub const portARCH_NAME = NULL;
pub const MPU_WRAPPERS_H = "";
pub const PRIVILEGED_FUNCTION = "";
pub const PRIVILEGED_DATA = "";
pub const FREERTOS_SYSTEM_CALL = "";
pub const pvPortMallocStack = pvPortMalloc;
pub const vPortFreeStack = vPortFree;
pub const _REENT_H_ = "";
pub const configUSE_C_RUNTIME_TLS_SUPPORT = @as(c_int, 1);
pub const configTLS_BLOCK_TYPE = struct__reent;
pub const INCLUDE_xQueueGetMutexHolder = @as(c_int, 0);
pub const configUSE_DAEMON_TASK_STARTUP_HOOK = @as(c_int, 0);
pub const configUSE_APPLICATION_TASK_TAG = @as(c_int, 0);
pub const configUSE_ALTERNATIVE_API = @as(c_int, 0);
pub const configASSERT_DEFINED = @as(c_int, 1);
pub inline fn configPRECONDITION(X: anytype) @TypeOf(configASSERT(X)) {
    _ = &X;
    return configASSERT(X);
}
pub const configPRECONDITION_DEFINED = @as(c_int, 0);
pub const portMEMORY_BARRIER = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:356:13
pub const portSOFTWARE_BARRIER = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:360:13
pub const portPRE_TASK_DELETE_HOOK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:393:13
pub const portSETUP_TCB = @import("std").zig.c_translation.Macros.DISCARD;
pub const vQueueAddToRegistry = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:405:13
pub const vQueueUnregisterQueue = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:406:13
pub const pcQueueGetName = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:407:13
pub const configUSE_MINI_LIST_ITEM = @as(c_int, 1);
pub const portPOINTER_SIZE_TYPE = u32;
pub const traceSTART = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:423:13
pub const traceEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:430:13
pub const traceTASK_SWITCHED_IN = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:437:13
pub const traceINCREASE_TICK_COUNT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:444:13
pub const traceLOW_POWER_IDLE_BEGIN = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:449:13
pub const traceLOW_POWER_IDLE_END = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:454:13
pub const traceTASK_SWITCHED_OUT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:461:13
pub const traceTASK_PRIORITY_INHERIT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:471:13
pub const traceTASK_PRIORITY_DISINHERIT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:480:13
pub const traceBLOCKING_ON_QUEUE_RECEIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:489:13
pub const traceBLOCKING_ON_QUEUE_PEEK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:498:13
pub const traceBLOCKING_ON_QUEUE_SEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:507:13
pub const traceMOVED_TASK_TO_READY_STATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:525:13
pub const tracePOST_MOVED_TASK_TO_READY_STATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:529:13
pub const traceQUEUE_CREATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:533:13
pub const traceQUEUE_CREATE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:537:13
pub const traceCREATE_MUTEX = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:541:13
pub const traceCREATE_MUTEX_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:545:13
pub const traceGIVE_MUTEX_RECURSIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:549:13
pub const traceGIVE_MUTEX_RECURSIVE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:553:13
pub const traceTAKE_MUTEX_RECURSIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:557:13
pub const traceTAKE_MUTEX_RECURSIVE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:561:13
pub const traceCREATE_COUNTING_SEMAPHORE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:565:13
pub const traceCREATE_COUNTING_SEMAPHORE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:569:13
pub const traceQUEUE_SET_SEND = traceQUEUE_SEND;
pub const traceQUEUE_SEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:577:13
pub const traceQUEUE_SEND_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:581:13
pub const traceQUEUE_RECEIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:585:13
pub const traceQUEUE_PEEK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:589:13
pub const traceQUEUE_PEEK_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:593:13
pub const traceQUEUE_PEEK_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:597:13
pub const traceQUEUE_RECEIVE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:601:13
pub const traceQUEUE_SEND_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:605:13
pub const traceQUEUE_SEND_FROM_ISR_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:609:13
pub const traceQUEUE_RECEIVE_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:613:13
pub const traceQUEUE_RECEIVE_FROM_ISR_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:617:13
pub const traceQUEUE_PEEK_FROM_ISR_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:621:13
pub const traceQUEUE_DELETE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:625:13
pub const traceTASK_CREATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:629:13
pub const traceTASK_CREATE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:633:13
pub const traceTASK_DELETE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:637:13
pub const traceTASK_DELAY_UNTIL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:641:13
pub const traceTASK_DELAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:645:13
pub const traceTASK_PRIORITY_SET = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:649:13
pub const traceTASK_SUSPEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:653:13
pub const traceTASK_RESUME = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:657:13
pub const traceTASK_RESUME_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:661:13
pub const traceTASK_INCREMENT_TICK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:665:13
pub const traceTIMER_CREATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:669:13
pub const traceTIMER_CREATE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:673:13
pub const traceTIMER_COMMAND_SEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:677:13
pub const traceTIMER_EXPIRED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:681:13
pub const traceTIMER_COMMAND_RECEIVED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:685:13
pub const traceMALLOC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:689:13
pub const traceFREE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:693:13
pub const traceEVENT_GROUP_CREATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:697:13
pub const traceEVENT_GROUP_CREATE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:701:13
pub const traceEVENT_GROUP_SYNC_BLOCK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:705:13
pub inline fn traceEVENT_GROUP_SYNC_END(xEventGroup: anytype, uxBitsToSet: anytype, uxBitsToWaitFor: anytype, xTimeoutOccurred: anytype) anyopaque {
    _ = &xEventGroup;
    _ = &uxBitsToSet;
    _ = &uxBitsToWaitFor;
    _ = &xTimeoutOccurred;
    return @import("std").zig.c_translation.cast(anyopaque, xTimeoutOccurred);
}
pub const traceEVENT_GROUP_WAIT_BITS_BLOCK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:713:13
pub inline fn traceEVENT_GROUP_WAIT_BITS_END(xEventGroup: anytype, uxBitsToWaitFor: anytype, xTimeoutOccurred: anytype) anyopaque {
    _ = &xEventGroup;
    _ = &uxBitsToWaitFor;
    _ = &xTimeoutOccurred;
    return @import("std").zig.c_translation.cast(anyopaque, xTimeoutOccurred);
}
pub const traceEVENT_GROUP_CLEAR_BITS = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:721:13
pub const traceEVENT_GROUP_CLEAR_BITS_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:725:13
pub const traceEVENT_GROUP_SET_BITS = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:729:13
pub const traceEVENT_GROUP_SET_BITS_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:733:13
pub const traceEVENT_GROUP_DELETE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:737:13
pub const tracePEND_FUNC_CALL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:741:13
pub const tracePEND_FUNC_CALL_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:745:13
pub const traceQUEUE_REGISTRY_ADD = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:749:13
pub const traceTASK_NOTIFY_TAKE_BLOCK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:753:13
pub const traceTASK_NOTIFY_TAKE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:757:13
pub const traceTASK_NOTIFY_WAIT_BLOCK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:761:13
pub const traceTASK_NOTIFY_WAIT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:765:13
pub const traceTASK_NOTIFY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:769:13
pub const traceTASK_NOTIFY_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:773:13
pub const traceTASK_NOTIFY_GIVE_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:777:13
pub const traceSTREAM_BUFFER_CREATE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:781:13
pub const traceSTREAM_BUFFER_CREATE_STATIC_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:785:13
pub const traceSTREAM_BUFFER_CREATE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:789:13
pub const traceSTREAM_BUFFER_DELETE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:793:13
pub const traceSTREAM_BUFFER_RESET = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:797:13
pub const traceBLOCKING_ON_STREAM_BUFFER_SEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:801:13
pub const traceSTREAM_BUFFER_SEND = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:805:13
pub const traceSTREAM_BUFFER_SEND_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:809:13
pub const traceSTREAM_BUFFER_SEND_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:813:13
pub const traceBLOCKING_ON_STREAM_BUFFER_RECEIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:817:13
pub const traceSTREAM_BUFFER_RECEIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:821:13
pub const traceSTREAM_BUFFER_RECEIVE_FAILED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:825:13
pub const traceSTREAM_BUFFER_RECEIVE_FROM_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:829:13
pub const configGENERATE_RUN_TIME_STATS = @as(c_int, 0);
pub const configUSE_MALLOC_FAILED_HOOK = @as(c_int, 0);
pub const portPRIVILEGE_BIT = @import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 0x00));
pub const portSUPPRESS_TICKS_AND_SLEEP = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:867:13
pub const configEXPECTED_IDLE_TIME_BEFORE_SLEEP = @as(c_int, 2);
pub const configPRE_SUPPRESS_TICKS_AND_SLEEP_PROCESSING = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:883:13
pub const configPRE_SLEEP_PROCESSING = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:887:13
pub const configPOST_SLEEP_PROCESSING = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:891:13
pub const portTASK_USES_FLOATING_POINT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:899:13
pub const portALLOCATE_SECURE_CONTEXT = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:903:13
pub const portDONT_DISCARD = "";
pub const configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS = @as(c_int, 0);
pub const configUSE_STATS_FORMATTING_FUNCTIONS = @as(c_int, 0);
pub const portASSERT_IF_INTERRUPT_PRIORITY_INVALID = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:923:13
pub const configUSE_TRACE_FACILITY = @as(c_int, 0);
pub const mtCOVERAGE_TEST_MARKER = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:931:13
pub const mtCOVERAGE_TEST_DELAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:935:13
pub const portASSERT_IF_IN_ISR = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:939:13
pub const configUSE_POSIX_ERRNO = @as(c_int, 0);
pub const configUSE_SB_COMPLETED_CALLBACK = @as(c_int, 0);
pub const portTICK_TYPE_IS_ATOMIC = @as(c_int, 0);
pub const configRUN_TIME_COUNTER_TYPE = u32;
pub const configMESSAGE_BUFFER_LENGTH_TYPE = usize;
pub const configINITIAL_TICK_COUNT = @as(c_int, 0);
pub inline fn portTICK_TYPE_ENTER_CRITICAL() @TypeOf(portENTER_CRITICAL()) {
    return portENTER_CRITICAL();
}
pub inline fn portTICK_TYPE_EXIT_CRITICAL() @TypeOf(portEXIT_CRITICAL()) {
    return portEXIT_CRITICAL();
}
pub inline fn portTICK_TYPE_SET_INTERRUPT_MASK_FROM_ISR() @TypeOf(portSET_INTERRUPT_MASK_FROM_ISR()) {
    return portSET_INTERRUPT_MASK_FROM_ISR();
}
pub inline fn portTICK_TYPE_CLEAR_INTERRUPT_MASK_FROM_ISR(x: anytype) @TypeOf(portCLEAR_INTERRUPT_MASK_FROM_ISR(x)) {
    _ = &x;
    return portCLEAR_INTERRUPT_MASK_FROM_ISR(x);
}
pub const configPRINTF = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/FreeRTOS.h:1073:13
pub inline fn configMAX(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    _ = &a;
    _ = &b;
    return if (a > b) a else b;
}
pub inline fn configMIN(a: anytype, b: anytype) @TypeOf(if (a < b) a else b) {
    _ = &a;
    _ = &b;
    return if (a < b) a else b;
}
pub const configUSE_TASK_FPU_SUPPORT = @as(c_int, 1);
pub const configENABLE_MPU = @as(c_int, 0);
pub const configENABLE_FPU = @as(c_int, 1);
pub const configENABLE_MVE = @as(c_int, 0);
pub const configENABLE_TRUSTZONE = @as(c_int, 1);
pub const configRUN_FREERTOS_SECURE_ONLY = @as(c_int, 0);
pub const configRUN_ADDITIONAL_TESTS = @as(c_int, 0);
pub const tskSTATIC_AND_DYNAMIC_ALLOCATION_POSSIBLE = (((portUSING_MPU_WRAPPERS == @as(c_int, 0)) and (configSUPPORT_DYNAMIC_ALLOCATION == @as(c_int, 1))) and (configSUPPORT_STATIC_ALLOCATION == @as(c_int, 1))) or ((portUSING_MPU_WRAPPERS == @as(c_int, 1)) and (configSUPPORT_DYNAMIC_ALLOCATION == @as(c_int, 1)));
pub const INC_TASK_H = "";
pub const LIST_H = "";
pub const listFIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE = "";
pub const listSECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE = "";
pub const listFIRST_LIST_INTEGRITY_CHECK_VALUE = "";
pub const listSECOND_LIST_INTEGRITY_CHECK_VALUE = "";
pub const listSET_FIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:118:13
pub const listSET_SECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:119:13
pub const listSET_LIST_INTEGRITY_CHECK_1_VALUE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:120:13
pub const listSET_LIST_INTEGRITY_CHECK_2_VALUE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:121:13
pub const listTEST_LIST_ITEM_INTEGRITY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:122:13
pub const listTEST_LIST_INTEGRITY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:123:13
pub const listSET_LIST_ITEM_OWNER = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:192:9
pub inline fn listGET_LIST_ITEM_OWNER(pxListItem: anytype) @TypeOf(pxListItem.*.pvOwner) {
    _ = &pxListItem;
    return pxListItem.*.pvOwner;
}
pub const listSET_LIST_ITEM_VALUE = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:210:9
pub inline fn listGET_LIST_ITEM_VALUE(pxListItem: anytype) @TypeOf(pxListItem.*.xItemValue) {
    _ = &pxListItem;
    return pxListItem.*.xItemValue;
}
pub inline fn listGET_ITEM_VALUE_OF_HEAD_ENTRY(pxList: anytype) @TypeOf(pxList.*.xListEnd.pxNext.*.xItemValue) {
    _ = &pxList;
    return pxList.*.xListEnd.pxNext.*.xItemValue;
}
pub inline fn listGET_HEAD_ENTRY(pxList: anytype) @TypeOf(pxList.*.xListEnd.pxNext) {
    _ = &pxList;
    return pxList.*.xListEnd.pxNext;
}
pub inline fn listGET_NEXT(pxListItem: anytype) @TypeOf(pxListItem.*.pxNext) {
    _ = &pxListItem;
    return pxListItem.*.pxNext;
}
pub const listGET_END_MARKER = @compileError("unable to translate C expr: expected ')' instead got 'const'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:253:9
pub inline fn listLIST_IS_EMPTY(pxList: anytype) @TypeOf(if (pxList.*.uxNumberOfItems == @import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 0))) pdTRUE else pdFALSE) {
    _ = &pxList;
    return if (pxList.*.uxNumberOfItems == @import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 0))) pdTRUE else pdFALSE;
}
pub inline fn listCURRENT_LIST_LENGTH(pxList: anytype) @TypeOf(pxList.*.uxNumberOfItems) {
    _ = &pxList;
    return pxList.*.uxNumberOfItems;
}
pub const listGET_OWNER_OF_NEXT_ENTRY = @compileError("unable to translate macro: undefined identifier `pxConstList`");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:289:9
pub const listREMOVE_ITEM = @compileError("unable to translate macro: undefined identifier `pxList`");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:318:9
pub const listINSERT_END = @compileError("unable to translate macro: undefined identifier `pxIndex`");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/list.h:358:9
pub inline fn listGET_OWNER_OF_HEAD_ENTRY(pxList: anytype) @TypeOf((&pxList.*.xListEnd).*.pxNext.*.pvOwner) {
    _ = &pxList;
    return (&pxList.*.xListEnd).*.pxNext.*.pvOwner;
}
pub inline fn listIS_CONTAINED_WITHIN(pxList: anytype, pxListItem: anytype) @TypeOf(if (pxListItem.*.pxContainer == pxList) pdTRUE else pdFALSE) {
    _ = &pxList;
    _ = &pxListItem;
    return if (pxListItem.*.pxContainer == pxList) pdTRUE else pdFALSE;
}
pub inline fn listLIST_ITEM_CONTAINER(pxListItem: anytype) @TypeOf(pxListItem.*.pxContainer) {
    _ = &pxListItem;
    return pxListItem.*.pxContainer;
}
pub inline fn listLIST_IS_INITIALISED(pxList: anytype) @TypeOf(pxList.*.xListEnd.xItemValue == portMAX_DELAY) {
    _ = &pxList;
    return pxList.*.xListEnd.xItemValue == portMAX_DELAY;
}
pub const tskKERNEL_VERSION_NUMBER = "V10.5.1";
pub const tskKERNEL_VERSION_MAJOR = @as(c_int, 10);
pub const tskKERNEL_VERSION_MINOR = @as(c_int, 5);
pub const tskKERNEL_VERSION_BUILD = @as(c_int, 1);
pub const tskMPU_REGION_READ_ONLY = @as(c_ulong, 1) << @as(c_ulong, 0);
pub const tskMPU_REGION_READ_WRITE = @as(c_ulong, 1) << @as(c_ulong, 1);
pub const tskMPU_REGION_EXECUTE_NEVER = @as(c_ulong, 1) << @as(c_ulong, 2);
pub const tskMPU_REGION_NORMAL_MEMORY = @as(c_ulong, 1) << @as(c_ulong, 3);
pub const tskMPU_REGION_DEVICE_MEMORY = @as(c_ulong, 1) << @as(c_ulong, 4);
pub const tskDEFAULT_INDEX_TO_NOTIFY = @as(c_int, 0);
pub const tskIDLE_PRIORITY = @import("std").zig.c_translation.cast(UBaseType_t, @as(c_uint, 0));
pub const tskNO_AFFINITY = @import("std").zig.c_translation.cast(BaseType_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex));
pub inline fn taskVALID_CORE_ID(xCoreID: anytype) @TypeOf(if ((@import("std").zig.c_translation.cast(BaseType_t, xCoreID) >= @as(c_int, 0)) and (@import("std").zig.c_translation.cast(BaseType_t, xCoreID) < configNUMBER_OF_CORES)) pdTRUE else pdFALSE) {
    _ = &xCoreID;
    return if ((@import("std").zig.c_translation.cast(BaseType_t, xCoreID) >= @as(c_int, 0)) and (@import("std").zig.c_translation.cast(BaseType_t, xCoreID) < configNUMBER_OF_CORES)) pdTRUE else pdFALSE;
}
pub inline fn taskYIELD() @TypeOf(portYIELD()) {
    return portYIELD();
}
pub inline fn taskENTER_CRITICAL(x: anytype) @TypeOf(portENTER_CRITICAL(x)) {
    _ = &x;
    return portENTER_CRITICAL(x);
}
pub inline fn taskENTER_CRITICAL_FROM_ISR() @TypeOf(portSET_INTERRUPT_MASK_FROM_ISR()) {
    return portSET_INTERRUPT_MASK_FROM_ISR();
}
pub inline fn taskENTER_CRITICAL_ISR(x: anytype) @TypeOf(portENTER_CRITICAL_ISR(x)) {
    _ = &x;
    return portENTER_CRITICAL_ISR(x);
}
pub inline fn taskEXIT_CRITICAL(x: anytype) @TypeOf(portEXIT_CRITICAL(x)) {
    _ = &x;
    return portEXIT_CRITICAL(x);
}
pub inline fn taskEXIT_CRITICAL_FROM_ISR(x: anytype) @TypeOf(portCLEAR_INTERRUPT_MASK_FROM_ISR(x)) {
    _ = &x;
    return portCLEAR_INTERRUPT_MASK_FROM_ISR(x);
}
pub inline fn taskEXIT_CRITICAL_ISR(x: anytype) @TypeOf(portEXIT_CRITICAL_ISR(x)) {
    _ = &x;
    return portEXIT_CRITICAL_ISR(x);
}
pub inline fn taskDISABLE_INTERRUPTS() @TypeOf(portDISABLE_INTERRUPTS()) {
    return portDISABLE_INTERRUPTS();
}
pub inline fn taskENABLE_INTERRUPTS() @TypeOf(portENABLE_INTERRUPTS()) {
    return portENABLE_INTERRUPTS();
}
pub const taskSCHEDULER_SUSPENDED = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 0));
pub const taskSCHEDULER_NOT_STARTED = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 1));
pub const taskSCHEDULER_RUNNING = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 2));
pub const vTaskDelayUntil = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/task.h:906:9
pub inline fn xTaskNotify(xTaskToNotify: anytype, ulValue: anytype, eAction: anytype) @TypeOf(xTaskGenericNotify(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, NULL)) {
    _ = &xTaskToNotify;
    _ = &ulValue;
    _ = &eAction;
    return xTaskGenericNotify(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, NULL);
}
pub inline fn xTaskNotifyIndexed(xTaskToNotify: anytype, uxIndexToNotify: anytype, ulValue: anytype, eAction: anytype) @TypeOf(xTaskGenericNotify(xTaskToNotify, uxIndexToNotify, ulValue, eAction, NULL)) {
    _ = &xTaskToNotify;
    _ = &uxIndexToNotify;
    _ = &ulValue;
    _ = &eAction;
    return xTaskGenericNotify(xTaskToNotify, uxIndexToNotify, ulValue, eAction, NULL);
}
pub inline fn xTaskNotifyAndQuery(xTaskToNotify: anytype, ulValue: anytype, eAction: anytype, pulPreviousNotifyValue: anytype) @TypeOf(xTaskGenericNotify(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, pulPreviousNotifyValue)) {
    _ = &xTaskToNotify;
    _ = &ulValue;
    _ = &eAction;
    _ = &pulPreviousNotifyValue;
    return xTaskGenericNotify(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, pulPreviousNotifyValue);
}
pub inline fn xTaskNotifyAndQueryIndexed(xTaskToNotify: anytype, uxIndexToNotify: anytype, ulValue: anytype, eAction: anytype, pulPreviousNotifyValue: anytype) @TypeOf(xTaskGenericNotify(xTaskToNotify, uxIndexToNotify, ulValue, eAction, pulPreviousNotifyValue)) {
    _ = &xTaskToNotify;
    _ = &uxIndexToNotify;
    _ = &ulValue;
    _ = &eAction;
    _ = &pulPreviousNotifyValue;
    return xTaskGenericNotify(xTaskToNotify, uxIndexToNotify, ulValue, eAction, pulPreviousNotifyValue);
}
pub inline fn xTaskNotifyFromISR(xTaskToNotify: anytype, ulValue: anytype, eAction: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xTaskGenericNotifyFromISR(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, NULL, pxHigherPriorityTaskWoken)) {
    _ = &xTaskToNotify;
    _ = &ulValue;
    _ = &eAction;
    _ = &pxHigherPriorityTaskWoken;
    return xTaskGenericNotifyFromISR(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, NULL, pxHigherPriorityTaskWoken);
}
pub inline fn xTaskNotifyIndexedFromISR(xTaskToNotify: anytype, uxIndexToNotify: anytype, ulValue: anytype, eAction: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xTaskGenericNotifyFromISR(xTaskToNotify, uxIndexToNotify, ulValue, eAction, NULL, pxHigherPriorityTaskWoken)) {
    _ = &xTaskToNotify;
    _ = &uxIndexToNotify;
    _ = &ulValue;
    _ = &eAction;
    _ = &pxHigherPriorityTaskWoken;
    return xTaskGenericNotifyFromISR(xTaskToNotify, uxIndexToNotify, ulValue, eAction, NULL, pxHigherPriorityTaskWoken);
}
pub inline fn xTaskNotifyAndQueryIndexedFromISR(xTaskToNotify: anytype, uxIndexToNotify: anytype, ulValue: anytype, eAction: anytype, pulPreviousNotificationValue: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xTaskGenericNotifyFromISR(xTaskToNotify, uxIndexToNotify, ulValue, eAction, pulPreviousNotificationValue, pxHigherPriorityTaskWoken)) {
    _ = &xTaskToNotify;
    _ = &uxIndexToNotify;
    _ = &ulValue;
    _ = &eAction;
    _ = &pulPreviousNotificationValue;
    _ = &pxHigherPriorityTaskWoken;
    return xTaskGenericNotifyFromISR(xTaskToNotify, uxIndexToNotify, ulValue, eAction, pulPreviousNotificationValue, pxHigherPriorityTaskWoken);
}
pub inline fn xTaskNotifyAndQueryFromISR(xTaskToNotify: anytype, ulValue: anytype, eAction: anytype, pulPreviousNotificationValue: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xTaskGenericNotifyFromISR(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, pulPreviousNotificationValue, pxHigherPriorityTaskWoken)) {
    _ = &xTaskToNotify;
    _ = &ulValue;
    _ = &eAction;
    _ = &pulPreviousNotificationValue;
    _ = &pxHigherPriorityTaskWoken;
    return xTaskGenericNotifyFromISR(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, ulValue, eAction, pulPreviousNotificationValue, pxHigherPriorityTaskWoken);
}
pub inline fn xTaskNotifyWait(ulBitsToClearOnEntry: anytype, ulBitsToClearOnExit: anytype, pulNotificationValue: anytype, xTicksToWait: anytype) @TypeOf(xTaskGenericNotifyWait(tskDEFAULT_INDEX_TO_NOTIFY, ulBitsToClearOnEntry, ulBitsToClearOnExit, pulNotificationValue, xTicksToWait)) {
    _ = &ulBitsToClearOnEntry;
    _ = &ulBitsToClearOnExit;
    _ = &pulNotificationValue;
    _ = &xTicksToWait;
    return xTaskGenericNotifyWait(tskDEFAULT_INDEX_TO_NOTIFY, ulBitsToClearOnEntry, ulBitsToClearOnExit, pulNotificationValue, xTicksToWait);
}
pub inline fn xTaskNotifyWaitIndexed(uxIndexToWaitOn: anytype, ulBitsToClearOnEntry: anytype, ulBitsToClearOnExit: anytype, pulNotificationValue: anytype, xTicksToWait: anytype) @TypeOf(xTaskGenericNotifyWait(uxIndexToWaitOn, ulBitsToClearOnEntry, ulBitsToClearOnExit, pulNotificationValue, xTicksToWait)) {
    _ = &uxIndexToWaitOn;
    _ = &ulBitsToClearOnEntry;
    _ = &ulBitsToClearOnExit;
    _ = &pulNotificationValue;
    _ = &xTicksToWait;
    return xTaskGenericNotifyWait(uxIndexToWaitOn, ulBitsToClearOnEntry, ulBitsToClearOnExit, pulNotificationValue, xTicksToWait);
}
pub inline fn xTaskNotifyGive(xTaskToNotify: anytype) @TypeOf(xTaskGenericNotify(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, @as(c_int, 0), eIncrement, NULL)) {
    _ = &xTaskToNotify;
    return xTaskGenericNotify(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, @as(c_int, 0), eIncrement, NULL);
}
pub inline fn xTaskNotifyGiveIndexed(xTaskToNotify: anytype, uxIndexToNotify: anytype) @TypeOf(xTaskGenericNotify(xTaskToNotify, uxIndexToNotify, @as(c_int, 0), eIncrement, NULL)) {
    _ = &xTaskToNotify;
    _ = &uxIndexToNotify;
    return xTaskGenericNotify(xTaskToNotify, uxIndexToNotify, @as(c_int, 0), eIncrement, NULL);
}
pub inline fn vTaskNotifyGiveFromISR(xTaskToNotify: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(vTaskGenericNotifyGiveFromISR(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, pxHigherPriorityTaskWoken)) {
    _ = &xTaskToNotify;
    _ = &pxHigherPriorityTaskWoken;
    return vTaskGenericNotifyGiveFromISR(xTaskToNotify, tskDEFAULT_INDEX_TO_NOTIFY, pxHigherPriorityTaskWoken);
}
pub inline fn vTaskNotifyGiveIndexedFromISR(xTaskToNotify: anytype, uxIndexToNotify: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(vTaskGenericNotifyGiveFromISR(xTaskToNotify, uxIndexToNotify, pxHigherPriorityTaskWoken)) {
    _ = &xTaskToNotify;
    _ = &uxIndexToNotify;
    _ = &pxHigherPriorityTaskWoken;
    return vTaskGenericNotifyGiveFromISR(xTaskToNotify, uxIndexToNotify, pxHigherPriorityTaskWoken);
}
pub inline fn ulTaskNotifyTake(xClearCountOnExit: anytype, xTicksToWait: anytype) @TypeOf(ulTaskGenericNotifyTake(tskDEFAULT_INDEX_TO_NOTIFY, xClearCountOnExit, xTicksToWait)) {
    _ = &xClearCountOnExit;
    _ = &xTicksToWait;
    return ulTaskGenericNotifyTake(tskDEFAULT_INDEX_TO_NOTIFY, xClearCountOnExit, xTicksToWait);
}
pub inline fn ulTaskNotifyTakeIndexed(uxIndexToWaitOn: anytype, xClearCountOnExit: anytype, xTicksToWait: anytype) @TypeOf(ulTaskGenericNotifyTake(uxIndexToWaitOn, xClearCountOnExit, xTicksToWait)) {
    _ = &uxIndexToWaitOn;
    _ = &xClearCountOnExit;
    _ = &xTicksToWait;
    return ulTaskGenericNotifyTake(uxIndexToWaitOn, xClearCountOnExit, xTicksToWait);
}
pub inline fn xTaskNotifyStateClear(xTask: anytype) @TypeOf(xTaskGenericNotifyStateClear(xTask, tskDEFAULT_INDEX_TO_NOTIFY)) {
    _ = &xTask;
    return xTaskGenericNotifyStateClear(xTask, tskDEFAULT_INDEX_TO_NOTIFY);
}
pub inline fn xTaskNotifyStateClearIndexed(xTask: anytype, uxIndexToClear: anytype) @TypeOf(xTaskGenericNotifyStateClear(xTask, uxIndexToClear)) {
    _ = &xTask;
    _ = &uxIndexToClear;
    return xTaskGenericNotifyStateClear(xTask, uxIndexToClear);
}
pub inline fn ulTaskNotifyValueClear(xTask: anytype, ulBitsToClear: anytype) @TypeOf(ulTaskGenericNotifyValueClear(xTask, tskDEFAULT_INDEX_TO_NOTIFY, ulBitsToClear)) {
    _ = &xTask;
    _ = &ulBitsToClear;
    return ulTaskGenericNotifyValueClear(xTask, tskDEFAULT_INDEX_TO_NOTIFY, ulBitsToClear);
}
pub inline fn ulTaskNotifyValueClearIndexed(xTask: anytype, uxIndexToClear: anytype, ulBitsToClear: anytype) @TypeOf(ulTaskGenericNotifyValueClear(xTask, uxIndexToClear, ulBitsToClear)) {
    _ = &xTask;
    _ = &uxIndexToClear;
    _ = &ulBitsToClear;
    return ulTaskGenericNotifyValueClear(xTask, uxIndexToClear, ulBitsToClear);
}
pub const QUEUE_H = "";
pub const queueSEND_TO_BACK = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 0));
pub const queueSEND_TO_FRONT = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 1));
pub const queueOVERWRITE = @import("std").zig.c_translation.cast(BaseType_t, @as(c_int, 2));
pub const queueQUEUE_TYPE_BASE = @import("std").zig.c_translation.cast(u8, @as(c_uint, 0));
pub const queueQUEUE_TYPE_SET = @import("std").zig.c_translation.cast(u8, @as(c_uint, 0));
pub const queueQUEUE_TYPE_MUTEX = @import("std").zig.c_translation.cast(u8, @as(c_uint, 1));
pub const queueQUEUE_TYPE_COUNTING_SEMAPHORE = @import("std").zig.c_translation.cast(u8, @as(c_uint, 2));
pub const queueQUEUE_TYPE_BINARY_SEMAPHORE = @import("std").zig.c_translation.cast(u8, @as(c_uint, 3));
pub const queueQUEUE_TYPE_RECURSIVE_MUTEX = @import("std").zig.c_translation.cast(u8, @as(c_uint, 4));
pub inline fn xQueueCreate(uxQueueLength: anytype, uxItemSize: anytype) @TypeOf(xQueueGenericCreate(uxQueueLength, uxItemSize, queueQUEUE_TYPE_BASE)) {
    _ = &uxQueueLength;
    _ = &uxItemSize;
    return xQueueGenericCreate(uxQueueLength, uxItemSize, queueQUEUE_TYPE_BASE);
}
pub inline fn xQueueCreateStatic(uxQueueLength: anytype, uxItemSize: anytype, pucQueueStorage: anytype, pxQueueBuffer: anytype) @TypeOf(xQueueGenericCreateStatic(uxQueueLength, uxItemSize, pucQueueStorage, pxQueueBuffer, queueQUEUE_TYPE_BASE)) {
    _ = &uxQueueLength;
    _ = &uxItemSize;
    _ = &pucQueueStorage;
    _ = &pxQueueBuffer;
    return xQueueGenericCreateStatic(uxQueueLength, uxItemSize, pucQueueStorage, pxQueueBuffer, queueQUEUE_TYPE_BASE);
}
pub inline fn xQueueGetStaticBuffers(xQueue: anytype, ppucQueueStorage: anytype, ppxStaticQueue: anytype) @TypeOf(xQueueGenericGetStaticBuffers(xQueue, ppucQueueStorage, ppxStaticQueue)) {
    _ = &xQueue;
    _ = &ppucQueueStorage;
    _ = &ppxStaticQueue;
    return xQueueGenericGetStaticBuffers(xQueue, ppucQueueStorage, ppxStaticQueue);
}
pub inline fn xQueueSendToFront(xQueue: anytype, pvItemToQueue: anytype, xTicksToWait: anytype) @TypeOf(xQueueGenericSend(xQueue, pvItemToQueue, xTicksToWait, queueSEND_TO_FRONT)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &xTicksToWait;
    return xQueueGenericSend(xQueue, pvItemToQueue, xTicksToWait, queueSEND_TO_FRONT);
}
pub inline fn xQueueSendToBack(xQueue: anytype, pvItemToQueue: anytype, xTicksToWait: anytype) @TypeOf(xQueueGenericSend(xQueue, pvItemToQueue, xTicksToWait, queueSEND_TO_BACK)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &xTicksToWait;
    return xQueueGenericSend(xQueue, pvItemToQueue, xTicksToWait, queueSEND_TO_BACK);
}
pub inline fn xQueueSend(xQueue: anytype, pvItemToQueue: anytype, xTicksToWait: anytype) @TypeOf(xQueueGenericSend(xQueue, pvItemToQueue, xTicksToWait, queueSEND_TO_BACK)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &xTicksToWait;
    return xQueueGenericSend(xQueue, pvItemToQueue, xTicksToWait, queueSEND_TO_BACK);
}
pub inline fn xQueueOverwrite(xQueue: anytype, pvItemToQueue: anytype) @TypeOf(xQueueGenericSend(xQueue, pvItemToQueue, @as(c_int, 0), queueOVERWRITE)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    return xQueueGenericSend(xQueue, pvItemToQueue, @as(c_int, 0), queueOVERWRITE);
}
pub inline fn xQueueSendToFrontFromISR(xQueue: anytype, pvItemToQueue: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueSEND_TO_FRONT)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &pxHigherPriorityTaskWoken;
    return xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueSEND_TO_FRONT);
}
pub inline fn xQueueSendToBackFromISR(xQueue: anytype, pvItemToQueue: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueSEND_TO_BACK)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &pxHigherPriorityTaskWoken;
    return xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueSEND_TO_BACK);
}
pub inline fn xQueueOverwriteFromISR(xQueue: anytype, pvItemToQueue: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueOVERWRITE)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &pxHigherPriorityTaskWoken;
    return xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueOVERWRITE);
}
pub inline fn xQueueSendFromISR(xQueue: anytype, pvItemToQueue: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueSEND_TO_BACK)) {
    _ = &xQueue;
    _ = &pvItemToQueue;
    _ = &pxHigherPriorityTaskWoken;
    return xQueueGenericSendFromISR(xQueue, pvItemToQueue, pxHigherPriorityTaskWoken, queueSEND_TO_BACK);
}
pub inline fn xQueueReset(xQueue: anytype) @TypeOf(xQueueGenericReset(xQueue, pdFALSE)) {
    _ = &xQueue;
    return xQueueGenericReset(xQueue, pdFALSE);
}
pub const SEMAPHORE_H = "";
pub const semBINARY_SEMAPHORE_QUEUE_LENGTH = @import("std").zig.c_translation.cast(u8, @as(c_uint, 1));
pub const semSEMAPHORE_QUEUE_ITEM_LENGTH = @import("std").zig.c_translation.cast(u8, @as(c_uint, 0));
pub const semGIVE_BLOCK_TIME = @import("std").zig.c_translation.cast(TickType_t, @as(c_uint, 0));
pub const vSemaphoreCreateBinary = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/freertos/FreeRTOS-Kernel/include/freertos/semphr.h:96:13
pub inline fn xSemaphoreCreateBinary() @TypeOf(xQueueGenericCreate(@import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 1)), semSEMAPHORE_QUEUE_ITEM_LENGTH, queueQUEUE_TYPE_BINARY_SEMAPHORE)) {
    return xQueueGenericCreate(@import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 1)), semSEMAPHORE_QUEUE_ITEM_LENGTH, queueQUEUE_TYPE_BINARY_SEMAPHORE);
}
pub inline fn xSemaphoreCreateBinaryStatic(pxStaticSemaphore: anytype) @TypeOf(xQueueGenericCreateStatic(@import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 1)), semSEMAPHORE_QUEUE_ITEM_LENGTH, NULL, pxStaticSemaphore, queueQUEUE_TYPE_BINARY_SEMAPHORE)) {
    _ = &pxStaticSemaphore;
    return xQueueGenericCreateStatic(@import("std").zig.c_translation.cast(UBaseType_t, @as(c_int, 1)), semSEMAPHORE_QUEUE_ITEM_LENGTH, NULL, pxStaticSemaphore, queueQUEUE_TYPE_BINARY_SEMAPHORE);
}
pub inline fn xSemaphoreTake(xSemaphore: anytype, xBlockTime: anytype) @TypeOf(xQueueSemaphoreTake(xSemaphore, xBlockTime)) {
    _ = &xSemaphore;
    _ = &xBlockTime;
    return xQueueSemaphoreTake(xSemaphore, xBlockTime);
}
pub inline fn xSemaphoreTakeRecursive(xMutex: anytype, xBlockTime: anytype) @TypeOf(xQueueTakeMutexRecursive(xMutex, xBlockTime)) {
    _ = &xMutex;
    _ = &xBlockTime;
    return xQueueTakeMutexRecursive(xMutex, xBlockTime);
}
pub inline fn xSemaphoreGive(xSemaphore: anytype) @TypeOf(xQueueGenericSend(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), NULL, semGIVE_BLOCK_TIME, queueSEND_TO_BACK)) {
    _ = &xSemaphore;
    return xQueueGenericSend(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), NULL, semGIVE_BLOCK_TIME, queueSEND_TO_BACK);
}
pub inline fn xSemaphoreGiveRecursive(xMutex: anytype) @TypeOf(xQueueGiveMutexRecursive(xMutex)) {
    _ = &xMutex;
    return xQueueGiveMutexRecursive(xMutex);
}
pub inline fn xSemaphoreGiveFromISR(xSemaphore: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xQueueGiveFromISR(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), pxHigherPriorityTaskWoken)) {
    _ = &xSemaphore;
    _ = &pxHigherPriorityTaskWoken;
    return xQueueGiveFromISR(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), pxHigherPriorityTaskWoken);
}
pub inline fn xSemaphoreTakeFromISR(xSemaphore: anytype, pxHigherPriorityTaskWoken: anytype) @TypeOf(xQueueReceiveFromISR(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), NULL, pxHigherPriorityTaskWoken)) {
    _ = &xSemaphore;
    _ = &pxHigherPriorityTaskWoken;
    return xQueueReceiveFromISR(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), NULL, pxHigherPriorityTaskWoken);
}
pub inline fn xSemaphoreCreateMutex() @TypeOf(xQueueCreateMutex(queueQUEUE_TYPE_MUTEX)) {
    return xQueueCreateMutex(queueQUEUE_TYPE_MUTEX);
}
pub inline fn xSemaphoreCreateMutexStatic(pxMutexBuffer: anytype) @TypeOf(xQueueCreateMutexStatic(queueQUEUE_TYPE_MUTEX, pxMutexBuffer)) {
    _ = &pxMutexBuffer;
    return xQueueCreateMutexStatic(queueQUEUE_TYPE_MUTEX, pxMutexBuffer);
}
pub inline fn xSemaphoreCreateRecursiveMutex() @TypeOf(xQueueCreateMutex(queueQUEUE_TYPE_RECURSIVE_MUTEX)) {
    return xQueueCreateMutex(queueQUEUE_TYPE_RECURSIVE_MUTEX);
}
pub inline fn xSemaphoreCreateRecursiveMutexStatic(pxStaticSemaphore: anytype) @TypeOf(xQueueCreateMutexStatic(queueQUEUE_TYPE_RECURSIVE_MUTEX, pxStaticSemaphore)) {
    _ = &pxStaticSemaphore;
    return xQueueCreateMutexStatic(queueQUEUE_TYPE_RECURSIVE_MUTEX, pxStaticSemaphore);
}
pub inline fn xSemaphoreCreateCounting(uxMaxCount: anytype, uxInitialCount: anytype) @TypeOf(xQueueCreateCountingSemaphore(uxMaxCount, uxInitialCount)) {
    _ = &uxMaxCount;
    _ = &uxInitialCount;
    return xQueueCreateCountingSemaphore(uxMaxCount, uxInitialCount);
}
pub inline fn xSemaphoreCreateCountingStatic(uxMaxCount: anytype, uxInitialCount: anytype, pxSemaphoreBuffer: anytype) @TypeOf(xQueueCreateCountingSemaphoreStatic(uxMaxCount, uxInitialCount, pxSemaphoreBuffer)) {
    _ = &uxMaxCount;
    _ = &uxInitialCount;
    _ = &pxSemaphoreBuffer;
    return xQueueCreateCountingSemaphoreStatic(uxMaxCount, uxInitialCount, pxSemaphoreBuffer);
}
pub inline fn vSemaphoreDelete(xSemaphore: anytype) @TypeOf(vQueueDelete(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore))) {
    _ = &xSemaphore;
    return vQueueDelete(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore));
}
pub inline fn xSemaphoreGetMutexHolder(xSemaphore: anytype) @TypeOf(xQueueGetMutexHolder(xSemaphore)) {
    _ = &xSemaphore;
    return xQueueGetMutexHolder(xSemaphore);
}
pub inline fn xSemaphoreGetMutexHolderFromISR(xSemaphore: anytype) @TypeOf(xQueueGetMutexHolderFromISR(xSemaphore)) {
    _ = &xSemaphore;
    return xQueueGetMutexHolderFromISR(xSemaphore);
}
pub inline fn uxSemaphoreGetCount(xSemaphore: anytype) @TypeOf(uxQueueMessagesWaiting(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore))) {
    _ = &xSemaphore;
    return uxQueueMessagesWaiting(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore));
}
pub inline fn uxSemaphoreGetCountFromISR(xSemaphore: anytype) @TypeOf(uxQueueMessagesWaitingFromISR(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore))) {
    _ = &xSemaphore;
    return uxQueueMessagesWaitingFromISR(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore));
}
pub inline fn xSemaphoreGetStaticBuffer(xSemaphore: anytype, ppxSemaphoreBuffer: anytype) @TypeOf(xQueueGenericGetStaticBuffers(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), NULL, ppxSemaphoreBuffer)) {
    _ = &xSemaphore;
    _ = &ppxSemaphoreBuffer;
    return xQueueGenericGetStaticBuffers(@import("std").zig.c_translation.cast(QueueHandle_t, xSemaphore), NULL, ppxSemaphoreBuffer);
}
pub const __ESP_LOG_H__ = "";
pub const __ESP_LOG_INTERNAL_H__ = "";
pub const ESP_LOG_BUFFER_HEX_LEVEL = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:196:9
pub const ESP_LOG_BUFFER_CHAR_LEVEL = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:212:9
pub const ESP_LOG_BUFFER_HEXDUMP = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:235:9
pub const ESP_LOG_BUFFER_HEX = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:252:9
pub const ESP_LOG_BUFFER_CHAR = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:269:9
pub const esp_log_buffer_hex = ESP_LOG_BUFFER_HEX;
pub const esp_log_buffer_char = ESP_LOG_BUFFER_CHAR;
pub const LOG_COLOR_BLACK = "30";
pub const LOG_COLOR_RED = "31";
pub const LOG_COLOR_GREEN = "32";
pub const LOG_COLOR_BROWN = "33";
pub const LOG_COLOR_BLUE = "34";
pub const LOG_COLOR_PURPLE = "35";
pub const LOG_COLOR_CYAN = "36";
pub inline fn LOG_COLOR(COLOR: anytype) @TypeOf("\x1b[0;" ++ COLOR ++ "m") {
    _ = &COLOR;
    return "\x1b[0;" ++ COLOR ++ "m";
}
pub inline fn LOG_BOLD(COLOR: anytype) @TypeOf("\x1b[1;" ++ COLOR ++ "m") {
    _ = &COLOR;
    return "\x1b[1;" ++ COLOR ++ "m";
}
pub const LOG_RESET_COLOR = "\x1b[0m";
pub const LOG_COLOR_E = LOG_COLOR(LOG_COLOR_RED);
pub const LOG_COLOR_W = LOG_COLOR(LOG_COLOR_BROWN);
pub const LOG_COLOR_I = LOG_COLOR(LOG_COLOR_GREEN);
pub const LOG_COLOR_D = "";
pub const LOG_COLOR_V = "";
pub const LOG_FORMAT = @compileError("unable to translate macro: undefined identifier `LOG_COLOR_`");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:307:9
pub const LOG_SYSTEM_TIME_FORMAT = @compileError("unable to translate macro: undefined identifier `LOG_COLOR_`");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:308:9
pub const ESP_EARLY_LOGE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:333:9
pub const ESP_EARLY_LOGW = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:335:9
pub const ESP_EARLY_LOGI = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:337:9
pub const ESP_EARLY_LOGD = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:339:9
pub const ESP_EARLY_LOGV = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:341:9
pub inline fn _ESP_LOG_EARLY_ENABLED(log_level: anytype) @TypeOf((LOG_LOCAL_LEVEL >= log_level) and (esp_log_default_level >= log_level)) {
    _ = &log_level;
    return (LOG_LOCAL_LEVEL >= log_level) and (esp_log_default_level >= log_level);
}
pub const ESP_LOG_EARLY_IMPL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:352:9
pub const ESP_LOGE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:365:9
pub const ESP_LOGW = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:366:9
pub const ESP_LOGI = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:367:9
pub const ESP_LOGD = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:368:9
pub const ESP_LOGV = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:369:9
pub const ESP_LOG_LEVEL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:434:9
pub const ESP_LOG_LEVEL_LOCAL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:462:9
pub const ESP_DRAM_LOGE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:494:9
pub const ESP_DRAM_LOGW = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:496:9
pub const ESP_DRAM_LOGI = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:498:9
pub const ESP_DRAM_LOGD = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:500:9
pub const ESP_DRAM_LOGV = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:502:9
pub const _ESP_LOG_DRAM_LOG_FORMAT = @compileError("unable to translate C expr: unexpected token '#'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:506:9
pub const ESP_DRAM_LOG_IMPL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/log/include/esp_log.h:514:9
pub const ESP_APP_TRACE_H_ = "";
pub const ESP_APP_TRACE_UTIL_H_ = "";
pub const ESP_APPTRACE_TMO_INFINITE = @import("std").zig.c_translation.cast(u32, -@as(c_int, 1));
pub const ESP_APPTRACE_LOG = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:167:9
pub const ESP_APPTRACE_LOG_LEV = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:174:9
pub const ESP_APPTRACE_LOGE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:181:9
pub const ESP_APPTRACE_LOGW = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:182:9
pub const ESP_APPTRACE_LOGI = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:183:9
pub const ESP_APPTRACE_LOGD = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:184:9
pub const ESP_APPTRACE_LOGV = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:185:9
pub const ESP_APPTRACE_LOGO = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/app_trace/include/esp_app_trace_util.h:186:9
pub const __ESP_WIFI_H__ = "";
pub const __ESP_WIFI_TYPES_H__ = "";
pub const ESP_EVENT_DECLARE_BASE = @compileError("unable to translate C expr: unexpected token 'extern'");
// /home/wiiggee1/esp-idf/components/esp_event/include/esp_event_base.h:16:9
pub const ESP_EVENT_DEFINE_BASE = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/esp_event/include/esp_event_base.h:17:9
pub const ESP_EVENT_ANY_BASE = NULL;
pub const ESP_EVENT_ANY_ID = -@as(c_int, 1);
pub const __ESP_INTERFACE_H__ = "";
pub const WIFI_OFFCHAN_TX_REQ = @as(c_int, 1);
pub const WIFI_OFFCHAN_TX_CANCEL = @as(c_int, 0);
pub const WIFI_ROC_REQ = @as(c_int, 1);
pub const WIFI_ROC_CANCEL = @as(c_int, 0);
pub const WIFI_ACTIVE_SCAN_MIN_DEFAULT_TIME = @as(c_int, 0);
pub const WIFI_ACTIVE_SCAN_MAX_DEFAULT_TIME = @as(c_int, 120);
pub const WIFI_PASSIVE_SCAN_DEFAULT_TIME = @as(c_int, 360);
pub const WIFI_SCAN_HOME_CHANNEL_DWELL_DEFAULT_TIME = @as(c_int, 30);
pub const WIFI_SCAN_PARAMS_DEFAULT_CONFIG = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi_types_generic.h:154:9
pub const WIFI_PROTOCOL_11B = @as(c_int, 0x1);
pub const WIFI_PROTOCOL_11G = @as(c_int, 0x2);
pub const WIFI_PROTOCOL_11N = @as(c_int, 0x4);
pub const WIFI_PROTOCOL_LR = @as(c_int, 0x8);
pub const WIFI_PROTOCOL_11A = @as(c_int, 0x10);
pub const WIFI_PROTOCOL_11AC = @as(c_int, 0x20);
pub const WIFI_PROTOCOL_11AX = @as(c_int, 0x40);
pub const SAE_H2E_IDENTIFIER_LEN = @as(c_int, 32);
pub const WIFI_VENDOR_IE_ELEMENT_ID = @as(c_int, 0xDD);
pub const WIFI_PROMIS_FILTER_MASK_ALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
pub const WIFI_PROMIS_FILTER_MASK_MGMT = @as(c_int, 1);
pub const WIFI_PROMIS_FILTER_MASK_CTRL = @as(c_int, 1) << @as(c_int, 1);
pub const WIFI_PROMIS_FILTER_MASK_DATA = @as(c_int, 1) << @as(c_int, 2);
pub const WIFI_PROMIS_FILTER_MASK_MISC = @as(c_int, 1) << @as(c_int, 3);
pub const WIFI_PROMIS_FILTER_MASK_DATA_MPDU = @as(c_int, 1) << @as(c_int, 4);
pub const WIFI_PROMIS_FILTER_MASK_DATA_AMPDU = @as(c_int, 1) << @as(c_int, 5);
pub const WIFI_PROMIS_FILTER_MASK_FCSFAIL = @as(c_int, 1) << @as(c_int, 6);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_ALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFF800000, .hex);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_WRAPPER = @as(c_int, 1) << @as(c_int, 23);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_BAR = @as(c_int, 1) << @as(c_int, 24);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_BA = @as(c_int, 1) << @as(c_int, 25);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_PSPOLL = @as(c_int, 1) << @as(c_int, 26);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_RTS = @as(c_int, 1) << @as(c_int, 27);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_CTS = @as(c_int, 1) << @as(c_int, 28);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_ACK = @as(c_int, 1) << @as(c_int, 29);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_CFEND = @as(c_int, 1) << @as(c_int, 30);
pub const WIFI_PROMIS_CTRL_FILTER_MASK_CFENDACK = @as(c_int, 1) << @as(c_int, 31);
pub const WIFI_EVENT_MASK_ALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
pub const WIFI_EVENT_MASK_NONE = @as(c_int, 0);
pub const WIFI_EVENT_MASK_AP_PROBEREQRECVED = BIT(@as(c_int, 0));
pub const ESP_WIFI_NAN_MAX_SVC_SUPPORTED = @as(c_int, 2);
pub const ESP_WIFI_NAN_DATAPATH_MAX_PEERS = @as(c_int, 2);
pub const ESP_WIFI_NDP_ROLE_INITIATOR = @as(c_int, 1);
pub const ESP_WIFI_NDP_ROLE_RESPONDER = @as(c_int, 2);
pub const ESP_WIFI_MAX_SVC_NAME_LEN = @as(c_int, 256);
pub const ESP_WIFI_MAX_FILTER_LEN = @as(c_int, 256);
pub const ESP_WIFI_MAX_SVC_INFO_LEN = @as(c_int, 64);
pub const ESP_WIFI_MAX_NEIGHBOR_REP_LEN = @as(c_int, 64);
pub const MAX_SSID_LEN = @as(c_int, 32);
pub const MAX_PASSPHRASE_LEN = @as(c_int, 64);
pub const MAX_WPS_AP_CRED = @as(c_int, 3);
pub const WIFI_STATIS_BUFFER = @as(c_int, 1) << @as(c_int, 0);
pub const WIFI_STATIS_RXTX = @as(c_int, 1) << @as(c_int, 1);
pub const WIFI_STATIS_HW = @as(c_int, 1) << @as(c_int, 2);
pub const WIFI_STATIS_DIAG = @as(c_int, 1) << @as(c_int, 3);
pub const WIFI_STATIS_PS = @as(c_int, 1) << @as(c_int, 4);
pub const WIFI_STATIS_ALL = -@as(c_int, 1);
pub const ESP_EVENT_H_ = "";
pub const __ESP_WIFI_CRYPTO_TYPES_H__ = "";
pub const ESP_WIFI_CRYPTO_VERSION = @as(c_int, 0x00000001);
pub const _ESP_WIFI_DEFAULT_H = "";
pub const _ESP_NETIF_H_ = "";
pub const _ESP_NETIF_IP_ADDR_H_ = "";
pub const __MACHINE_ENDIAN_H__ = "";
pub const _LITTLE_ENDIAN = @as(c_int, 1234);
pub const _BIG_ENDIAN = @as(c_int, 4321);
pub const _PDP_ENDIAN = @as(c_int, 3412);
pub const _BYTE_ORDER = _LITTLE_ENDIAN;
pub const _QUAD_HIGHWORD = @as(c_int, 1);
pub const _QUAD_LOWWORD = @as(c_int, 0);
pub const LITTLE_ENDIAN = _LITTLE_ENDIAN;
pub const BIG_ENDIAN = _BIG_ENDIAN;
pub const PDP_ENDIAN = _PDP_ENDIAN;
pub const BYTE_ORDER = _BYTE_ORDER;
pub inline fn __bswap16(_x: anytype) @TypeOf(__builtin_bswap16(_x)) {
    _ = &_x;
    return __builtin_bswap16(_x);
}
pub inline fn __bswap32(_x: anytype) @TypeOf(__builtin_bswap32(_x)) {
    _ = &_x;
    return __builtin_bswap32(_x);
}
pub inline fn __bswap64(_x: anytype) @TypeOf(__builtin_bswap64(_x)) {
    _ = &_x;
    return __builtin_bswap64(_x);
}
pub inline fn __htonl(_x: anytype) @TypeOf(__bswap32(_x)) {
    _ = &_x;
    return __bswap32(_x);
}
pub inline fn __htons(_x: anytype) @TypeOf(__bswap16(_x)) {
    _ = &_x;
    return __bswap16(_x);
}
pub inline fn __ntohl(_x: anytype) @TypeOf(__bswap32(_x)) {
    _ = &_x;
    return __bswap32(_x);
}
pub inline fn __ntohs(_x: anytype) @TypeOf(__bswap16(_x)) {
    _ = &_x;
    return __bswap16(_x);
}
pub inline fn esp_netif_htonl(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0x000000ff))) << @as(c_int, 24)) | ((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0x0000ff00))) << @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0x00ff0000))) >> @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0xff000000))) >> @as(c_int, 24))) {
    _ = &x;
    return ((((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0x000000ff))) << @as(c_int, 24)) | ((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0x0000ff00))) << @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0x00ff0000))) >> @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32, @as(c_ulong, 0xff000000))) >> @as(c_int, 24));
}
pub inline fn esp_netif_ip4_makeu32(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u32, a & @as(c_int, 0xff)) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32, b & @as(c_int, 0xff)) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32, c & @as(c_int, 0xff)) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32, d & @as(c_int, 0xff))) {
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    return (((@import("std").zig.c_translation.cast(u32, a & @as(c_int, 0xff)) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32, b & @as(c_int, 0xff)) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32, c & @as(c_int, 0xff)) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32, d & @as(c_int, 0xff));
}
pub inline fn ESP_IP6_ADDR_BLOCK1(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, (esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK2(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK3(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, (esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK4(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK5(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, (esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK6(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK7(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, (esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn ESP_IP6_ADDR_BLOCK8(ip6addr: anytype) u16 {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16, esp_netif_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub const IPSTR = "%d.%d.%d.%d";
pub const esp_ip4_addr_get_byte = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_ip_addr.h:43:9
pub inline fn esp_ip4_addr1(ipaddr: anytype) @TypeOf(esp_ip4_addr_get_byte(ipaddr, @as(c_int, 0))) {
    _ = &ipaddr;
    return esp_ip4_addr_get_byte(ipaddr, @as(c_int, 0));
}
pub inline fn esp_ip4_addr2(ipaddr: anytype) @TypeOf(esp_ip4_addr_get_byte(ipaddr, @as(c_int, 1))) {
    _ = &ipaddr;
    return esp_ip4_addr_get_byte(ipaddr, @as(c_int, 1));
}
pub inline fn esp_ip4_addr3(ipaddr: anytype) @TypeOf(esp_ip4_addr_get_byte(ipaddr, @as(c_int, 2))) {
    _ = &ipaddr;
    return esp_ip4_addr_get_byte(ipaddr, @as(c_int, 2));
}
pub inline fn esp_ip4_addr4(ipaddr: anytype) @TypeOf(esp_ip4_addr_get_byte(ipaddr, @as(c_int, 3))) {
    _ = &ipaddr;
    return esp_ip4_addr_get_byte(ipaddr, @as(c_int, 3));
}
pub inline fn esp_ip4_addr1_16(ipaddr: anytype) u16 {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16, esp_ip4_addr1(ipaddr));
}
pub inline fn esp_ip4_addr2_16(ipaddr: anytype) u16 {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16, esp_ip4_addr2(ipaddr));
}
pub inline fn esp_ip4_addr3_16(ipaddr: anytype) u16 {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16, esp_ip4_addr3(ipaddr));
}
pub inline fn esp_ip4_addr4_16(ipaddr: anytype) u16 {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16, esp_ip4_addr4(ipaddr));
}
pub inline fn IP2STR(ipaddr: anytype) @TypeOf(esp_ip4_addr4_16(ipaddr)) {
    _ = &ipaddr;
    return blk: {
        _ = esp_ip4_addr1_16(ipaddr);
        _ = esp_ip4_addr2_16(ipaddr);
        _ = esp_ip4_addr3_16(ipaddr);
        break :blk esp_ip4_addr4_16(ipaddr);
    };
}
pub const IPV6STR = "%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x";
pub inline fn IPV62STR(ipaddr: anytype) @TypeOf(ESP_IP6_ADDR_BLOCK8(&ipaddr)) {
    _ = &ipaddr;
    return blk: {
        _ = ESP_IP6_ADDR_BLOCK1(&ipaddr);
        _ = ESP_IP6_ADDR_BLOCK2(&ipaddr);
        _ = ESP_IP6_ADDR_BLOCK3(&ipaddr);
        _ = ESP_IP6_ADDR_BLOCK4(&ipaddr);
        _ = ESP_IP6_ADDR_BLOCK5(&ipaddr);
        _ = ESP_IP6_ADDR_BLOCK6(&ipaddr);
        _ = ESP_IP6_ADDR_BLOCK7(&ipaddr);
        break :blk ESP_IP6_ADDR_BLOCK8(&ipaddr);
    };
}
pub const ESP_IPADDR_TYPE_V4 = @as(c_uint, 0);
pub const ESP_IPADDR_TYPE_V6 = @as(c_uint, 6);
pub const ESP_IPADDR_TYPE_ANY = @as(c_uint, 46);
pub inline fn ESP_IP4TOUINT32(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u32, a & @as(c_uint, 0xff)) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32, b & @as(c_uint, 0xff)) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32, c & @as(c_uint, 0xff)) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32, d & @as(c_uint, 0xff))) {
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    return (((@import("std").zig.c_translation.cast(u32, a & @as(c_uint, 0xff)) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32, b & @as(c_uint, 0xff)) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32, c & @as(c_uint, 0xff)) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32, d & @as(c_uint, 0xff));
}
pub inline fn ESP_IP4TOADDR(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(esp_netif_htonl(ESP_IP4TOUINT32(a, b, c, d))) {
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    return esp_netif_htonl(ESP_IP4TOUINT32(a, b, c, d));
}
pub const ESP_IP4ADDR_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_ip_addr.h:82:9
pub const ESP_IP6ADDR_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_ip_addr.h:83:9
pub const IP4ADDR_STRLEN_MAX = @as(c_int, 16);
pub inline fn ESP_IP_IS_ANY(addr: anytype) @TypeOf(((addr.type == ESP_IPADDR_TYPE_V4) and (ip4_addr_isany_val(addr.u_addr.ip4) != 0)) or ((addr.type == ESP_IPADDR_TYPE_V6) and (ip6_addr_isany_val(addr.u_addr.ip6) != 0))) {
    _ = &addr;
    return ((addr.type == ESP_IPADDR_TYPE_V4) and (ip4_addr_isany_val(addr.u_addr.ip4) != 0)) or ((addr.type == ESP_IPADDR_TYPE_V6) and (ip6_addr_isany_val(addr.u_addr.ip6) != 0));
}
pub const _ESP_NETIF_TYPES_H_ = "";
pub const ESP_ERR_ESP_NETIF_BASE = @as(c_int, 0x5000);
pub const ESP_ERR_ESP_NETIF_INVALID_PARAMS = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x01);
pub const ESP_ERR_ESP_NETIF_IF_NOT_READY = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x02);
pub const ESP_ERR_ESP_NETIF_DHCPC_START_FAILED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x03);
pub const ESP_ERR_ESP_NETIF_DHCP_ALREADY_STARTED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x04);
pub const ESP_ERR_ESP_NETIF_DHCP_ALREADY_STOPPED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x05);
pub const ESP_ERR_ESP_NETIF_NO_MEM = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x06);
pub const ESP_ERR_ESP_NETIF_DHCP_NOT_STOPPED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x07);
pub const ESP_ERR_ESP_NETIF_DRIVER_ATTACH_FAILED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x08);
pub const ESP_ERR_ESP_NETIF_INIT_FAILED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x09);
pub const ESP_ERR_ESP_NETIF_DNS_NOT_CONFIGURED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x0A);
pub const ESP_ERR_ESP_NETIF_MLD6_FAILED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x0B);
pub const ESP_ERR_ESP_NETIF_IP6_ADDR_FAILED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x0C);
pub const ESP_ERR_ESP_NETIF_DHCPS_START_FAILED = ESP_ERR_ESP_NETIF_BASE + @as(c_int, 0x0D);
pub const ESP_NETIF_BR_FLOOD = -@as(c_int, 1);
pub const ESP_NETIF_BR_DROP = @as(c_int, 0);
pub const ESP_NETIF_BR_FDW_CPU = @as(c_ulonglong, 1) << @as(c_int, 63);
pub const _ESP_NETIF_DEFAULTS_H = "";
pub const ESP_NETIF_DEFAULT_ARP_FLAGS = ESP_NETIF_FLAG_GARP;
pub inline fn ESP_NETIF_IPV4_ONLY_FLAGS(flags: anytype) @TypeOf(flags) {
    _ = &flags;
    return flags;
}
pub const ESP_NETIF_DEFAULT_MLDV6_REPORT_FLAGS = ESP_NETIF_FLAG_MLDV6_REPORT;
pub const ESP_NETIF_INHERENT_DEFAULT_WIFI_STA = @compileError("unable to translate macro: undefined identifier `mac`");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:39:9
pub const ESP_NETIF_INHERENT_DEFAULT_WIFI_AP = @compileError("unable to translate macro: undefined identifier `mac`");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:53:9
pub const ESP_NETIF_INHERENT_DEFAULT_WIFI_NAN = @compileError("unable to translate macro: undefined identifier `mac`");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:67:9
pub const ESP_NETIF_INHERENT_DEFAULT_ETH = @compileError("unable to translate macro: undefined identifier `mac`");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:79:9
pub const ESP_NETIF_INHERENT_DEFAULT_BR = @compileError("unable to translate macro: undefined identifier `mac`");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:107:9
pub const ESP_NETIF_INHERENT_DEFAULT_BR_DHCPS = @compileError("unable to translate macro: undefined identifier `mac`");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:120:9
pub const ESP_NETIF_DEFAULT_ETH = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:136:9
pub const ESP_NETIF_DEFAULT_WIFI_AP = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:147:9
pub const ESP_NETIF_DEFAULT_WIFI_STA = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:170:9
pub const ESP_NETIF_BASE_DEFAULT_WIFI_STA = &_g_esp_netif_inherent_sta_config;
pub const ESP_NETIF_BASE_DEFAULT_WIFI_AP = &_g_esp_netif_inherent_ap_config;
pub const ESP_NETIF_BASE_DEFAULT_ETH = &_g_esp_netif_inherent_eth_config;
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:221:9: warning: macro 'ESP_NETIF_NETSTACK_DEFAULT_ETH' contains a runtime value, translated to function
pub inline fn ESP_NETIF_NETSTACK_DEFAULT_ETH() @TypeOf(_g_esp_netif_netstack_default_eth) {
    return _g_esp_netif_netstack_default_eth;
}
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:222:9: warning: macro 'ESP_NETIF_NETSTACK_DEFAULT_BR' contains a runtime value, translated to function
pub inline fn ESP_NETIF_NETSTACK_DEFAULT_BR() @TypeOf(_g_esp_netif_netstack_default_br) {
    return _g_esp_netif_netstack_default_br;
}
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:223:9: warning: macro 'ESP_NETIF_NETSTACK_DEFAULT_WIFI_STA' contains a runtime value, translated to function
pub inline fn ESP_NETIF_NETSTACK_DEFAULT_WIFI_STA() @TypeOf(_g_esp_netif_netstack_default_wifi_sta) {
    return _g_esp_netif_netstack_default_wifi_sta;
}
// /home/wiiggee1/esp-idf/components/esp_netif/include/esp_netif_defaults.h:225:9: warning: macro 'ESP_NETIF_NETSTACK_DEFAULT_WIFI_AP' contains a runtime value, translated to function
pub inline fn ESP_NETIF_NETSTACK_DEFAULT_WIFI_AP() @TypeOf(_g_esp_netif_netstack_default_wifi_ap) {
    return _g_esp_netif_netstack_default_wifi_ap;
}
pub const ESP_ERR_WIFI_NOT_INIT = ESP_ERR_WIFI_BASE + @as(c_int, 1);
pub const ESP_ERR_WIFI_NOT_STARTED = ESP_ERR_WIFI_BASE + @as(c_int, 2);
pub const ESP_ERR_WIFI_NOT_STOPPED = ESP_ERR_WIFI_BASE + @as(c_int, 3);
pub const ESP_ERR_WIFI_IF = ESP_ERR_WIFI_BASE + @as(c_int, 4);
pub const ESP_ERR_WIFI_MODE = ESP_ERR_WIFI_BASE + @as(c_int, 5);
pub const ESP_ERR_WIFI_STATE = ESP_ERR_WIFI_BASE + @as(c_int, 6);
pub const ESP_ERR_WIFI_CONN = ESP_ERR_WIFI_BASE + @as(c_int, 7);
pub const ESP_ERR_WIFI_NVS = ESP_ERR_WIFI_BASE + @as(c_int, 8);
pub const ESP_ERR_WIFI_MAC = ESP_ERR_WIFI_BASE + @as(c_int, 9);
pub const ESP_ERR_WIFI_SSID = ESP_ERR_WIFI_BASE + @as(c_int, 10);
pub const ESP_ERR_WIFI_PASSWORD = ESP_ERR_WIFI_BASE + @as(c_int, 11);
pub const ESP_ERR_WIFI_TIMEOUT = ESP_ERR_WIFI_BASE + @as(c_int, 12);
pub const ESP_ERR_WIFI_WAKE_FAIL = ESP_ERR_WIFI_BASE + @as(c_int, 13);
pub const ESP_ERR_WIFI_WOULD_BLOCK = ESP_ERR_WIFI_BASE + @as(c_int, 14);
pub const ESP_ERR_WIFI_NOT_CONNECT = ESP_ERR_WIFI_BASE + @as(c_int, 15);
pub const ESP_ERR_WIFI_POST = ESP_ERR_WIFI_BASE + @as(c_int, 18);
pub const ESP_ERR_WIFI_INIT_STATE = ESP_ERR_WIFI_BASE + @as(c_int, 19);
pub const ESP_ERR_WIFI_STOP_STATE = ESP_ERR_WIFI_BASE + @as(c_int, 20);
pub const ESP_ERR_WIFI_NOT_ASSOC = ESP_ERR_WIFI_BASE + @as(c_int, 21);
pub const ESP_ERR_WIFI_TX_DISALLOW = ESP_ERR_WIFI_BASE + @as(c_int, 22);
pub const ESP_ERR_WIFI_TWT_FULL = ESP_ERR_WIFI_BASE + @as(c_int, 23);
pub const ESP_ERR_WIFI_TWT_SETUP_TIMEOUT = ESP_ERR_WIFI_BASE + @as(c_int, 24);
pub const ESP_ERR_WIFI_TWT_SETUP_TXFAIL = ESP_ERR_WIFI_BASE + @as(c_int, 25);
pub const ESP_ERR_WIFI_TWT_SETUP_REJECT = ESP_ERR_WIFI_BASE + @as(c_int, 26);
pub const ESP_ERR_WIFI_DISCARD = ESP_ERR_WIFI_BASE + @as(c_int, 27);
pub const ESP_ERR_WIFI_ROC_IN_PROGRESS = ESP_ERR_WIFI_BASE + @as(c_int, 28);
pub const WIFI_STATIC_TX_BUFFER_NUM = @as(c_int, 0);
pub const WIFI_CACHE_TX_BUFFER_NUM = @as(c_int, 0);
pub const WIFI_DYNAMIC_TX_BUFFER_NUM = CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER_NUM;
pub const WIFI_RX_MGMT_BUF_NUM_DEF = CONFIG_ESP_WIFI_RX_MGMT_BUF_NUM_DEF;
pub const WIFI_CSI_ENABLED = @as(c_int, 0);
pub const WIFI_AMPDU_RX_ENABLED = @as(c_int, 1);
pub const WIFI_AMPDU_TX_ENABLED = @as(c_int, 1);
pub const WIFI_AMSDU_TX_ENABLED = @as(c_int, 0);
pub const WIFI_NVS_ENABLED = @as(c_int, 1);
pub const WIFI_NANO_FORMAT_ENABLED = @as(c_int, 0);
pub const WIFI_INIT_CONFIG_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1F2F3F4F, .hex);
pub const WIFI_DEFAULT_RX_BA_WIN = CONFIG_ESP_WIFI_RX_BA_WIN;
pub const WIFI_TASK_CORE_ID = @as(c_int, 0);
pub const WIFI_SOFTAP_BEACON_MAX_LEN = CONFIG_ESP_WIFI_SOFTAP_BEACON_MAX_LEN;
pub const WIFI_MGMT_SBUF_NUM = CONFIG_ESP_WIFI_MGMT_SBUF_NUM;
pub const WIFI_STA_DISCONNECTED_PM_ENABLED = @"true";
pub const WIFI_ENABLE_WPA3_SAE = @as(c_int, 1) << @as(c_int, 0);
pub const WIFI_ENABLE_SPIRAM = @as(c_int, 0);
pub const WIFI_FTM_INITIATOR = @as(c_int, 0);
pub const WIFI_FTM_RESPONDER = @as(c_int, 0);
pub const WIFI_ENABLE_GCMP = @as(c_int, 0);
pub const WIFI_ENABLE_GMAC = @as(c_int, 1) << @as(c_int, 5);
pub const WIFI_ENABLE_11R = @as(c_int, 0);
pub const WIFI_ENABLE_ENTERPRISE = @as(c_int, 1) << @as(c_int, 7);
pub const WIFI_DUMP_HESIGB_ENABLED = @"false";
pub const WIFI_TX_HETB_QUEUE_NUM = @as(c_int, 1);
pub const CONFIG_FEATURE_WPA3_SAE_BIT = @as(c_int, 1) << @as(c_int, 0);
pub const CONFIG_FEATURE_CACHE_TX_BUF_BIT = @as(c_int, 1) << @as(c_int, 1);
pub const CONFIG_FEATURE_FTM_INITIATOR_BIT = @as(c_int, 1) << @as(c_int, 2);
pub const CONFIG_FEATURE_FTM_RESPONDER_BIT = @as(c_int, 1) << @as(c_int, 3);
pub const CONFIG_FEATURE_GCMP_BIT = @as(c_int, 1) << @as(c_int, 4);
pub const CONFIG_FEATURE_GMAC_BIT = @as(c_int, 1) << @as(c_int, 5);
pub const CONFIG_FEATURE_11R_BIT = @as(c_int, 1) << @as(c_int, 6);
pub const CONFIG_FEATURE_WIFI_ENT_BIT = @as(c_int, 1) << @as(c_int, 7);
pub const WIFI_FEATURE_CAPS = ((((((WIFI_ENABLE_WPA3_SAE | WIFI_ENABLE_SPIRAM) | WIFI_FTM_INITIATOR) | WIFI_FTM_RESPONDER) | WIFI_ENABLE_GCMP) | WIFI_ENABLE_GMAC) | WIFI_ENABLE_11R) | WIFI_ENABLE_ENTERPRISE;
pub const WIFI_INIT_CONFIG_DEFAULT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/esp_wifi/include/esp_wifi.h:300:9
pub const ESP_WIFI_CONNECTIONLESS_INTERVAL_DEFAULT_MODE = @as(c_int, 0);
pub const nvs_flash_h = "";
pub const ESP_NVS_H = "";
pub const ESP_ERR_NVS_BASE = @as(c_int, 0x1100);
pub const ESP_ERR_NVS_NOT_INITIALIZED = ESP_ERR_NVS_BASE + @as(c_int, 0x01);
pub const ESP_ERR_NVS_NOT_FOUND = ESP_ERR_NVS_BASE + @as(c_int, 0x02);
pub const ESP_ERR_NVS_TYPE_MISMATCH = ESP_ERR_NVS_BASE + @as(c_int, 0x03);
pub const ESP_ERR_NVS_READ_ONLY = ESP_ERR_NVS_BASE + @as(c_int, 0x04);
pub const ESP_ERR_NVS_NOT_ENOUGH_SPACE = ESP_ERR_NVS_BASE + @as(c_int, 0x05);
pub const ESP_ERR_NVS_INVALID_NAME = ESP_ERR_NVS_BASE + @as(c_int, 0x06);
pub const ESP_ERR_NVS_INVALID_HANDLE = ESP_ERR_NVS_BASE + @as(c_int, 0x07);
pub const ESP_ERR_NVS_REMOVE_FAILED = ESP_ERR_NVS_BASE + @as(c_int, 0x08);
pub const ESP_ERR_NVS_KEY_TOO_LONG = ESP_ERR_NVS_BASE + @as(c_int, 0x09);
pub const ESP_ERR_NVS_PAGE_FULL = ESP_ERR_NVS_BASE + @as(c_int, 0x0a);
pub const ESP_ERR_NVS_INVALID_STATE = ESP_ERR_NVS_BASE + @as(c_int, 0x0b);
pub const ESP_ERR_NVS_INVALID_LENGTH = ESP_ERR_NVS_BASE + @as(c_int, 0x0c);
pub const ESP_ERR_NVS_NO_FREE_PAGES = ESP_ERR_NVS_BASE + @as(c_int, 0x0d);
pub const ESP_ERR_NVS_VALUE_TOO_LONG = ESP_ERR_NVS_BASE + @as(c_int, 0x0e);
pub const ESP_ERR_NVS_PART_NOT_FOUND = ESP_ERR_NVS_BASE + @as(c_int, 0x0f);
pub const ESP_ERR_NVS_NEW_VERSION_FOUND = ESP_ERR_NVS_BASE + @as(c_int, 0x10);
pub const ESP_ERR_NVS_XTS_ENCR_FAILED = ESP_ERR_NVS_BASE + @as(c_int, 0x11);
pub const ESP_ERR_NVS_XTS_DECR_FAILED = ESP_ERR_NVS_BASE + @as(c_int, 0x12);
pub const ESP_ERR_NVS_XTS_CFG_FAILED = ESP_ERR_NVS_BASE + @as(c_int, 0x13);
pub const ESP_ERR_NVS_XTS_CFG_NOT_FOUND = ESP_ERR_NVS_BASE + @as(c_int, 0x14);
pub const ESP_ERR_NVS_ENCR_NOT_SUPPORTED = ESP_ERR_NVS_BASE + @as(c_int, 0x15);
pub const ESP_ERR_NVS_KEYS_NOT_INITIALIZED = ESP_ERR_NVS_BASE + @as(c_int, 0x16);
pub const ESP_ERR_NVS_CORRUPT_KEY_PART = ESP_ERR_NVS_BASE + @as(c_int, 0x17);
pub const ESP_ERR_NVS_WRONG_ENCRYPTION = ESP_ERR_NVS_BASE + @as(c_int, 0x19);
pub const ESP_ERR_NVS_CONTENT_DIFFERS = ESP_ERR_NVS_BASE + @as(c_int, 0x18);
pub const NVS_DEFAULT_PART_NAME = "nvs";
pub const NVS_PART_NAME_MAX_SIZE = @as(c_int, 16);
pub const NVS_KEY_NAME_MAX_SIZE = @as(c_int, 16);
pub const NVS_NS_NAME_MAX_SIZE = NVS_KEY_NAME_MAX_SIZE;
pub const NVS_GUARD_SYSVIEW_MACRO_EXPANSION_PUSH = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /home/wiiggee1/esp-idf/components/nvs_flash/include/nvs.h:64:9
pub const NVS_GUARD_SYSVIEW_MACRO_EXPANSION_POP = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /home/wiiggee1/esp-idf/components/nvs_flash/include/nvs.h:74:9
pub const __ESP_PARTITION_H__ = "";
pub inline fn ESP_PARTITION_SUBTYPE_OTA(i: anytype) esp_partition_subtype_t {
    _ = &i;
    return @import("std").zig.c_translation.cast(esp_partition_subtype_t, ESP_PARTITION_SUBTYPE_APP_OTA_MIN + (i & @as(c_int, 0xf)));
}
pub const NVS_KEY_SIZE = @as(c_int, 32);
pub const LWIP_HDR_SOCKETS_H = "";
pub const LWIP_HDR_OPT_H = "";
pub const LWIP_HDR_ESP_LWIPOPTS_H = "";
pub const _STRING_H_ = "";
pub const _STRINGS_H_ = "";
pub const _SIZE_T_DECLARED = "";
pub const _UNISTD_H_ = "";
pub const _SYS_UNISTD_H = "";
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _SYS_TYPES_H = "";
pub const _SYS_SELECT_H = "";
pub const _SYS__SIGSET_H_ = "";
pub const _SYS__TIMEVAL_H_ = "";
pub const _SUSECONDS_T_DECLARED = "";
pub const __time_t_defined = "";
pub const _TIME_T_DECLARED = "";
pub const _TIMEVAL_DEFINED = "";
pub const _SYS_TIMESPEC_H_ = "";
pub const _SYS__TIMESPEC_H_ = "";
pub const TIMEVAL_TO_TIMESPEC = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/timespec.h:41:9
pub const TIMESPEC_TO_TIMEVAL = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/timespec.h:46:9
pub const _SIGSET_T_DECLARED = "";
pub const _SYS_TYPES_FD_SET = "";
pub const FD_SETSIZE = @as(c_int, 64);
pub const _NFDBITS = @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask)) * @as(c_int, 8);
pub const NFDBITS = _NFDBITS;
pub inline fn _howmany(x: anytype, y: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(x + (y - @as(c_int, 1)), y)) {
    _ = &x;
    _ = &y;
    return @import("std").zig.c_translation.MacroArithmetic.div(x + (y - @as(c_int, 1)), y);
}
pub const fds_bits = @compileError("unable to translate macro: undefined identifier `__fds_bits`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/select.h:56:9
pub inline fn __fdset_mask(n: anytype) @TypeOf(@import("std").zig.c_translation.cast(__fd_mask, @as(c_int, 1)) << @import("std").zig.c_translation.MacroArithmetic.rem(n, _NFDBITS)) {
    _ = &n;
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_int, 1)) << @import("std").zig.c_translation.MacroArithmetic.rem(n, _NFDBITS);
}
pub const FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/select.h:60:9
pub const FD_COPY = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/select.h:62:9
pub inline fn FD_ISSET(n: anytype, p: anytype) @TypeOf((p.*.__fds_bits[@as(usize, @intCast(@import("std").zig.c_translation.MacroArithmetic.div(n, _NFDBITS)))] & __fdset_mask(n)) != @as(c_int, 0)) {
    _ = &n;
    _ = &p;
    return (p.*.__fds_bits[@as(usize, @intCast(@import("std").zig.c_translation.MacroArithmetic.div(n, _NFDBITS)))] & __fdset_mask(n)) != @as(c_int, 0);
}
pub const FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/select.h:65:9
pub const FD_ZERO = @compileError("unable to translate macro: undefined identifier `_p`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/select.h:66:9
pub const physadr = @compileError("unable to translate macro: undefined identifier `physadr_t`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/types.h:51:11
pub const quad = @compileError("unable to translate macro: undefined identifier `quad_t`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/types.h:52:11
pub const _IN_ADDR_T_DECLARED = "";
pub const _IN_PORT_T_DECLARED = "";
pub const __u_char_defined = "";
pub const __u_short_defined = "";
pub const __u_int_defined = "";
pub const __u_long_defined = "";
pub const _BSDTYPES_DEFINED = "";
pub const _BLKCNT_T_DECLARED = "";
pub const _BLKSIZE_T_DECLARED = "";
pub const __clock_t_defined = "";
pub const _CLOCK_T_DECLARED = "";
pub const __caddr_t_defined = "";
pub const _FSBLKCNT_T_DECLARED = "";
pub const _ID_T_DECLARED = "";
pub const _INO_T_DECLARED = "";
pub const _DEV_T_DECLARED = "";
pub const _UID_T_DECLARED = "";
pub const _GID_T_DECLARED = "";
pub const _PID_T_DECLARED = "";
pub const _KEY_T_DECLARED = "";
pub const _MODE_T_DECLARED = "";
pub const _NLINK_T_DECLARED = "";
pub const __clockid_t_defined = "";
pub const _CLOCKID_T_DECLARED = "";
pub const __timer_t_defined = "";
pub const _TIMER_T_DECLARED = "";
pub const _USECONDS_T_DECLARED = "";
pub const _SYS__PTHREADTYPES_H_ = "";
pub const _SYS_SCHED_H_ = "";
pub const SCHED_OTHER = @as(c_int, 0);
pub const SCHED_FIFO = @as(c_int, 1);
pub const SCHED_RR = @as(c_int, 2);
pub const PTHREAD_SCOPE_PROCESS = @as(c_int, 0);
pub const PTHREAD_SCOPE_SYSTEM = @as(c_int, 1);
pub const PTHREAD_INHERIT_SCHED = @as(c_int, 1);
pub const PTHREAD_EXPLICIT_SCHED = @as(c_int, 2);
pub const PTHREAD_CREATE_DETACHED = @as(c_int, 0);
pub const PTHREAD_CREATE_JOINABLE = @as(c_int, 1);
pub const PTHREAD_MUTEX_NORMAL = @as(c_int, 0);
pub const PTHREAD_MUTEX_RECURSIVE = @as(c_int, 1);
pub const PTHREAD_MUTEX_ERRORCHECK = @as(c_int, 2);
pub const PTHREAD_MUTEX_DEFAULT = @as(c_int, 3);
pub const _PTHREAD_MUTEX_INITIALIZER = @import("std").zig.c_translation.cast(pthread_mutex_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex));
pub const _PTHREAD_COND_INITIALIZER = @import("std").zig.c_translation.cast(pthread_cond_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex));
pub const _PTHREAD_ONCE_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/_pthreadtypes.h:197:9
pub const F_ULOCK = @as(c_int, 0);
pub const F_LOCK = @as(c_int, 1);
pub const F_TLOCK = @as(c_int, 2);
pub const F_TEST = @as(c_int, 3);
pub const F_OK = @as(c_int, 0);
pub const R_OK = @as(c_int, 4);
pub const W_OK = @as(c_int, 2);
pub const X_OK = @as(c_int, 1);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const _SC_ARG_MAX = @as(c_int, 0);
pub const _SC_CHILD_MAX = @as(c_int, 1);
pub const _SC_CLK_TCK = @as(c_int, 2);
pub const _SC_NGROUPS_MAX = @as(c_int, 3);
pub const _SC_OPEN_MAX = @as(c_int, 4);
pub const _SC_JOB_CONTROL = @as(c_int, 5);
pub const _SC_SAVED_IDS = @as(c_int, 6);
pub const _SC_VERSION = @as(c_int, 7);
pub const _SC_PAGESIZE = @as(c_int, 8);
pub const _SC_PAGE_SIZE = _SC_PAGESIZE;
pub const _SC_NPROCESSORS_CONF = @as(c_int, 9);
pub const _SC_NPROCESSORS_ONLN = @as(c_int, 10);
pub const _SC_PHYS_PAGES = @as(c_int, 11);
pub const _SC_AVPHYS_PAGES = @as(c_int, 12);
pub const _SC_MQ_OPEN_MAX = @as(c_int, 13);
pub const _SC_MQ_PRIO_MAX = @as(c_int, 14);
pub const _SC_RTSIG_MAX = @as(c_int, 15);
pub const _SC_SEM_NSEMS_MAX = @as(c_int, 16);
pub const _SC_SEM_VALUE_MAX = @as(c_int, 17);
pub const _SC_SIGQUEUE_MAX = @as(c_int, 18);
pub const _SC_TIMER_MAX = @as(c_int, 19);
pub const _SC_TZNAME_MAX = @as(c_int, 20);
pub const _SC_ASYNCHRONOUS_IO = @as(c_int, 21);
pub const _SC_FSYNC = @as(c_int, 22);
pub const _SC_MAPPED_FILES = @as(c_int, 23);
pub const _SC_MEMLOCK = @as(c_int, 24);
pub const _SC_MEMLOCK_RANGE = @as(c_int, 25);
pub const _SC_MEMORY_PROTECTION = @as(c_int, 26);
pub const _SC_MESSAGE_PASSING = @as(c_int, 27);
pub const _SC_PRIORITIZED_IO = @as(c_int, 28);
pub const _SC_REALTIME_SIGNALS = @as(c_int, 29);
pub const _SC_SEMAPHORES = @as(c_int, 30);
pub const _SC_SHARED_MEMORY_OBJECTS = @as(c_int, 31);
pub const _SC_SYNCHRONIZED_IO = @as(c_int, 32);
pub const _SC_TIMERS = @as(c_int, 33);
pub const _SC_AIO_LISTIO_MAX = @as(c_int, 34);
pub const _SC_AIO_MAX = @as(c_int, 35);
pub const _SC_AIO_PRIO_DELTA_MAX = @as(c_int, 36);
pub const _SC_DELAYTIMER_MAX = @as(c_int, 37);
pub const _SC_THREAD_KEYS_MAX = @as(c_int, 38);
pub const _SC_THREAD_STACK_MIN = @as(c_int, 39);
pub const _SC_THREAD_THREADS_MAX = @as(c_int, 40);
pub const _SC_TTY_NAME_MAX = @as(c_int, 41);
pub const _SC_THREADS = @as(c_int, 42);
pub const _SC_THREAD_ATTR_STACKADDR = @as(c_int, 43);
pub const _SC_THREAD_ATTR_STACKSIZE = @as(c_int, 44);
pub const _SC_THREAD_PRIORITY_SCHEDULING = @as(c_int, 45);
pub const _SC_THREAD_PRIO_INHERIT = @as(c_int, 46);
pub const _SC_THREAD_PRIO_PROTECT = @as(c_int, 47);
pub const _SC_THREAD_PRIO_CEILING = _SC_THREAD_PRIO_PROTECT;
pub const _SC_THREAD_PROCESS_SHARED = @as(c_int, 48);
pub const _SC_THREAD_SAFE_FUNCTIONS = @as(c_int, 49);
pub const _SC_GETGR_R_SIZE_MAX = @as(c_int, 50);
pub const _SC_GETPW_R_SIZE_MAX = @as(c_int, 51);
pub const _SC_LOGIN_NAME_MAX = @as(c_int, 52);
pub const _SC_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 53);
pub const _SC_ADVISORY_INFO = @as(c_int, 54);
pub const _SC_ATEXIT_MAX = @as(c_int, 55);
pub const _SC_BARRIERS = @as(c_int, 56);
pub const _SC_BC_BASE_MAX = @as(c_int, 57);
pub const _SC_BC_DIM_MAX = @as(c_int, 58);
pub const _SC_BC_SCALE_MAX = @as(c_int, 59);
pub const _SC_BC_STRING_MAX = @as(c_int, 60);
pub const _SC_CLOCK_SELECTION = @as(c_int, 61);
pub const _SC_COLL_WEIGHTS_MAX = @as(c_int, 62);
pub const _SC_CPUTIME = @as(c_int, 63);
pub const _SC_EXPR_NEST_MAX = @as(c_int, 64);
pub const _SC_HOST_NAME_MAX = @as(c_int, 65);
pub const _SC_IOV_MAX = @as(c_int, 66);
pub const _SC_IPV6 = @as(c_int, 67);
pub const _SC_LINE_MAX = @as(c_int, 68);
pub const _SC_MONOTONIC_CLOCK = @as(c_int, 69);
pub const _SC_RAW_SOCKETS = @as(c_int, 70);
pub const _SC_READER_WRITER_LOCKS = @as(c_int, 71);
pub const _SC_REGEXP = @as(c_int, 72);
pub const _SC_RE_DUP_MAX = @as(c_int, 73);
pub const _SC_SHELL = @as(c_int, 74);
pub const _SC_SPAWN = @as(c_int, 75);
pub const _SC_SPIN_LOCKS = @as(c_int, 76);
pub const _SC_SPORADIC_SERVER = @as(c_int, 77);
pub const _SC_SS_REPL_MAX = @as(c_int, 78);
pub const _SC_SYMLOOP_MAX = @as(c_int, 79);
pub const _SC_THREAD_CPUTIME = @as(c_int, 80);
pub const _SC_THREAD_SPORADIC_SERVER = @as(c_int, 81);
pub const _SC_TIMEOUTS = @as(c_int, 82);
pub const _SC_TRACE = @as(c_int, 83);
pub const _SC_TRACE_EVENT_FILTER = @as(c_int, 84);
pub const _SC_TRACE_EVENT_NAME_MAX = @as(c_int, 85);
pub const _SC_TRACE_INHERIT = @as(c_int, 86);
pub const _SC_TRACE_LOG = @as(c_int, 87);
pub const _SC_TRACE_NAME_MAX = @as(c_int, 88);
pub const _SC_TRACE_SYS_MAX = @as(c_int, 89);
pub const _SC_TRACE_USER_EVENT_MAX = @as(c_int, 90);
pub const _SC_TYPED_MEMORY_OBJECTS = @as(c_int, 91);
pub const _SC_V7_ILP32_OFF32 = @as(c_int, 92);
pub const _SC_V6_ILP32_OFF32 = _SC_V7_ILP32_OFF32;
pub const _SC_XBS5_ILP32_OFF32 = _SC_V7_ILP32_OFF32;
pub const _SC_V7_ILP32_OFFBIG = @as(c_int, 93);
pub const _SC_V6_ILP32_OFFBIG = _SC_V7_ILP32_OFFBIG;
pub const _SC_XBS5_ILP32_OFFBIG = _SC_V7_ILP32_OFFBIG;
pub const _SC_V7_LP64_OFF64 = @as(c_int, 94);
pub const _SC_V6_LP64_OFF64 = _SC_V7_LP64_OFF64;
pub const _SC_XBS5_LP64_OFF64 = _SC_V7_LP64_OFF64;
pub const _SC_V7_LPBIG_OFFBIG = @as(c_int, 95);
pub const _SC_V6_LPBIG_OFFBIG = _SC_V7_LPBIG_OFFBIG;
pub const _SC_XBS5_LPBIG_OFFBIG = _SC_V7_LPBIG_OFFBIG;
pub const _SC_XOPEN_CRYPT = @as(c_int, 96);
pub const _SC_XOPEN_ENH_I18N = @as(c_int, 97);
pub const _SC_XOPEN_LEGACY = @as(c_int, 98);
pub const _SC_XOPEN_REALTIME = @as(c_int, 99);
pub const _SC_STREAM_MAX = @as(c_int, 100);
pub const _SC_PRIORITY_SCHEDULING = @as(c_int, 101);
pub const _SC_XOPEN_REALTIME_THREADS = @as(c_int, 102);
pub const _SC_XOPEN_SHM = @as(c_int, 103);
pub const _SC_XOPEN_STREAMS = @as(c_int, 104);
pub const _SC_XOPEN_UNIX = @as(c_int, 105);
pub const _SC_XOPEN_VERSION = @as(c_int, 106);
pub const _SC_2_CHAR_TERM = @as(c_int, 107);
pub const _SC_2_C_BIND = @as(c_int, 108);
pub const _SC_2_C_DEV = @as(c_int, 109);
pub const _SC_2_FORT_DEV = @as(c_int, 110);
pub const _SC_2_FORT_RUN = @as(c_int, 111);
pub const _SC_2_LOCALEDEF = @as(c_int, 112);
pub const _SC_2_PBS = @as(c_int, 113);
pub const _SC_2_PBS_ACCOUNTING = @as(c_int, 114);
pub const _SC_2_PBS_CHECKPOINT = @as(c_int, 115);
pub const _SC_2_PBS_LOCATE = @as(c_int, 116);
pub const _SC_2_PBS_MESSAGE = @as(c_int, 117);
pub const _SC_2_PBS_TRACK = @as(c_int, 118);
pub const _SC_2_SW_DEV = @as(c_int, 119);
pub const _SC_2_UPE = @as(c_int, 120);
pub const _SC_2_VERSION = @as(c_int, 121);
pub const _SC_THREAD_ROBUST_PRIO_INHERIT = @as(c_int, 122);
pub const _SC_THREAD_ROBUST_PRIO_PROTECT = @as(c_int, 123);
pub const _SC_XOPEN_UUCP = @as(c_int, 124);
pub const _SC_LEVEL1_ICACHE_SIZE = @as(c_int, 125);
pub const _SC_LEVEL1_ICACHE_ASSOC = @as(c_int, 126);
pub const _SC_LEVEL1_ICACHE_LINESIZE = @as(c_int, 127);
pub const _SC_LEVEL1_DCACHE_SIZE = @as(c_int, 128);
pub const _SC_LEVEL1_DCACHE_ASSOC = @as(c_int, 129);
pub const _SC_LEVEL1_DCACHE_LINESIZE = @as(c_int, 130);
pub const _SC_LEVEL2_CACHE_SIZE = @as(c_int, 131);
pub const _SC_LEVEL2_CACHE_ASSOC = @as(c_int, 132);
pub const _SC_LEVEL2_CACHE_LINESIZE = @as(c_int, 133);
pub const _SC_LEVEL3_CACHE_SIZE = @as(c_int, 134);
pub const _SC_LEVEL3_CACHE_ASSOC = @as(c_int, 135);
pub const _SC_LEVEL3_CACHE_LINESIZE = @as(c_int, 136);
pub const _SC_LEVEL4_CACHE_SIZE = @as(c_int, 137);
pub const _SC_LEVEL4_CACHE_ASSOC = @as(c_int, 138);
pub const _SC_LEVEL4_CACHE_LINESIZE = @as(c_int, 139);
pub const _SC_POSIX_26_VERSION = @as(c_int, 140);
pub const _PC_LINK_MAX = @as(c_int, 0);
pub const _PC_MAX_CANON = @as(c_int, 1);
pub const _PC_MAX_INPUT = @as(c_int, 2);
pub const _PC_NAME_MAX = @as(c_int, 3);
pub const _PC_PATH_MAX = @as(c_int, 4);
pub const _PC_PIPE_BUF = @as(c_int, 5);
pub const _PC_CHOWN_RESTRICTED = @as(c_int, 6);
pub const _PC_NO_TRUNC = @as(c_int, 7);
pub const _PC_VDISABLE = @as(c_int, 8);
pub const _PC_ASYNC_IO = @as(c_int, 9);
pub const _PC_PRIO_IO = @as(c_int, 10);
pub const _PC_SYNC_IO = @as(c_int, 11);
pub const _PC_FILESIZEBITS = @as(c_int, 12);
pub const _PC_2_SYMLINKS = @as(c_int, 13);
pub const _PC_SYMLINK_MAX = @as(c_int, 14);
pub const _PC_ALLOC_SIZE_MIN = @as(c_int, 15);
pub const _PC_REC_INCR_XFER_SIZE = @as(c_int, 16);
pub const _PC_REC_MAX_XFER_SIZE = @as(c_int, 17);
pub const _PC_REC_MIN_XFER_SIZE = @as(c_int, 18);
pub const _PC_REC_XFER_ALIGN = @as(c_int, 19);
pub const _PC_TIMESTAMP_RESOLUTION = @as(c_int, 20);
pub const _SYS_FCNTL_H_ = "";
pub const _SYS__DEFAULT_FCNTL_H_ = "";
pub const _FOPEN = -@as(c_int, 1);
pub const _FREAD = @as(c_int, 0x0001);
pub const _FWRITE = @as(c_int, 0x0002);
pub const _FAPPEND = @as(c_int, 0x0008);
pub const _FMARK = @as(c_int, 0x0010);
pub const _FDEFER = @as(c_int, 0x0020);
pub const _FASYNC = @as(c_int, 0x0040);
pub const _FSHLOCK = @as(c_int, 0x0080);
pub const _FEXLOCK = @as(c_int, 0x0100);
pub const _FCREAT = @as(c_int, 0x0200);
pub const _FTRUNC = @as(c_int, 0x0400);
pub const _FEXCL = @as(c_int, 0x0800);
pub const _FNBIO = @as(c_int, 0x1000);
pub const _FSYNC = @as(c_int, 0x2000);
pub const _FNONBLOCK = @as(c_int, 0x4000);
pub const _FNDELAY = _FNONBLOCK;
pub const _FNOCTTY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const _FNOINHERIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000, .hex);
pub const _FDIRECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000, .hex);
pub const _FNOFOLLOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x100000, .hex);
pub const _FDIRECTORY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x200000, .hex);
pub const _FEXECSRCH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x400000, .hex);
pub const O_ACCMODE = (O_RDONLY | O_WRONLY) | O_RDWR;
pub const O_RDONLY = @as(c_int, 0);
pub const O_WRONLY = @as(c_int, 1);
pub const O_RDWR = @as(c_int, 2);
pub const O_APPEND = _FAPPEND;
pub const O_CREAT = _FCREAT;
pub const O_TRUNC = _FTRUNC;
pub const O_EXCL = _FEXCL;
pub const O_SYNC = _FSYNC;
pub const O_NONBLOCK = _FNONBLOCK;
pub const O_NOCTTY = _FNOCTTY;
pub const O_CLOEXEC = _FNOINHERIT;
pub const O_NOFOLLOW = _FNOFOLLOW;
pub const O_DIRECTORY = _FDIRECTORY;
pub const O_EXEC = _FEXECSRCH;
pub const O_SEARCH = _FEXECSRCH;
pub const O_DIRECT = _FDIRECT;
pub const FAPPEND = _FAPPEND;
pub const FSYNC = _FSYNC;
pub const FASYNC = _FASYNC;
pub const FNBIO = _FNBIO;
pub const FNONBIO = _FNONBLOCK;
pub const FNDELAY = _FNDELAY;
pub const FREAD = _FREAD;
pub const FWRITE = _FWRITE;
pub const FMARK = _FMARK;
pub const FDEFER = _FDEFER;
pub const FSHLOCK = _FSHLOCK;
pub const FEXLOCK = _FEXLOCK;
pub const FOPEN = _FOPEN;
pub const FCREAT = _FCREAT;
pub const FTRUNC = _FTRUNC;
pub const FEXCL = _FEXCL;
pub const FNOCTTY = _FNOCTTY;
pub const FNONBLOCK = _FNONBLOCK;
pub const FD_CLOEXEC = @as(c_int, 1);
pub const F_DUPFD = @as(c_int, 0);
pub const F_GETFD = @as(c_int, 1);
pub const F_SETFD = @as(c_int, 2);
pub const F_GETFL = @as(c_int, 3);
pub const F_SETFL = @as(c_int, 4);
pub const F_GETOWN = @as(c_int, 5);
pub const F_SETOWN = @as(c_int, 6);
pub const F_GETLK = @as(c_int, 7);
pub const F_SETLK = @as(c_int, 8);
pub const F_SETLKW = @as(c_int, 9);
pub const F_RGETLK = @as(c_int, 10);
pub const F_RSETLK = @as(c_int, 11);
pub const F_CNVT = @as(c_int, 12);
pub const F_RSETLKW = @as(c_int, 13);
pub const F_DUPFD_CLOEXEC = @as(c_int, 14);
pub const F_RDLCK = @as(c_int, 1);
pub const F_WRLCK = @as(c_int, 2);
pub const F_UNLCK = @as(c_int, 3);
pub const F_UNLKSYS = @as(c_int, 4);
pub const AT_FDCWD = -@as(c_int, 2);
pub const AT_EACCESS = @as(c_int, 1);
pub const AT_SYMLINK_NOFOLLOW = @as(c_int, 2);
pub const AT_SYMLINK_FOLLOW = @as(c_int, 4);
pub const AT_REMOVEDIR = @as(c_int, 8);
pub const LOCK_SH = @as(c_int, 0x01);
pub const LOCK_EX = @as(c_int, 0x02);
pub const LOCK_NB = @as(c_int, 0x04);
pub const LOCK_UN = @as(c_int, 0x08);
pub const _SYS_STAT_H = "";
pub const _TIME_H_ = "";
pub const _MACHTIME_H_ = "";
pub const _CLOCKS_PER_SEC_ = @as(c_int, 1000);
pub const CLOCKS_PER_SEC = _CLOCKS_PER_SEC_;
pub const CLK_TCK = CLOCKS_PER_SEC;
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/time.h:142:9: warning: macro 'tzname' contains a runtime value, translated to function
pub inline fn tzname() @TypeOf(_tzname) {
    return _tzname;
}
pub const _SIGNAL_H_ = "";
pub const _SYS_SIGNAL_H = "";
pub const SIGEV_NONE = @as(c_int, 1);
pub const SIGEV_SIGNAL = @as(c_int, 2);
pub const SIGEV_THREAD = @as(c_int, 3);
pub const SI_USER = @as(c_int, 1);
pub const SI_QUEUE = @as(c_int, 2);
pub const SI_TIMER = @as(c_int, 3);
pub const SI_ASYNCIO = @as(c_int, 4);
pub const SI_MESGQ = @as(c_int, 5);
pub const SA_NOCLDSTOP = @as(c_int, 1);
pub const MINSIGSTKSZ = @as(c_int, 2048);
pub const SIGSTKSZ = @as(c_int, 8192);
pub const SS_ONSTACK = @as(c_int, 0x1);
pub const SS_DISABLE = @as(c_int, 0x2);
pub const SIG_SETMASK = @as(c_int, 0);
pub const SIG_BLOCK = @as(c_int, 1);
pub const SIG_UNBLOCK = @as(c_int, 2);
pub const SIG2STR_MAX = @compileError("unable to translate C expr: unexpected token 'a string literal'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/signal.h:248:9
pub const SIGHUP = @as(c_int, 1);
pub const SIGINT = @as(c_int, 2);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGILL = @as(c_int, 4);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGIOT = @as(c_int, 6);
pub const SIGABRT = @as(c_int, 6);
pub const SIGEMT = @as(c_int, 7);
pub const SIGFPE = @as(c_int, 8);
pub const SIGKILL = @as(c_int, 9);
pub const SIGBUS = @as(c_int, 10);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGSYS = @as(c_int, 12);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGTERM = @as(c_int, 15);
pub const SIGURG = @as(c_int, 16);
pub const SIGSTOP = @as(c_int, 17);
pub const SIGTSTP = @as(c_int, 18);
pub const SIGCONT = @as(c_int, 19);
pub const SIGCHLD = @as(c_int, 20);
pub const SIGCLD = @as(c_int, 20);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGIO = @as(c_int, 23);
pub const SIGPOLL = SIGIO;
pub const SIGXCPU = @as(c_int, 24);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGWINCH = @as(c_int, 28);
pub const SIGLOST = @as(c_int, 29);
pub const SIGUSR1 = @as(c_int, 30);
pub const SIGUSR2 = @as(c_int, 31);
pub const NSIG = @as(c_int, 32);
pub const SIG_DFL = @import("std").zig.c_translation.cast(_sig_func_ptr, @as(c_int, 0));
pub const SIG_IGN = @import("std").zig.c_translation.cast(_sig_func_ptr, @as(c_int, 1));
pub const SIG_ERR = @import("std").zig.c_translation.cast(_sig_func_ptr, -@as(c_int, 1));
pub const CLOCK_ENABLED = @as(c_int, 1);
pub const CLOCK_DISABLED = @as(c_int, 0);
pub const CLOCK_ALLOWED = @as(c_int, 1);
pub const CLOCK_DISALLOWED = @as(c_int, 0);
pub const TIMER_ABSTIME = @as(c_int, 4);
pub const CLOCK_REALTIME = @import("std").zig.c_translation.cast(clockid_t, @as(c_int, 1));
pub const CLOCK_MONOTONIC = @import("std").zig.c_translation.cast(clockid_t, @as(c_int, 4));
pub const st_atime = @compileError("unable to translate macro: undefined identifier `st_atim`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/stat.h:54:9
pub const st_ctime = @compileError("unable to translate macro: undefined identifier `st_ctim`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/stat.h:55:9
pub const st_mtime = @compileError("unable to translate macro: undefined identifier `st_mtim`");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/sys/stat.h:56:9
pub const _IFMT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o170000, .octal);
pub const _IFDIR = @as(c_int, 0o040000);
pub const _IFCHR = @as(c_int, 0o020000);
pub const _IFBLK = @as(c_int, 0o060000);
pub const _IFREG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const _IFLNK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o120000, .octal);
pub const _IFSOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o140000, .octal);
pub const _IFIFO = @as(c_int, 0o010000);
pub const S_BLKSIZE = @as(c_int, 1024);
pub const S_ISUID = @as(c_int, 0o004000);
pub const S_ISGID = @as(c_int, 0o002000);
pub const S_ISVTX = @as(c_int, 0o001000);
pub const S_IREAD = @as(c_int, 0o000400);
pub const S_IWRITE = @as(c_int, 0o000200);
pub const S_IEXEC = @as(c_int, 0o000100);
pub const S_ENFMT = @as(c_int, 0o002000);
pub const S_IFMT = _IFMT;
pub const S_IFDIR = _IFDIR;
pub const S_IFCHR = _IFCHR;
pub const S_IFBLK = _IFBLK;
pub const S_IFREG = _IFREG;
pub const S_IFLNK = _IFLNK;
pub const S_IFSOCK = _IFSOCK;
pub const S_IFIFO = _IFIFO;
pub const S_IRWXU = (S_IRUSR | S_IWUSR) | S_IXUSR;
pub const S_IRUSR = @as(c_int, 0o000400);
pub const S_IWUSR = @as(c_int, 0o000200);
pub const S_IXUSR = @as(c_int, 0o000100);
pub const S_IRWXG = (S_IRGRP | S_IWGRP) | S_IXGRP;
pub const S_IRGRP = @as(c_int, 0o000040);
pub const S_IWGRP = @as(c_int, 0o000020);
pub const S_IXGRP = @as(c_int, 0o000010);
pub const S_IRWXO = (S_IROTH | S_IWOTH) | S_IXOTH;
pub const S_IROTH = @as(c_int, 0o000004);
pub const S_IWOTH = @as(c_int, 0o000002);
pub const S_IXOTH = @as(c_int, 0o000001);
pub const ACCESSPERMS = (S_IRWXU | S_IRWXG) | S_IRWXO;
pub const ALLPERMS = ((((S_ISUID | S_ISGID) | S_ISVTX) | S_IRWXU) | S_IRWXG) | S_IRWXO;
pub const DEFFILEMODE = ((((S_IRUSR | S_IWUSR) | S_IRGRP) | S_IWGRP) | S_IROTH) | S_IWOTH;
pub inline fn S_ISBLK(m: anytype) @TypeOf((m & _IFMT) == _IFBLK) {
    _ = &m;
    return (m & _IFMT) == _IFBLK;
}
pub inline fn S_ISCHR(m: anytype) @TypeOf((m & _IFMT) == _IFCHR) {
    _ = &m;
    return (m & _IFMT) == _IFCHR;
}
pub inline fn S_ISDIR(m: anytype) @TypeOf((m & _IFMT) == _IFDIR) {
    _ = &m;
    return (m & _IFMT) == _IFDIR;
}
pub inline fn S_ISFIFO(m: anytype) @TypeOf((m & _IFMT) == _IFIFO) {
    _ = &m;
    return (m & _IFMT) == _IFIFO;
}
pub inline fn S_ISREG(m: anytype) @TypeOf((m & _IFMT) == _IFREG) {
    _ = &m;
    return (m & _IFMT) == _IFREG;
}
pub inline fn S_ISLNK(m: anytype) @TypeOf((m & _IFMT) == _IFLNK) {
    _ = &m;
    return (m & _IFMT) == _IFLNK;
}
pub inline fn S_ISSOCK(m: anytype) @TypeOf((m & _IFMT) == _IFSOCK) {
    _ = &m;
    return (m & _IFMT) == _IFSOCK;
}
pub const _ESP_PLATFORM_SYS_POLL_H_ = "";
pub const POLLIN = @as(c_uint, 1) << @as(c_int, 0);
pub const POLLRDNORM = @as(c_uint, 1) << @as(c_int, 1);
pub const POLLRDBAND = @as(c_uint, 1) << @as(c_int, 2);
pub const POLLPRI = POLLRDBAND;
pub const POLLOUT = @as(c_uint, 1) << @as(c_int, 3);
pub const POLLWRNORM = POLLOUT;
pub const POLLWRBAND = @as(c_uint, 1) << @as(c_int, 4);
pub const POLLERR = @as(c_uint, 1) << @as(c_int, 5);
pub const POLLHUP = @as(c_uint, 1) << @as(c_int, 6);
pub const POLLNVAL = @as(c_uint, 1) << @as(c_int, 7);
pub const _ESP_TASK_H_ = "";
pub const ESP_TASK_PRIO_MAX = configMAX_PRIORITIES;
pub const ESP_TASK_PRIO_MIN = @as(c_int, 0);
pub const ESP_TASK_BT_CONTROLLER_PRIO = ESP_TASK_PRIO_MAX - @as(c_int, 2);
pub const TASK_EXTRA_STACK_SIZE = @as(c_int, 512);
pub const BT_TASK_EXTRA_STACK_SIZE = TASK_EXTRA_STACK_SIZE;
pub const ESP_TASK_BT_CONTROLLER_STACK = @as(c_int, 3584) + TASK_EXTRA_STACK_SIZE;
pub const ESP_TASK_PING_STACK = @as(c_int, 2048) + TASK_EXTRA_STACK_SIZE;
pub const ESP_TASK_TIMER_PRIO = ESP_TASK_PRIO_MAX - @as(c_int, 3);
pub const ESP_TASK_TIMER_STACK = CONFIG_ESP_TIMER_TASK_STACK_SIZE + TASK_EXTRA_STACK_SIZE;
pub const ESP_TASKD_EVENT_PRIO = ESP_TASK_PRIO_MAX - @as(c_int, 5);
pub const ESP_TASKD_EVENT_STACK = CONFIG_ESP_SYSTEM_EVENT_TASK_STACK_SIZE + TASK_EXTRA_STACK_SIZE;
pub const ESP_TASK_TCPIP_PRIO = CONFIG_LWIP_TCPIP_TASK_PRIO;
pub const ESP_TASK_TCPIP_STACK = CONFIG_LWIP_TCPIP_TASK_STACK_SIZE + TASK_EXTRA_STACK_SIZE;
pub const ESP_TASK_MAIN_PRIO = ESP_TASK_PRIO_MIN + @as(c_int, 1);
pub const ESP_TASK_MAIN_STACK = CONFIG_ESP_MAIN_TASK_STACK_SIZE + TASK_EXTRA_STACK_SIZE;
pub const ESP_TASK_MAIN_CORE = CONFIG_ESP_MAIN_TASK_AFFINITY;
pub const __ESP_RANDOM_H__ = "";
pub const __SNTP_GET_SET_TIME_H__ = "";
pub const IPV6_MULTICAST_IF = @as(c_int, 0x300);
pub const IPV6_MULTICAST_HOPS = @as(c_int, 0x301);
pub const IPV6_MULTICAST_LOOP = @as(c_int, 0x302);
pub const __SYS_ARCH_H__ = "";
pub const ERR_NEED_SCHED = @as(c_int, 123);
pub inline fn sys_msleep(ms: anytype) @TypeOf(sys_delay_ms(ms)) {
    _ = &ms;
    return sys_delay_ms(ms);
}
pub const LWIP_COMPAT_MUTEX = @as(c_int, 0);
pub inline fn sys_mutex_valid(x: anytype) @TypeOf(if (x.* == NULL) pdFALSE else pdTRUE) {
    _ = &x;
    return if (x.* == NULL) pdFALSE else pdTRUE;
}
pub const sys_mutex_set_invalid = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/port/freertos/include/arch/sys_arch.h:42:9
pub inline fn sys_mbox_valid(x: anytype) @TypeOf(if (x.* == NULL) pdFALSE else pdTRUE) {
    _ = &x;
    return if (x.* == NULL) pdFALSE else pdTRUE;
}
pub const sys_mbox_set_invalid = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/lwip/port/freertos/include/arch/sys_arch.h:64:9
pub inline fn sys_sem_valid(x: anytype) @TypeOf(if (x.* == NULL) pdFALSE else pdTRUE) {
    _ = &x;
    return if (x.* == NULL) pdFALSE else pdTRUE;
}
pub const sys_sem_set_invalid = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/port/freertos/include/arch/sys_arch.h:67:9
pub const LWIP_TCPIP_CORE_LOCKING = @as(c_int, 0);
pub const LWIP_TCPIP_CORE_LOCKING_INPUT = @as(c_int, 0);
pub inline fn LWIP_MARK_TCPIP_THREAD() @TypeOf(sys_thread_tcpip(LWIP_CORE_MARK_TCPIP_TASK)) {
    return sys_thread_tcpip(LWIP_CORE_MARK_TCPIP_TASK);
}
pub const SYS_LIGHTWEIGHT_PROT = @as(c_int, 1);
pub inline fn MEMCPY(dst: anytype, src: anytype, len: anytype) @TypeOf(memcpy(dst, src, len)) {
    _ = &dst;
    _ = &src;
    _ = &len;
    return memcpy(dst, src, len);
}
pub inline fn SMEMCPY(dst: anytype, src: anytype, len: anytype) @TypeOf(memcpy(dst, src, len)) {
    _ = &dst;
    _ = &src;
    _ = &len;
    return memcpy(dst, src, len);
}
pub const LWIP_RAND = esp_random;
pub const MEM_LIBC_MALLOC = @as(c_int, 1);
pub const MEMP_MEM_MALLOC = @as(c_int, 1);
pub const MEM_ALIGNMENT = @as(c_int, 4);
pub const MEMP_NUM_NETCONN = CONFIG_LWIP_MAX_SOCKETS;
pub const MEMP_NUM_RAW_PCB = CONFIG_LWIP_MAX_RAW_PCBS;
pub const MEMP_NUM_TCP_PCB = CONFIG_LWIP_MAX_ACTIVE_TCP;
pub const MEMP_NUM_TCP_PCB_LISTEN = CONFIG_LWIP_MAX_LISTENING_TCP;
pub const MEMP_NUM_UDP_PCB = CONFIG_LWIP_MAX_UDP_PCBS;
pub const ARP_QUEUEING = @as(c_int, 1);
pub const ETHARP_SUPPORT_STATIC_ENTRIES = @as(c_int, 1);
pub const LWIP_IPV4 = @as(c_int, 1);
pub const IP_REASSEMBLY = @as(c_int, 0);
pub const IP_FRAG = @as(c_int, 1);
pub const IP_FORWARD = @as(c_int, 0);
pub const IP_NAPT = @as(c_int, 0);
pub const IP_REASS_MAXAGE = @as(c_int, 3);
pub const IP_REASS_MAX_PBUFS = CONFIG_LWIP_IP_REASS_MAX_PBUFS;
pub const IP_DEFAULT_TTL = CONFIG_LWIP_IP_DEFAULT_TTL;
pub const LWIP_ICMP = @as(c_int, 1);
pub const LWIP_BROADCAST_PING = @as(c_int, 0);
pub const LWIP_MULTICAST_PING = @as(c_int, 0);
pub const LWIP_RAW = @as(c_int, 1);
pub const LWIP_DHCP = @as(c_int, 1);
pub const DHCP_DOES_ARP_CHECK = @as(c_int, 1);
pub const LWIP_DHCP_GET_NTP_SRV = @as(c_int, 0);
pub const ESP_DHCP_DISABLE_CLIENT_ID = @as(c_int, 0);
pub inline fn LWIP_HOOK_DHCP_PRE_DISCOVERY(netif_1: anytype, result: anytype) @TypeOf(@"false") {
    _ = &netif_1;
    _ = &result;
    return @"false";
}
pub const LWIP_DHCP_MAX_NTP_SERVERS = @compileError("unable to translate macro: undefined identifier `CONFIG_LWIP_DHCP_MAX_NTP_SERVERS`");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:365:9
pub const DHCP_OPTIONS_LEN = CONFIG_LWIP_DHCP_OPTIONS_LEN;
pub const ESP_DHCP_DISABLE_VENDOR_CLASS_IDENTIFIER = CONFIG_LWIP_DHCP_DISABLE_VENDOR_CLASS_ID;
pub const DHCP_DEFINE_CUSTOM_TIMEOUTS = @as(c_int, 1);
pub const DHCP_COARSE_TIMER_SECS = CONFIG_LWIP_DHCP_COARSE_TIMER_SECS;
pub const DHCP_NEXT_TIMEOUT_THRESHOLD = @as(c_int, 3);
pub inline fn DHCP_REQUEST_TIMEOUT_SEQUENCE(tries: anytype) u16 {
    _ = &tries;
    return @import("std").zig.c_translation.cast(u16, (if (tries < @as(c_int, 5)) @as(c_int, 1) << tries else @as(c_int, 16)) * @as(c_int, 250));
}
pub inline fn DHCP_CALC_TIMEOUT_FROM_OFFERED_T0_LEASE(dhcp: anytype) @TypeOf(timeout_from_offered(dhcp.*.offered_t0_lease, @as(c_int, 120))) {
    _ = &dhcp;
    return timeout_from_offered(dhcp.*.offered_t0_lease, @as(c_int, 120));
}
pub inline fn DHCP_CALC_TIMEOUT_FROM_OFFERED_T1_RENEW(dhcp: anytype) @TypeOf(timeout_from_offered(dhcp.*.offered_t1_renew, dhcp.*.t0_timeout >> @as(c_int, 1))) {
    _ = &dhcp;
    return timeout_from_offered(dhcp.*.offered_t1_renew, dhcp.*.t0_timeout >> @as(c_int, 1));
}
pub inline fn DHCP_CALC_TIMEOUT_FROM_OFFERED_T2_REBIND(dhcp: anytype) @TypeOf(timeout_from_offered(dhcp.*.offered_t2_rebind, @import("std").zig.c_translation.MacroArithmetic.div(dhcp.*.t0_timeout, @as(c_int, 8)) * @as(c_int, 7))) {
    _ = &dhcp;
    return timeout_from_offered(dhcp.*.offered_t2_rebind, @import("std").zig.c_translation.MacroArithmetic.div(dhcp.*.t0_timeout, @as(c_int, 8)) * @as(c_int, 7));
}
pub const LWIP_HOOK_DHCP_PARSE_OPTION = @compileError("unable to translate macro: undefined identifier `dhcp_parse_extra_opts`");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:403:9
pub const LWIP_HOOK_DHCP_APPEND_OPTIONS = @compileError("unable to translate macro: undefined identifier `dhcp_append_extra_opts`");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:408:9
pub const LWIP_IGMP = @as(c_int, 1);
pub const LWIP_DNS = @as(c_int, 1);
pub const DNS_MAX_SERVERS = CONFIG_LWIP_DNS_MAX_SERVERS;
pub const DNS_FALLBACK_SERVER_INDEX = DNS_MAX_SERVERS - @as(c_int, 1);
pub const LWIP_DNS_SUPPORT_MDNS_QUERIES = @as(c_int, 1);
pub const LWIP_UDP = @as(c_int, 1);
pub const LWIP_NETBUF_RECVINFO = @as(c_int, 0);
pub const LWIP_TCP = @as(c_int, 1);
pub const TCP_WND = CONFIG_LWIP_TCP_WND_DEFAULT;
pub const TCP_MAXRTX = CONFIG_LWIP_TCP_MAXRTX;
pub const TCP_SYNMAXRTX = CONFIG_LWIP_TCP_SYNMAXRTX;
pub const TCP_QUEUE_OOSEQ = @as(c_int, 1);
pub const TCP_OOSEQ_MAX_PBUFS = CONFIG_LWIP_TCP_OOSEQ_MAX_PBUFS;
pub const TCP_OOSEQ_TIMEOUT = CONFIG_LWIP_TCP_OOSEQ_TIMEOUT;
pub const LWIP_TCP_SACK_OUT = @as(c_int, 0);
pub const TCP_MSS = CONFIG_LWIP_TCP_MSS;
pub const TCP_SND_BUF = CONFIG_LWIP_TCP_SND_BUF_DEFAULT;
pub const TCP_LISTEN_BACKLOG = @as(c_int, 1);
pub const TCP_OVERSIZE = TCP_MSS;
pub const LWIP_EVENT_API = @as(c_int, 0);
pub const LWIP_CALLBACK_API = @as(c_int, 1);
pub const TCP_TMR_INTERVAL = CONFIG_LWIP_TCP_TMR_INTERVAL;
pub const TCP_MSL = CONFIG_LWIP_TCP_MSL;
pub const TCP_FIN_WAIT_TIMEOUT = CONFIG_LWIP_TCP_FIN_WAIT_TIMEOUT;
pub const LWIP_WND_SCALE = @as(c_int, 0);
pub const TCP_RCV_SCALE = @as(c_int, 0);
pub const LWIP_TCP_RTO_TIME = CONFIG_LWIP_TCP_RTO_TIME;
pub const LWIP_NETIF_HOSTNAME = @as(c_int, 1);
pub const LWIP_NETIF_API = @as(c_int, 0);
pub const LWIP_NETIF_STATUS_CALLBACK = @as(c_int, 0);
pub const LWIP_NETIF_EXT_STATUS_CALLBACK = @as(c_int, 1);
pub const LWIP_NETIF_TX_SINGLE_PBUF = @as(c_int, 1);
pub const LWIP_ESP_NETIF_DATA = @as(c_int, 0);
pub const LWIP_NUM_NETIF_CLIENT_DATA = LWIP_ESP_NETIF_DATA + CONFIG_LWIP_NUM_NETIF_CLIENT_DATA;
pub const BRIDGEIF_MAX_PORTS = CONFIG_LWIP_BRIDGEIF_MAX_PORTS;
pub const LWIP_HAVE_LOOPIF = @as(c_int, 1);
pub const LWIP_NETIF_LOOPBACK = @as(c_int, 1);
pub const LWIP_LOOPBACK_MAX_PBUFS = CONFIG_LWIP_LOOPBACK_MAX_PBUFS;
pub const TCPIP_THREAD_NAME = "tiT";
pub const TCPIP_THREAD_STACKSIZE = ESP_TASK_TCPIP_STACK;
pub const TCPIP_THREAD_PRIO = ESP_TASK_TCPIP_PRIO;
pub const TCPIP_MBOX_SIZE = CONFIG_LWIP_TCPIP_RECVMBOX_SIZE;
pub const DEFAULT_UDP_RECVMBOX_SIZE = CONFIG_LWIP_UDP_RECVMBOX_SIZE;
pub const DEFAULT_TCP_RECVMBOX_SIZE = CONFIG_LWIP_TCP_RECVMBOX_SIZE;
pub const DEFAULT_ACCEPTMBOX_SIZE = CONFIG_LWIP_TCP_ACCEPTMBOX_SIZE;
pub const DEFAULT_THREAD_STACKSIZE = TCPIP_THREAD_STACKSIZE;
pub const DEFAULT_THREAD_PRIO = TCPIP_THREAD_PRIO;
pub const DEFAULT_RAW_RECVMBOX_SIZE = @as(c_int, 6);
pub const LWIP_NETCONN = @as(c_int, 1);
pub const LWIP_NETCONN_SEM_PER_THREAD = @as(c_int, 1);
pub const LWIP_NETCONN_FULLDUPLEX = @as(c_int, 1);
pub const LWIP_SOCKET = @as(c_int, 1);
pub const LWIP_COMPAT_SOCKETS = @as(c_int, 0);
pub const LWIP_POSIX_SOCKETS_IO_NAMES = @as(c_int, 0);
pub const LWIP_SOCKET_OFFSET = FD_SETSIZE - CONFIG_LWIP_MAX_SOCKETS;
pub const LWIP_SO_SNDTIMEO = @as(c_int, 1);
pub const LWIP_SO_RCVTIMEO = @as(c_int, 1);
pub const LWIP_TCP_KEEPALIVE = @as(c_int, 1);
pub const LWIP_SO_LINGER = @as(c_int, 0);
pub const LWIP_SO_RCVBUF = @as(c_int, 0);
pub const SO_REUSE = @as(c_int, 1);
pub const SO_REUSE_RXTOALL = @as(c_int, 1);
pub const LWIP_TIMEVAL_PRIVATE = @as(c_int, 0);
pub const LWIP_STATS = @as(c_int, 0);
pub const ESP_STATS_MEM = @as(c_int, 0);
pub const PPP_SUPPORT = @as(c_int, 0);
pub const CHECKSUM_CHECK_IP = @as(c_int, 0);
pub const CHECKSUM_CHECK_UDP = @as(c_int, 0);
pub const CHECKSUM_CHECK_ICMP = @as(c_int, 1);
pub const LWIP_IPV6 = @as(c_int, 1);
pub const LWIP_ND6 = @as(c_int, 1);
pub const LWIP_FORCE_ROUTER_FORWARDING = @as(c_int, 0);
pub const LWIP_IPV6_NUM_ADDRESSES = CONFIG_LWIP_IPV6_NUM_ADDRESSES;
pub const LWIP_IPV6_FORWARD = @as(c_int, 0);
pub const LWIP_IPV6_FRAG = @as(c_int, 1);
pub const LWIP_IPV6_REASS = @as(c_int, 0);
pub const ESP_IPV6_AUTOCONFIG = @as(c_int, 0);
pub const LWIP_ND6_RDNSS_MAX_DNS_SERVERS = @compileError("unable to translate macro: undefined identifier `CONFIG_LWIP_IPV6_RDNSS_MAX_DNS_SERVERS`");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:1255:9
pub const LWIP_IPV6_DHCP6 = @as(c_int, 0);
pub const MEMP_NUM_ND6_QUEUE = CONFIG_LWIP_IPV6_MEMP_NUM_ND6_QUEUE;
pub const LWIP_ND6_NUM_NEIGHBORS = CONFIG_LWIP_IPV6_ND6_NUM_NEIGHBORS;
pub const LWIP_HOOK_FILENAME = "lwip_default_hooks.h";
pub const LWIP_HOOK_IP4_ROUTE_SRC = @compileError("unable to translate macro: undefined identifier `ip4_route_src_hook`");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:1285:9
pub const LWIP_DONE_SOCK = @compileError("unable to translate macro: undefined identifier `done_socket`");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:1287:9
pub inline fn LWIP_HOOK_SOCKETS_GETSOCKOPT(s: anytype, sock: anytype, level: anytype, optname: anytype, optval: anytype, optlen: anytype, err: anytype) @TypeOf(if (lwip_getsockopt_impl_ext(sock, level, optname, optval, optlen, err))
blk_1: {
    _ = LWIP_DONE_SOCK(sock);
    break :blk_1 @"true";
} else @"false") {
    _ = &s;
    _ = &sock;
    _ = &level;
    _ = &optname;
    _ = &optval;
    _ = &optlen;
    _ = &err;
    return if (lwip_getsockopt_impl_ext(sock, level, optname, optval, optlen, err)) blk_1: {
        _ = LWIP_DONE_SOCK(sock);
        break :blk_1 @"true";
    } else @"false";
}
pub inline fn LWIP_HOOK_SOCKETS_SETSOCKOPT(s: anytype, sock: anytype, level: anytype, optname: anytype, optval: anytype, optlen: anytype, err: anytype) @TypeOf(if (lwip_setsockopt_impl_ext(sock, level, optname, optval, optlen, err))
blk_1: {
    _ = LWIP_DONE_SOCK(sock);
    break :blk_1 @"true";
} else @"false") {
    _ = &s;
    _ = &sock;
    _ = &level;
    _ = &optname;
    _ = &optval;
    _ = &optlen;
    _ = &err;
    return if (lwip_setsockopt_impl_ext(sock, level, optname, optval, optlen, err)) blk_1: {
        _ = LWIP_DONE_SOCK(sock);
        break :blk_1 @"true";
    } else @"false";
}
pub const ETHARP_DEBUG = LWIP_DBG_OFF;
pub const NETIF_DEBUG = LWIP_DBG_OFF;
pub const PBUF_DEBUG = LWIP_DBG_OFF;
pub const API_LIB_DEBUG = LWIP_DBG_OFF;
pub const SOCKETS_DEBUG = LWIP_DBG_OFF;
pub const ICMP_DEBUG = LWIP_DBG_OFF;
pub const ICMP6_DEBUG = LWIP_DBG_OFF;
pub const DHCP_DEBUG = LWIP_DBG_OFF;
pub const ESP_DHCP_DEBUG = LWIP_DBG_OFF;
pub const IP_DEBUG = LWIP_DBG_OFF;
pub const IP6_DEBUG = LWIP_DBG_OFF;
pub const TCP_DEBUG = LWIP_DBG_OFF;
pub const UDP_DEBUG = LWIP_DBG_OFF;
pub const SNTP_DEBUG = LWIP_DBG_OFF;
pub const DNS_DEBUG = LWIP_DBG_OFF;
pub const NAPT_DEBUG = LWIP_DBG_OFF;
pub const MEMP_DEBUG = LWIP_DBG_OFF;
pub const TCP_INPUT_DEBUG = LWIP_DBG_OFF;
pub const TCP_OUTPUT_DEBUG = LWIP_DBG_OFF;
pub const TCPIP_DEBUG = LWIP_DBG_OFF;
pub const TCP_OOSEQ_DEBUG = LWIP_DBG_OFF;
pub const SNTP_MAX_SERVERS = CONFIG_LWIP_SNTP_MAX_SERVERS;
pub const SNTP_SERVER_DNS = @as(c_int, 1);
pub const SNTP_SUPPRESS_DELAY_CHECK = "";
pub const SNTP_UPDATE_DELAY = sntp_get_sync_interval();
pub inline fn SNTP_SET_SYSTEM_TIME_US(sec: anytype, us: anytype) @TypeOf(sntp_set_system_time(sec, us)) {
    _ = &sec;
    _ = &us;
    return sntp_set_system_time(sec, us);
}
pub inline fn SNTP_GET_SYSTEM_TIME(sec: anytype, us: anytype) @TypeOf(sntp_get_system_time(&sec, &us)) {
    _ = &sec;
    _ = &us;
    return sntp_get_system_time(&sec, &us);
}
pub const SNTP_STARTUP_DELAY = @as(c_int, 1);
pub const SNTP_STARTUP_DELAY_FUNC = @import("std").zig.c_translation.MacroArithmetic.rem(LWIP_RAND(), CONFIG_LWIP_SNTP_MAXIMUM_STARTUP_DELAY);
pub const ESP_LWIP_IGMP_TIMERS_ONDEMAND = @as(c_int, 1);
pub const ESP_LWIP_MLD6_TIMERS_ONDEMAND = @as(c_int, 1);
pub const ESP_LWIP_DHCP_FINE_TIMERS_ONDEMAND = @as(c_int, 1);
pub const ESP_LWIP_DNS_TIMERS_ONDEMAND = @as(c_int, 1);
pub const ESP_GRATUITOUS_ARP = @as(c_int, 1);
pub const ESP_GRATUITOUS_ARP_INTERVAL = CONFIG_LWIP_GARP_TMR_INTERVAL * @as(c_ulong, 1000);
pub const ESP_MLDV6_REPORT = @as(c_int, 1);
pub const ESP_LWIP = @as(c_int, 1);
pub const ESP_LWIP_ARP = @as(c_int, 1);
pub const ESP_PER_SOC_TCP_WND = @as(c_int, 0);
pub const ESP_THREAD_SAFE = @as(c_int, 1);
pub const ESP_THREAD_SAFE_DEBUG = LWIP_DBG_OFF;
pub const ESP_DHCP = @as(c_int, 1);
pub const ESP_DNS = @as(c_int, 1);
pub const ESP_STATS_TCP = @as(c_int, 0);
pub const ESP_LWIP_LOGI = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /home/wiiggee1/esp-idf/components/lwip/port/include/lwipopts.h:1596:9
pub const ESP_PING = @as(c_int, 1);
pub const ESP_HAS_SELECT = @as(c_int, 1);
pub const ESP_IP4_ROUTE = @as(c_int, 1);
pub const ESP_AUTO_IP = @as(c_int, 1);
pub const ESP_PBUF = @as(c_int, 1);
pub const ESP_PPP = @as(c_int, 1);
pub const ESP_IPV6 = LWIP_IPV6;
pub const ESP_SOCKET = @as(c_int, 1);
pub const ESP_LWIP_SELECT = @as(c_int, 1);
pub const ESP_LWIP_LOCK = @as(c_int, 1);
pub const ESP_THREAD_PROTECTION = @as(c_int, 1);
pub const LWIP_SUPPORT_CUSTOM_PBUF = @as(c_int, 1);
pub const ESP_LWIP_FALLBACK_DNS_PREFER_IPV4 = @as(c_int, 0);
pub const ESP_DHCPS = @as(c_int, 1);
pub const ESP_DHCPS_TIMER = @as(c_int, 0);
pub inline fn LWIP_NETCONN_THREAD_SEM_GET() @TypeOf(sys_thread_sem_get()) {
    return sys_thread_sem_get();
}
pub inline fn LWIP_NETCONN_THREAD_SEM_ALLOC() @TypeOf(sys_thread_sem_init()) {
    return sys_thread_sem_init();
}
pub inline fn LWIP_NETCONN_THREAD_SEM_FREE() @TypeOf(sys_thread_sem_deinit()) {
    return sys_thread_sem_deinit();
}
pub const mem_clib_malloc = malloc;
pub const mem_clib_calloc = calloc;
pub const LWIP_HDR_DEBUG_H = "";
pub const LWIP_HDR_ARCH_H = "";
pub const __ARCH_CC_H__ = "";
pub const __ERRNO_H__ = "";
pub const __error_t_defined = @as(c_int, 1);
pub const _SYS_ERRNO_H_ = "";
pub const errno = __errno().*;
pub inline fn __errno_r(ptr: anytype) @TypeOf(_REENT_ERRNO(ptr)) {
    _ = &ptr;
    return _REENT_ERRNO(ptr);
}
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EAGAIN = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const ENOMSG = @as(c_int, 35);
pub const EIDRM = @as(c_int, 36);
pub const EDEADLK = @as(c_int, 45);
pub const ENOLCK = @as(c_int, 46);
pub const ENOSTR = @as(c_int, 60);
pub const ENODATA = @as(c_int, 61);
pub const ETIME = @as(c_int, 62);
pub const ENOSR = @as(c_int, 63);
pub const ENOLINK = @as(c_int, 67);
pub const EPROTO = @as(c_int, 71);
pub const EMULTIHOP = @as(c_int, 74);
pub const EBADMSG = @as(c_int, 77);
pub const EFTYPE = @as(c_int, 79);
pub const ENOSYS = @as(c_int, 88);
pub const ENOTEMPTY = @as(c_int, 90);
pub const ENAMETOOLONG = @as(c_int, 91);
pub const ELOOP = @as(c_int, 92);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const EPFNOSUPPORT = @as(c_int, 96);
pub const ECONNRESET = @as(c_int, 104);
pub const ENOBUFS = @as(c_int, 105);
pub const EAFNOSUPPORT = @as(c_int, 106);
pub const EPROTOTYPE = @as(c_int, 107);
pub const ENOTSOCK = @as(c_int, 108);
pub const ENOPROTOOPT = @as(c_int, 109);
pub const ECONNREFUSED = @as(c_int, 111);
pub const EADDRINUSE = @as(c_int, 112);
pub const ECONNABORTED = @as(c_int, 113);
pub const ENETUNREACH = @as(c_int, 114);
pub const ENETDOWN = @as(c_int, 115);
pub const ETIMEDOUT = @as(c_int, 116);
pub const EHOSTDOWN = @as(c_int, 117);
pub const EHOSTUNREACH = @as(c_int, 118);
pub const EINPROGRESS = @as(c_int, 119);
pub const EALREADY = @as(c_int, 120);
pub const EDESTADDRREQ = @as(c_int, 121);
pub const EMSGSIZE = @as(c_int, 122);
pub const EPROTONOSUPPORT = @as(c_int, 123);
pub const EADDRNOTAVAIL = @as(c_int, 125);
pub const ENETRESET = @as(c_int, 126);
pub const EISCONN = @as(c_int, 127);
pub const ENOTCONN = @as(c_int, 128);
pub const ETOOMANYREFS = @as(c_int, 129);
pub const EDQUOT = @as(c_int, 132);
pub const ESTALE = @as(c_int, 133);
pub const ENOTSUP = @as(c_int, 134);
pub const EILSEQ = @as(c_int, 138);
pub const EOVERFLOW = @as(c_int, 139);
pub const ECANCELED = @as(c_int, 140);
pub const ENOTRECOVERABLE = @as(c_int, 141);
pub const EOWNERDEAD = @as(c_int, 142);
pub const EWOULDBLOCK = EAGAIN;
pub const __ELASTERROR = @as(c_int, 2000);
pub const LWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS = "";
pub inline fn htons(x: anytype) @TypeOf(__builtin_bswap16(x)) {
    _ = &x;
    return __builtin_bswap16(x);
}
pub inline fn ntohs(x: anytype) @TypeOf(__builtin_bswap16(x)) {
    _ = &x;
    return __builtin_bswap16(x);
}
pub inline fn htonl(x: anytype) @TypeOf(__builtin_bswap32(x)) {
    _ = &x;
    return __builtin_bswap32(x);
}
pub inline fn ntohl(x: anytype) @TypeOf(__builtin_bswap32(x)) {
    _ = &x;
    return __builtin_bswap32(x);
}
pub const S16_F = "d";
pub const U16_F = "d";
pub const X16_F = "x";
pub const S32_F = PRId32;
pub const U32_F = PRIu32;
pub const X32_F = PRIx32;
pub inline fn PACK_STRUCT_FIELD(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const PACK_STRUCT_STRUCT = @compileError("unable to translate macro: undefined identifier `packed`");
// /home/wiiggee1/esp-idf/components/lwip/port/esp32xx/include/arch/cc.h:56:9
pub const PACK_STRUCT_BEGIN = "";
pub const PACK_STRUCT_END = "";
pub const LWIP_PLATFORM_DIAG = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/port/esp32xx/include/arch/cc.h:69:9
pub const LWIP_PLATFORM_ASSERT = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/wiiggee1/esp-idf/components/lwip/port/esp32xx/include/arch/cc.h:82:9
pub const LWIP_ERROR = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/port/esp32xx/include/arch/cc.h:93:9
pub const LWIP_NO_STDDEF_H = @as(c_int, 0);
pub const LWIP_NO_STDINT_H = @as(c_int, 0);
pub const LWIP_HAVE_INT64 = @as(c_int, 1);
pub const LWIP_NO_INTTYPES_H = @as(c_int, 0);
pub const X8_F = "02" ++ PRIx8;
pub const SZT_F = PRIuPTR;
pub const LWIP_NO_LIMITS_H = @as(c_int, 0);
pub const SSIZE_MAX = INT_MAX;
pub const LWIP_UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex);
pub const LWIP_NO_CTYPE_H = @as(c_int, 0);
pub const _CTYPE_H_ = "";
pub inline fn _tolower(__c: anytype) @TypeOf((@import("std").zig.c_translation.cast(u8, __c) - 'A') + 'a') {
    _ = &__c;
    return (@import("std").zig.c_translation.cast(u8, __c) - 'A') + 'a';
}
pub inline fn _toupper(__c: anytype) @TypeOf((@import("std").zig.c_translation.cast(u8, __c) - 'a') + 'A') {
    _ = &__c;
    return (@import("std").zig.c_translation.cast(u8, __c) - 'a') + 'A';
}
pub const _U = @as(c_int, 0o1);
pub const _L = @as(c_int, 0o2);
pub const _N = @as(c_int, 0o4);
pub const _S = @as(c_int, 0o10);
pub const _P = @as(c_int, 0o20);
pub const _C = @as(c_int, 0o40);
pub const _X = @as(c_int, 0o100);
pub const _B = @as(c_int, 0o200);
pub inline fn __locale_ctype_ptr() @TypeOf(_ctype_) {
    return _ctype_;
}
pub const __CTYPE_PTR = __locale_ctype_ptr();
pub const __ctype_lookup = @compileError("unable to translate C expr: unexpected token 'a string literal'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/ctype.h:90:9
pub const __ctype_lookup_l = @compileError("unable to translate C expr: unexpected token 'a string literal'");
// /home/wiiggee1/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include/ctype.h:121:9
pub inline fn lwip_isdigit(c: anytype) @TypeOf(isdigit(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return isdigit(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn lwip_isxdigit(c: anytype) @TypeOf(isxdigit(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return isxdigit(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn lwip_islower(c: anytype) @TypeOf(islower(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return islower(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn lwip_isspace(c: anytype) @TypeOf(isspace(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return isspace(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn lwip_isupper(c: anytype) @TypeOf(isupper(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return isupper(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn lwip_tolower(c: anytype) @TypeOf(tolower(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return tolower(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn lwip_toupper(c: anytype) @TypeOf(toupper(@import("std").zig.c_translation.cast(u8, c))) {
    _ = &c;
    return toupper(@import("std").zig.c_translation.cast(u8, c));
}
pub inline fn LWIP_CONST_CAST(target_type: anytype, val: anytype) @TypeOf(target_type(@import("std").zig.c_translation.cast(ptrdiff_t, val))) {
    _ = &target_type;
    _ = &val;
    return target_type(@import("std").zig.c_translation.cast(ptrdiff_t, val));
}
pub inline fn LWIP_ALIGNMENT_CAST(target_type: anytype, val: anytype) @TypeOf(LWIP_CONST_CAST(target_type, val)) {
    _ = &target_type;
    _ = &val;
    return LWIP_CONST_CAST(target_type, val);
}
pub inline fn LWIP_PTR_NUMERIC_CAST(target_type: anytype, val: anytype) @TypeOf(LWIP_CONST_CAST(target_type, val)) {
    _ = &target_type;
    _ = &val;
    return LWIP_CONST_CAST(target_type, val);
}
pub inline fn LWIP_PACKED_CAST(target_type: anytype, val: anytype) @TypeOf(LWIP_CONST_CAST(target_type, val)) {
    _ = &target_type;
    _ = &val;
    return LWIP_CONST_CAST(target_type, val);
}
pub inline fn LWIP_DECLARE_MEMORY_ALIGNED(variable_name: anytype, size: anytype) @TypeOf(u8_t ++ variable_name[@as(usize, @intCast(LWIP_MEM_ALIGN_BUFFER(size)))]) {
    _ = &variable_name;
    _ = &size;
    return u8_t ++ variable_name[@as(usize, @intCast(LWIP_MEM_ALIGN_BUFFER(size)))];
}
pub inline fn LWIP_MEM_ALIGN_SIZE(size: anytype) @TypeOf(((size + MEM_ALIGNMENT) - @as(c_uint, 1)) & ~(MEM_ALIGNMENT - @as(c_uint, 1))) {
    _ = &size;
    return ((size + MEM_ALIGNMENT) - @as(c_uint, 1)) & ~(MEM_ALIGNMENT - @as(c_uint, 1));
}
pub inline fn LWIP_MEM_ALIGN_BUFFER(size: anytype) @TypeOf((size + MEM_ALIGNMENT) - @as(c_uint, 1)) {
    _ = &size;
    return (size + MEM_ALIGNMENT) - @as(c_uint, 1);
}
pub inline fn LWIP_MEM_ALIGN(addr: anytype) ?*anyopaque {
    _ = &addr;
    return @import("std").zig.c_translation.cast(?*anyopaque, ((@import("std").zig.c_translation.cast(mem_ptr_t, addr) + MEM_ALIGNMENT) - @as(c_int, 1)) & ~@import("std").zig.c_translation.cast(mem_ptr_t, MEM_ALIGNMENT - @as(c_int, 1)));
}
pub inline fn PACK_STRUCT_FLD_8(x: anytype) @TypeOf(PACK_STRUCT_FIELD(x)) {
    _ = &x;
    return PACK_STRUCT_FIELD(x);
}
pub inline fn PACK_STRUCT_FLD_S(x: anytype) @TypeOf(PACK_STRUCT_FIELD(x)) {
    _ = &x;
    return PACK_STRUCT_FIELD(x);
}
pub inline fn LWIP_UNUSED_ARG(x: anytype) anyopaque {
    _ = &x;
    return @import("std").zig.c_translation.cast(anyopaque, x);
}
pub const LWIP_DBG_LEVEL_ALL = @as(c_int, 0x00);
pub const LWIP_DBG_LEVEL_WARNING = @as(c_int, 0x01);
pub const LWIP_DBG_LEVEL_SERIOUS = @as(c_int, 0x02);
pub const LWIP_DBG_LEVEL_SEVERE = @as(c_int, 0x03);
pub const LWIP_DBG_MASK_LEVEL = @as(c_int, 0x03);
pub const LWIP_DBG_LEVEL_OFF = LWIP_DBG_LEVEL_ALL;
pub const LWIP_DBG_ON = @as(c_uint, 0x80);
pub const LWIP_DBG_OFF = @as(c_uint, 0x00);
pub const LWIP_DBG_TRACE = @as(c_uint, 0x40);
pub const LWIP_DBG_STATE = @as(c_uint, 0x20);
pub const LWIP_DBG_FRESH = @as(c_uint, 0x10);
pub const LWIP_DBG_HALT = @as(c_uint, 0x08);
pub const LWIP_ASSERT = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/debug.h:116:9
pub const LWIP_DEBUGF = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/debug.h:156:9
pub const NO_SYS = @as(c_int, 0);
pub const LWIP_TIMERS = @as(c_int, 1);
pub const LWIP_TIMERS_CUSTOM = @as(c_int, 0);
pub inline fn MEMMOVE(dst: anytype, src: anytype, len: anytype) @TypeOf(memmove(dst, src, len)) {
    _ = &dst;
    _ = &src;
    _ = &len;
    return memmove(dst, src, len);
}
pub const LWIP_MPU_COMPATIBLE = @as(c_int, 0);
pub const LWIP_ASSERT_CORE_LOCKED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/opt.h:227:9
pub const MEMP_MEM_INIT = @as(c_int, 0);
pub const MEM_SIZE = @as(c_int, 1600);
pub const MEMP_OVERFLOW_CHECK = @as(c_int, 0);
pub const MEMP_SANITY_CHECK = @as(c_int, 0);
pub const MEM_OVERFLOW_CHECK = @as(c_int, 0);
pub const MEM_SANITY_CHECK = @as(c_int, 0);
pub const MEM_USE_POOLS = @as(c_int, 0);
pub const MEM_USE_POOLS_TRY_BIGGER_POOL = @as(c_int, 0);
pub const MEMP_USE_CUSTOM_POOLS = @as(c_int, 0);
pub const LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT = @as(c_int, 0);
pub const MEMP_NUM_PBUF = @as(c_int, 16);
pub const MEMP_NUM_TCP_SEG = @as(c_int, 16);
pub const MEMP_NUM_ALTCP_PCB = MEMP_NUM_TCP_PCB;
pub const MEMP_NUM_REASSDATA = @as(c_int, 5);
pub const MEMP_NUM_FRAG_PBUF = @as(c_int, 15);
pub const MEMP_NUM_ARP_QUEUE = @as(c_int, 30);
pub const MEMP_NUM_IGMP_GROUP = @as(c_int, 8);
pub const LWIP_NUM_SYS_TIMEOUT_INTERNAL = @compileError("unable to translate macro: undefined identifier `PPP_NUM_TIMEOUTS`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/opt.h:508:9
pub const MEMP_NUM_SYS_TIMEOUT = LWIP_NUM_SYS_TIMEOUT_INTERNAL;
pub const MEMP_NUM_NETBUF = @as(c_int, 2);
pub const MEMP_NUM_SELECT_CB = @as(c_int, 4);
pub const MEMP_NUM_TCPIP_MSG_API = @as(c_int, 8);
pub const MEMP_NUM_TCPIP_MSG_INPKT = @as(c_int, 8);
pub const MEMP_NUM_NETDB = @as(c_int, 1);
pub const MEMP_NUM_LOCALHOSTLIST = @as(c_int, 1);
pub const PBUF_POOL_SIZE = @as(c_int, 16);
pub const MEMP_NUM_API_MSG = MEMP_NUM_TCPIP_MSG_API;
pub const MEMP_NUM_DNS_API_MSG = MEMP_NUM_TCPIP_MSG_API;
pub const MEMP_NUM_SOCKET_SETGETSOCKOPT_DATA = MEMP_NUM_TCPIP_MSG_API;
pub const MEMP_NUM_NETIFAPI_MSG = MEMP_NUM_TCPIP_MSG_API;
pub const LWIP_ARP = @as(c_int, 1);
pub const ARP_TABLE_SIZE = @as(c_int, 10);
pub const ARP_MAXAGE = @as(c_int, 300);
pub const ARP_QUEUE_LEN = @as(c_int, 3);
pub const ETHARP_SUPPORT_VLAN = @as(c_int, 0);
pub const LWIP_ETHERNET = LWIP_ARP;
pub const ETH_PAD_SIZE = @as(c_int, 0);
pub const ETHARP_TABLE_MATCH_NETIF = !(LWIP_SINGLE_NETIF != 0);
pub const IP_OPTIONS_ALLOWED = @as(c_int, 1);
pub const IP_SOF_BROADCAST = @as(c_int, 0);
pub const IP_SOF_BROADCAST_RECV = @as(c_int, 0);
pub const IP_FORWARD_ALLOW_TX_ON_RX_NETIF = @as(c_int, 0);
pub const ICMP_TTL = IP_DEFAULT_TTL;
pub const RAW_TTL = IP_DEFAULT_TTL;
pub const LWIP_DHCP_BOOTP_FILE = @as(c_int, 0);
pub const LWIP_DHCP_MAX_DNS_SERVERS = DNS_MAX_SERVERS;
pub const LWIP_AUTOIP = @as(c_int, 0);
pub const LWIP_DHCP_AUTOIP_COOP = @as(c_int, 0);
pub const LWIP_DHCP_AUTOIP_COOP_TRIES = @as(c_int, 9);
pub const LWIP_MIB2_CALLBACKS = @as(c_int, 0);
pub const LWIP_MULTICAST_TX_OPTIONS = ((LWIP_IGMP != 0) or (LWIP_IPV6_MLD != 0)) and ((LWIP_UDP != 0) or (LWIP_RAW != 0));
pub const DNS_TABLE_SIZE = @as(c_int, 4);
pub const DNS_MAX_NAME_LENGTH = @as(c_int, 256);
pub const DNS_MAX_RETRIES = @as(c_int, 4);
pub const DNS_DOES_NAME_CHECK = @as(c_int, 1);
pub const LWIP_DNS_SECURE = (LWIP_DNS_SECURE_RAND_XID | LWIP_DNS_SECURE_NO_MULTIPLE_OUTSTANDING) | LWIP_DNS_SECURE_RAND_SRC_PORT;
pub const LWIP_DNS_SECURE_RAND_XID = @as(c_int, 1);
pub const LWIP_DNS_SECURE_NO_MULTIPLE_OUTSTANDING = @as(c_int, 2);
pub const LWIP_DNS_SECURE_RAND_SRC_PORT = @as(c_int, 4);
pub const DNS_LOCAL_HOSTLIST = @as(c_int, 0);
pub const DNS_LOCAL_HOSTLIST_IS_DYNAMIC = @as(c_int, 0);
pub const LWIP_UDPLITE = @as(c_int, 0);
pub const UDP_TTL = IP_DEFAULT_TTL;
pub const TCP_TTL = IP_DEFAULT_TTL;
pub const LWIP_TCP_MAX_SACK_NUM = @as(c_int, 4);
pub const TCP_CALCULATE_EFF_SEND_MSS = @as(c_int, 1);
pub const TCP_SND_QUEUELEN = @import("std").zig.c_translation.MacroArithmetic.div((@as(c_int, 4) * TCP_SND_BUF) + (TCP_MSS - @as(c_int, 1)), TCP_MSS);
pub const TCP_SNDLOWAT = LWIP_MIN(LWIP_MAX(@import("std").zig.c_translation.MacroArithmetic.div(TCP_SND_BUF, @as(c_int, 2)), (@as(c_int, 2) * TCP_MSS) + @as(c_int, 1)), TCP_SND_BUF - @as(c_int, 1));
pub const TCP_SNDQUEUELOWAT = LWIP_MAX(@import("std").zig.c_translation.MacroArithmetic.div(TCP_SND_QUEUELEN, @as(c_int, 2)), @as(c_int, 5));
pub const TCP_OOSEQ_MAX_BYTES = @as(c_int, 0);
pub inline fn TCP_OOSEQ_PBUFS_LIMIT(pcb: anytype) @TypeOf(TCP_OOSEQ_MAX_PBUFS) {
    _ = &pcb;
    return TCP_OOSEQ_MAX_PBUFS;
}
pub const TCP_DEFAULT_LISTEN_BACKLOG = @as(c_int, 0xff);
pub const LWIP_TCP_TIMESTAMPS = @as(c_int, 0);
pub const TCP_WND_UPDATE_THRESHOLD = LWIP_MIN(@import("std").zig.c_translation.MacroArithmetic.div(TCP_WND, @as(c_int, 4)), TCP_MSS * @as(c_int, 4));
pub const LWIP_TCP_PCB_NUM_EXT_ARGS = @as(c_int, 0);
pub const LWIP_ALTCP = @as(c_int, 0);
pub const LWIP_ALTCP_TLS = @as(c_int, 0);
pub const PBUF_LINK_HLEN = @as(c_int, 14) + ETH_PAD_SIZE;
pub const PBUF_LINK_ENCAPSULATION_HLEN = @as(c_int, 0);
pub const PBUF_POOL_BUFSIZE = LWIP_MEM_ALIGN_SIZE((((TCP_MSS + PBUF_IP_HLEN) + PBUF_TRANSPORT_HLEN) + PBUF_LINK_ENCAPSULATION_HLEN) + PBUF_LINK_HLEN);
pub const LWIP_PBUF_REF_T = u8_t;
pub const LWIP_PBUF_CUSTOM_DATA = "";
pub const LWIP_SINGLE_NETIF = @as(c_int, 0);
pub const LWIP_NETIF_LINK_CALLBACK = @as(c_int, 0);
pub const LWIP_NETIF_REMOVE_CALLBACK = @as(c_int, 0);
pub const LWIP_NETIF_HWADDRHINT = @as(c_int, 0);
pub const LWIP_LOOPIF_MULTICAST = @as(c_int, 0);
pub const LWIP_NETIF_LOOPBACK_MULTITHREADING = !(NO_SYS != 0);
pub const LWIP_TCPIP_THREAD_ALIVE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/opt.h:1808:9
pub const SLIPIF_THREAD_NAME = "slipif_loop";
pub const SLIPIF_THREAD_STACKSIZE = @as(c_int, 0);
pub const SLIPIF_THREAD_PRIO = @as(c_int, 1);
pub const DEFAULT_THREAD_NAME = "lwIP";
pub const LWIP_TCPIP_TIMEOUT = @as(c_int, 0);
pub const LWIP_SO_SNDRCVTIMEO_NONSTANDARD = @as(c_int, 0);
pub const RECV_BUFSIZE_DEFAULT = INT_MAX;
pub const LWIP_TCP_CLOSE_TIMEOUT_MS_DEFAULT = @as(c_int, 20000);
pub const LWIP_FIONREAD_LINUXMODE = @as(c_int, 0);
pub const LWIP_SOCKET_SELECT = @as(c_int, 1);
pub const LWIP_SOCKET_POLL = @as(c_int, 1);
pub const LINK_STATS = @as(c_int, 0);
pub const ETHARP_STATS = @as(c_int, 0);
pub const IP_STATS = @as(c_int, 0);
pub const IPFRAG_STATS = @as(c_int, 0);
pub const ICMP_STATS = @as(c_int, 0);
pub const IGMP_STATS = @as(c_int, 0);
pub const UDP_STATS = @as(c_int, 0);
pub const TCP_STATS = @as(c_int, 0);
pub const MEM_STATS = @as(c_int, 0);
pub const MEMP_STATS = @as(c_int, 0);
pub const SYS_STATS = @as(c_int, 0);
pub const LWIP_STATS_DISPLAY = @as(c_int, 0);
pub const IP6_STATS = @as(c_int, 0);
pub const ICMP6_STATS = @as(c_int, 0);
pub const IP6_FRAG_STATS = @as(c_int, 0);
pub const MLD6_STATS = @as(c_int, 0);
pub const ND6_STATS = @as(c_int, 0);
pub const MIB2_STATS = @as(c_int, 0);
pub const IP_NAPT_STATS = @as(c_int, 0);
pub const LWIP_CHECKSUM_CTRL_PER_NETIF = @as(c_int, 0);
pub const CHECKSUM_GEN_IP = @as(c_int, 1);
pub const CHECKSUM_GEN_UDP = @as(c_int, 1);
pub const CHECKSUM_GEN_TCP = @as(c_int, 1);
pub const CHECKSUM_GEN_ICMP = @as(c_int, 1);
pub const CHECKSUM_GEN_ICMP6 = @as(c_int, 1);
pub const CHECKSUM_CHECK_TCP = @as(c_int, 1);
pub const CHECKSUM_CHECK_ICMP6 = @as(c_int, 1);
pub const LWIP_CHECKSUM_ON_COPY = @as(c_int, 0);
pub const IPV6_REASS_MAXAGE = @as(c_int, 60);
pub const LWIP_IPV6_SCOPES = (LWIP_IPV6 != 0) and !(LWIP_SINGLE_NETIF != 0);
pub const LWIP_IPV6_SCOPES_DEBUG = @as(c_int, 0);
pub const LWIP_IPV6_SEND_ROUTER_SOLICIT = LWIP_IPV6;
pub const LWIP_IPV6_AUTOCONFIG = LWIP_IPV6;
pub const LWIP_IPV6_ADDRESS_LIFETIMES = LWIP_IPV6_AUTOCONFIG;
pub const LWIP_IPV6_DUP_DETECT_ATTEMPTS = @as(c_int, 1);
pub const LWIP_ICMP6 = LWIP_IPV6;
pub const LWIP_ICMP6_DATASIZE = @as(c_int, 0);
pub const LWIP_ICMP6_HL = @as(c_int, 255);
pub const LWIP_IPV6_MLD = LWIP_IPV6;
pub const MEMP_NUM_MLD6_GROUP = @as(c_int, 4);
pub const LWIP_ND6_QUEUEING = LWIP_IPV6;
pub const ESP_ND6_QUEUEING = LWIP_IPV6;
pub const LWIP_ND6_NUM_DESTINATIONS = @as(c_int, 10);
pub const LWIP_ND6_NUM_PREFIXES = @as(c_int, 5);
pub const LWIP_ND6_NUM_ROUTERS = @as(c_int, 3);
pub const LWIP_ND6_MAX_MULTICAST_SOLICIT = @as(c_int, 3);
pub const LWIP_ND6_MAX_UNICAST_SOLICIT = @as(c_int, 3);
pub const LWIP_ND6_MAX_ANYCAST_DELAY_TIME = @as(c_int, 1000);
pub const LWIP_ND6_MAX_NEIGHBOR_ADVERTISEMENT = @as(c_int, 3);
pub const LWIP_ND6_REACHABLE_TIME = @as(c_int, 30000);
pub const LWIP_ND6_RETRANS_TIMER = @as(c_int, 1000);
pub const LWIP_ND6_DELAY_FIRST_PROBE_TIME = @as(c_int, 5000);
pub const LWIP_ND6_ALLOW_RA_UPDATES = @as(c_int, 1);
pub const LWIP_ND6_TCP_REACHABILITY_HINTS = @as(c_int, 1);
pub const LWIP_IPV6_DHCP6_STATEFUL = @as(c_int, 0);
pub const LWIP_IPV6_DHCP6_STATELESS = LWIP_IPV6_DHCP6;
pub const LWIP_DHCP6_GET_NTP_SRV = @as(c_int, 0);
pub const LWIP_DHCP6_MAX_NTP_SERVERS = @as(c_int, 1);
pub const LWIP_DHCP6_MAX_DNS_SERVERS = DNS_MAX_SERVERS;
pub const LWIP_DBG_MIN_LEVEL = LWIP_DBG_LEVEL_ALL;
pub const LWIP_DBG_TYPES_ON = LWIP_DBG_ON;
pub const API_MSG_DEBUG = LWIP_DBG_OFF;
pub const IGMP_DEBUG = LWIP_DBG_OFF;
pub const INET_DEBUG = LWIP_DBG_OFF;
pub const IP_REASS_DEBUG = LWIP_DBG_OFF;
pub const RAW_DEBUG = LWIP_DBG_OFF;
pub const MEM_DEBUG = LWIP_DBG_OFF;
pub const SYS_DEBUG = LWIP_DBG_OFF;
pub const TIMERS_DEBUG = LWIP_DBG_OFF;
pub const TCP_FR_DEBUG = LWIP_DBG_OFF;
pub const TCP_RTO_DEBUG = LWIP_DBG_OFF;
pub const TCP_CWND_DEBUG = LWIP_DBG_OFF;
pub const TCP_WND_DEBUG = LWIP_DBG_OFF;
pub const TCP_RST_DEBUG = LWIP_DBG_OFF;
pub const TCP_QLEN_DEBUG = LWIP_DBG_OFF;
pub const SLIP_DEBUG = LWIP_DBG_OFF;
pub const AUTOIP_DEBUG = LWIP_DBG_OFF;
pub const DHCP6_DEBUG = LWIP_DBG_OFF;
pub const LWIP_TESTMODE = @as(c_int, 0);
pub const LWIP_PERF = @as(c_int, 0);
pub const LWIP_HDR_IP_ADDR_H = "";
pub const LWIP_HDR_DEF_H = "";
pub const PERF_START = "";
pub const PERF_STOP = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/def.h:58:9
pub inline fn LWIP_MAX(x: anytype, y: anytype) @TypeOf(if (x > y) x else y) {
    _ = &x;
    _ = &y;
    return if (x > y) x else y;
}
pub inline fn LWIP_MIN(x: anytype, y: anytype) @TypeOf(if (x < y) x else y) {
    _ = &x;
    _ = &y;
    return if (x < y) x else y;
}
pub const LWIP_ARRAYSIZE = @compileError("unable to translate C expr: unexpected token '('");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/def.h:69:9
pub inline fn LWIP_MAKEU32(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u32_t, a & @as(c_int, 0xff)) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32_t, b & @as(c_int, 0xff)) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32_t, c & @as(c_int, 0xff)) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32_t, d & @as(c_int, 0xff))) {
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    return (((@import("std").zig.c_translation.cast(u32_t, a & @as(c_int, 0xff)) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32_t, b & @as(c_int, 0xff)) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32_t, c & @as(c_int, 0xff)) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32_t, d & @as(c_int, 0xff));
}
pub inline fn lwip_ntohs(x: anytype) @TypeOf(lwip_htons(x)) {
    _ = &x;
    return lwip_htons(x);
}
pub inline fn lwip_ntohl(x: anytype) @TypeOf(lwip_htonl(x)) {
    _ = &x;
    return lwip_htonl(x);
}
pub inline fn PP_HTONS(x: anytype) u16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(u16_t, ((x & @import("std").zig.c_translation.cast(u16_t, @as(c_uint, 0x00ff))) << @as(c_int, 8)) | ((x & @import("std").zig.c_translation.cast(u16_t, @as(c_uint, 0xff00))) >> @as(c_int, 8)));
}
pub inline fn PP_NTOHS(x: anytype) @TypeOf(PP_HTONS(x)) {
    _ = &x;
    return PP_HTONS(x);
}
pub inline fn PP_HTONL(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x000000ff))) << @as(c_int, 24)) | ((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x0000ff00))) << @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x00ff0000))) >> @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0xff000000))) >> @as(c_int, 24))) {
    _ = &x;
    return ((((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x000000ff))) << @as(c_int, 24)) | ((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x0000ff00))) << @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x00ff0000))) >> @as(c_int, 8))) | ((x & @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0xff000000))) >> @as(c_int, 24));
}
pub inline fn PP_NTOHL(x: anytype) @TypeOf(PP_HTONL(x)) {
    _ = &x;
    return PP_HTONL(x);
}
pub const LWIP_HDR_IP4_ADDR_H = "";
pub const IPADDR_NONE = @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0xffffffff));
pub const IPADDR_LOOPBACK = @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x7f000001));
pub const IPADDR_ANY = @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0x00000000));
pub const IPADDR_BROADCAST = @import("std").zig.c_translation.cast(u32_t, @as(c_ulong, 0xffffffff));
pub inline fn IP_CLASSA(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0x80000000)) == @as(c_int, 0)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0x80000000)) == @as(c_int, 0);
}
pub const IP_CLASSA_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex);
pub const IP_CLASSA_NSHIFT = @as(c_int, 24);
pub const IP_CLASSA_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IP_CLASSA_NET;
pub const IP_CLASSA_MAX = @as(c_int, 128);
pub inline fn IP_CLASSB(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xc0000000)) == @as(c_ulong, 0x80000000)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xc0000000)) == @as(c_ulong, 0x80000000);
}
pub const IP_CLASSB_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hex);
pub const IP_CLASSB_NSHIFT = @as(c_int, 16);
pub const IP_CLASSB_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IP_CLASSB_NET;
pub const IP_CLASSB_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub inline fn IP_CLASSC(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xe0000000)) == @as(c_ulong, 0xc0000000)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xe0000000)) == @as(c_ulong, 0xc0000000);
}
pub const IP_CLASSC_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hex);
pub const IP_CLASSC_NSHIFT = @as(c_int, 8);
pub const IP_CLASSC_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IP_CLASSC_NET;
pub inline fn IP_CLASSD(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xf0000000)) == @as(c_ulong, 0xe0000000)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xf0000000)) == @as(c_ulong, 0xe0000000);
}
pub const IP_CLASSD_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex);
pub const IP_CLASSD_NSHIFT = @as(c_int, 28);
pub const IP_CLASSD_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0fffffff, .hex);
pub inline fn IP_MULTICAST(a: anytype) @TypeOf(IP_CLASSD(a)) {
    _ = &a;
    return IP_CLASSD(a);
}
pub inline fn IP_EXPERIMENTAL(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xf0000000)) == @as(c_ulong, 0xf0000000)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xf0000000)) == @as(c_ulong, 0xf0000000);
}
pub inline fn IP_BADCLASS(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xf0000000)) == @as(c_ulong, 0xf0000000)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(u32_t, a) & @as(c_ulong, 0xf0000000)) == @as(c_ulong, 0xf0000000);
}
pub const IP_LOOPBACKNET = @as(c_int, 127);
pub const IP4_ADDR = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:104:9
pub const ip4_addr_copy = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:107:9
pub const ip4_addr_set = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:109:9
pub const ip4_addr_set_zero = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:113:9
pub const ip4_addr_set_any = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:115:9
pub const ip4_addr_set_loopback = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:117:9
pub inline fn ip4_addr_isloopback(ipaddr: anytype) @TypeOf((ipaddr.*.addr & PP_HTONL(IP_CLASSA_NET)) == PP_HTONL(@import("std").zig.c_translation.cast(u32_t, IP_LOOPBACKNET) << @as(c_int, 24))) {
    _ = &ipaddr;
    return (ipaddr.*.addr & PP_HTONL(IP_CLASSA_NET)) == PP_HTONL(@import("std").zig.c_translation.cast(u32_t, IP_LOOPBACKNET) << @as(c_int, 24));
}
pub const ip4_addr_set_hton = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:122:9
pub const ip4_addr_set_u32 = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:126:9
pub inline fn ip4_addr_get_u32(src_ipaddr: anytype) @TypeOf(src_ipaddr.*.addr) {
    _ = &src_ipaddr;
    return src_ipaddr.*.addr;
}
pub const ip4_addr_get_network = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:131:9
pub inline fn ip4_addr_netcmp(addr1: anytype, addr2: anytype, mask: anytype) @TypeOf((addr1.*.addr & mask.*.addr) == (addr2.*.addr & mask.*.addr)) {
    _ = &addr1;
    _ = &addr2;
    _ = &mask;
    return (addr1.*.addr & mask.*.addr) == (addr2.*.addr & mask.*.addr);
}
pub inline fn ip4_addr_cmp(addr1: anytype, addr2: anytype) @TypeOf(addr1.*.addr == addr2.*.addr) {
    _ = &addr1;
    _ = &addr2;
    return addr1.*.addr == addr2.*.addr;
}
pub inline fn ip4_addr_isany_val(addr1: anytype) @TypeOf(addr1.addr == IPADDR_ANY) {
    _ = &addr1;
    return addr1.addr == IPADDR_ANY;
}
pub inline fn ip4_addr_isany(addr1: anytype) @TypeOf((addr1 == NULL) or (ip4_addr_isany_val(addr1.*) != 0)) {
    _ = &addr1;
    return (addr1 == NULL) or (ip4_addr_isany_val(addr1.*) != 0);
}
pub inline fn ip4_addr_isbroadcast(addr1: anytype, netif_1: anytype) @TypeOf(ip4_addr_isbroadcast_u32(addr1.*.addr, netif_1)) {
    _ = &addr1;
    _ = &netif_1;
    return ip4_addr_isbroadcast_u32(addr1.*.addr, netif_1);
}
pub inline fn ip_addr_netmask_valid(netmask: anytype) @TypeOf(ip4_addr_netmask_valid(netmask.*.addr)) {
    _ = &netmask;
    return ip4_addr_netmask_valid(netmask.*.addr);
}
pub inline fn ip4_addr_ismulticast(addr1: anytype) @TypeOf((addr1.*.addr & PP_HTONL(@as(c_ulong, 0xf0000000))) == PP_HTONL(@as(c_ulong, 0xe0000000))) {
    _ = &addr1;
    return (addr1.*.addr & PP_HTONL(@as(c_ulong, 0xf0000000))) == PP_HTONL(@as(c_ulong, 0xe0000000));
}
pub inline fn ip4_addr_islinklocal(addr1: anytype) @TypeOf((addr1.*.addr & PP_HTONL(@as(c_ulong, 0xffff0000))) == PP_HTONL(@as(c_ulong, 0xa9fe0000))) {
    _ = &addr1;
    return (addr1.*.addr & PP_HTONL(@as(c_ulong, 0xffff0000))) == PP_HTONL(@as(c_ulong, 0xa9fe0000));
}
pub inline fn ip4_addr_debug_print_parts(debug: anytype, a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(LWIP_DEBUGF(debug, blk_1: {
    _ = "%" ++ U16_F ++ ".%" ++ U16_F ++ ".%" ++ U16_F ++ ".%" ++ U16_F;
    _ = &a;
    _ = &b;
    _ = &c;
    break :blk_1 d;
})) {
    _ = &debug;
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    return LWIP_DEBUGF(debug, blk_1: {
        _ = "%" ++ U16_F ++ ".%" ++ U16_F ++ ".%" ++ U16_F ++ ".%" ++ U16_F;
        _ = &a;
        _ = &b;
        _ = &c;
        break :blk_1 d;
    });
}
pub inline fn ip4_addr_debug_print(debug: anytype, ipaddr: anytype) @TypeOf(ip4_addr_debug_print_parts(debug, @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr1_16(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr2_16(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr3_16(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr4_16(ipaddr) else @as(c_int, 0)))) {
    _ = &debug;
    _ = &ipaddr;
    return ip4_addr_debug_print_parts(debug, @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr1_16(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr2_16(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr3_16(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) ip4_addr4_16(ipaddr) else @as(c_int, 0)));
}
pub inline fn ip4_addr_debug_print_val(debug: anytype, ipaddr: anytype) @TypeOf(ip4_addr_debug_print_parts(debug, ip4_addr1_16_val(ipaddr), ip4_addr2_16_val(ipaddr), ip4_addr3_16_val(ipaddr), ip4_addr4_16_val(ipaddr))) {
    _ = &debug;
    _ = &ipaddr;
    return ip4_addr_debug_print_parts(debug, ip4_addr1_16_val(ipaddr), ip4_addr2_16_val(ipaddr), ip4_addr3_16_val(ipaddr), ip4_addr4_16_val(ipaddr));
}
pub const ip4_addr_get_byte = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip4_addr.h:176:9
pub inline fn ip4_addr1(ipaddr: anytype) @TypeOf(ip4_addr_get_byte(ipaddr, @as(c_int, 0))) {
    _ = &ipaddr;
    return ip4_addr_get_byte(ipaddr, @as(c_int, 0));
}
pub inline fn ip4_addr2(ipaddr: anytype) @TypeOf(ip4_addr_get_byte(ipaddr, @as(c_int, 1))) {
    _ = &ipaddr;
    return ip4_addr_get_byte(ipaddr, @as(c_int, 1));
}
pub inline fn ip4_addr3(ipaddr: anytype) @TypeOf(ip4_addr_get_byte(ipaddr, @as(c_int, 2))) {
    _ = &ipaddr;
    return ip4_addr_get_byte(ipaddr, @as(c_int, 2));
}
pub inline fn ip4_addr4(ipaddr: anytype) @TypeOf(ip4_addr_get_byte(ipaddr, @as(c_int, 3))) {
    _ = &ipaddr;
    return ip4_addr_get_byte(ipaddr, @as(c_int, 3));
}
pub inline fn ip4_addr_get_byte_val(ipaddr: anytype, idx: anytype) u8_t {
    _ = &ipaddr;
    _ = &idx;
    return @import("std").zig.c_translation.cast(u8_t, (ipaddr.addr >> (idx * @as(c_int, 8))) & @as(c_int, 0xff));
}
pub inline fn ip4_addr1_val(ipaddr: anytype) @TypeOf(ip4_addr_get_byte_val(ipaddr, @as(c_int, 0))) {
    _ = &ipaddr;
    return ip4_addr_get_byte_val(ipaddr, @as(c_int, 0));
}
pub inline fn ip4_addr2_val(ipaddr: anytype) @TypeOf(ip4_addr_get_byte_val(ipaddr, @as(c_int, 1))) {
    _ = &ipaddr;
    return ip4_addr_get_byte_val(ipaddr, @as(c_int, 1));
}
pub inline fn ip4_addr3_val(ipaddr: anytype) @TypeOf(ip4_addr_get_byte_val(ipaddr, @as(c_int, 2))) {
    _ = &ipaddr;
    return ip4_addr_get_byte_val(ipaddr, @as(c_int, 2));
}
pub inline fn ip4_addr4_val(ipaddr: anytype) @TypeOf(ip4_addr_get_byte_val(ipaddr, @as(c_int, 3))) {
    _ = &ipaddr;
    return ip4_addr_get_byte_val(ipaddr, @as(c_int, 3));
}
pub inline fn ip4_addr1_16(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr1(ipaddr));
}
pub inline fn ip4_addr2_16(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr2(ipaddr));
}
pub inline fn ip4_addr3_16(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr3(ipaddr));
}
pub inline fn ip4_addr4_16(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr4(ipaddr));
}
pub inline fn ip4_addr1_16_val(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr1_val(ipaddr));
}
pub inline fn ip4_addr2_16_val(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr2_val(ipaddr));
}
pub inline fn ip4_addr3_16_val(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr3_val(ipaddr));
}
pub inline fn ip4_addr4_16_val(ipaddr: anytype) u16_t {
    _ = &ipaddr;
    return @import("std").zig.c_translation.cast(u16_t, ip4_addr4_val(ipaddr));
}
pub inline fn ip_ntoa(ipaddr: anytype) @TypeOf(ipaddr_ntoa(ipaddr)) {
    _ = &ipaddr;
    return ipaddr_ntoa(ipaddr);
}
pub const LWIP_HDR_IP6_ADDR_H = "";
pub const LWIP_HDR_IP6_ZONE_H = "";
pub const IP6_NO_ZONE = @as(c_int, 0);
pub const IPADDR6_ZONE_INIT = @compileError("unable to translate C expr: unexpected token ','");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:106:9
pub inline fn ip6_addr_zone(ip6addr: anytype) @TypeOf(ip6addr.*.zone) {
    _ = &ip6addr;
    return ip6addr.*.zone;
}
pub inline fn ip6_addr_has_zone(ip6addr: anytype) @TypeOf(ip6_addr_zone(ip6addr) != IP6_NO_ZONE) {
    _ = &ip6addr;
    return ip6_addr_zone(ip6addr) != IP6_NO_ZONE;
}
pub const ip6_addr_set_zone = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:115:9
pub const ip6_addr_clear_zone = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:118:9
pub const ip6_addr_copy_zone = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:121:9
pub inline fn ip6_addr_equals_zone(ip6addr: anytype, zone_idx: anytype) @TypeOf(ip6addr.*.zone == zone_idx) {
    _ = &ip6addr;
    _ = &zone_idx;
    return ip6addr.*.zone == zone_idx;
}
pub inline fn ip6_addr_cmp_zone(ip6addr1: anytype, ip6addr2: anytype) @TypeOf(ip6addr1.*.zone == ip6addr2.*.zone) {
    _ = &ip6addr1;
    _ = &ip6addr2;
    return ip6addr1.*.zone == ip6addr2.*.zone;
}
pub const IPV6_CUSTOM_SCOPES = @as(c_int, 0);
pub inline fn ip6_addr_has_scope(ip6addr: anytype, @"type": anytype) @TypeOf((ip6_addr_islinklocal(ip6addr) != 0) or ((@"type" != IP6_UNICAST) and ((ip6_addr_ismulticast_iflocal(ip6addr) != 0) or (ip6_addr_ismulticast_linklocal(ip6addr) != 0)))) {
    _ = &ip6addr;
    _ = &@"type";
    return (ip6_addr_islinklocal(ip6addr) != 0) or ((@"type" != IP6_UNICAST) and ((ip6_addr_ismulticast_iflocal(ip6addr) != 0) or (ip6_addr_ismulticast_linklocal(ip6addr) != 0)));
}
pub inline fn ip6_addr_assign_zone(ip6addr: anytype, @"type": anytype, netif_1: anytype) @TypeOf(ip6_addr_set_zone(ip6addr, if (ip6_addr_has_scope(ip6addr, @"type")) netif_get_index(netif_1) else @as(c_int, 0))) {
    _ = &ip6addr;
    _ = &@"type";
    _ = &netif_1;
    return ip6_addr_set_zone(ip6addr, if (ip6_addr_has_scope(ip6addr, @"type")) netif_get_index(netif_1) else @as(c_int, 0));
}
pub inline fn ip6_addr_test_zone(ip6addr: anytype, netif_1: anytype) @TypeOf(ip6_addr_equals_zone(ip6addr, netif_get_index(netif_1))) {
    _ = &ip6addr;
    _ = &netif_1;
    return ip6_addr_equals_zone(ip6addr, netif_get_index(netif_1));
}
pub inline fn ip6_addr_lacks_zone(ip6addr: anytype, @"type": anytype) @TypeOf(!(ip6_addr_has_zone(ip6addr) != 0) and (ip6_addr_has_scope(ip6addr, @"type") != 0)) {
    _ = &ip6addr;
    _ = &@"type";
    return !(ip6_addr_has_zone(ip6addr) != 0) and (ip6_addr_has_scope(ip6addr, @"type") != 0);
}
pub const ip6_addr_select_zone = @compileError("unable to translate macro: undefined identifier `selected_netif`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:249:9
pub const IP6_ADDR_ZONECHECK = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:293:9
pub const IP6_ADDR_ZONECHECK_NETIF = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_zone.h:294:9
pub const IP6_ADDR_PART = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:70:9
pub const IP6_ADDR = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:75:9
pub inline fn IP6_ADDR_BLOCK1(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, (lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK2(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK3(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, (lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK4(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK5(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, (lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK6(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK7(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, (lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))]) >> @as(c_int, 16)) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub inline fn IP6_ADDR_BLOCK8(ip6addr: anytype) u16_t {
    _ = &ip6addr;
    return @import("std").zig.c_translation.cast(u16_t, lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))]) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex));
}
pub const ip6_addr_copy = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:100:9
pub const ip6_addr_set = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:106:9
pub const ip6_addr_copy_from_packed = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:113:9
pub const ip6_addr_copy_to_packed = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:120:9
pub const ip6_addr_set_zero = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:126:9
pub inline fn ip6_addr_set_any(ip6addr: anytype) @TypeOf(ip6_addr_set_zero(ip6addr)) {
    _ = &ip6addr;
    return ip6_addr_set_zero(ip6addr);
}
pub const ip6_addr_set_loopback = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:135:9
pub const ip6_addr_set_hton = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:142:9
pub inline fn ip6_addr_netcmp_zoneless(addr1: anytype, addr2: anytype) @TypeOf((addr1.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 1)))])) {
    _ = &addr1;
    _ = &addr2;
    return (addr1.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 1)))]);
}
pub inline fn ip6_addr_netcmp(addr1: anytype, addr2: anytype) @TypeOf((ip6_addr_netcmp_zoneless(addr1, addr2) != 0) and (ip6_addr_cmp_zone(addr1, addr2) != 0)) {
    _ = &addr1;
    _ = &addr2;
    return (ip6_addr_netcmp_zoneless(addr1, addr2) != 0) and (ip6_addr_cmp_zone(addr1, addr2) != 0);
}
pub inline fn ip6_addr_nethostcmp(addr1: anytype, addr2: anytype) @TypeOf((addr1.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 3)))])) {
    _ = &addr1;
    _ = &addr2;
    return (addr1.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 3)))]);
}
pub inline fn ip6_addr_cmp_zoneless(addr1: anytype, addr2: anytype) @TypeOf((((addr1.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 1)))])) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 2)))])) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 3)))])) {
    _ = &addr1;
    _ = &addr2;
    return (((addr1.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 1)))])) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 2)))])) and (addr1.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == addr2.*.addr[@as(usize, @intCast(@as(c_int, 3)))]);
}
pub inline fn ip6_addr_cmp(addr1: anytype, addr2: anytype) @TypeOf((ip6_addr_cmp_zoneless(addr1, addr2) != 0) and (ip6_addr_cmp_zone(addr1, addr2) != 0)) {
    _ = &addr1;
    _ = &addr2;
    return (ip6_addr_cmp_zoneless(addr1, addr2) != 0) and (ip6_addr_cmp_zone(addr1, addr2) != 0);
}
pub inline fn ip6_addr_cmp_packed(ip6addr: anytype, paddr: anytype, zone_idx: anytype) @TypeOf(((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 1)))])) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 2)))])) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 3)))])) and (ip6_addr_equals_zone(ip6addr, zone_idx) != 0)) {
    _ = &ip6addr;
    _ = &paddr;
    _ = &zone_idx;
    return ((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 1)))])) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 2)))])) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == paddr.*.addr[@as(usize, @intCast(@as(c_int, 3)))])) and (ip6_addr_equals_zone(ip6addr, zone_idx) != 0);
}
pub inline fn ip6_get_subnet_id(ip6addr: anytype) @TypeOf(lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) & @as(c_ulong, 0x0000ffff)) {
    _ = &ip6addr;
    return lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))]) & @as(c_ulong, 0x0000ffff);
}
pub inline fn ip6_addr_isany_val(ip6addr: anytype) @TypeOf((((ip6addr.addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0)) and (ip6addr.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_int, 0))) and (ip6addr.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_int, 0))) and (ip6addr.addr[@as(usize, @intCast(@as(c_int, 3)))] == @as(c_int, 0))) {
    _ = &ip6addr;
    return (((ip6addr.addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0)) and (ip6addr.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_int, 0))) and (ip6addr.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_int, 0))) and (ip6addr.addr[@as(usize, @intCast(@as(c_int, 3)))] == @as(c_int, 0));
}
pub inline fn ip6_addr_isany(ip6addr: anytype) @TypeOf((ip6addr == NULL) or (ip6_addr_isany_val(ip6addr.*) != 0)) {
    _ = &ip6addr;
    return (ip6addr == NULL) or (ip6_addr_isany_val(ip6addr.*) != 0);
}
pub inline fn ip6_addr_isloopback(ip6addr: anytype) @TypeOf((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_ulong, 0)) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) {
    _ = &ip6addr;
    return (((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_ulong, 0)) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000001)));
}
pub inline fn ip6_addr_isglobal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xe0000000))) == PP_HTONL(@as(c_ulong, 0x20000000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xe0000000))) == PP_HTONL(@as(c_ulong, 0x20000000));
}
pub inline fn ip6_addr_islinklocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xffc00000))) == PP_HTONL(@as(c_ulong, 0xfe800000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xffc00000))) == PP_HTONL(@as(c_ulong, 0xfe800000));
}
pub inline fn ip6_addr_issitelocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xffc00000))) == PP_HTONL(@as(c_ulong, 0xfec00000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xffc00000))) == PP_HTONL(@as(c_ulong, 0xfec00000));
}
pub inline fn ip6_addr_isuniquelocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xfe000000))) == PP_HTONL(@as(c_ulong, 0xfc000000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xfe000000))) == PP_HTONL(@as(c_ulong, 0xfc000000));
}
pub inline fn ip6_addr_isipv4mappedipv6(ip6addr: anytype) @TypeOf(((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0)) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_int, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == PP_HTONL(@as(c_ulong, 0x0000FFFF)))) {
    _ = &ip6addr;
    return ((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0)) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_int, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == PP_HTONL(@as(c_ulong, 0x0000FFFF)));
}
pub inline fn ip6_addr_ismulticast(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff000000))) == PP_HTONL(@as(c_ulong, 0xff000000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff000000))) == PP_HTONL(@as(c_ulong, 0xff000000));
}
pub inline fn ip6_addr_multicast_transient_flag(ip6addr: anytype) @TypeOf(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0x00100000))) {
    _ = &ip6addr;
    return ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0x00100000));
}
pub inline fn ip6_addr_multicast_prefix_flag(ip6addr: anytype) @TypeOf(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0x00200000))) {
    _ = &ip6addr;
    return ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0x00200000));
}
pub inline fn ip6_addr_multicast_rendezvous_flag(ip6addr: anytype) @TypeOf(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0x00400000))) {
    _ = &ip6addr;
    return ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0x00400000));
}
pub inline fn ip6_addr_multicast_scope(ip6addr: anytype) @TypeOf((lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) >> @as(c_int, 16)) & @as(c_int, 0xf)) {
    _ = &ip6addr;
    return (lwip_htonl(ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))]) >> @as(c_int, 16)) & @as(c_int, 0xf);
}
pub const IP6_MULTICAST_SCOPE_RESERVED = @as(c_int, 0x0);
pub const IP6_MULTICAST_SCOPE_RESERVED0 = @as(c_int, 0x0);
pub const IP6_MULTICAST_SCOPE_INTERFACE_LOCAL = @as(c_int, 0x1);
pub const IP6_MULTICAST_SCOPE_LINK_LOCAL = @as(c_int, 0x2);
pub const IP6_MULTICAST_SCOPE_RESERVED3 = @as(c_int, 0x3);
pub const IP6_MULTICAST_SCOPE_ADMIN_LOCAL = @as(c_int, 0x4);
pub const IP6_MULTICAST_SCOPE_SITE_LOCAL = @as(c_int, 0x5);
pub const IP6_MULTICAST_SCOPE_ORGANIZATION_LOCAL = @as(c_int, 0x8);
pub const IP6_MULTICAST_SCOPE_GLOBAL = @as(c_int, 0xe);
pub const IP6_MULTICAST_SCOPE_RESERVEDF = @as(c_int, 0xf);
pub inline fn ip6_addr_ismulticast_iflocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff010000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff010000));
}
pub inline fn ip6_addr_ismulticast_linklocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff020000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff020000));
}
pub inline fn ip6_addr_ismulticast_adminlocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff040000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff040000));
}
pub inline fn ip6_addr_ismulticast_sitelocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff050000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff050000));
}
pub inline fn ip6_addr_ismulticast_orglocal(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff080000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff080000));
}
pub inline fn ip6_addr_ismulticast_global(ip6addr: anytype) @TypeOf((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff0e0000))) {
    _ = &ip6addr;
    return (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] & PP_HTONL(@as(c_ulong, 0xff8f0000))) == PP_HTONL(@as(c_ulong, 0xff0e0000));
}
pub inline fn ip6_addr_isallnodes_iflocal(ip6addr: anytype) @TypeOf((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff010000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) {
    _ = &ip6addr;
    return (((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff010000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000001)));
}
pub inline fn ip6_addr_isallnodes_linklocal(ip6addr: anytype) @TypeOf((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) {
    _ = &ip6addr;
    return (((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000001)));
}
pub const ip6_addr_set_allnodes_linklocal = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:251:9
pub inline fn ip6_addr_isallrouters_linklocal(ip6addr: anytype) @TypeOf((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000002)))) {
    _ = &ip6addr;
    return (((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == @as(c_ulong, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == PP_HTONL(@as(c_ulong, 0x00000002)));
}
pub const ip6_addr_set_allrouters_linklocal = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:261:9
pub inline fn ip6_addr_issolicitednode(ip6addr: anytype) @TypeOf(((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) and ((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] & PP_HTONL(@as(c_ulong, 0xff000000))) == PP_HTONL(@as(c_ulong, 0xff000000)))) {
    _ = &ip6addr;
    return ((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) and ((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] & PP_HTONL(@as(c_ulong, 0xff000000))) == PP_HTONL(@as(c_ulong, 0xff000000)));
}
pub const ip6_addr_set_solicitednode = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip6_addr.h:271:9
pub inline fn ip6_addr_cmp_solicitednode(ip6addr: anytype, sn_addr: anytype) @TypeOf((((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_int, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == (PP_HTONL(@as(c_ulong, 0xff000000)) | sn_addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))]))) {
    _ = &ip6addr;
    _ = &sn_addr;
    return (((ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 0)))] == PP_HTONL(@as(c_ulong, 0xff020000))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 1)))] == @as(c_int, 0))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 2)))] == PP_HTONL(@as(c_ulong, 0x00000001)))) and (ip6addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))] == (PP_HTONL(@as(c_ulong, 0xff000000)) | sn_addr.*.addr[@as(usize, @intCast(@as(c_int, 3)))]));
}
pub const IP6_ADDR_INVALID = @as(c_int, 0x00);
pub const IP6_ADDR_TENTATIVE = @as(c_int, 0x08);
pub const IP6_ADDR_TENTATIVE_1 = @as(c_int, 0x09);
pub const IP6_ADDR_TENTATIVE_2 = @as(c_int, 0x0a);
pub const IP6_ADDR_TENTATIVE_3 = @as(c_int, 0x0b);
pub const IP6_ADDR_TENTATIVE_4 = @as(c_int, 0x0c);
pub const IP6_ADDR_TENTATIVE_5 = @as(c_int, 0x0d);
pub const IP6_ADDR_TENTATIVE_6 = @as(c_int, 0x0e);
pub const IP6_ADDR_TENTATIVE_7 = @as(c_int, 0x0f);
pub const IP6_ADDR_VALID = @as(c_int, 0x10);
pub const IP6_ADDR_PREFERRED = @as(c_int, 0x30);
pub const IP6_ADDR_DEPRECATED = @as(c_int, 0x10);
pub const IP6_ADDR_DUPLICATED = @as(c_int, 0x40);
pub const IP6_ADDR_TENTATIVE_COUNT_MASK = @as(c_int, 0x07);
pub inline fn ip6_addr_isinvalid(addr_state: anytype) @TypeOf(addr_state == IP6_ADDR_INVALID) {
    _ = &addr_state;
    return addr_state == IP6_ADDR_INVALID;
}
pub inline fn ip6_addr_istentative(addr_state: anytype) @TypeOf(addr_state & IP6_ADDR_TENTATIVE) {
    _ = &addr_state;
    return addr_state & IP6_ADDR_TENTATIVE;
}
pub inline fn ip6_addr_isvalid(addr_state: anytype) @TypeOf(addr_state & IP6_ADDR_VALID) {
    _ = &addr_state;
    return addr_state & IP6_ADDR_VALID;
}
pub inline fn ip6_addr_ispreferred(addr_state: anytype) @TypeOf(addr_state == IP6_ADDR_PREFERRED) {
    _ = &addr_state;
    return addr_state == IP6_ADDR_PREFERRED;
}
pub inline fn ip6_addr_isdeprecated(addr_state: anytype) @TypeOf(addr_state == IP6_ADDR_DEPRECATED) {
    _ = &addr_state;
    return addr_state == IP6_ADDR_DEPRECATED;
}
pub inline fn ip6_addr_isduplicated(addr_state: anytype) @TypeOf(addr_state == IP6_ADDR_DUPLICATED) {
    _ = &addr_state;
    return addr_state == IP6_ADDR_DUPLICATED;
}
pub const IP6_ADDR_LIFE_STATIC = @as(c_int, 0);
pub const IP6_ADDR_LIFE_INFINITE = @as(c_ulong, 0xffffffff);
pub inline fn ip6_addr_life_isstatic(addr_life: anytype) @TypeOf(addr_life == IP6_ADDR_LIFE_STATIC) {
    _ = &addr_life;
    return addr_life == IP6_ADDR_LIFE_STATIC;
}
pub inline fn ip6_addr_life_isinfinite(addr_life: anytype) @TypeOf(addr_life == IP6_ADDR_LIFE_INFINITE) {
    _ = &addr_life;
    return addr_life == IP6_ADDR_LIFE_INFINITE;
}
pub inline fn ip6_addr_debug_print_parts(debug: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype, g: anytype, h: anytype) @TypeOf(LWIP_DEBUGF(debug, blk_1: {
    _ = "%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F;
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    _ = &e;
    _ = &f;
    _ = &g;
    break :blk_1 h;
})) {
    _ = &debug;
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    _ = &e;
    _ = &f;
    _ = &g;
    _ = &h;
    return LWIP_DEBUGF(debug, blk_1: {
        _ = "%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F ++ ":%" ++ X16_F;
        _ = &a;
        _ = &b;
        _ = &c;
        _ = &d;
        _ = &e;
        _ = &f;
        _ = &g;
        break :blk_1 h;
    });
}
pub inline fn ip6_addr_debug_print(debug: anytype, ipaddr: anytype) @TypeOf(ip6_addr_debug_print_parts(debug, @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK1(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK2(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK3(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK4(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK5(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK6(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK7(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK8(ipaddr) else @as(c_int, 0)))) {
    _ = &debug;
    _ = &ipaddr;
    return ip6_addr_debug_print_parts(debug, @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK1(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK2(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK3(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK4(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK5(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK6(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK7(ipaddr) else @as(c_int, 0)), @import("std").zig.c_translation.cast(u16_t, if (ipaddr != NULL) IP6_ADDR_BLOCK8(ipaddr) else @as(c_int, 0)));
}
pub inline fn ip6_addr_debug_print_val(debug: anytype, ipaddr: anytype) @TypeOf(ip6_addr_debug_print_parts(debug, IP6_ADDR_BLOCK1(&ipaddr), IP6_ADDR_BLOCK2(&ipaddr), IP6_ADDR_BLOCK3(&ipaddr), IP6_ADDR_BLOCK4(&ipaddr), IP6_ADDR_BLOCK5(&ipaddr), IP6_ADDR_BLOCK6(&ipaddr), IP6_ADDR_BLOCK7(&ipaddr), IP6_ADDR_BLOCK8(&ipaddr))) {
    _ = &debug;
    _ = &ipaddr;
    return ip6_addr_debug_print_parts(debug, IP6_ADDR_BLOCK1(&ipaddr), IP6_ADDR_BLOCK2(&ipaddr), IP6_ADDR_BLOCK3(&ipaddr), IP6_ADDR_BLOCK4(&ipaddr), IP6_ADDR_BLOCK5(&ipaddr), IP6_ADDR_BLOCK6(&ipaddr), IP6_ADDR_BLOCK7(&ipaddr), IP6_ADDR_BLOCK8(&ipaddr));
}
pub const IP6ADDR_STRLEN_MAX = @as(c_int, 46);
pub const IPADDR4_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:81:9
pub inline fn IPADDR4_INIT_BYTES(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(IPADDR4_INIT(PP_HTONL(LWIP_MAKEU32(a, b, c, d)))) {
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    return IPADDR4_INIT(PP_HTONL(LWIP_MAKEU32(a, b, c, d)));
}
pub const IPADDR6_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:86:9
pub const IPADDR6_INIT_HOST = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:88:9
pub inline fn IP_IS_ANY_TYPE_VAL(ipaddr: anytype) @TypeOf(IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_ANY) {
    _ = &ipaddr;
    return IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_ANY;
}
pub const IPADDR_ANY_TYPE_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:93:9
pub inline fn IP_IS_V4_VAL(ipaddr: anytype) @TypeOf(IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_V4) {
    _ = &ipaddr;
    return IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_V4;
}
pub inline fn IP_IS_V6_VAL(ipaddr: anytype) @TypeOf(IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_V6) {
    _ = &ipaddr;
    return IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_V6;
}
pub inline fn IP_IS_V4(ipaddr: anytype) @TypeOf((ipaddr == NULL) or (IP_IS_V4_VAL(ipaddr.*) != 0)) {
    _ = &ipaddr;
    return (ipaddr == NULL) or (IP_IS_V4_VAL(ipaddr.*) != 0);
}
pub inline fn IP_IS_V6(ipaddr: anytype) @TypeOf((ipaddr != NULL) and (IP_IS_V6_VAL(ipaddr.*) != 0)) {
    _ = &ipaddr;
    return (ipaddr != NULL) and (IP_IS_V6_VAL(ipaddr.*) != 0);
}
pub const IP_SET_TYPE_VAL = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:104:9
pub const IP_SET_TYPE = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:105:9
pub inline fn IP_GET_TYPE(ipaddr: anytype) @TypeOf(ipaddr.*.type) {
    _ = &ipaddr;
    return ipaddr.*.type;
}
pub inline fn IP_ADDR_RAW_SIZE(ipaddr: anytype) @TypeOf(if (IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_V4) @import("std").zig.c_translation.sizeof(ip4_addr_t) else @import("std").zig.c_translation.sizeof(ip6_addr_t)) {
    _ = &ipaddr;
    return if (IP_GET_TYPE(&ipaddr) == IPADDR_TYPE_V4) @import("std").zig.c_translation.sizeof(ip4_addr_t) else @import("std").zig.c_translation.sizeof(ip6_addr_t);
}
pub inline fn IP_ADDR_PCB_VERSION_MATCH_EXACT(pcb: anytype, ipaddr: anytype) @TypeOf(IP_GET_TYPE(&pcb.*.local_ip) == IP_GET_TYPE(ipaddr)) {
    _ = &pcb;
    _ = &ipaddr;
    return IP_GET_TYPE(&pcb.*.local_ip) == IP_GET_TYPE(ipaddr);
}
pub inline fn IP_ADDR_PCB_VERSION_MATCH(pcb: anytype, ipaddr: anytype) @TypeOf((IP_IS_ANY_TYPE_VAL(pcb.*.local_ip) != 0) or (IP_ADDR_PCB_VERSION_MATCH_EXACT(pcb, ipaddr) != 0)) {
    _ = &pcb;
    _ = &ipaddr;
    return (IP_IS_ANY_TYPE_VAL(pcb.*.local_ip) != 0) or (IP_ADDR_PCB_VERSION_MATCH_EXACT(pcb, ipaddr) != 0);
}
pub inline fn ip_2_ip6(ipaddr: anytype) @TypeOf(&ipaddr.*.u_addr.ip6) {
    _ = &ipaddr;
    return &ipaddr.*.u_addr.ip6;
}
pub inline fn ip_2_ip4(ipaddr: anytype) @TypeOf(&ipaddr.*.u_addr.ip4) {
    _ = &ipaddr;
    return &ipaddr.*.u_addr.ip4;
}
pub const IP_ADDR4 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:123:9
pub const IP_ADDR6 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:126:9
pub inline fn IP_ADDR6_HOST(ipaddr: anytype, @"i0": anytype, @"i1": anytype, @"i2": anytype, @"i3": anytype) @TypeOf(IP_ADDR6(ipaddr, PP_HTONL(@"i0"), PP_HTONL(@"i1"), PP_HTONL(@"i2"), PP_HTONL(@"i3"))) {
    _ = &ipaddr;
    _ = &@"i0";
    _ = &@"i1";
    _ = &@"i2";
    _ = &@"i3";
    return IP_ADDR6(ipaddr, PP_HTONL(@"i0"), PP_HTONL(@"i1"), PP_HTONL(@"i2"), PP_HTONL(@"i3"));
}
pub const ip_clear_no4 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:131:9
pub inline fn IP_V6_EQ_PART(ipaddr: anytype, WORD: anytype, VAL: anytype) @TypeOf(ip_2_ip6(ipaddr).*.addr[@as(usize, @intCast(WORD))] == htonl(VAL)) {
    _ = &ipaddr;
    _ = &WORD;
    _ = &VAL;
    return ip_2_ip6(ipaddr).*.addr[@as(usize, @intCast(WORD))] == htonl(VAL);
}
pub inline fn IP_IS_V4MAPPEDV6(ipaddr: anytype) @TypeOf((((IP_IS_V6(ipaddr) != 0) and (IP_V6_EQ_PART(ipaddr, @as(c_int, 0), @as(c_int, 0)) != 0)) and (IP_V6_EQ_PART(ipaddr, @as(c_int, 1), @as(c_int, 0)) != 0)) and (IP_V6_EQ_PART(ipaddr, @as(c_int, 2), @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000FFFF, .hex)) != 0)) {
    _ = &ipaddr;
    return (((IP_IS_V6(ipaddr) != 0) and (IP_V6_EQ_PART(ipaddr, @as(c_int, 0), @as(c_int, 0)) != 0)) and (IP_V6_EQ_PART(ipaddr, @as(c_int, 1), @as(c_int, 0)) != 0)) and (IP_V6_EQ_PART(ipaddr, @as(c_int, 2), @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000FFFF, .hex)) != 0);
}
pub const ip_addr_copy = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:142:9
pub const ip_addr_copy_from_ip6 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:146:9
pub const ip_addr_copy_from_ip6_packed = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:149:9
pub const ip_addr_copy_from_ip4 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:152:9
pub const ip_addr_set_ip4_u32 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:155:9
pub const ip_addr_set_ip4_u32_val = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:158:9
pub inline fn ip_addr_get_ip4_u32(ipaddr: anytype) @TypeOf(if ((ipaddr != 0) and (IP_IS_V4(ipaddr) != 0)) ip4_addr_get_u32(ip_2_ip4(ipaddr)) else @as(c_int, 0)) {
    _ = &ipaddr;
    return if ((ipaddr != 0) and (IP_IS_V4(ipaddr) != 0)) ip4_addr_get_u32(ip_2_ip4(ipaddr)) else @as(c_int, 0);
}
pub const ip_addr_set = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:164:9
pub inline fn ip_addr_set_ipaddr(dest: anytype, src: anytype) @TypeOf(ip_addr_set(dest, src)) {
    _ = &dest;
    _ = &src;
    return ip_addr_set(dest, src);
}
pub const ip_addr_set_zero = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:170:9
pub const ip_addr_set_zero_ip4 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:173:9
pub const ip_addr_set_zero_ip6 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:176:9
pub const ip_addr_set_any = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:179:9
pub const ip_addr_set_any_val = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:183:9
pub const ip_addr_set_loopback = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:187:9
pub const ip_addr_set_loopback_val = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:191:9
pub const ip_addr_set_hton = @compileError("unable to translate macro: undefined identifier `ipaddr`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:195:9
pub const ip_addr_get_network = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:199:9
pub inline fn ip_addr_netcmp(addr1: anytype, addr2: anytype, mask: anytype) @TypeOf(if ((IP_IS_V6(addr1) != 0) and (IP_IS_V6(addr2) != 0)) @as(c_int, 0) else ip4_addr_netcmp(ip_2_ip4(addr1), ip_2_ip4(addr2), mask)) {
    _ = &addr1;
    _ = &addr2;
    _ = &mask;
    return if ((IP_IS_V6(addr1) != 0) and (IP_IS_V6(addr2) != 0)) @as(c_int, 0) else ip4_addr_netcmp(ip_2_ip4(addr1), ip_2_ip4(addr2), mask);
}
pub inline fn ip_addr_cmp(addr1: anytype, addr2: anytype) @TypeOf(if (IP_GET_TYPE(addr1) != IP_GET_TYPE(addr2)) @as(c_int, 0) else if (IP_IS_V6_VAL(addr1.*)) ip6_addr_cmp(ip_2_ip6(addr1), ip_2_ip6(addr2)) else ip4_addr_cmp(ip_2_ip4(addr1), ip_2_ip4(addr2))) {
    _ = &addr1;
    _ = &addr2;
    return if (IP_GET_TYPE(addr1) != IP_GET_TYPE(addr2)) @as(c_int, 0) else if (IP_IS_V6_VAL(addr1.*)) ip6_addr_cmp(ip_2_ip6(addr1), ip_2_ip6(addr2)) else ip4_addr_cmp(ip_2_ip4(addr1), ip_2_ip4(addr2));
}
pub inline fn ip_addr_cmp_zoneless(addr1: anytype, addr2: anytype) @TypeOf(if (IP_GET_TYPE(addr1) != IP_GET_TYPE(addr2)) @as(c_int, 0) else if (IP_IS_V6_VAL(addr1.*)) ip6_addr_cmp_zoneless(ip_2_ip6(addr1), ip_2_ip6(addr2)) else ip4_addr_cmp(ip_2_ip4(addr1), ip_2_ip4(addr2))) {
    _ = &addr1;
    _ = &addr2;
    return if (IP_GET_TYPE(addr1) != IP_GET_TYPE(addr2)) @as(c_int, 0) else if (IP_IS_V6_VAL(addr1.*)) ip6_addr_cmp_zoneless(ip_2_ip6(addr1), ip_2_ip6(addr2)) else ip4_addr_cmp(ip_2_ip4(addr1), ip_2_ip4(addr2));
}
pub inline fn ip_addr_isany(ipaddr: anytype) @TypeOf(if (ipaddr == NULL) @as(c_int, 1) else if (IP_IS_V6(ipaddr)) ip6_addr_isany(ip_2_ip6(ipaddr)) else ip4_addr_isany(ip_2_ip4(ipaddr))) {
    _ = &ipaddr;
    return if (ipaddr == NULL) @as(c_int, 1) else if (IP_IS_V6(ipaddr)) ip6_addr_isany(ip_2_ip6(ipaddr)) else ip4_addr_isany(ip_2_ip4(ipaddr));
}
pub inline fn ip_addr_isany_val(ipaddr: anytype) @TypeOf(if (IP_IS_V6_VAL(ipaddr)) ip6_addr_isany_val(ip_2_ip6(&ipaddr).*) else ip4_addr_isany_val(ip_2_ip4(&ipaddr).*)) {
    _ = &ipaddr;
    return if (IP_IS_V6_VAL(ipaddr)) ip6_addr_isany_val(ip_2_ip6(&ipaddr).*) else ip4_addr_isany_val(ip_2_ip4(&ipaddr).*);
}
pub inline fn ip_addr_isbroadcast(ipaddr: anytype, netif_1: anytype) @TypeOf(if (IP_IS_V6(ipaddr)) @as(c_int, 0) else ip4_addr_isbroadcast(ip_2_ip4(ipaddr), netif_1)) {
    _ = &ipaddr;
    _ = &netif_1;
    return if (IP_IS_V6(ipaddr)) @as(c_int, 0) else ip4_addr_isbroadcast(ip_2_ip4(ipaddr), netif_1);
}
pub inline fn ip_addr_ismulticast(ipaddr: anytype) @TypeOf(if (IP_IS_V6(ipaddr)) ip6_addr_ismulticast(ip_2_ip6(ipaddr)) else ip4_addr_ismulticast(ip_2_ip4(ipaddr))) {
    _ = &ipaddr;
    return if (IP_IS_V6(ipaddr)) ip6_addr_ismulticast(ip_2_ip6(ipaddr)) else ip4_addr_ismulticast(ip_2_ip4(ipaddr));
}
pub inline fn ip_addr_isloopback(ipaddr: anytype) @TypeOf(if (IP_IS_V6(ipaddr)) ip6_addr_isloopback(ip_2_ip6(ipaddr)) else ip4_addr_isloopback(ip_2_ip4(ipaddr))) {
    _ = &ipaddr;
    return if (IP_IS_V6(ipaddr)) ip6_addr_isloopback(ip_2_ip6(ipaddr)) else ip4_addr_isloopback(ip_2_ip4(ipaddr));
}
pub inline fn ip_addr_islinklocal(ipaddr: anytype) @TypeOf(if (IP_IS_V6(ipaddr)) ip6_addr_islinklocal(ip_2_ip6(ipaddr)) else ip4_addr_islinklocal(ip_2_ip4(ipaddr))) {
    _ = &ipaddr;
    return if (IP_IS_V6(ipaddr)) ip6_addr_islinklocal(ip_2_ip6(ipaddr)) else ip4_addr_islinklocal(ip_2_ip4(ipaddr));
}
pub const ip_addr_debug_print = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:238:9
pub const ip_addr_debug_print_val = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:241:9
pub const IPADDR_STRLEN_MAX = IP6ADDR_STRLEN_MAX;
pub const ip4_2_ipv4_mapped_ipv6 = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:252:9
pub const unmap_ipv4_mapped_ipv6 = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/ip_addr.h:260:9
pub inline fn IP46_ADDR_ANY(@"type": anytype) @TypeOf(if (@"type" == IPADDR_TYPE_V6) IP6_ADDR_ANY else IP4_ADDR_ANY) {
    _ = &@"type";
    return if (@"type" == IPADDR_TYPE_V6) IP6_ADDR_ANY else IP4_ADDR_ANY;
}
pub const IP_ADDR_ANY = IP4_ADDR_ANY;
pub const IP4_ADDR_ANY = &ip_addr_any;
pub const IP4_ADDR_ANY4 = ip_2_ip4(&ip_addr_any);
pub const IP_ADDR_BROADCAST = &ip_addr_broadcast;
pub const IP4_ADDR_BROADCAST = ip_2_ip4(&ip_addr_broadcast);
pub const IP6_ADDR_ANY = &ip6_addr_any;
pub const IP6_ADDR_ANY6 = ip_2_ip6(&ip6_addr_any);
pub const IP_ANY_TYPE = &ip_addr_any_type;
pub const LWIP_HDR_NETIF_H = "";
pub const ENABLE_LOOPBACK = (LWIP_NETIF_LOOPBACK != 0) or (LWIP_HAVE_LOOPIF != 0);
pub const LWIP_HDR_ERR_H = "";
pub inline fn lwip_strerr(x: anytype) @TypeOf("") {
    _ = &x;
    return "";
}
pub const LWIP_HDR_PBUF_H = "";
pub inline fn PBUF_NEEDS_COPY(p: anytype) @TypeOf(p.*.type_internal & PBUF_TYPE_FLAG_DATA_VOLATILE) {
    _ = &p;
    return p.*.type_internal & PBUF_TYPE_FLAG_DATA_VOLATILE;
}
pub const PBUF_TRANSPORT_HLEN = @as(c_int, 20);
pub const PBUF_IP_HLEN = @as(c_int, 40);
pub const PBUF_TYPE_FLAG_STRUCT_DATA_CONTIGUOUS = @as(c_int, 0x80);
pub const PBUF_TYPE_FLAG_DATA_VOLATILE = @as(c_int, 0x40);
pub const PBUF_TYPE_ALLOC_SRC_MASK = @as(c_int, 0x0F);
pub const PBUF_ALLOC_FLAG_RX = @as(c_int, 0x0100);
pub const PBUF_ALLOC_FLAG_DATA_CONTIGUOUS = @as(c_int, 0x0200);
pub const PBUF_TYPE_ALLOC_SRC_MASK_STD_HEAP = @as(c_int, 0x00);
pub const PBUF_TYPE_ALLOC_SRC_MASK_STD_MEMP_PBUF = @as(c_int, 0x01);
pub const PBUF_TYPE_ALLOC_SRC_MASK_STD_MEMP_PBUF_POOL = @as(c_int, 0x02);
pub const PBUF_TYPE_ALLOC_SRC_MASK_APP_MIN = @as(c_int, 0x03);
pub const PBUF_TYPE_ALLOC_SRC_MASK_APP_MAX = PBUF_TYPE_ALLOC_SRC_MASK;
pub const PBUF_FLAG_PUSH = @as(c_uint, 0x01);
pub const PBUF_FLAG_IS_CUSTOM = @as(c_uint, 0x02);
pub const PBUF_FLAG_MCASTLOOP = @as(c_uint, 0x04);
pub const PBUF_FLAG_LLBCAST = @as(c_uint, 0x08);
pub const PBUF_FLAG_LLMCAST = @as(c_uint, 0x10);
pub const PBUF_FLAG_TCP_FIN = @as(c_uint, 0x20);
pub const PBUF_POOL_FREE_OOSEQ = @as(c_int, 1);
pub const PBUF_CHECK_FREE_OOSEQ = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/pbuf.h:269:11
pub const pbuf_init = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/pbuf.h:273:9
pub inline fn pbuf_get_allocsrc(p: anytype) @TypeOf(p.*.type_internal & PBUF_TYPE_ALLOC_SRC_MASK) {
    _ = &p;
    return p.*.type_internal & PBUF_TYPE_ALLOC_SRC_MASK;
}
pub inline fn pbuf_match_allocsrc(p: anytype, @"type": anytype) @TypeOf(pbuf_get_allocsrc(p) == (@"type" & PBUF_TYPE_ALLOC_SRC_MASK)) {
    _ = &p;
    _ = &@"type";
    return pbuf_get_allocsrc(p) == (@"type" & PBUF_TYPE_ALLOC_SRC_MASK);
}
pub inline fn pbuf_match_type(p: anytype, @"type": anytype) @TypeOf(pbuf_match_allocsrc(p, @"type")) {
    _ = &p;
    _ = &@"type";
    return pbuf_match_allocsrc(p, @"type");
}
pub const LWIP_HDR_STATS_H = "";
pub const LWIP_HDR_MEM_H = "";
pub const MEM_SIZE_F = SZT_F;
pub const LWIP_HDR_MEMP_H = "";
pub const LWIP_MEMPOOL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/memp.h:48:9
pub const LWIP_MALLOC_MEMPOOL = @compileError("unable to translate macro: undefined identifier `POOL_`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/priv/memp_std.h:23:9
pub const LWIP_MALLOC_MEMPOOL_START = "";
pub const LWIP_MALLOC_MEMPOOL_END = "";
pub inline fn LWIP_PBUF_MEMPOOL(name: anytype, num: anytype, payload: anytype, desc: anytype) @TypeOf(LWIP_MEMPOOL(name, num, LWIP_MEM_ALIGN_SIZE(@import("std").zig.c_translation.sizeof(struct_pbuf)) + LWIP_MEM_ALIGN_SIZE(payload), desc)) {
    _ = &name;
    _ = &num;
    _ = &payload;
    _ = &desc;
    return LWIP_MEMPOOL(name, num, LWIP_MEM_ALIGN_SIZE(@import("std").zig.c_translation.sizeof(struct_pbuf)) + LWIP_MEM_ALIGN_SIZE(payload), desc);
}
pub const LWIP_HDR_MEMP_PRIV_H = "";
pub const LWIP_HDR_MEM_PRIV_H = "";
pub const MEMP_SIZE = @as(c_int, 0);
pub inline fn MEMP_ALIGN_SIZE(x: anytype) @TypeOf(LWIP_MEM_ALIGN_SIZE(x)) {
    _ = &x;
    return LWIP_MEM_ALIGN_SIZE(x);
}
pub const DECLARE_LWIP_MEMPOOL_DESC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/priv/memp_priv.h:136:9
pub const LWIP_MEMPOOL_DECLARE_STATS_INSTANCE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/priv/memp_priv.h:143:9
pub const LWIP_MEMPOOL_DECLARE_STATS_REFERENCE = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/priv/memp_priv.h:144:9
pub const LWIP_MEMPOOL_PROTOTYPE = @compileError("unable to translate macro: undefined identifier `memp_`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/memp.h:67:9
pub const LWIP_MEMPOOL_DECLARE = @compileError("unable to translate macro: undefined identifier `memp_stats_`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/memp.h:71:9
pub const LWIP_MEMPOOL_INIT = @compileError("unable to translate macro: undefined identifier `memp_`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/memp.h:117:9
pub const LWIP_MEMPOOL_ALLOC = @compileError("unable to translate macro: undefined identifier `memp_`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/memp.h:122:9
pub const LWIP_MEMPOOL_FREE = @compileError("unable to translate macro: undefined identifier `memp_`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/memp.h:127:9
pub const stats_init = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:335:9
pub const STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:336:9
pub const STATS_DEC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:337:9
pub const STATS_INC_USED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:338:9
pub const TCP_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:345:9
pub const TCP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:346:9
pub const UDP_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:353:9
pub const UDP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:354:9
pub const ICMP_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:361:9
pub const ICMP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:362:9
pub const IGMP_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:369:9
pub const IGMP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:370:9
pub const IP_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:377:9
pub const IP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:378:9
pub const IPFRAG_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:385:9
pub const IPFRAG_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:386:9
pub const ETHARP_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:393:9
pub const ETHARP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:394:9
pub const LINK_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:401:9
pub const LINK_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:402:9
pub const MEM_STATS_AVAIL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:412:9
pub const MEM_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:413:9
pub const MEM_STATS_INC_USED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:414:9
pub const MEM_STATS_DEC_USED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:415:9
pub const MEM_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:416:9
pub const MEMP_STATS_DEC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:424:9
pub const MEMP_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:425:9
pub inline fn MEMP_STATS_GET(x: anytype, i: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    _ = &i;
    return @as(c_int, 0);
}
pub const SYS_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:435:9
pub const SYS_STATS_DEC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:436:9
pub const SYS_STATS_INC_USED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:437:9
pub const SYS_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:438:9
pub const IP6_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:445:9
pub const IP6_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:446:9
pub const ICMP6_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:453:9
pub const ICMP6_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:454:9
pub const IP6_FRAG_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:461:9
pub const IP6_FRAG_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:462:9
pub const MLD6_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:469:9
pub const MLD6_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:470:9
pub const ND6_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:477:9
pub const ND6_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:478:9
pub const MIB2_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:484:9
pub const IP_NAPT_STATS_INC = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:490:9
pub const IP_NAPT_STATS_DISPLAY = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:497:9
pub const stats_display = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:509:9
pub const stats_display_proto = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:510:9
pub const stats_display_igmp = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:511:9
pub const stats_display_mem = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:512:9
pub const stats_display_memp = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:513:9
pub const stats_display_sys = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/stats.h:514:9
pub const NETIF_MAX_HWADDR_LEN = @as(c_uint, 6);
pub const NETIF_NAMESIZE = @as(c_int, 6);
pub const NETIF_FLAG_UP = @as(c_uint, 0x01);
pub const NETIF_FLAG_BROADCAST = @as(c_uint, 0x02);
pub const NETIF_FLAG_LINK_UP = @as(c_uint, 0x04);
pub const NETIF_FLAG_ETHARP = @as(c_uint, 0x08);
pub const NETIF_FLAG_ETHERNET = @as(c_uint, 0x10);
pub const NETIF_FLAG_IGMP = @as(c_uint, 0x20);
pub const NETIF_FLAG_MLD6 = @as(c_uint, 0x40);
pub const netif_set_client_data = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:233:9
pub inline fn netif_get_client_data(netif_1: anytype, id: anytype) @TypeOf(netif_1.*.client_data[@as(usize, @intCast(id))]) {
    _ = &netif_1;
    _ = &id;
    return netif_1.*.client_data[@as(usize, @intCast(id))];
}
pub const NETIF_ADDR_IDX_MAX = @as(c_int, 0x7F);
pub const LWIP_NETIF_USE_HINTS = @as(c_int, 0);
pub const NETIF_SET_CHECKSUM_CTRL = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:404:9
pub const IF__NETIF_CHECKSUM_ENABLED = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:405:9
pub const NETIF_FOREACH = @compileError("unable to translate C expr: unexpected token 'for'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:413:9
pub const netif_ip4_addr = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:446:9
pub const netif_ip4_netmask = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:448:9
pub const netif_ip4_gw = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:450:9
pub const netif_ip_addr4 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:452:9
pub const netif_ip_netmask4 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:454:9
pub const netif_ip_gw4 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:456:9
pub const netif_set_flags = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:459:9
pub const netif_clear_flags = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:460:9
pub inline fn netif_is_flag_set(netif_1: anytype, flag: anytype) @TypeOf((netif_1.*.flags & flag) != @as(c_int, 0)) {
    _ = &netif_1;
    _ = &flag;
    return (netif_1.*.flags & flag) != @as(c_int, 0);
}
pub inline fn netif_is_up(netif_1: anytype) @TypeOf(if (netif_1.*.flags & NETIF_FLAG_UP) @import("std").zig.c_translation.cast(u8_t, @as(c_int, 1)) else @import("std").zig.c_translation.cast(u8_t, @as(c_int, 0))) {
    _ = &netif_1;
    return if (netif_1.*.flags & NETIF_FLAG_UP) @import("std").zig.c_translation.cast(u8_t, @as(c_int, 1)) else @import("std").zig.c_translation.cast(u8_t, @as(c_int, 0));
}
pub inline fn netif_is_link_up(netif_1: anytype) @TypeOf(if (netif_1.*.flags & NETIF_FLAG_LINK_UP) @import("std").zig.c_translation.cast(u8_t, @as(c_int, 1)) else @import("std").zig.c_translation.cast(u8_t, @as(c_int, 0))) {
    _ = &netif_1;
    return if (netif_1.*.flags & NETIF_FLAG_LINK_UP) @import("std").zig.c_translation.cast(u8_t, @as(c_int, 1)) else @import("std").zig.c_translation.cast(u8_t, @as(c_int, 0));
}
pub const netif_set_hostname = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:488:9
pub inline fn netif_get_hostname(netif_1: anytype) @TypeOf(if (netif_1 != NULL) netif_1.*.hostname else NULL) {
    _ = &netif_1;
    return if (netif_1 != NULL) netif_1.*.hostname else NULL;
}
pub const netif_set_igmp_mac_filter = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:495:9
pub inline fn netif_get_igmp_mac_filter(netif_1: anytype) @TypeOf(if (netif_1 != NULL) netif_1.*.igmp_mac_filter else NULL) {
    _ = &netif_1;
    return if (netif_1 != NULL) netif_1.*.igmp_mac_filter else NULL;
}
pub const netif_set_mld_mac_filter = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:501:9
pub inline fn netif_get_mld_mac_filter(netif_1: anytype) @TypeOf(if (netif_1 != NULL) netif_1.*.mld_mac_filter else NULL) {
    _ = &netif_1;
    return if (netif_1 != NULL) netif_1.*.mld_mac_filter else NULL;
}
pub const netif_mld_mac_filter = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:503:9
pub const netif_ip_addr6 = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:518:9
pub const netif_ip6_addr = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:520:9
pub inline fn netif_ip6_addr_state(netif_1: anytype, i: anytype) @TypeOf(netif_1.*.ip6_addr_state[@as(usize, @intCast(i))]) {
    _ = &netif_1;
    _ = &i;
    return netif_1.*.ip6_addr_state[@as(usize, @intCast(i))];
}
pub const netif_set_ip6_autoconfig_enabled = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:528:9
pub inline fn netif_ip6_addr_valid_life(netif_1: anytype, i: anytype) @TypeOf(if (netif_1 != NULL) netif_1.*.ip6_addr_valid_life[@as(usize, @intCast(i))] else IP6_ADDR_LIFE_STATIC) {
    _ = &netif_1;
    _ = &i;
    return if (netif_1 != NULL) netif_1.*.ip6_addr_valid_life[@as(usize, @intCast(i))] else IP6_ADDR_LIFE_STATIC;
}
pub const netif_ip6_addr_set_valid_life = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:532:9
pub inline fn netif_ip6_addr_pref_life(netif_1: anytype, i: anytype) @TypeOf(if (netif_1 != NULL) netif_1.*.ip6_addr_pref_life[@as(usize, @intCast(i))] else IP6_ADDR_LIFE_STATIC) {
    _ = &netif_1;
    _ = &i;
    return if (netif_1 != NULL) netif_1.*.ip6_addr_pref_life[@as(usize, @intCast(i))] else IP6_ADDR_LIFE_STATIC;
}
pub const netif_ip6_addr_set_pref_life = @compileError("unable to translate C expr: unexpected token 'do'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:536:9
pub inline fn netif_ip6_addr_isstatic(netif_1: anytype, i: anytype) @TypeOf(netif_ip6_addr_valid_life(netif_1, i) == IP6_ADDR_LIFE_STATIC) {
    _ = &netif_1;
    _ = &i;
    return netif_ip6_addr_valid_life(netif_1, i) == IP6_ADDR_LIFE_STATIC;
}
pub inline fn netif_mtu6(netif_1: anytype) @TypeOf(netif_1.*.mtu6) {
    _ = &netif_1;
    return netif_1.*.mtu6;
}
pub const NETIF_SET_HINTS = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:554:9
pub const NETIF_RESET_HINTS = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:555:9
pub inline fn netif_get_index(netif_1: anytype) u8_t {
    _ = &netif_1;
    return @import("std").zig.c_translation.cast(u8_t, netif_1.*.num + @as(c_int, 1));
}
pub const NETIF_NO_INDEX = @as(c_int, 0);
pub const LWIP_NSC_NONE = @as(c_int, 0x0000);
pub const LWIP_NSC_NETIF_ADDED = @as(c_int, 0x0001);
pub const LWIP_NSC_NETIF_REMOVED = @as(c_int, 0x0002);
pub const LWIP_NSC_LINK_CHANGED = @as(c_int, 0x0004);
pub const LWIP_NSC_STATUS_CHANGED = @as(c_int, 0x0008);
pub const LWIP_NSC_IPV4_ADDRESS_CHANGED = @as(c_int, 0x0010);
pub const LWIP_NSC_IPV4_GATEWAY_CHANGED = @as(c_int, 0x0020);
pub const LWIP_NSC_IPV4_NETMASK_CHANGED = @as(c_int, 0x0040);
pub const LWIP_NSC_IPV4_SETTINGS_CHANGED = @as(c_int, 0x0080);
pub const LWIP_NSC_IPV6_SET = @as(c_int, 0x0100);
pub const LWIP_NSC_IPV6_ADDR_STATE_CHANGED = @as(c_int, 0x0200);
pub const NETIF_DECLARE_EXT_CALLBACK = @compileError("unable to translate C expr: unexpected token 'static'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netif.h:661:9
pub const LWIP_HDR_INET_H = "";
pub const s6_addr = @compileError("unable to translate macro: undefined identifier `un`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:67:9
pub const INADDR_NONE = IPADDR_NONE;
pub const INADDR_LOOPBACK = IPADDR_LOOPBACK;
pub const INADDR_ANY = IPADDR_ANY;
pub const INADDR_BROADCAST = IPADDR_BROADCAST;
pub const IN6ADDR_ANY_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:81:9
pub const IN6ADDR_LOOPBACK_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:84:9
pub inline fn IN_CLASSA(a: anytype) @TypeOf(IP_CLASSA(a)) {
    _ = &a;
    return IP_CLASSA(a);
}
pub const IN_CLASSA_NET = IP_CLASSA_NET;
pub const IN_CLASSA_NSHIFT = IP_CLASSA_NSHIFT;
pub const IN_CLASSA_HOST = IP_CLASSA_HOST;
pub const IN_CLASSA_MAX = IP_CLASSA_MAX;
pub inline fn IN_CLASSB(b: anytype) @TypeOf(IP_CLASSB(b)) {
    _ = &b;
    return IP_CLASSB(b);
}
pub const IN_CLASSB_NET = IP_CLASSB_NET;
pub const IN_CLASSB_NSHIFT = IP_CLASSB_NSHIFT;
pub const IN_CLASSB_HOST = IP_CLASSB_HOST;
pub const IN_CLASSB_MAX = IP_CLASSB_MAX;
pub inline fn IN_CLASSC(c: anytype) @TypeOf(IP_CLASSC(c)) {
    _ = &c;
    return IP_CLASSC(c);
}
pub const IN_CLASSC_NET = IP_CLASSC_NET;
pub const IN_CLASSC_NSHIFT = IP_CLASSC_NSHIFT;
pub const IN_CLASSC_HOST = IP_CLASSC_HOST;
pub const IN_CLASSC_MAX = @compileError("unable to translate macro: undefined identifier `IP_CLASSC_MAX`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:108:9
pub inline fn IN_CLASSD(d: anytype) @TypeOf(IP_CLASSD(d)) {
    _ = &d;
    return IP_CLASSD(d);
}
pub const IN_CLASSD_NET = IP_CLASSD_NET;
pub const IN_CLASSD_NSHIFT = IP_CLASSD_NSHIFT;
pub const IN_CLASSD_HOST = IP_CLASSD_HOST;
pub const IN_CLASSD_MAX = @compileError("unable to translate macro: undefined identifier `IP_CLASSD_MAX`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:114:9
pub inline fn IN_MULTICAST(a: anytype) @TypeOf(IP_MULTICAST(a)) {
    _ = &a;
    return IP_MULTICAST(a);
}
pub inline fn IN_EXPERIMENTAL(a: anytype) @TypeOf(IP_EXPERIMENTAL(a)) {
    _ = &a;
    return IP_EXPERIMENTAL(a);
}
pub inline fn IN_BADCLASS(a: anytype) @TypeOf(IP_BADCLASS(a)) {
    _ = &a;
    return IP_BADCLASS(a);
}
pub const IN_LOOPBACKNET = IP_LOOPBACKNET;
pub const INET_ADDRSTRLEN = IP4ADDR_STRLEN_MAX;
pub const INET6_ADDRSTRLEN = IP6ADDR_STRLEN_MAX;
pub const inet_addr_from_ip4addr = @compileError("unable to translate C expr: expected ')' instead got '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:135:9
pub inline fn inet_addr_to_ip4addr(target_ipaddr: anytype, source_inaddr: anytype) @TypeOf(ip4_addr_set_u32(target_ipaddr, source_inaddr.*.s_addr)) {
    _ = &target_ipaddr;
    _ = &source_inaddr;
    return ip4_addr_set_u32(target_ipaddr, source_inaddr.*.s_addr);
}
pub inline fn inet_addr(cp: anytype) @TypeOf(ipaddr_addr(cp)) {
    _ = &cp;
    return ipaddr_addr(cp);
}
pub inline fn inet_aton(cp: anytype, addr: anytype) @TypeOf(ip4addr_aton(cp, @import("std").zig.c_translation.cast([*c]ip4_addr_t, addr))) {
    _ = &cp;
    _ = &addr;
    return ip4addr_aton(cp, @import("std").zig.c_translation.cast([*c]ip4_addr_t, addr));
}
pub const inet_ntoa = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:141:9
pub const inet_ntoa_r = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:142:9
pub const inet6_addr_from_ip6addr = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:147:9
pub const inet6_addr_to_ip6addr = @compileError("unable to translate C expr: unexpected token '{'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:151:9
pub inline fn inet6_aton(cp: anytype, addr: anytype) @TypeOf(ip6addr_aton(cp, @import("std").zig.c_translation.cast([*c]ip6_addr_t, addr))) {
    _ = &cp;
    _ = &addr;
    return ip6addr_aton(cp, @import("std").zig.c_translation.cast([*c]ip6_addr_t, addr));
}
pub const inet6_ntoa = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:159:9
pub const inet6_ntoa_r = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/inet.h:160:9
pub const LWIP_HDR_ERRNO_H = "";
pub const SIN_ZERO_LEN = @as(c_int, 8);
pub const MSG_TRUNC = @as(c_int, 0x04);
pub const MSG_CTRUNC = @as(c_int, 0x08);
pub inline fn ALIGN_H(size: anytype) @TypeOf(((size + @import("std").zig.c_translation.sizeof(c_long)) - @as(c_uint, 1)) & ~(@import("std").zig.c_translation.sizeof(c_long) - @as(c_uint, 1))) {
    _ = &size;
    return ((size + @import("std").zig.c_translation.sizeof(c_long)) - @as(c_uint, 1)) & ~(@import("std").zig.c_translation.sizeof(c_long) - @as(c_uint, 1));
}
pub inline fn ALIGN_D(size: anytype) @TypeOf(ALIGN_H(size)) {
    _ = &size;
    return ALIGN_H(size);
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (mhdr.*.msg_controllen >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, NULL)) {
    _ = &mhdr;
    return if (mhdr.*.msg_controllen >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, NULL);
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(if (cmsg == NULL) CMSG_FIRSTHDR(mhdr) else if (((@import("std").zig.c_translation.cast([*c]u8_t, cmsg) + ALIGN_H(cmsg.*.cmsg_len)) + ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) > (@import("std").zig.c_translation.cast([*c]u8_t, mhdr.*.msg_control) + mhdr.*.msg_controllen)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, NULL) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8_t, cmsg) + ALIGN_H(cmsg.*.cmsg_len)))) {
    _ = &mhdr;
    _ = &cmsg;
    return if (cmsg == NULL) CMSG_FIRSTHDR(mhdr) else if (((@import("std").zig.c_translation.cast([*c]u8_t, cmsg) + ALIGN_H(cmsg.*.cmsg_len)) + ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) > (@import("std").zig.c_translation.cast([*c]u8_t, mhdr.*.msg_control) + mhdr.*.msg_controllen)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, NULL) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8_t, cmsg) + ALIGN_H(cmsg.*.cmsg_len)));
}
pub inline fn CMSG_DATA(cmsg: anytype) ?*anyopaque {
    _ = &cmsg;
    return @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8_t, cmsg) + ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr)));
}
pub inline fn CMSG_SPACE(length: anytype) @TypeOf(ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + ALIGN_H(length)) {
    _ = &length;
    return ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + ALIGN_H(length);
}
pub inline fn CMSG_LEN(length: anytype) @TypeOf(ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + length) {
    _ = &length;
    return ALIGN_D(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + length;
}
pub const IFNAMSIZ = NETIF_NAMESIZE;
pub const SOCK_STREAM = @as(c_int, 1);
pub const SOCK_DGRAM = @as(c_int, 2);
pub const SOCK_RAW = @as(c_int, 3);
pub const SO_REUSEADDR = @as(c_int, 0x0004);
pub const SO_KEEPALIVE = @as(c_int, 0x0008);
pub const SO_BROADCAST = @as(c_int, 0x0020);
pub const SO_DEBUG = @as(c_int, 0x0001);
pub const SO_ACCEPTCONN = @as(c_int, 0x0002);
pub const SO_DONTROUTE = @as(c_int, 0x0010);
pub const SO_USELOOPBACK = @as(c_int, 0x0040);
pub const SO_LINGER = @as(c_int, 0x0080);
pub const SO_DONTLINGER = @import("std").zig.c_translation.cast(c_int, ~SO_LINGER);
pub const SO_OOBINLINE = @as(c_int, 0x0100);
pub const SO_REUSEPORT = @as(c_int, 0x0200);
pub const SO_SNDBUF = @as(c_int, 0x1001);
pub const SO_RCVBUF = @as(c_int, 0x1002);
pub const SO_SNDLOWAT = @as(c_int, 0x1003);
pub const SO_RCVLOWAT = @as(c_int, 0x1004);
pub const SO_SNDTIMEO = @as(c_int, 0x1005);
pub const SO_RCVTIMEO = @as(c_int, 0x1006);
pub const SO_ERROR = @as(c_int, 0x1007);
pub const SO_TYPE = @as(c_int, 0x1008);
pub const SO_CONTIMEO = @as(c_int, 0x1009);
pub const SO_NO_CHECK = @as(c_int, 0x100a);
pub const SO_BINDTODEVICE = @as(c_int, 0x100b);
pub const SOL_SOCKET = @as(c_int, 0xfff);
pub const AF_UNSPEC = @as(c_int, 0);
pub const AF_INET = @as(c_int, 2);
pub const AF_INET6 = @as(c_int, 10);
pub const PF_INET = AF_INET;
pub const PF_INET6 = AF_INET6;
pub const PF_UNSPEC = AF_UNSPEC;
pub const IPPROTO_IP = @as(c_int, 0);
pub const IPPROTO_ICMP = @as(c_int, 1);
pub const IPPROTO_TCP = @as(c_int, 6);
pub const IPPROTO_UDP = @as(c_int, 17);
pub const IPPROTO_IPV6 = @as(c_int, 41);
pub const IPPROTO_ICMPV6 = @as(c_int, 58);
pub const IPPROTO_UDPLITE = @as(c_int, 136);
pub const IPPROTO_RAW = @as(c_int, 255);
pub const MSG_PEEK = @as(c_int, 0x01);
pub const MSG_WAITALL = @as(c_int, 0x02);
pub const MSG_OOB = @as(c_int, 0x04);
pub const MSG_DONTWAIT = @as(c_int, 0x08);
pub const MSG_MORE = @as(c_int, 0x10);
pub const MSG_NOSIGNAL = @as(c_int, 0x20);
pub const IP_TOS = @as(c_int, 1);
pub const IP_TTL = @as(c_int, 2);
pub const IP_PKTINFO = @as(c_int, 8);
pub const TCP_NODELAY = @as(c_int, 0x01);
pub const TCP_KEEPALIVE = @as(c_int, 0x02);
pub const TCP_KEEPIDLE = @as(c_int, 0x03);
pub const TCP_KEEPINTVL = @as(c_int, 0x04);
pub const TCP_KEEPCNT = @as(c_int, 0x05);
pub const IPV6_CHECKSUM = @as(c_int, 7);
pub const IPV6_V6ONLY = @as(c_int, 27);
pub const IP_MULTICAST_TTL = @as(c_int, 5);
pub const IP_MULTICAST_IF = @as(c_int, 6);
pub const IP_MULTICAST_LOOP = @as(c_int, 7);
pub const IP_ADD_MEMBERSHIP = @as(c_int, 3);
pub const IP_DROP_MEMBERSHIP = @as(c_int, 4);
pub const IPV6_JOIN_GROUP = @as(c_int, 12);
pub const IPV6_ADD_MEMBERSHIP = IPV6_JOIN_GROUP;
pub const IPV6_LEAVE_GROUP = @as(c_int, 13);
pub const IPV6_DROP_MEMBERSHIP = IPV6_LEAVE_GROUP;
pub const IPTOS_TOS_MASK = @as(c_int, 0x1E);
pub inline fn IPTOS_TOS(tos: anytype) @TypeOf(tos & IPTOS_TOS_MASK) {
    _ = &tos;
    return tos & IPTOS_TOS_MASK;
}
pub const IPTOS_LOWDELAY = @as(c_int, 0x10);
pub const IPTOS_THROUGHPUT = @as(c_int, 0x08);
pub const IPTOS_RELIABILITY = @as(c_int, 0x04);
pub const IPTOS_LOWCOST = @as(c_int, 0x02);
pub const IPTOS_MINCOST = IPTOS_LOWCOST;
pub const IPTOS_PREC_MASK = @as(c_int, 0xe0);
pub inline fn IPTOS_PREC(tos: anytype) @TypeOf(tos & IPTOS_PREC_MASK) {
    _ = &tos;
    return tos & IPTOS_PREC_MASK;
}
pub const IPTOS_PREC_NETCONTROL = @as(c_int, 0xe0);
pub const IPTOS_PREC_INTERNETCONTROL = @as(c_int, 0xc0);
pub const IPTOS_PREC_CRITIC_ECP = @as(c_int, 0xa0);
pub const IPTOS_PREC_FLASHOVERRIDE = @as(c_int, 0x80);
pub const IPTOS_PREC_FLASH = @as(c_int, 0x60);
pub const IPTOS_PREC_IMMEDIATE = @as(c_int, 0x40);
pub const IPTOS_PREC_PRIORITY = @as(c_int, 0x20);
pub const IPTOS_PREC_ROUTINE = @as(c_int, 0x00);
pub const IOCPARM_MASK = @as(c_uint, 0x7f);
pub const IOC_VOID = @as(c_ulong, 0x20000000);
pub const IOC_OUT = @as(c_ulong, 0x40000000);
pub const IOC_IN = @as(c_ulong, 0x80000000);
pub const IOC_INOUT = IOC_IN | IOC_OUT;
pub inline fn _IO(x: anytype, y: anytype) c_long {
    _ = &x;
    _ = &y;
    return @import("std").zig.c_translation.cast(c_long, (IOC_VOID | (x << @as(c_int, 8))) | y);
}
pub inline fn _IOR(x: anytype, y: anytype, t: anytype) c_long {
    _ = &x;
    _ = &y;
    _ = &t;
    return @import("std").zig.c_translation.cast(c_long, ((IOC_OUT | ((@import("std").zig.c_translation.sizeof(t) & IOCPARM_MASK) << @as(c_int, 16))) | (x << @as(c_int, 8))) | y);
}
pub inline fn _IOW(x: anytype, y: anytype, t: anytype) c_long {
    _ = &x;
    _ = &y;
    _ = &t;
    return @import("std").zig.c_translation.cast(c_long, ((IOC_IN | ((@import("std").zig.c_translation.sizeof(t) & IOCPARM_MASK) << @as(c_int, 16))) | (x << @as(c_int, 8))) | y);
}
pub const FIONREAD = _IOR('f', @as(c_int, 127), c_ulong);
pub const FIONBIO = _IOW('f', @as(c_int, 126), c_ulong);
pub const SIOCSHIWAT = _IOW('s', @as(c_int, 0), c_ulong);
pub const SIOCGHIWAT = _IOR('s', @as(c_int, 1), c_ulong);
pub const SIOCSLOWAT = _IOW('s', @as(c_int, 2), c_ulong);
pub const SIOCGLOWAT = _IOR('s', @as(c_int, 3), c_ulong);
pub const SIOCATMARK = _IOR('s', @as(c_int, 7), c_ulong);
pub const O_NDELAY = O_NONBLOCK;
pub const SHUT_RD = @as(c_int, 0);
pub const SHUT_WR = @as(c_int, 1);
pub const SHUT_RDWR = @as(c_int, 2);
pub const LWIP_SELECT_MAXNFDS = FD_SETSIZE;
pub const lwip_socket_init = @compileError("unable to translate C expr: unexpected token ''");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sockets.h:528:9
pub const LWIP_HDR_NETDB_H = "";
pub const LWIP_DNS_API_DECLARE_H_ERRNO = @as(c_int, 1);
pub const LWIP_DNS_API_DEFINE_ERRORS = @as(c_int, 1);
pub const LWIP_DNS_API_DEFINE_FLAGS = @as(c_int, 1);
pub const LWIP_DNS_API_DECLARE_STRUCTS = @as(c_int, 1);
pub const EAI_NONAME = @as(c_int, 200);
pub const EAI_SERVICE = @as(c_int, 201);
pub const EAI_FAIL = @as(c_int, 202);
pub const EAI_MEMORY = @as(c_int, 203);
pub const EAI_FAMILY = @as(c_int, 204);
pub const HOST_NOT_FOUND = @as(c_int, 210);
pub const NO_DATA = @as(c_int, 211);
pub const NO_RECOVERY = @as(c_int, 212);
pub const TRY_AGAIN = @as(c_int, 213);
pub const AI_PASSIVE = @as(c_int, 0x01);
pub const AI_CANONNAME = @as(c_int, 0x02);
pub const AI_NUMERICHOST = @as(c_int, 0x04);
pub const AI_NUMERICSERV = @as(c_int, 0x08);
pub const AI_V4MAPPED = @as(c_int, 0x10);
pub const AI_ALL = @as(c_int, 0x20);
pub const AI_ADDRCONFIG = @as(c_int, 0x40);
pub const h_addr = @compileError("unable to translate macro: undefined identifier `h_addr_list`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/netdb.h:100:9
pub const NETDB_ELEM_SIZE = ((@import("std").zig.c_translation.sizeof(struct_addrinfo) + @import("std").zig.c_translation.sizeof(struct_sockaddr_storage)) + DNS_MAX_NAME_LENGTH) + @as(c_int, 1);
pub const LWIP_HDR_SYS_H = "";
pub const SYS_ARCH_TIMEOUT = @as(c_ulong, 0xffffffff);
pub const SYS_MBOX_EMPTY = SYS_ARCH_TIMEOUT;
pub inline fn sys_sem_wait(sem: anytype) @TypeOf(sys_arch_sem_wait(sem, @as(c_int, 0))) {
    _ = &sem;
    return sys_arch_sem_wait(sem, @as(c_int, 0));
}
pub inline fn sys_sem_valid_val(sem: anytype) @TypeOf(sys_sem_valid(&sem)) {
    _ = &sem;
    return sys_sem_valid(&sem);
}
pub inline fn sys_sem_set_invalid_val(sem: anytype) @TypeOf(sys_sem_set_invalid(&sem)) {
    _ = &sem;
    return sys_sem_set_invalid(&sem);
}
pub inline fn sys_mbox_tryfetch(mbox: anytype, msg: anytype) @TypeOf(sys_arch_mbox_tryfetch(mbox, msg)) {
    _ = &mbox;
    _ = &msg;
    return sys_arch_mbox_tryfetch(mbox, msg);
}
pub inline fn sys_mbox_fetch(mbox: anytype, msg: anytype) @TypeOf(sys_arch_mbox_fetch(mbox, msg, @as(c_int, 0))) {
    _ = &mbox;
    _ = &msg;
    return sys_arch_mbox_fetch(mbox, msg, @as(c_int, 0));
}
pub inline fn sys_mbox_valid_val(mbox: anytype) @TypeOf(sys_mbox_valid(&mbox)) {
    _ = &mbox;
    return sys_mbox_valid(&mbox);
}
pub inline fn sys_mbox_set_invalid_val(mbox: anytype) @TypeOf(sys_mbox_set_invalid(&mbox)) {
    _ = &mbox;
    return sys_mbox_set_invalid(&mbox);
}
pub inline fn SYS_ARCH_DECL_PROTECT(lev: anytype) @TypeOf(sys_prot_t ++ lev) {
    _ = &lev;
    return sys_prot_t ++ lev;
}
pub const SYS_ARCH_PROTECT = @compileError("unable to translate C expr: unexpected token '='");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sys.h:480:9
pub inline fn SYS_ARCH_UNPROTECT(lev: anytype) @TypeOf(sys_arch_unprotect(lev)) {
    _ = &lev;
    return sys_arch_unprotect(lev);
}
pub const SYS_ARCH_INC = @compileError("unable to translate macro: undefined identifier `old_level`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sys.h:511:9
pub const SYS_ARCH_DEC = @compileError("unable to translate macro: undefined identifier `old_level`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sys.h:520:9
pub const SYS_ARCH_GET = @compileError("unable to translate macro: undefined identifier `old_level`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sys.h:529:9
pub const SYS_ARCH_SET = @compileError("unable to translate macro: undefined identifier `old_level`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sys.h:538:9
pub const SYS_ARCH_LOCKED = @compileError("unable to translate macro: undefined identifier `old_level`");
// /home/wiiggee1/esp-idf/components/lwip/lwip/src/include/lwip/sys.h:547:9
pub const __lock = struct___lock;
pub const __sbuf = struct___sbuf;
pub const __sFILE = struct___sFILE;
pub const __locale_t = struct___locale_t;
pub const _Bigint = struct__Bigint;
pub const _mprec = struct__mprec;
pub const _rand48 = struct__rand48;
pub const __tm = struct___tm;
pub const _on_exit_args = struct__on_exit_args;
pub const _atexit = struct__atexit;
pub const _glue = struct__glue;
pub const _misc_reent = struct__misc_reent;
pub const _reent = struct__reent;
pub const intr_handle_data_t = struct_intr_handle_data_t;
pub const multi_heap_info = struct_multi_heap_info;
pub const walker_heap_info = struct_walker_heap_info;
pub const walker_block_info = struct_walker_block_info;
pub const HeapRegion = struct_HeapRegion;
pub const xHeapStats = struct_xHeapStats;
pub const timespec = struct_timespec;
pub const tms = struct_tms;
pub const timeval = struct_timeval;
pub const timezone = struct_timezone;
pub const xSTATIC_LIST_ITEM = struct_xSTATIC_LIST_ITEM;
pub const xSTATIC_MINI_LIST_ITEM = struct_xSTATIC_MINI_LIST_ITEM;
pub const xSTATIC_LIST = struct_xSTATIC_LIST;
pub const xSTATIC_TCB = struct_xSTATIC_TCB;
pub const xSTATIC_QUEUE = struct_xSTATIC_QUEUE;
pub const xSTATIC_EVENT_GROUP = struct_xSTATIC_EVENT_GROUP;
pub const xSTATIC_TIMER = struct_xSTATIC_TIMER;
pub const xSTATIC_STREAM_BUFFER = struct_xSTATIC_STREAM_BUFFER;
pub const xLIST_ITEM = struct_xLIST_ITEM;
pub const xMINI_LIST_ITEM = struct_xMINI_LIST_ITEM;
pub const xLIST = struct_xLIST;
pub const tskTaskControlBlock = struct_tskTaskControlBlock;
pub const xTIME_OUT = struct_xTIME_OUT;
pub const xMEMORY_REGION = struct_xMEMORY_REGION;
pub const xTASK_PARAMETERS = struct_xTASK_PARAMETERS;
pub const xTASK_STATUS = struct_xTASK_STATUS;
pub const QueueDefinition = struct_QueueDefinition;
pub const esp_etm_channel_t = struct_esp_etm_channel_t;
pub const esp_etm_event_t = struct_esp_etm_event_t;
pub const esp_etm_task_t = struct_esp_etm_task_t;
pub const esp_timer = struct_esp_timer;
pub const crypto_hash = struct_crypto_hash;
pub const crypto_cipher = struct_crypto_cipher;
pub const esp_ip6_addr = struct_esp_ip6_addr;
pub const esp_ip4_addr = struct_esp_ip4_addr;
pub const _ip_addr = struct__ip_addr;
pub const esp_netif_obj = struct_esp_netif_obj;
pub const esp_netif_flags = enum_esp_netif_flags;
pub const esp_netif_ip_event_type = enum_esp_netif_ip_event_type;
pub const bridgeif_config = struct_bridgeif_config;
pub const esp_netif_inherent_config = struct_esp_netif_inherent_config;
pub const esp_netif_driver_ifconfig = struct_esp_netif_driver_ifconfig;
pub const esp_netif_netstack_config = struct_esp_netif_netstack_config;
pub const esp_netif_config = struct_esp_netif_config;
pub const esp_netif_driver_base_s = struct_esp_netif_driver_base_s;
pub const nvs_opaque_iterator_t = struct_nvs_opaque_iterator_t;
pub const esp_partition_iterator_opaque_ = struct_esp_partition_iterator_opaque_;
pub const itimerspec = struct_itimerspec;
pub const sched_param = struct_sched_param;
pub const eflock = struct_eflock;
pub const tm = struct_tm;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const pollfd = struct_pollfd;
pub const lwip_sock = struct_lwip_sock;
pub const sys_mbox_s = struct_sys_mbox_s;
pub const ip4_addr = struct_ip4_addr;
pub const ip6_addr = struct_ip6_addr;
pub const ip_addr = struct_ip_addr;
pub const pbuf = struct_pbuf;
pub const netif_mac_filter_action = enum_netif_mac_filter_action;
pub const netif = struct_netif;
pub const lwip_ipv6_scope_type = enum_lwip_ipv6_scope_type;
pub const lwip_ip_addr_type = enum_lwip_ip_addr_type;
pub const pbuf_rom = struct_pbuf_rom;
pub const pbuf_custom = struct_pbuf_custom;
pub const memp_desc = struct_memp_desc;
pub const lwip_internal_netif_client_data_index = enum_lwip_internal_netif_client_data_index;
pub const netif_ext_callback = struct_netif_ext_callback;
pub const in_addr = struct_in_addr;
pub const in6_addr = struct_in6_addr;
pub const sockaddr_in = struct_sockaddr_in;
pub const sockaddr_in6 = struct_sockaddr_in6;
pub const sockaddr = struct_sockaddr;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const iovec = struct_iovec;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const ifreq = struct_ifreq;
pub const linger = struct_linger;
pub const in_pktinfo = struct_in_pktinfo;
pub const hostent = struct_hostent;
pub const addrinfo = struct_addrinfo;
