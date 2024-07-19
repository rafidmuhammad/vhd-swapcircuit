library ieee;
use ieee.std_logic_1164.all;

entity regn is
	generic(N : integer := 8);
	port(
		R: in std_logic_vector(N-1 downto 0);
		Rin, clock: in std_logic;
		Q : out std_logic_vector(N-1 downto 0)
	);
end regn;

architecture behavioral of regn is
begin 
	process
	begin
		wait until clock'event and clock='1';
		if Rin='1' then
			Q <= R;
		end if;
	end process;
end behavioral;

