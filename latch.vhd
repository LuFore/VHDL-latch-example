library ieee;
use ieee.std_logic_1164.all;

entity latch is
  port( input, clk, rst : in std_ulogic;
        output          :out std_ulogic);
end latch;
--simple latch for an example of using GHDL + GTKWave 
architecture arch of latch is
begin
  process(clk, rst) --async rst 
  begin
    
    if rst = '1' then
      output <= '0';
    elsif rising_edge(clk)then
      output <= input;
    end if;
  end process;  
end arch;   
