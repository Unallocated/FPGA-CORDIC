library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.conv_std_logic_vector;
use IEEE.STD_LOGIC_UNSIGNED.conv_integer;
entity cordic_test is
	Port(clk  : in  STD_LOGIC;
		 rst  : in  STD_LOGIC;
		 leds : out STD_LOGIC_VECTOR(7 downto 0));
end cordic_test;

architecture Behavioral of cordic_test is
	-- CORDIC core that is set up to generate sin and cos
	-- based on the 3.14 to -3.14 value provided to phase_in
	COMPONENT cordic2
		PORT(
			phase_in  : IN  std_logic_vector(7 downto 0);
			nd        : IN  std_logic;
			x_out     : OUT std_logic_vector(7 downto 0);
			y_out     : OUT std_logic_vector(7 downto 0);
			phase_out : OUT std_logic_vector(7 downto 0);
			rdy       : OUT std_logic;
			clk       : IN  std_logic
		);
	END COMPONENT;
	-- fixed point phase input
	-- phase_in(7) is the sign bit
	-- phase_in(6 downto 5) are the whole number bits
	-- phase_in(4 downto 0) are the fractional bits
	signal phase_in  : std_logic_vector(7 downto 0);
	
	-- Both x and y out are fixed point signed numbers
	-- ?_out(7) is the sign bit
	-- ?_out(6) is the whole number
	-- ?_out(5 downto 0) are the fractional bits
	-- Both signals are scaled from 1 to -1 and are the 
	-- magnitude of the sign wave at the given phase.
	-- Think of 1 as being the high point in the sin wave
	-- and -1 as being the low point
	signal x_out     : std_logic_vector(7 downto 0);
	signal y_out     : std_logic_vector(7 downto 0);
	
	-- This is ignored
	signal phase_out : std_logic_vector(7 downto 0);
	-- This is ignored
	signal rdy       : std_logic;
	-- Ignored (will be set to a constant '1' at the instantiation)
	signal nd        : std_logic := '0';
	
	signal slow_clk : std_logic := '0';

	-- Clock period definitions
	constant clk_period : time := 10 ns;

	type points_t is array (0 to 255) of std_logic_vector(7 downto 0);
	constant points : points_t := (
		"00000000", "00000000", "00000001", "00000010", "00000011", "00000011", "00000100", "00000101",
		"00000110", "00000111", "00000111", "00001000", "00001001", "00001010", "00001010", "00001011",
		"00001100", "00001101", "00001110", "00001110", "00001111", "00010000", "00010001", "00010010",
		"00010010", "00010011", "00010100", "00010101", "00010101", "00010110", "00010111", "00011000",
		"00011001", "00011001", "00011010", "00011011", "00011100", "00011100", "00011101", "00011110",
		"00011111", "00100000", "00100000", "00100001", "00100010", "00100011", "00100100", "00100100",
		"00100101", "00100110", "00100111", "00100111", "00101000", "00101001", "00101010", "00101011",
		"00101011", "00101100", "00101101", "00101110", "00101110", "00101111", "00110000", "00110001",
		"00110010", "00110010", "00110011", "00110100", "00110101", "00110110", "00110110", "00110111",
		"00111000", "00111001", "00111001", "00111010", "00111011", "00111100", "00111101", "00111101",
		"00111110", "00111111", "01000000", "01000000", "01000001", "01000010", "01000011", "01000100",
		"01000100", "01000101", "01000110", "01000111", "01001000", "01001000", "01001001", "01001010",
		"01001011", "01001011", "01001100", "01001101", "01001110", "01001111", "01001111", "01010000",
		"01010001", "01010010", "01010011", "01010011", "01010100", "01010101", "01010110", "01010110",
		"01010111", "01011000", "01011001", "01011010", "01011010", "01011011", "01011100", "01011101",
		"01011101", "01011110", "01011111", "01100000", "01100001", "01100001", "01100010", "01100011",
		"01100100", "11111111", "11111110", "11111101", "11111101", "11111100", "11111011", "11111010",
		"11111001", "11111001", "11111000", "11110111", "11110110", "11110110", "11110101", "11110100",
		"11110011", "11110010", "11110010", "11110001", "11110000", "11101111", "11101111", "11101110",
		"11101101", "11101100", "11101011", "11101011", "11101010", "11101001", "11101000", "11100111",
		"11100111", "11100110", "11100101", "11100100", "11100100", "11100011", "11100010", "11100001",
		"11100000", "11100000", "11011111", "11011110", "11011101", "11011101", "11011100", "11011011",
		"11011010", "11011001", "11011001", "11011000", "11010111", "11010110", "11010101", "11010101",
		"11010100", "11010011", "11010010", "11010010", "11010001", "11010000", "11001111", "11001110",
		"11001110", "11001101", "11001100", "11001011", "11001011", "11001010", "11001001", "11001000",
		"11000111", "11000111", "11000110", "11000101", "11000100", "11000011", "11000011", "11000010",
		"11000001", "11000000", "11000000", "10111111", "10111110", "10111101", "10111100", "10111100",
		"10111011", "10111010", "10111001", "10111000", "10111000", "10110111", "10110110", "10110101",
		"10110101", "10110100", "10110011", "10110010", "10110001", "10110001", "10110000", "10101111",
		"10101110", "10101110", "10101101", "10101100", "10101011", "10101010", "10101010", "10101001",
		"10101000", "10100111", "10100111", "10100110", "10100101", "10100100", "10100011", "10100011",
		"10100010", "10100001", "10100000", "10011111", "10011111", "10011110", "10011101", "10011100"
	);

begin


	process(clk, rst)
		variable counter : integer := 0;
	begin
		if(rst = '1') then
			counter := 0;
			slow_clk <= '0';
		elsif(rising_edge(clk)) then
			if(counter = 50000000/8) then
				counter := 0;
				slow_clk <= not slow_clk;
			else
				counter := counter + 1;
			end if;
		end if;
	end process;

	process(slow_clk, rst)
		variable counter : integer range 0 to 255 := 0;
		variable y_int : integer range 0 to 255 := 0;
	begin
		if(rst = '1') then
			counter := 0;
			nd <= '0';
		elsif(rising_edge(slow_clk)) then
			phase_in <= points(counter);
			counter := counter + 1;
			if(y_out(7) = '1') then
				y_int := 64 - conv_integer(y_out xor "11111111");
			else
				y_int := conv_integer(y_out) + 64;
			end if;
			leds <= conv_std_logic_vector(y_int, 8);
		end if;
	end process;

	uut : cordic2 PORT MAP(
			phase_in  => phase_in,
			nd        => '1',
			x_out     => x_out,
			y_out     => y_out,
			phase_out => phase_out,
			rdy       => rdy,
			clk       => clk
		);

end Behavioral;
	
