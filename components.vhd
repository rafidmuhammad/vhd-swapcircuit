library ieee;
use ieee.std_logic_1164.all;

package components is

	component regn
	generic(N : integer := 8);
	port(
		R: in std_logic_vector(N-1 downto 0);
		Rin, clock: in std_logic;
		Q : out std_logic_vector(N-1 downto 0)
	);
	end component;

	component trin
	generic(N: integer := 8);
	port(
		X: in std_logic_vector(N-1 downto 0);
		En: in std_logic;
		F: out std_logic_vector(N-1 downto 0)
	);
	end component;

	component shiftr
	generic(N: integer := 4);
	port(
		resetn, clock, w : in std_logic;
		q : buffer std_logic_vector(1 to N)
	);
	end component;

end components;