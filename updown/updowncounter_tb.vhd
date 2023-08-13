library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UpDownCounter_TB is
end UpDownCounter_TB;

architecture Testbench of UpDownCounter_TB is
    signal clk      : STD_LOGIC := '0';
    signal rst      : STD_LOGIC := '0';
    signal up       : STD_LOGIC := '0';
    signal down     : STD_LOGIC := '0';
    signal count    : STD_LOGIC_VECTOR(7 downto 0);

    constant CLK_PERIOD : time := 10 ns;

    component UpDownCounter
        Port (
            clk      : in STD_LOGIC;
            rst      : in STD_LOGIC;
            up       : in STD_LOGIC;
            down     : in STD_LOGIC;
            count    : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    begin
        UUT: UpDownCounter
            Port Map (
                clk      => clk,
                rst      => rst,
                up       => up,
                down     => down,
                count    => count
            );

        clk_process: process
        begin
            while now < 1000 ns loop
                clk <= not clk;
                wait for CLK_PERIOD / 2;
            end loop;
            wait;
        end process;

        stim_process: process
        begin
            rst <= '1';
            up <= '0';
            down <= '0';
            wait for CLK_PERIOD;
            
            rst <= '0';
            wait for CLK_PERIOD;
            
            up <= '1';
            wait for 100 * CLK_PERIOD;
            
            up <= '0';
            wait for 50 * CLK_PERIOD;
            
            down <= '1';
            wait for 100 * CLK_PERIOD;
            
            down <= '0';
            wait for 50 * CLK_PERIOD;
            
            wait;
        end process;
end Testbench;
