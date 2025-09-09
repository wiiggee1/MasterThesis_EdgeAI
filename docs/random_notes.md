## Developer notes:

4000148a:  ffb3b637                lui     a2,0xffb3b

```gdb
(gdb) info line *0x4000148a
```

Gave the following: 

```zsh
Line 331 of "/home/wiiggee1/Desktop/Master_Thesis/MasterThesis_EdgeAI/src/system_timer.zig"
   starts at address 0x40001482 <edge_ai.app_main+1110> and ends at 0x40001492 <edge_ai.app_main+1126>.
(gdb)
```
