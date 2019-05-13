ENTITY rowend_x0 IS
GENERIC (
  CONSTANT area 	 : NATURAL := 250;
  CONSTANT transistors	 : NATURAL := 0
);
PORT (
  vdd	 : in  BIT;
  vss	 : in  BIT
);
END rowend_x0;

ARCHITECTURE behaviour_data_flow OF rowend_x0 IS

BEGIN
  ASSERT ((vdd and not (vss)) = '1')
  REPORT "power supply is missing on rowend_x0"
  SEVERITY WARNING;
END;
