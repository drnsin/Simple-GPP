LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latch2 IS
	PORT (B : IN STD_LOGIC_VECTOR(7 DOWNTO 0 );
			Resetn, Clock: IN STD_LOGIC;
			Q2: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END latch2;

ARCHITECTURE Behavior OF latch2 IS
BEGIN
	Process(Resetn, Clock)
	BEGIN	
		IF Resetn = '0' THEN
			Q2 <= "00000000";
		ELSIF CLOCK'EVENT AND Clock = '1' THEN	
			Q2 <= B;
		END IF;
	END PROCESS;
	END Behavior;
	
	