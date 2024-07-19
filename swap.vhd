library ieee;
use ieee.std_logic_1164.all;
use work.components.all;

entity swap is
	port(
		data : in std_logic_vector(7 downto 0);
		resetn, w: in std_logic;
		clock, extern : in std_logic;
		RinExt : in std_logic_vector(1 to 3);
		busWires : INOUT std_logic_vector(7 downto 0)
	);
end swap;

architecture behavioral of swap is
	signal rin, rout, q : std_logic_vector(1 to 3);
	signal R1, R2, R3: std_logic_vector(7 downto 0);
BEGIN
	control: shiftr Generic map (N => 3)
					Port map (resetn, clock, w, q);
	rin(1) <= RinExt(1) or q(3);
	rin(2) <= RinExt(2) or q(2);
	rin(3) <= RinExt(3) or q(1);
	rout(1) <= q(2); rout(2) <= q(1); rout(3) <= q(3);
	
	tri_ext: trin PORT MAP (data, extern, busWires);
	reg1: regn PORT MAP (busWires, rin(1), clock, R1);
	reg2: regn PORT MAP (busWires, rin(2), clock, R2);
	reg3: regn PORT MAP (busWires, rin(3), clock, R3);
	tri1: trin PORT MAP (R1, rout(1), busWires);
	tri2: trin PORT MAP (R2, rout(2), busWires);
	tri3: trin PORT MAP (R3, rout(3), busWires);

end behavioral;