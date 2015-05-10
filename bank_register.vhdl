library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity bank_register is

	generic(
		REG_SIZE : positive := 8;
		REG_COUNT : positive := 16
	);

	port(
		clk : in std_logic;
		rst : in std_logic;
		w : in std_logic;
		data : in std_logic_vector(REG_SIZE-1 downto 0);
		reg_a : in integer range 0 to REG_COUNT-1;
		reg_b : in integer range 0 to REG_COUNT-1;
		reg_w : in integer range 0 to REG_COUNT-1;
		qa : out std_logic_vector(REG_SIZE-1 downto 0);
		qb : out std_logic_vector(REG_SIZE-1 downto 0)
	);
end entity ; -- bank_register

architecture behavioral of bank_register is

	subtype reg is std_logic_vector(REG_SIZE-1 downto 0);
	type reg_list is array(0 to REG_COUNT) of reg;
	signal regs : reg_list;

begin

	qa <= regs(reg_a);
	qb <= regs(reg_b);

	bank_register_main : process( clk )
	begin
		if rising_edge(clk) then
			
			if rst = '0' then
				regs <= (others => (others => '0'));
			end if ;

		end if ;
	end process ; -- bank_register_main

end architecture ; -- behavioral

--library ieee ;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.numeric_std.all;

--entity bank_register is
--  port (
--	clk : in std_logic;
--	rst : in std_logic;
--	w : in std_logic;
--	data : in std_logic_vector(7 downto 0) ;
--	a : in std_logic_vector(3 downto 0) ;
--	b : in std_logic_vector(3 downto 0) ;
--	addr_w : in std_logic_vector(3 downto 0) ;
--	qa : out std_logic_vector(7 downto 0) ;
--	qb : out std_logic_vector(7 downto 0)
--  ) ;
--end entity ; -- bank_register

--architecture behavioral of bank_register is

--	constant nregister : positive := 16;
--	constant reg_size : positive := 8;

--	subtype reg is std_logic_vector(reg_size-1 downto 0) ;
--	type reg_list is array(0 to nregister) of reg;

--	signal aout : reg ;
--	signal bout : reg ;
--	signal regs : reg_list;

--begin

	
--	qa <= regs(to_integer(unsigned(a)));
--	qb <= regs(to_integer(unsigned(b)));

--	load_bank : process( clk )
--	begin
--		if rising_edge(clk) then
--			if rst = '0' then
--				regs <= (others => (others => '0'));
--			end if ;
--		end if ;
--	end process ; -- load_bank

--end architecture ; -- behavioral