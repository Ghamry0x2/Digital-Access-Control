library IEEE;
library Sxlib_ModelSim;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.all;

ENTITY testbench IS
END ENTITY testbench;

ARCHITECTURE testbench_beh_struct_dft OF testbench IS

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
	
	COMPONENT DAC_DFT IS
-- Just copy and paste the input and output ports of your module as such. 
		PORT(
		  daytime : in      bit;
		  code    : in      bit_vector(3 downto 0);
		  reset   : in      bit;
		  clk     : in      bit;
		  vdd     : in      bit;
		  vss     : in      bit;
		  door    : out     bit;
		  alarm   : out     bit;
		  scanin  : in      bit;
		  test    : in      bit;
		  scanout : out     bit
		);
	END COMPONENT DAC_DFT;

	FOR dut_beh: DAC USE ENTITY WORK.code (behav);
	FOR dut_struct: DAC USE ENTITY WORK.codem_b_l (structural);
	FOR dut_dft: DAC_DFT USE ENTITY WORK.codem_dft (structural);

-- Declare input signals and initialize them
	SIGNAL vdd 		: bit := '1';
	SIGNAL vss 		: bit := '0'; 
	SIGNAL clk 		: bit := '1'; 
	SIGNAL reset 	: bit := '1'; 
	SIGNAL daytime 	: bit := '0'; 
	SIGNAL code		: bit_vector (3 downto 0) := X"0";
	
	SIGNAL scanin 	: bit := '0'; 
	SIGNAL test 	: bit := '0'; 
	
-- Declare output signals and initialize them
	SIGNAL alarm_beh 	: bit := '0'; 
	SIGNAL door_beh 	: bit := '0'; 
	
	SIGNAL alarm_struct : bit := '0'; 
	SIGNAL door_struct 	: bit := '0'; 
	
	SIGNAL alarm_dft	: bit := '0'; 
	SIGNAL door_dft 	: bit := '0'; 
	SIGNAL scanout 	: bit := '0'; 

-- Constants and Clock period definitions
	CONSTANT clk_period : time := 20 ns;
	CONSTANT sequence	: bit_vector(15 downto 0) := "1010101011111010";

	BEGIN

-- Instantiate the Device Under Test (DUT)
		dut_beh: DAC PORT MAP (daytime, code, reset, clk, vdd, vss, door_beh, alarm_beh);
		dut_struct: DAC PORT MAP (daytime, code, reset, clk, vdd, vss, door_struct, alarm_struct);
		dut_dft: DAC_DFT PORT MAP (daytime, code, reset, clk, vdd, vss, door_dft, alarm_dft, scanin, test, scanout);
		
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
				
				test <= '0';
				wait for clk_period;
				
				REPORT "------------- Case 1 -------------";
					daytime <= '0'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 1.1" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 1.2" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 1.3" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"0"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 1.4" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"5"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 1.5" 
					SEVERITY Error;
				REPORT "------------- End of case 1 -------------";
				
				REPORT "------------- Case 2 -------------";
					daytime <= '1'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 2.1" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 2.2" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 2.3" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"3"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 2.4" 
					SEVERITY Error;
				REPORT "------------- End of case 2 -------------";
				
				REPORT "------------- Case 3 -------------";
					daytime <= '1'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 3.1" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 3.2" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 3.3" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"0"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 3.4" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"D"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 3.5" 
					SEVERITY Error;
				REPORT "------------- End of case 3 -------------";
				
				REPORT "------------- Case 4 -------------";
					daytime <= '0'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 4.1" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"6"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 4.2" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"A"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 4.3" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"0"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 4.4" 
					SEVERITY Error;
					
					daytime <= '0'; code <= X"D"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 4.5" 
					SEVERITY Error;
				REPORT "------------- End of case 4 -------------";
				
				REPORT "------------- Case 5 -------------";
					daytime <= '0'; code <= X"3"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 5.1" 
					SEVERITY Error;
				REPORT "------------- End of case 5 -------------";
				
				REPORT "------------- Case 6 -------------";
					daytime <= '1'; code <= X"2"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 6.1" 
					SEVERITY Error;
					
					daytime <= '1'; code <= X"6"; reset <= '1';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 6.2" 
					SEVERITY Error;
				REPORT "------------- End of case 6 -------------";
				
				REPORT "------------- Case 7 -------------";
					daytime <= '1'; code <= X"D"; reset <= '0';
					WAIT FOR clk_period;
					ASSERT door_beh = door_struct and door_beh = door_dft and alarm_beh = alarm_struct and alarm_beh = alarm_dft 
					REPORT "Error in Case 7.1" 
					SEVERITY Error;
				REPORT "------------- End of case 7 -------------";
					
				REPORT "------------- Case 8 'DFT' -------------";
				test <= '1'; reset <= '0';
				
				for i in 0 to sequence'length-1 loop
					scanin <= sequence(i);
					wait for clk_period;
					
					if i >= 2 then
						Report "Checking";
						Assert scanout = sequence(i-2)
						Report "scanout does not follow scanin"
						Severity error;
					end if;
				end loop;
				REPORT "------------- End of case 8 'DFT' -------------";
				
			WAIT; -- don't repeat above test vectors

	END PROCESS;
END testbench_beh_struct_dft;