-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.3.2021 00:40:07 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder is
end tb_decoder;

architecture tb of tb_decoder is

    component decoder
        port (x : in std_logic_vector (0 to 3);
              y : in std_logic_vector (0 to 3);
              s : out std_logic_vector (0 to 3));
    end component;

    signal x : std_logic_vector (0 to 3);
    signal y : std_logic_vector (0 to 3);
    signal s : std_logic_vector (0 to 3);

    constant TbPeriod : time := 50 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : decoder
    port map (x => x,
              y => y,
              s => s);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
    
        --0
        x <= "0001";
        y <= "0100";
        wait for 1 * TbPeriod;  
    
        -- 1
        x <= "1000";
        y <= "1000";
        wait for 1 * TbPeriod;
        
        --2
        x <= "1000";
        y <= "0100";
        wait for 1 * TbPeriod;
        
        --3
         x <= "1000";
         y <= "0010";
         wait for 1 * TbPeriod;    
         
         --4
         x <= "0100";
         y <= "1000";
         wait for 1 * TbPeriod;
         
         --5
         x <= "0100";
         y <= "0100";
         wait for 1 * TbPeriod;
         
         --6
          x <= "0100";
          y <= "0010";
          wait for 1 * TbPeriod;
          
          --7
          x <= "0010";
          y <= "1000";
          wait for 1 * TbPeriod;
          
          --8
          x <= "0010";
          y <= "0100";
          wait for 1 * TbPeriod;
          
          --9
           x <= "0010";
           y <= "0010";
           wait for 1 * TbPeriod;  
           
           -- SUMA A
           x <= "1000";
           y <= "0001";
           wait for 1 * TbPeriod;
           
           -- RESTA B
           x <= "0100";
           y <= "0001";
           wait for 1 * TbPeriod;
           
           -- MULTI C
            x <= "0010";
            y <= "0001";
            wait for 1 * TbPeriod;  
            
            -- BACK D
            x <= "0001";
            y <= "1000";
            wait for 1 * TbPeriod;
            
            -- NEG E
            x <= "0001";
            y <= "0010";
            wait for 1 * TbPeriod;
            
            -- IGUAL F
            x <= "0001";
            y <= "0001";
            wait for 1 * TbPeriod;
            
            -- U
            x <= "UUUU";
            y <= "UUUU";
            wait for 1 * TbPeriod;
            

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_decoder of tb_decoder is
    for tb
    end for;
end cfg_tb_decoder;