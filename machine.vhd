LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY machine IS
    PORT( 
        data_in, 
        clk, 
        reset : in std_logic;
        student_id          : out std_logic_vector(3 downto 0);
        current_state       : out std_logic_vector(3 downto 0)
    );
END machine;

ARCHITECTURE fsm OF machine IS
    TYPE state_type IS (s0, s1, s2, s3, s4, s5, s6, s7, s8);
    SIGNAL yfsm : state_type;
BEGIN

    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            yfsm <= s0;
        ELSIF (clk'EVENT AND clk = '1') THEN

            CASE yfsm IS

                WHEN s0 =>
                    IF data_in = '1' THEN
                        yfsm <= s8;
                    ELSE
                        yfsm <= s0;
                    END IF;

                WHEN s8 =>
                    IF data_in = '1' THEN
                        yfsm <= s6;
                    ELSE
                        yfsm <= s8;
                    END IF;

                WHEN s6 =>
                    IF data_in = '1' THEN
                        yfsm <= s4;
                    ELSE
                        yfsm <= s6;
                    END IF;

                WHEN s4 =>
                    IF data_in = '1' THEN
                        yfsm <= s2;
                    ELSE
                        yfsm <= s4;
                    END IF;

                WHEN s2 =>
                    IF data_in = '1' THEN
                        yfsm <= s7;
                    ELSE
                        yfsm <= s2;
                    END IF;

                WHEN s7 =>
                    IF data_in = '1' THEN
                        yfsm <= s5;
                    ELSE
                        yfsm <= s7;
                    END IF;

                WHEN s5 =>
                    IF data_in = '1' THEN
                        yfsm <= s3;
                    ELSE
                        yfsm <= s5;
                    END IF;

                WHEN s3 =>
                    IF data_in = '1' THEN
                        yfsm <= s1;
                    ELSE
                        yfsm <= s3;
                    END IF;

                WHEN s1 =>
                    IF data_in = '1' THEN
                        yfsm <= s0;
                    ELSE
                        yfsm <= s1;
                    END IF;
                    
            END CASE;
        END IF;
    END PROCESS;


    PROCESS(yfsm)
    BEGIN
        CASE yfsm IS  -- student number: 501227721

            WHEN s0 =>
                current_state <= "0000";   -- state 0
                student_id <= "0101";      -- 5

            WHEN s8 =>
                current_state <= "1000";   -- state 8
                student_id <= "0000";      -- 0

            WHEN s6 =>
                current_state <= "0110";   -- state 6
                student_id <= "0001";      -- 1

            WHEN s4 =>
                current_state <= "0100";   -- state 4
                student_id <= "0010";      -- 2

            WHEN s2 =>
                current_state <= "0010";   -- state 2
                student_id <= "0010";      -- 2

            WHEN s7 =>
                current_state <= "0111";   -- state 7
                student_id <= "0111";      -- 7

            WHEN s5 =>
                current_state <= "0101";   -- state 5
                student_id <= "0111";      -- 7

            WHEN s3 =>
                current_state <= "0011";   -- state 3
                student_id <= "0010";      -- 2

            WHEN s1 =>
                current_state <= "0001";   -- state 1
                student_id <= "0001";      -- 1

        END CASE;
    END PROCESS;

END fsm;

