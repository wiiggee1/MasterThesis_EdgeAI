## General Direct Memory Access (GDMA) - Interrupt for model inference

Setting up DMA interrupts allow less overhead on the CPU when 
doing model inference. 

#### Functional features: 

- Memory-to-Memory transfers: utilizing transmit (tx) and receive (rx)
channels and the corresponding FIFO pointer. 

- The ESP32-P4, also support 2D-DMA controller, for matrix processing. 
Software can use 2D-DMA via linked lists stored in internal or external
memory. It have *outlinks* (linked list of transmit descriptor) and 
*inlinks* (linked list of receive descriptor).
