with GNAT.IO; use GNAT.IO;
with Ada.Numerics.Generic_Elementary_Functions;
with PhysicConstants; use PhysicConstants;


package body Vitesse_EcoulementCompressible is
   package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions (Float);

   overriding function calculVitesse
     (This : access T_Vitesse_EcoulementCompressible;
      totalPressure, staticPressure : in Float)
      return Float
   is
   begin
            Put_Line("\\\\\\\\\\\\\\\\\ VITESSE ECOUL COMP");

       return 6.666; --V_SON * Sqrt( 2.0/(GAMMA-1.0) * ( ((totalPressure/staticPressure)**((GAMMA-1.0)/GAMMA)) -1.0) );
   end calculVitesse;

end Vitesse_EcoulementCompressible;
