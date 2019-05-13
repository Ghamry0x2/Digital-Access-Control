library IEEE;
library Sxlib_ModelSim;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.all;

ENTITY testbench IS
END ENTITY testbench;

ARCHITECTURE testbench_dft OF testbench IS

-- Component Declaration for the Device Under Test (DUT)
	COMPONENT DAC IS
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
	END COMPONENT DAC;

	FOR dut: DAC USE ENTITY WORK.codem_dft (structural);

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
	SIGNAL alarm 	: bit := '0'; 
	SIGNAL door 	: bit := '0'; 
	SIGNAL scanout 	: bit := '0'; 

-- Constants and Clock period definitions
	CONSTANT clk_period : time := 20 ns;
	CONSTANT sequence	: bit_vector(15 downto 0) := "1010101011111010";

	BEGIN

-- Instantiate the Device Under Test (DUT)
		dut: DAC PORT MAP (daytime, code, reset, clk, vdd, vss, door, alarm, scanin, test, scanout);
		
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
				
			WAIT; -- don't repeat above test vectors

	END PROCESS;
END testbench_dft;