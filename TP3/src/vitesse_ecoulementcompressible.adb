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
      tmp : Float := 0.0;
      --tmp := V_SON * Float_Functions.Sqrt( 2.0/(GAMMA-1.0) * ( ((totalPressure/staticPressure)**Natural(((GAMMA-1.0)/GAMMA))) -1.0) );
      --Put_Line("      [Vitesse] = ECOULEMENT COMPRESSIBLE" & Float'Image(totalPressure) & Float'Image(staticPressure));
      --return V_SON * Float_Functions.Sqrt( 2.0/(GAMMA-1.0) * ( ((totalPressure/staticPressure)**Natural(((GAMMA-1.0)/GAMMA))) -1.0) );

      sqrt : Float := 2.0/(GAMMA - 1.0);
   begin
      sqrt := sqrt * (genOp."**"( Float((totalPressure+staticPressure)/staticPressure) , Float((GAMMA - 1.0)/GAMMA) ) - 1.0);
      sqrt := genOp."**"( Float(sqrt), Float(0.5) );
      Put_Line("      [Vitesse] = ECOULEMENT COMPRESSIBLE" & Float'Image(sqrt) );
      return (V_SON*sqrt);


   end calculVitesse;

end Vitesse_EcoulementCompressible;
