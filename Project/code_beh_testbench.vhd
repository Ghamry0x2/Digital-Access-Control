library IEEE;
library Sxlib_ModelSim;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.all;

ENTITY testbench IS
END ENTITY testbench;

ARCHITECTURE testbench_beh OF testbench IS

-- Component Declaration for the Device Under Test (DUT)
	COMPONENT DAC IS
-- Just copy and paste the input and output ports of your module as such. 
		PORT(
			daytime:	IN bit;
			code: 		IN bit_vector(3 downto 0);
			reset: 		IN bit;
			clk: 		IN bit;
			vdd: 		IN bit;
			vss: 		IN bit;
			door:		OUT bit;
			alarm:		OUT bit
		);
	END COMPONENT DAC;

	FOR dut: DAC USE ENTITY WORK.code (behav);

-- Declare input signals and initialize them
	SIGNAL vdd 		: bit := '1';
	SIGNAL vss 		: bit := '0'; 
	SIGNAL clk 		: bit := '1'; 
	SIGNAL reset 	: bit := '1'; 
	SIGNAL daytime 	: bit := '0'; 
	SIGNAL code		: bit_vector (3 downto 0) := X"0";
	
-- Declare output signals and initialize them
	SIGNAL alarm 	: bit := '0'; 
	SIGNAL door 	: bit := '0'; 

-- Constants and Clock period definitions
	CONSTANT clk_period : time := 20 ns;

	BEGIN

-- Instantiate the Device Under Test (DUT)
		dut: DAC PORT MAP (daytime, code, reset, clk, vdd, vss, door, alarm);
		
-- Clock process definition( clock with 50% duty cycle )
		PROCESS
			BEGIN
				clk <= '1';
				WAIT FOR clk_period/2;  
				clk <= '0';
				WAIT FOR clk_period/2;  
		END PROCESS;

		PROCESS IS
			BEGIN
				
				REPORT "------------- Case 1 -------------";
					daytime <= '0'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 1.1" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 1.2" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 1.3" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"0"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 1.4" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"5"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '1' and alarm = '0' 
					REPORT "Error in Case 1.5" 
					SEVERITY Error;
				REPORT "------------- End of case 1 -------------";
				
				REPORT "------------- Case 2 -------------";
					daytime <= '1'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 2.1" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 2.2" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 2.3" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"3"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '1' 
					REPORT "Error in Case 2.4" 
					SEVERITY Error;
				REPORT "------------- End of case 2 -------------";
				
				REPORT "------------- Case 3 -------------";
					daytime <= '1'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 3.1" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 3.2" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 3.3" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"0"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 3.4" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"D"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '1' and alarm = '0' 
					REPORT "Error in Case 3.5" 
					SEVERITY Error;
				REPORT "------------- End of case 3 -------------";
				
				REPORT "------------- Case 4 -------------";
					daytime <= '0'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 4.1" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 4.2" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 4.3" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"0"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 4.4" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"D"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '1' 
					REPORT "Error in Case 4.5" 
					SEVERITY Error;
				REPORT "------------- End of case 4 -------------";
				
				REPORT "------------- Case 5 -------------";
					daytime <= '0'; code <= X"3"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '1' 
					REPORT "Error in Case 5.1" 
					SEVERITY Error;
				REPORT "------------- End of case 5 -------------";
				
				REPORT "------------- Case 6 -------------";
					daytime <= '1'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 6.1" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"6"; reset <= '1';
					WAIT FOR clk_period;
					ASSERT door = '0' and alarm = '0' 
					REPORT "Error in Case 6.2" 
					SEVERITY Error;
				REPORT "------------- End of case 6 -------------";
				
				REPORT "------------- Case 7 -------------";
					daytime <= '1'; code <= X"D"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door = '1' and alarm = '0' 
					REPORT "Error in Case 7.1" 
					SEVERITY Error;
				REPORT "------------- End of case 7 -------------";
				
			WAIT; -- don't repeat above test vectors

	END PROCESS;
END testbench_beh;