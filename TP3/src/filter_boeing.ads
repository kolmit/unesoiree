with Interface_StrategieFilter; use Interface_StrategieFilter;


package Filter_Boeing is

   type T_Filter_Boeing is new T_Interface_StrategieFilter with private;
   overriding function filterPressure(This : access T_Filter_Boeing; pressure : in Float) return Float;
   
private
   type T_Filter_Boeing is new T_Interface_StrategieFilter with record
      lastPressure : Float :=  0.0;
   end record;

end Filter_Boeing;
