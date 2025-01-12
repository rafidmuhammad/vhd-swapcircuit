library ieee;
use ieee.std_logic_1164.all;

entity testbench is

end testbench;


architecture behavioral of testbench is

component swap
	port(
		data : in std_logic_vector(7 downto 0);
		resetn, w: in std_logic;
		clock, extern : in std_logic;
		RinExt : in std_logic_vector(1 to 3);
		busWires : INOUT std_logic_vector(7 downto 0)
	);

end component;

signal data_in, BusWires_inout : std_logic_vector(7 downto 0);
signal resetn_in, w_in, clk_in, extern_in : std_logic;
signal RinExt_in: std_logic_vector(1 to 3);

begin

DUT: swap port map(
	data => data_in,
	resetn => resetn_in,
	w => w_in,
	clock => clk_in,
	extern => extern_in,
	RinExt => RinExt_in,
	busWires => BusWires_inout
);

clock_tb:PROCESS
begin
	loop
	clk_in <= '0';
	wait for 10 ns;
	clk_in <= '1';
	wait for 10 ns;
	end loop;
end PROCESS;

data_tb: PROCESS
begin
	data_in <= "00000000";
	wait for 30 ns;
	data_in <= "01010101";
	wait for 20 ns;
	data_in <= "10101010";
	wait for 20 ns;
	data_in <= "00000000";
	wait;
end PROCESS;


reset_tb: PROCESS
begin
	resetn_in <= '0';
	wait for 20 ns;
	resetn_in <= '1';
	wait;
end PROCESS;

extern_tb: PROCESS
begin
	extern_in <= '1';
	wait for 70 ns;
	extern_in <= '0';
	wait;
end PROCESS;

w_tb: PROCESS
begin
	w_in <= '0';
	wait for 90 ns;
	w_in <= '1';
	wait for 20 ns;
	w_in <= '0';
	wait;
end PROCESS;


RinExt_tb: PROCESS
begin
	RinExt_in <= "000";
	wait for 32 ns;
	RinExt_in <= "100";
	wait for 20 ns;
	RinExt_in <= "010";
	wait for 20 ns;
	RinExt_in <= "000";
	wait;
end PROCESS;


end behavioral;