library ieee;
use ieee.std_logic_1164.all;

entity C4M1P3 is
    port(
        SW   : in  std_logic_vector(8 downto 0);
        LEDR : out std_logic_vector(4 downto 0)
    );
end C4M1P3;

architecture Structural of C4M1P3 is

    component FullAdder
        port(
            a    : in  std_logic;
            b    : in  std_logic;
            cin  : in  std_logic;
            s    : out std_logic;
            cout : out std_logic
        );
    end component;

    signal c1, c2, c3 : std_logic;

begin

    FA0: FullAdder
        port map(
            a    => SW(4),
            b    => SW(0),
            cin  => SW(8),
            s    => LEDR(0),
            cout => c1
        );

    FA1: FullAdder
        port map(
            a    => SW(5),
            b    => SW(1),
            cin  => c1,
            s    => LEDR(1),
            cout => c2
        );

    FA2: FullAdder
        port map(
            a    => SW(6),
            b    => SW(2),
            cin  => c2,
            s    => LEDR(2),
            cout => c3
        );

    FA3: FullAdder
        port map(
            a    => SW(7),
            b    => SW(3),
            cin  => c3,
            s    => LEDR(3),
            cout => LEDR(4)
        );

end Structural;