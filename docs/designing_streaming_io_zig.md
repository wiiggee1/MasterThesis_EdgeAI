## Designing a Streaming I/O Interface - "Don't Forget To Flush by Andrew Kelley"

- Buffer and Sink.

#### VTable
Struct of fields, that represent the interface methods. In other words
a *VTable* is a name for a set of runtime known function pointers.
That are populated in order to satisfy the given interface.

Since the function pointers are runtime-known the compiler, 
have to treat them as a *black-box*.

- There is benefits of the hot-paths to be above the *VTable*. 
Since it allows the compiler to perform better optimizations. 
Meaning the interface becomes less flexible, if we move more 
logic inside the interface's *VTable*. 

- *Tips*: For pipeline design, sacrifice a few cache lines to avoid syscall overhead. 


