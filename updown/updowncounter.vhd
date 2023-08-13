library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UpDownCounter is
    Port (
        clk      : in STD_LOGIC;
        rst      : in STD_LOGIC;
        up       : in STD_LOGIC;
        down     : in STD_LOGIC;
        count    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end UpDownCounter;

architecture Behavioral of UpDownCounter is
    signal counter_value : unsigned(7 downto 0) := (others => '0');
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter_value <= (others => '0');
        elsif rising_edge(clk) then
            if up = '1' then
                counter_value <= counter_value + 1;
            elsif down = '1' then
                counter_value <= counter_value - 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(counter_value);
end Behavioral;
