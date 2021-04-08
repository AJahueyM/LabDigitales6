library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- recibir primer digito    S_PrimerNumero
-- recibir segundo digito   S_SegundoNumero
-- recibir igual            S_Igual
-- generar resultado        S_Resultado



entity calculator is -- -8+-9= 8 + 9 =
Port(CX : in std_logic_vector(0 to 3);
     CY : in std_logic_vector(0 to 3);
     RESET : in std_logic;
     C_OUT : out std_logic_vector(0 to 7)
     );
end calculator;

architecture Behavioral of calculator is

component decoder is
Port(x : in std_logic_vector(0 to 3);
     y : in std_logic_vector(0 to 3);
     s : out std_logic_vector(0 to 3)
         );
end component;


type T_CALCULATOR is
    (S_PrimerNumero,S_SegundoNumero,S_Resultado);
  signal STATE : T_CALCULATOR := S_PrimerNumero;
  signal DIGIT : std_logic_vector(0 to 3);
  signal N1 : integer := 30;
  signal N2 : integer := 30;
  signal OP : std_logic_vector(0 to 3);
  signal RST : integer := 0;
  signal NEG : std_logic := '0';
begin

E1 :  decoder port map(CX,CY,DIGIT);
C_OUT <= std_logic_vector(to_signed(RST,C_OUT'length));

process(DIGIT, STATE, RESET)
begin
    if(RESET = '1') then
        N1 <= 30;
        N2  <= 30;
        RST <= 0;
        NEG <= '0';
        STATE <= S_PrimerNumero;
    else 
       case(STATE) is
           when S_PrimerNumero => 
               if("1110" = DIGIT) then -- es neg?
                   NEG <= not(NEG);
               elsif(to_integer(unsigned(DIGIT)) < 10) then
                   N1 <= to_integer(unsigned(DIGIT));
               elsif(N1 /= 30) then
                   if("1101" = DIGIT) then -- BACK
                       N1 <= 30;
                       NEG <= '0';
                   elsif (DIGIT /= "1111") then-- /= = 
                       if(NEG = '1') then
                           N1 <= -(N1);
                           end if;
                       OP <= DIGIT;
                       STATE <= S_SegundoNumero;
                       NEG <= '0';
                   end if;
               end if;
            
           when S_SegundoNumero => 
                   if("1110" = DIGIT) then -- es neg?
                       NEG <= not(NEG);
                   elsif(to_integer(unsigned(DIGIT)) < 10) then
                       N2 <= to_integer(unsigned(DIGIT));
                   elsif(N2 /= 30) then
                       if("1101" = DIGIT) then -- BACK
                           N2 <= 30;
                           NEG <= '0';
                       elsif (DIGIT = "1111") then-- /= = 
                           if(NEG = '1') then
                               N2 <= -(N2);
                               end if;
                           STATE <= S_Resultado;
                       end if;
                   end if;
                   
           when S_Resultado  => 
               
               case(OP) is
                   when "1010" => -- SUMA
                       RST <= (N1 + N2);
                   when "1011" => -- RESTA
                       RST <= N1 - N2;
                   when "1100" => -- MULTI
                       RST <= N1 * N2;
                   when others =>
                       RST <= 0;
               end case;
           --std_logic_vector(to_signed(input_1, output_1b'length));
      
       
       end case;
    
    end if;
     
end process;


end Behavioral;
