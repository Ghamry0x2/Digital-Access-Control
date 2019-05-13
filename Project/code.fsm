library IEEE;
library Sxlib_ModelSim;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.all;

ENTITY code IS
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
END code;

ARCHITECTURE behav OF code IS
	TYPE State IS (START, IN2, IN6, INA, IN0);
	SIGNAL CS, NS: State;
	
--Synthesis directivs:
--pragma current_state CS
--pragma next_state NS
--pragma clock clk
	
	BEGIN
-- Process (1): State update (sequential)
		PROCESS (clk)
		  BEGIN
			if(clk = '1' and not clk'stable) THEN
			  CS <= NS;
			END if;
		END PROCESS;
	  
-- Process (2): Transition and Generation functions
		PROCESS (CS, reset, code, daytime)
			BEGIN
				if(reset = '1') THEN
					NS <= START;
				else
					case CS IS
						WHEN START =>
							if(daytime = '1' and code = X"D") THEN
								NS <= START;
								door <= '1';
								alarm <= '0';
							elsif (code = X"2") THEN
								NS <= IN2;
								door <= '0';
								alarm <= '0';
							else
								NS <= START;
								door <= '0';
								alarm <= '1';
							END if;
							
						WHEN IN2 =>
							if(daytime = '1' and code = X"D") THEN
								NS <= START;
								door <= '1';
								alarm <= '0';
							elsif (code = X"6") THEN
								NS <= IN6;
								door <= '0';
								alarm <= '0';
							else
								NS <= START;
								door <= '0';
								alarm <= '1';
							END if;
							
						WHEN IN6 =>
							if(daytime = '1' and code = X"D") THEN
								NS <= START;
								door <= '1';
								alarm <= '0';
							elsif (code = X"A") THEN
								NS <= INA;
								door <= '0';
								alarm <= '0';
							else
								NS <= START;
								door <= '0';
								alarm <= '1';
							END if;
							
						WHEN INA =>
							if(daytime = '1' and code = X"D") THEN
								NS <= START;
								door <= '1';
								alarm <= '0';
							elsif (code = X"0") THEN
								NS <= IN0;
								door <= '0';
								alarm <= '0';
							else
								NS <= START;
								door <= '0';
								alarm <= '1';
							END if;
							
						WHEN IN0 =>
							if(daytime = '1' and code = X"D") THEN
								NS <= START;
								door <= '1';
								alarm <= '0';
							elsif (code = X"5") THEN
								NS <= START;
								door <= '1';
								alarm <= '0';
							else
								NS <= START;
								door <= '0';
								alarm <= '1';
							END if;
					END case;
				END if;
		END PROCESS;
END behav;