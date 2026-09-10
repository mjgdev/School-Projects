LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
    PORT (
        bcd      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); 
        sign     : IN  STD_LOGIC;           
		  Overflow : IN STD_LOGIC;
        leds_right : OUT STD_LOGIC_VECTOR(1 TO 7);      
        leds_left: OUT STD_LOGIC_VECTOR(1 TO 7)
);
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
  
    PROCESS ( bcd )
    BEGIN
        CASE bcd IS
            WHEN "0000" => leds_right <= "0000001";  
            WHEN "0001" => leds_right <= "1001111";  
            WHEN "0010" => leds_right <= "0010010";  
            WHEN "0011" => leds_right <= "0000110";  
            WHEN "0100" => leds_right <= "1001100";  
            WHEN "0101" => leds_right <= "0100100";  
            WHEN "0110" => leds_right <= "0100000";  
            WHEN "0111" => leds_right <= "0001111";  
            WHEN "1000" => leds_right <= "0000000";  
            WHEN "1001" => leds_right <= "0000100";  
            WHEN "1010" => leds_right <= "0001000";  -- A
            WHEN "1011" => leds_right <= "1100000";  -- B
            WHEN "1100" => leds_right <= "0110001";  -- C
            WHEN "1101" => leds_right <= "1000010";  -- D
            WHEN "1110" => leds_right <= "0110000";  -- E
            WHEN "1111" => leds_right <= "0111000";  -- F
            WHEN OTHERS => leds_right <= "-------";  
        END CASE;
    END PROCESS;


    PROCESS ( sign, Overflow )
    BEGIN
		  IF Overflow = '1' THEN
            leds_left <= "0110000";
				
        ELSIF sign = '1' THEN  
            leds_left <= "1111110";  
        ELSE             
            leds_left <= "1111111";  
        END IF;
    END PROCESS;
END Behavior;
