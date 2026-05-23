library ieee;
use ieee.std_logic_1164.all;

entity C4M1P2 is
    port (
        SW   : in  std_logic_vector(3 downto 0);
        HEX1 : out std_logic_vector(6 downto 0);
        HEX0 : out std_logic_vector(6 downto 0)
    );
end entity C4M1P2;

architecture dataflow of C4M1P2 is
    signal V  : std_logic_vector(3 downto 0);
    signal A  : std_logic_vector(3 downto 0);
    signal D0 : std_logic_vector(3 downto 0);
    signal D1 : std_logic_vector(3 downto 0);
    signal z  : std_logic;

    signal d0_m0, d0_m1, d0_m2, d0_m3, d0_m4 : std_logic;
    signal d0_m5, d0_m6, d0_m7, d0_m8, d0_m9 : std_logic;
begin
    -- Binary input V = v3v2v1v0
    V <= SW;

    -- Comparator output: z = 1 when V > 9
    z <= V(3) and (V(2) or V(1));

    -- Circuit A: for V = 1010 through 1111, A = 0000 through 0101
    A(3) <= '0';
    A(2) <= V(2) and V(1);
    A(1) <= V(2) and (not V(1));
    A(0) <= V(0);

    -- 4-bit wide 2-to-1 multiplexer for the ones digit d0
    D0(3) <= ((not z) and V(3)) or (z and A(3));
    D0(2) <= ((not z) and V(2)) or (z and A(2));
    D0(1) <= ((not z) and V(1)) or (z and A(1));
    D0(0) <= ((not z) and V(0)) or (z and A(0));

    -- Tens digit d1 is 0 when V <= 9, and 1 when V > 9
    D1 <= "000" & z;

    -- Minterms for valid BCD values of D0
    d0_m0 <= (not D0(3)) and (not D0(2)) and (not D0(1)) and (not D0(0));
    d0_m1 <= (not D0(3)) and (not D0(2)) and (not D0(1)) and      D0(0);
    d0_m2 <= (not D0(3)) and (not D0(2)) and      D0(1)  and (not D0(0));
    d0_m3 <= (not D0(3)) and (not D0(2)) and      D0(1)  and      D0(0);
    d0_m4 <= (not D0(3)) and      D0(2)  and (not D0(1)) and (not D0(0));
    d0_m5 <= (not D0(3)) and      D0(2)  and (not D0(1)) and      D0(0);
    d0_m6 <= (not D0(3)) and      D0(2)  and      D0(1)  and (not D0(0));
    d0_m7 <= (not D0(3)) and      D0(2)  and      D0(1)  and      D0(0);
    d0_m8 <=      D0(3)  and (not D0(2)) and (not D0(1)) and (not D0(0));
    d0_m9 <=      D0(3)  and (not D0(2)) and (not D0(1)) and      D0(0);

    -- Active-low 7-segment decoder for HEX0, using bit order HEX(6 downto 0)
    HEX0(6) <= d0_m0 or d0_m1 or d0_m7;
    HEX0(5) <= d0_m1 or d0_m2 or d0_m3 or d0_m7;
    HEX0(4) <= d0_m1 or d0_m3 or d0_m4 or d0_m5 or d0_m7 or d0_m9;
    HEX0(3) <= d0_m1 or d0_m4 or d0_m7;
    HEX0(2) <= d0_m2;
    HEX0(1) <= d0_m5 or d0_m6;
    HEX0(0) <= d0_m1 or d0_m4;

    -- Active-low 7-segment decoder for HEX1.
    -- D1 can only be 0000 or 0001, so these direct equations are sufficient.
    HEX1(6) <= '1';
    HEX1(5) <= D1(0);
    HEX1(4) <= D1(0);
    HEX1(3) <= D1(0);
    HEX1(2) <= '0';
    HEX1(1) <= '0';
    HEX1(0) <= D1(0);
end architecture dataflow;
