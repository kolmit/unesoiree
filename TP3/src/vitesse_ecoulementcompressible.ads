with Interface_StrategieVitesse; use Interface_StrategieVitesse;
with Ada.Numerics.Generic_Elementary_Functions;


package Vitesse_EcoulementCompressible is

   type T_Vitesse_EcoulementCompressible is new T_Interface_StrategieVitesse with private;
   overriding function calculVitesse(This : access T_Vitesse_EcoulementCompressible; totalPressure, staticPressure : in Float) return Float;
   package genOp is new Ada.Numerics.Generic_Elementary_Functions(Float_Type => Float); use genOp;

private
   
   type T_Vitesse_EcoulementCompressible is new T_Interface_StrategieVitesse with null record;

end Vitesse_EcoulementCompressible;
