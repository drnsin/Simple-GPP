library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU2 is
	port(Clock 		: in std_logic; --input clock signal
		A,B 			: in unsigned (7 downto 0); -- 8 bit inputs from latches A and B
		student_id 	: in unsigned(3 downto 0); --4 bit student id from FSM
		OP 			: in unsigned (15 downto 0); --16 bit selector for Operation from Decoder
		Neg			: out std_logic;
		R1				: out unsigned (3 downto 0);
		R2				: out unsigned (3 downto 0));
	end ALU2;
	
	architecture calculation of ALU2 is 
	signal Reg1,Reg2,Result : unsigned(7 downto 0) := (others => '0');
	signal temp : unsigned(7 downto 0);
	signal Reg4 : unsigned(0 to 7);
	begin
	Reg1 <= A;
	Reg2 <= B;
	process(Clock, OP)
	Begin
		if(rising_edge(Clock)) THEN 
		neg <= '0';
		case OP is
			When "0000000000000001" =>
				-- Swap the lower and upper 4 bits of A
				temp(7 downto 4) <= Reg1(3 downto 0);
				temp(3 downto 0) <= Reg1(7 downto 4);
				
				result <= temp;
			
			WHEN "0000000000000010" =>
					--Produce the result of ORing A and B
					Result <= Reg1 OR Reg2;
					Neg <= '0';
			WHEN "0000000000000100" =>
					--Decrement B by 5
					Result <= Reg2 - "0101";
					Neg <= '0';
			WHEN "0000000000001000" =>
					--Invert all bits of A
					Result <= (Not Reg1);
					Neg <= '0';
			WHEN "0000000000010000" =>
					--Invert the bit-significance order of A
					for i in 0 to 7 loop
						Result(i) <= Reg1(7-i);
					end loop;
					Neg <= '0';
			WHEN "0000000000100000" =>
					--Find the greater value of A and B and produce the results(Max(A,B))
					IF Reg1 >= Reg2 THEN
						Result <= Reg1;
						Neg <= '1';
					ELSE
					Result <= Reg2;
					END IF;
					Neg <= '0';
			WHEN "0000000001000000" =>
					--Produce the difference between A and B
					IF Reg1 < Reg2 THEN
						Result <= (Reg1 + (NOT Reg2 + 1));
						Neg <= '1';
					ELSE
						Result <= (Reg1 - Reg2);
					END IF;
			WHEN "0000000010000000" =>
					--Produce the result of XNORing A and B
					Result <= (Reg1 XNOR Reg2);
					Neg <= '0';
			WHEN "0000000100000000" =>
					--Rotate B to left by three bits
					Result <= rotate_left(Reg2, 3);
					Neg <= '0';
			WHEN OTHERS =>
					--Don't care, do nothing
					Result <= "--------";
					Neg <= '0';
			end case;
			end if;
		
		end process;
		
		R1 <= Result(3 downto 0);
		R2 <= Result(7 downto 4);
		
	end calculation;	
			
	