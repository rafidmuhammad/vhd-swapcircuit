library ieee;
use ieee.std_logic_1164.all;

entity trin is
 generic(N: integer := 8);
 port(
	X: in std_logic_vector(N-1 downto 0);
	En: in std_logic;
	F: out std_logic_vector(N-1 downto 0)
 );
end trin;


architecture behavioral of trin is
	begin
	F <= (others => 'Z') when En = '0' else X;
end behavioral;