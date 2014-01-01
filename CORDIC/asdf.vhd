--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:11:37 12/31/2013
-- Design Name:   
-- Module Name:   /home/main/git/FPGA-CORDIC/CORDIC/asdf.vhd
-- Project Name:  CORDIC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.conv_integer;

use std.textio.all;
use ieee.std_logic_textio.all; -- if you're saving this type of signal
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY asdf IS
END asdf;
 
ARCHITECTURE behavior OF asdf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic2
    PORT(
         phase_in : IN  std_logic_vector(7 downto 0);
         nd : IN  std_logic;
         x_out : OUT  std_logic_vector(7 downto 0);
         y_out : OUT  std_logic_vector(7 downto 0);
         phase_out : OUT  std_logic_vector(7 downto 0);
         rdy : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal phase_in : std_logic_vector(7 downto 0) := (others => '0');
   signal nd : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal x_out : std_logic_vector(7 downto 0);
   signal y_out : std_logic_vector(7 downto 0);
   signal phase_out : std_logic_vector(7 downto 0);
   signal rdy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
	type points_t is array(0 to 255) of std_logic_vector(7 downto 0);
	constant points : points_t := (
		"00000000","00000000","00000001","00000010","00000011","00000011","00000100","00000101",
		"00000110","00000111","00000111","00001000","00001001","00001010","00001010","00001011",
		"00001100","00001101","00001110","00001110","00001111","00010000","00010001","00010010",
		"00010010","00010011","00010100","00010101","00010101","00010110","00010111","00011000",
		"00011001","00011001","00011010","00011011","00011100","00011100","00011101","00011110",
		"00011111","00100000","00100000","00100001","00100010","00100011","00100100","00100100",
		"00100101","00100110","00100111","00100111","00101000","00101001","00101010","00101011",
		"00101011","00101100","00101101","00101110","00101110","00101111","00110000","00110001",
		"00110010","00110010","00110011","00110100","00110101","00110110","00110110","00110111",
		"00111000","00111001","00111001","00111010","00111011","00111100","00111101","00111101",
		"00111110","00111111","01000000","01000000","01000001","01000010","01000011","01000100",
		"01000100","01000101","01000110","01000111","01001000","01001000","01001001","01001010",
		"01001011","01001011","01001100","01001101","01001110","01001111","01001111","01010000",
		"01010001","01010010","01010011","01010011","01010100","01010101","01010110","01010110",
		"01010111","01011000","01011001","01011010","01011010","01011011","01011100","01011101",
		"01011101","01011110","01011111","01100000","01100001","01100001","01100010","01100011",
		"01100100","11111111","11111110","11111101","11111101","11111100","11111011","11111010",
		"11111001","11111001","11111000","11110111","11110110","11110110","11110101","11110100",
		"11110011","11110010","11110010","11110001","11110000","11101111","11101111","11101110",
		"11101101","11101100","11101011","11101011","11101010","11101001","11101000","11100111",
		"11100111","11100110","11100101","11100100","11100100","11100011","11100010","11100001",
		"11100000","11100000","11011111","11011110","11011101","11011101","11011100","11011011",
		"11011010","11011001","11011001","11011000","11010111","11010110","11010101","11010101",
		"11010100","11010011","11010010","11010010","11010001","11010000","11001111","11001110",
		"11001110","11001101","11001100","11001011","11001011","11001010","11001001","11001000",
		"11000111","11000111","11000110","11000101","11000100","11000011","11000011","11000010",
		"11000001","11000000","11000000","10111111","10111110","10111101","10111100","10111100",
		"10111011","10111010","10111001","10111000","10111000","10110111","10110110","10110101",
		"10110101","10110100","10110011","10110010","10110001","10110001","10110000","10101111",
		"10101110","10101110","10101101","10101100","10101011","10101010","10101010","10101001",
		"10101000","10100111","10100111","10100110","10100101","10100100","10100011","10100011",
		"10100010","10100001","10100000","10011111","10011111","10011110","10011101","10011100"
	);
	
	signal counter : integer range 0 to 255 := 0;
 
	file output	: text open write_mode is "/tmp/test";
	signal int : integer range 0 to 255;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cordic2 PORT MAP (
          phase_in => phase_in,
          nd => nd,
          x_out => x_out,
          y_out => y_out,
          phase_out => phase_out,
          rdy => rdy,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process	
		variable l1 : line;
		variable y : std_logic_vector(7 downto 0) := (others => '0');
		variable y_int : integer range 0 to 255 := 0;
   begin		
      nd <= '0';
		wait for clk_period;
		phase_in <= points(counter);
		if(counter = 255) then
			wait;
		else
			counter <= counter + 1;
		end if;
		wait for clk_period;
		nd <= '1';
		wait for clk_period * 3;
		if(y_out(7) = '1') then
			write(l1, "negative");
			y_int := 64 - conv_integer(y_out xor "11111111");
		else
			write(l1, "positive");
			y_int := conv_integer(y_out) + 64;
		end if;
		int <= y_int;
		write(l1, " ");
		write(l1, y_int);
		write(l1, " ");
		write(l1, counter);
		--writeline(output, l1);
		write(l1, " ");
		write(l1, phase_in);
		--writeline(output, l1);
		write(l1, " ");
		write(l1, y_out);
		writeline(output, l1);
   end process;

END;
