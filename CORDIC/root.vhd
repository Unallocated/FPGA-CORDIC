library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity root is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           phase_i : in std_logic_vector(7 downto 0);
           rdy : out std_logic;
           phase_o, x, y : out std_logic_vector(7 downto 0));
end root;

architecture Behavioral of root is

	COMPONENT cordic
	  PORT (
		 phase_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 x_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 y_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 phase_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rdy : OUT STD_LOGIC;
		 clk : IN STD_LOGIC
	  );
	END COMPONENT;

--	signal phase_i, x, y, phase_o : std_logic_vector(7 downto 0);
--	signal rdy : std_logic;

begin

	your_instance_name : cordic
	  PORT MAP (
		 phase_in => phase_i,
		 x_out => x,
		 y_out => y,
		 phase_out => phase_o,
		 rdy => rdy,
		 clk => clk
	  );

end Behavioral;

