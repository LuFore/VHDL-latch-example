library ieee;
use ieee.std_logic_1164.all;

entity tb_latch is
end tb_latch;

architecture tb of tb_latch is

    component latch
        port (input  : in std_ulogic;
              clk    : in std_ulogic;
              rst    : in std_ulogic;
              output : out std_ulogic);
    end component;

    signal input  : std_ulogic;
    signal clk    : std_ulogic;
    signal rst    : std_ulogic;
    signal output : std_ulogic;

    constant TbPeriod : time := 1000 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : latch
    port map (input  => input,
              clk    => clk,
              rst    => rst,
              output => output);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    clk <= TbClock;

    stimuli : process
    begin

        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        for i in 1 to 10 loop
          input <= not output;
          wait for  TbPeriod;
        end loop;
        report "Simulation finished" severity note;
        
        -- end simulation
        TbSimEnded <= '1';
        wait;
    end process;
end tb;
