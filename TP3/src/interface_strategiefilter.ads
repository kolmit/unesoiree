package Interface_StrategieFilter is

   type T_Interface_StrategieFilter is interface;
   type T_Interface_StrategieFilter_Access is access all T_Interface_StrategieFilter'Class;
   
   function filterPressure(This : access T_Interface_StrategieFilter; pressure : in Float) return Float is abstract;


end Interface_StrategieFilter;
