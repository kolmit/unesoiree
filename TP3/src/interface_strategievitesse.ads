package Interface_StrategieVitesse is

   type T_Interface_StrategieVitesse is interface;
   type T_Interface_StrategieVitesse_Access is access all T_Interface_StrategieVitesse'Class;
   
   function calculVitesse(This : access T_Interface_StrategieVitesse; totalPessure, staticPressure : in Float) return Float is abstract;


end Interface_StrategieVitesse;
