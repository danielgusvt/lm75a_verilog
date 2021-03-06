# lm75a_verilog
Verilog code for retrieving temperature on I2C bus from LM75A sensor and to show to 7 segment displays of board "RZ-EasyFPGA A2.2", which features Cyclone IV E EP4CE6E22C8 FPGA.

The I2C code comes from the Chinese resources included with the FPGA board.

This project uses Intel Quartus Prime software.

The sensor datasheet can be found [here.](https://www.ti.com/lit/ds/symlink/lm75a.pdf)

## Notes:
* In order to show decimal values on 7 segment displays, we had to use LPM_DIVIDE IP core from Intel IP Catalog, which results in little area usage compared to an implementation of a soft core CPU.
* The sensor is able to work with negative temperatures, but currently we do not support them.

![Photo](Photo.jpg "Photo")
