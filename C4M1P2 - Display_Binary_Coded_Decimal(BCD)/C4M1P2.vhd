library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C4M1P2 is
    port(
        SW   : in  STD_LOGIC_VECTOR(3 downto 0);
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end C4M1P2;

architecture Behavioral of C4M1P2 is

    -- Signals required by assignment instructions
    signal V  : STD_LOGIC_VECTOR(3 downto 0);
    signal z  : STD_LOGIC;
    signal A  : STD_LOGIC_VECTOR(3 downto 0);
    signal D0 : STD_LOGIC_VECTOR(3 downto 0);

    -- Digit detect signals
    signal digit0, digit1, digit2, digit3, digit4 : STD_LOGIC;
    signal digit5, digit6, digit7, digit8, digit9 : STD_LOGIC;

begin

    -- V input
    V <= SW;

    -- Comparator: z = 1 when V > 9
    z <= V(3) and (V(2) or V(1));

    -- Circuit A
    -- 1010 -> 0000
    -- 1011 -> 0001
    -- 1100 -> 0010
    -- 1101 -> 0011
    -- 1110 -> 0100
    -- 1111 -> 0101

    A(3) <= '0';
    A(2) <= V(2) and V(1);
    A(1) <= V(2) and (not V(1));
    A(0) <= V(0);

    -- 2-to-1 mux
    D0(3) <= ((not z) and V(3)) or (z and A(3));
    D0(2) <= ((not z) and V(2)) or (z and A(2));
    D0(1) <= ((not z) and V(1)) or (z and A(1));
    D0(0) <= ((not z) and V(0)) or (z and A(0));

    -- Digit detection
    digit0 <= (not D0(3)) and (not D0(2)) and (not D0(1)) and (not D0(0));
    digit1 <= (not D0(3)) and (not D0(2)) and (not D0(1)) and D0(0);
    digit2 <= (not D0(3)) and (not D0(2)) and D0(1) and (not D0(0));
    digit3 <= (not D0(3)) and (not D0(2)) and D0(1) and D0(0);
    digit4 <= (not D0(3)) and D0(2) and (not D0(1)) and (not D0(0));
    digit5 <= (not D0(3)) and D0(2) and (not D0(1)) and D0(0);
    digit6 <= (not D0(3)) and D0(2) and D0(1) and (not D0(0));
    digit7 <= (not D0(3)) and D0(2) and D0(1) and D0(0);
    digit8 <= D0(3) and (not D0(2)) and (not D0(1)) and (not D0(0));
    digit9 <= D0(3) and (not D0(2)) and (not D0(1)) and D0(0);

    -- HEX0 (ones digit)
    HEX0(0) <= not (digit0 or digit2 or digit3 or digit5 or digit6 or digit7 or digit8 or digit9);
    HEX0(1) <= not (digit0 or digit1 or digit2 or digit3 or digit4 or digit7 or digit8 or digit9);
    HEX0(2) <= not (digit0 or digit1 or digit3 or digit4 or digit5 or digit6 or digit7 or digit8 or digit9);
    HEX0(3) <= not (digit0 or digit2 or digit3 or digit5 or digit6 or digit8 or digit9);
    HEX0(4) <= not (digit0 or digit2 or digit6 or digit8);
    HEX0(5) <= not (digit0 or digit4 or digit5 or digit6 or digit8 or digit9);
    HEX0(6) <= not (digit2 or digit3 or digit4 or digit5 or digit6 or digit8 or digit9);

    -- HEX1 (tens digit)
    -- Displays 1 when V > 9, blank otherwise

    HEX1(0) <= '1';
    HEX1(1) <= not z;
    HEX1(2) <= not z;
    HEX1(3) <= '1';
    HEX1(4) <= '1';
    HEX1(5) <= '1';
    HEX1(6) <= '1';

end Behavioral;