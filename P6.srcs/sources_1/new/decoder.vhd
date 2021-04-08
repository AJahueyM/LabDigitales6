----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2021 03:07:29 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
Port(x : in std_logic_vector(0 to 3);
     y : in std_logic_vector(0 to 3);
     s : out std_logic_vector(0 to 3)
         );
end decoder;

architecture Behavioral of decoder is

begin
    process (x,y)
    begin
    
    if (x = "1000" and y = "1000") then     -- 1
        s <= "0001";
    elsif (x = "1000" and y = "0100") then -- 2
        s <= "0010";
    elsif (x = "1000" and y = "0010") then -- 3
        s <= "0011";
    elsif (x = "1000" and y = "0001") then -- SUMA A
        s <= "1010";
    elsif (x = "0100" and y = "1000") then -- 4
        s <= "0100";
    elsif (x = "0100" and y = "0100") then -- 5
        s <= "0101";
    elsif (x = "0100" and y = "0010") then -- 6
        s <= "0110";
    elsif (x = "0100" and y = "0001") then -- RESTA B
        s <= "1011";
    elsif (x = "0010" and y = "1000") then -- 7
        s <= "0111";
    elsif (x = "0010" and y = "0100") then -- 8
        s <= "1000";
    elsif (x = "0010" and y = "0010") then -- 9
        s <= "1001";
    elsif (x = "0010" and y = "0001") then -- MULTI C
        s <= "1100";
    elsif (x = "0001" and y = "1000") then -- BACK D
        s <= "1101";
    elsif (x = "0001" and y = "0100") then -- 0
        s <= "0000";
    elsif (x = "0001" and y = "0010") then -- NEG E
        s <= "1110";
    else --(x = "0001" and y = "0001")  -- IGUAL F
         s<= "1111";
     end if;
    
    end process;


end Behavioral;
