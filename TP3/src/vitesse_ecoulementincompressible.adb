with GNAT.IO; use GNAT.IO;
with PhysicConstants; use PhysicConstants;
with Ada;
with Ada.Numerics.Generic_Elementary_Functions;

package body Vitesse_EcoulementIncompressible is

   overriding function calculVitesse
     (This : access T_Vitesse_EcoulementIncompressible;
      totalPressure, staticPressure : in Float)
      return Float
   is
      package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions (Float);
      res : Float := 0.0;
   begin
      Put_Line("\\\\\\\\\\\\\\\\\ VITESSE ECOUL INCOMP");
      -- Condition pour éviter que le calcul donne une vitesse négative
      if (totalPressure = 0.0) then
         res := 2.0 * staticPressure / RHO;
      else
         res := 2.0 * (totalPressure - staticPressure) / RHO;
      end if;

      --res := Float_Functions.Sqrt(X => (res));
      return res;
   end calculVitesse;

end Vitesse_EcoulementIncompressible;

