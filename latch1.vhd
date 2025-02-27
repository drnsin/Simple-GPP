LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latch1 IS
	PORT (A : IN STD_LOGIC_VECTOR(7 DOWNTO 0 );
			Resetn, Clock: IN STD_LOGIC;
			Q1: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END latch1;

ARCHITECTURE Behavior OF latch1 IS
BEGIN
	Process(Resetn, Clock)
	BEGIN	
		IF Resetn = '0' THEN
			Q1 <= "00000000";
		ELSIF CLOCK'EVENT AND Clock = '1' THEN	
			Q1 <= A;
		END IF;
	END PROCESS;
	END Behavior;
	
	