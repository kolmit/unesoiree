with PhysicConstants; use PhysicConstants;
with Ada.Numerics.Generic_Elementary_Functions;

package body Vitesse_EcoulementIncompressible is
   package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions (Float);
   overriding function calculVitesse
     (This : access T_Vitesse_EcoulementIncompressible;
      totalPressure, staticPressure : in Float)
      return Float
   is
   begin
      return Float_Functions.Sqrt(2.0*(totalPressure - staticPressure)/RHO);
   end calculVitesse;

end Vitesse_EcoulementIncompressible;
