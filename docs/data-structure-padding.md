### Data Structure Padding in Embedded hardware

Padding is usally added between fields of a structure, when a member field is
followed by a data type that has a larger alignment requirment. If you change
the ordering between the fields in a struct, you can minimize the amount of
padding needed for maintaining the `natural alignment` property. By reordering
the struct members we can save space. 

"A memory access is said to be aligned when the data being accessed is n bytes
long and the datum address is n-byte aligned"

In *Zig* we can utilize the keyword `packed` to conserve memory in 
a resource constraint environment.

#### Data structures
Fields within a struct, are usally stored sequentially in memory. 
For a 32-bit x86 architecture we have the following alignment: 

- A char (one byte) will be 1-byte aligned.
- A short (two bytes) will be 2-byte aligned.
- An int (four bytes) will be 4-byte aligned.
- A long (four bytes) will be 4-byte aligned.
- A float (four bytes) will be 4-byte aligned.
- A double (eight bytes) will be 8-byte aligned on Windows and 4-byte aligned on Linux
- Any pointer (four bytes) will be 4-byte aligned. (e.g.: char*, int*)

#### Allocating memory aligned to cache lines
...

