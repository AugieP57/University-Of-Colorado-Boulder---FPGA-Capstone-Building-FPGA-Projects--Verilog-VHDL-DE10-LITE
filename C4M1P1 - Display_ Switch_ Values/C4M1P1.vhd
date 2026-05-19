--
-- Write a VHDL file that provides the necessary functionality. Name it C4M1P1.vhd. The intent of 
-- this exercise is to manually derive the logic functions needed for the 7-segment displays. 
-- Therefore, you should use only simple VHDL assignment statements in your code and specify 
-- each logic function as a Boolean expression. Include this file in your project and assign the pins 
-- on the FPGA to connect to the switches and 7-segment displays. Make sure to include or verify 
-- the necessary pin assignments using the pin planner. 

-- You will need to instantiate your VHDL code into the top-level Verilog template.  To instantiate a 
-- VHDL module inside a Verilog design, make sure the two files are in the same directory and 
-- that they have been added to the project for compilation. Next, simply instantiate the lower 
-- level VHDL design by name in the Verilog file.  In this case, insert a line of code in the top level 
-- Verilog file something like:  
-- C4M1P1 u1 (.SW(SW), .HEX0(HEX0), .HEX1(HEX1)); 
-- This should wire together your VHDL design with the top-level.  Save the modified top-level 
-- Verilog file, which should be either DE10_LITE_Golden_Top.v or DE10_LITE_Default.v. Be sure 
-- to set this file as the top-level entity. 

-- Compile the project and download the compiled circuit into the FPGA chip using the .sof file 
-- found in the output files folder of the project. 
 
-- Test the functionality of your design by toggling the switches and observing the displays.  From 
-- the Compiler Report in Quartus, estimate the Fmax and % utilization of FPGA logic.  Drill down 
-- into the blocks in the RTL Viewer.  Estimate the number of Flip-flops used. Record your 
-- observations of the board behavior once the FPGA is programmed.  Does it behave as you 
-- might expect? 
--

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY C4M1P1 IS
    PORT(
        sw   : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END C4M1P1;

ARCHITECTURE C4M1P1_ARCH OF C4M1P1 IS

    SIGNAL A, B, C, D : STD_LOGIC;

BEGIN

    A <= sw(3);
    B <= sw(2);
    C <= sw(1);
    D <= sw(0);

    -- HEX0 shows hexadecimal digit 0-F from SW(3 downto 0)
    -- DE10-Lite HEX displays are active LOW

    HEX0(0) <= NOT((NOT A AND NOT B AND NOT C AND D) OR
                   (NOT A AND B AND NOT C AND NOT D) OR
                   (A AND NOT B AND C AND D) OR
                   (A AND B AND NOT C AND D));

    HEX0(1) <= NOT((NOT A AND B AND NOT C AND D) OR
                   (B AND C AND NOT D) OR
                   (A AND C AND D) OR
                   (A AND B AND NOT D));

    HEX0(2) <= NOT((NOT A AND NOT B AND C AND NOT D) OR
                   (A AND B AND NOT D) OR
                   (A AND B AND C));

    HEX0(3) <= NOT((NOT A AND NOT B AND NOT C AND D) OR
                   (NOT A AND B AND NOT C AND NOT D) OR
                   (B AND C AND D) OR
                   (A AND NOT B AND C AND NOT D));

    HEX0(4) <= NOT((NOT A AND D) OR
                   (NOT B AND NOT C AND D) OR
                   (NOT A AND B AND NOT C));

    HEX0(5) <= NOT((NOT A AND NOT B AND D) OR
                   (NOT A AND NOT B AND C) OR
                   (NOT A AND C AND D) OR
                   (A AND B AND NOT C AND D));

    HEX0(6) <= NOT((NOT A AND NOT B AND NOT C) OR
                   (NOT A AND B AND C AND D) OR
                   (A AND B AND NOT C AND NOT D));

    HEX0(7) <= '1'; -- decimal point off

    -- Turn off unused displays
    HEX1 <= "11111111";
    HEX2 <= "11111111";
    HEX3 <= "11111111";
    HEX4 <= "11111111";
    HEX5 <= "11111111";

END C4M1P1_ARCH;


































