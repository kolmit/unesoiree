with Interface_StrategieVitesse; use Interface_StrategieVitesse;


package Vitesse_EcoulementIncompressible is
   
   type T_Vitesse_EcoulementIncompressible is new T_Interface_StrategieVitesse with private;
   overriding function calculVitesse(This : access T_Vitesse_EcoulementIncompressible; totalPressure, staticPressure : in Float) return Float;
   
private
   
   type T_Vitesse_EcoulementIncompressible is new T_Interface_StrategieVitesse with null record;
   
   
end Vitesse_EcoulementIncompressible;
