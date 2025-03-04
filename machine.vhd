library ieee;
use ieee.std_logic_1164.all;
entity machine is
	port
	(
		clk : in std_logic;
		data_in : in std_logic;
		reset : in std_logic;
		student_id : out std_logic_vector(3 downto 0);
		current_state: out std_logic_vector (3 downto 0)
	);
end entity;

architecture fsm of machine is
	
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
		
	signal yfsm : state_type;
		
begin
	process(clk, reset)
	begin
		if reset = '1' then
			yfsm <= s0;
		elsif (clk'EVENT AND clk = '1') then
		
			case yfsm is
				when s0 =>
					IF (data_in = '0') then
						yfsm <= s0;
					ELSE
						yfsm <= s1;
					END IF;
				when s1 =>
					IF (data_in = '0') then
						yfsm <= s1;
					ELSE
						yfsm <= s2;
					END IF;
				when s2 =>
					IF (data_in = '0') then
						yfsm <= s2;
					ELSE
						yfsm <= s3;
					END IF;
				when s3 =>
					IF (data_in = '0') then
						yfsm <= s3;
					ELSE
						yfsm <= s4;
					END IF;
				when s4 =>
					IF (data_in = '0') then
						yfsm <= s4;
					ELSE
						yfsm <= s5;
					END IF;
				when s5 =>
					IF (data_in = '0') then
						yfsm <= s5;
					ELSE
						yfsm <= s6;
					END IF;
				when s6 =>
					IF (data_in = '0') then
						yfsm <= s6;
					ELSE
						yfsm <= s7;
					END IF;
				when s7 =>
					IF (data_in = '0') then
						yfsm <= s7;
					ELSE
						yfsm <= s8;
					END IF;
				when s8 =>
					IF (data_in = '0') then
						yfsm <= s8;
					ELSE
						yfsm <= s0;
					END IF;
				END CASE;
			END IF;
		END process;
	
	process (yfsm, data_in)
	begin
		case yfsm is
			when s0 =>
				student_id <= "0101";--s#:5
				current_state <= "1111";
			when s1 =>
				student_id <= "0000";--s#:0
				current_state <= "1110";
			when s2 =>
				student_id <= "0001";--s#:1
				current_state <= "1101";
			when s3 =>
				student_id <= "0001";--s#:1
				current_state <= "1100";
			when s4 =>
				student_id <= "0101";--s#:5
				current_state <= "1011";
			when s5 =>
				student_id <= "0111";--s#:7
				current_state <= "1010";
			when s6 =>
				student_id <= "0110";--s#:6
				current_state <= "1001";
			when s7 =>
				student_id <= "0110";--s#:6
				current_state <= "1000";
			when s8 =>
				student_id <= "0100";--s#:4
				current_state <= "0111"; --1000
		END CASE;
	END process;
END fsm;