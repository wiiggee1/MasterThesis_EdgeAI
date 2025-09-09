## Using the System-Timer: 

On ESP32-P4, the system clock frequency is *16 MHz* for the *XTAL_CLK*. 

##### Terminology: 

- *Timer counter*: Holds the changing value of the timer (number of ticks since the timer was last reset).

- *Compare Register*: Whenever, the timer counter equal to this register value, 
an action (e.g., interrupt) is taken.

- *Action Register*: Action to take when timer = compare register. Example of actions are: 
    - Interrupt,
    - Stop or countinue counting,
    - Reload the counter,
    - Setting an output pin to high, low, toggle, etc.

- *Clock Configure Register*: Register for setting up which clock source to use. 
Default is often the *system clock*. 

- *Prescaler Register*: Value for reducing the fast incoming clock so that it 
runs more slowly. 

- *Control Register*: Value that sets the timer to start counting once it has 
been configured. This register can also reset the timer. 

- *Interrupt Register*: For enabling, clearing, and checking status of each 
timer interrupt. 

#### System Timer on ESP32-P4:

Setting the period value in the register named 
`SYSTIMER_TARGET0_CONF_REG (0x0034)` is done through the *bits\[25:0]*
of the 32-bit register. E.g., for an 8-bit timer, (2^8) - 1 = 255,
is the maximum value before the timer overflows. 

ESP32-P4 provides a 52-bit system timer, it has two 52-bit counters,
and three 52-bit comparators. It have 52-bit alarm values(t) and
26-bit alarm periods (δt). 

- Max compare value is given by: `2^52 -1` ~ 9 * 10^15

After XTAL\_CLK is scaled by 2.5, a counter clock signal CNT\_CLK
clock is generated with a frequency of f_{XTAL\_CLK} / 2.5. 
The average clock frequency of CNT\_CLK is 16 MHz. 
The timer counter is incremented by 1/16 μs on each CNT\_CLK cycle


- Frequency(f), \[Unit: Hz], mathematical relationship: 
    - f = 1 / Time Period(T).
    - Time Period(T) = 1 / f.

- Interrupt Frequency = Clock Input / (prescaler * compare).

So if we want the goal (interrupt frequency), and we know the Clock Input (e.g., 16 MHz), 
we adjust the *prescaler* and *compare registers* until we reach the goal interrupt freq.

**Example:**

- Interrupt Frequency (our goal): 1 Hz or 1 sec. 
- Known: Clock Input = 16 MHz, period values = bits \[25:0], system timer has 52-bit comparators. 

→ Interrupt Freq = 16 MHz / (prescaler * compare) → ...

... → prescaler * compare = Clock Input / Interrupt Freq → 
        → (prescaler * compare) = 16 MHz / 1 Hz = 16 * 10^6 / 1 = 16 * 10^6





