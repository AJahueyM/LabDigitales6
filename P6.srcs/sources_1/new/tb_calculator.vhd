-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 8.4.2021 20:08:43 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_calculator is
end tb_calculator;

architecture tb of tb_calculator is

    component calculator
        port (CX    : in std_logic_vector (0 to 3);
              CY    : in std_logic_vector (0 to 3);
              RESET : in std_logic := '0';
              C_OUT : out std_logic_vector (0 to 7));
    end component;

    signal CX    : std_logic_vector (0 to 3);
    signal CY    : std_logic_vector (0 to 3);
    signal RESET : std_logic;
    signal C_OUT : std_logic_vector (0 to 7);

    constant TbPeriod : time := 10 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : calculator
    port map (CX    => CX,
              CY    => CY,
              RESET => RESET,
              C_OUT => C_OUT);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
        -- 5 + 3 = 8
        
        -- 5
        CX <= ("0100");
        CY <= ("0100");
        wait for 1 * TbPeriod;
        
        -- +
        CX <= ("1000");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        -- 3
        CX <= ("1000");
        CY <= ("0010");
        wait for 1 * TbPeriod;
        
        -- =
        CX <= ("0001");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        RESET <= '1';
        wait for 1 * TbPeriod;
        RESET <= '0';
        
        -- 9 - 4 = 5
        
        -- 9
        CX <= ("0010");
        CY <= ("0010");
        wait for 1 * TbPeriod;
        
        -- -
        CX <= ("0100");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        -- 4
        CX <= ("0100");
        CY <= ("1000");
        wait for 1 * TbPeriod;
        
        -- =
        CX <= ("0001");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        RESET <= '1';
        wait for 1 * TbPeriod;
        RESET <= '0';
        
        -- 5 * 3 = 15
        
        -- 5
        CX <= ("0100");
        CY <= ("0100");
        wait for 1 * TbPeriod;
        
        -- *
        CX <= ("0010");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        -- 3
        CX <= ("1000");
        CY <= ("0010");
        wait for 1 * TbPeriod;
        
        -- =
        CX <= ("0001");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        RESET <= '1';
        wait for 1 * TbPeriod;
        RESET <= '0';
        
        -- -8 + -5 = -13
               
        -- (-)
        CX <= ("0001");
        CY <= ("0010");
        wait for 1 * TbPeriod;
        
        -- 8
        CX <= ("0010");
        CY <= ("0100");
        wait for 1 * TbPeriod;
        
        -- +
        CX <= ("1000");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        -- (-)
        CX <= ("0001");
        CY <= ("0010");
        wait for 1 * TbPeriod;
           
        -- 5
        CX <= ("0100");
        CY <= ("0100");
        wait for 1 * TbPeriod;
        
        -- =
        CX <= ("0001");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        RESET <= '1';
        wait for 1 * TbPeriod;
        RESET <= '0';
        
        
        -- 6 * -2 = -12
        
        -- 6
        CX <= ("0100");
        CY <= ("0010");
        wait for 1 * TbPeriod;
        
        -- *
        CX <= ("0010");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        -- (-)
        CX <= ("0001");
        CY <= ("0010");
        wait for 1 * TbPeriod;
           
        -- 2
        CX <= ("1000");
        CY <= ("0100");
        wait for 1 * TbPeriod;
        
        -- =
        CX <= ("0001");
        CY <= ("0001");
        wait for 1 * TbPeriod;
        
        RESET <= '1';
        wait for 1 * TbPeriod;
        RESET <= '0';
        


        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_calculator of tb_calculator is
    for tb
    end for;
end cfg_tb_calculator;