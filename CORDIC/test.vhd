LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test IS
END test;

ARCHITECTURE behavior OF test IS

	-- Component Declaration for the Unit Under Test (UUT)

	COMPONENT root
		PORT(
			clk     : IN  std_logic;
			rst     : IN  std_logic;
			phase_i : IN  std_logic_vector(7 downto 0);
			rdy     : OUT std_logic;
			phase_o : OUT std_logic_vector(7 downto 0);
			x       : OUT std_logic_vector(7 downto 0);
			y       : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	signal clk     : std_logic                    := '0';
	signal rst     : std_logic                    := '0';
	signal phase_i : std_logic_vector(7 downto 0) := (others => '0');

	--Outputs
	signal rdy     : std_logic;
	signal phase_o : std_logic_vector(7 downto 0);
	signal x       : std_logic_vector(7 downto 0);
	signal y       : std_logic_vector(7 downto 0);

	-- Clock period definitions
	constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut : root PORT MAP(
			clk     => clk,
			rst     => rst,
			phase_i => phase_i,
			rdy     => rdy,
			phase_o => phase_o,
			x       => x,
			y       => y
		);

	-- Clock process definitions
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
	end process;

	-- Stimulus process
	stim_proc : process
	begin
		-- hold reset state for 100 ns.
		wait for 100 ns;
		phase_i <= "00011001";
		wait for clk_period * 10;

		-- insert stimulus here 

		wait;
	end process;

END;
