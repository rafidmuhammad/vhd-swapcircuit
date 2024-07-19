library ieee;
use ieee.std_logic_1164.all;

entity shiftr is 
	generic(N: integer := 4);
	port(
		resetn, clock, w : in std_logic;
		q : buffer std_logic_vector(1 to N)
	);
end shiftr;

architecture behavioral of shiftr is 
	begin
		process(resetn, clock)
		begin
			if resetn='0' then
				q <= (others => '0');
			elsif clock'event and clock='1' then
				FOR i in N downto 2 loop
					q(i) <= q(i-1);
				end loop;
			q(1) <= w;
			end if;
		end process;
end behavioral;