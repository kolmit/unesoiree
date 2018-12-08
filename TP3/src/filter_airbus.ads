with Interface_StrategieFilter; use Interface_StrategieFilter;


package Filter_Airbus is
   
   type T_Filter_Airbus is new T_Interface_StrategieFilter with private;
   
   package Constructor is
      function Initialize(a : in Float) return T_Filter_Airbus;
   end Constructor;
   
   overriding function filterPressure(This : access T_Filter_Airbus; pressure : in Float) return Float;
   
private
   type T_Filter_Airbus is new T_Interface_StrategieFilter with record
      cst_a : Float;
      lastPressure : Float := 0.0;
      isItFirstMeasure : Boolean := True;
   end record;


end Filter_Airbus;
