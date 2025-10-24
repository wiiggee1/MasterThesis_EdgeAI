const std = @import("std");
const builtin = @import("builtin");

/// Here should optimized functions be declared. 
/// Such as frequently executed code that should 
/// be as fast as possible. E.g., placing 
/// dot product function in the `iram0` memory 
/// section for improved speed.
pub const Optimized = struct{

    // pub fn dot_product() linksection(".iram0.text") void{
    // }

};
