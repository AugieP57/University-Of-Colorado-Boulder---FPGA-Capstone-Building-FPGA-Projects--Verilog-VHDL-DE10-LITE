library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity C4M1P4 is
    port(
        SW   : in  std_logic_vector(9 downto 0);
        HEX0 : out std_logic_vector(6 downto 0);
        HEX1 : out std_logic_vector(6 downto 0);
        HEX3 : out std_logic_vector(6 downto 0);
        HEX5 : out std_logic_vector(6 downto 0)
    );
end C4M1P4;

architecture Behavioral of C4M1P4 is

    component SevenSeg
        port(
            X   : in  std_logic_vector(3 downto 0);
            HEX : out std_logic_vector(6 downto 0)
        );
    end component;

    signal A  : unsigned(3 downto 0);
    signal B  : unsigned(3 downto 0);
    signal T0 : unsigned(4 downto 0);
    signal Z0 : unsigned(4 downto 0);
    signal S0 : unsigned(4 downto 0);
    signal S1 : std_logic;

begin

    A <= unsigned(SW(7 downto 4));
    B <= unsigned(SW(3 downto 0));

    process(A, B, SW)
    begin
        T0 <= ('0' & A) + ('0' & B) + unsigned'("0000" & SW(8));

        if T0 > 9 then
            Z0 <= to_unsigned(10, 5);
            S1 <= '1';
        else
            Z0 <= to_unsigned(0, 5);
            S1 <= '0';
        end if;
    end process;

    S0 <= T0 - Z0;

    A_Display: SevenSeg port map(
        X   => std_logic_vector(A),
        HEX => HEX5
    );

    B_Display: SevenSeg port map(
        X   => std_logic_vector(B),
        HEX => HEX3
    );

    S0_Display: SevenSeg port map(
        X   => std_logic_vector(S0(3 downto 0)),
        HEX => HEX0
    );

    S1_Display: SevenSeg port map(
        X   => "000" & S1,
        HEX => HEX1
    );

end Behavioral;