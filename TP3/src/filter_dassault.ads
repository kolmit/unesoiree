with Interface_StrategieFilter; use Interface_StrategieFilter;

package Filter_Dassault is
        
   type T_Filter_Dassault is new T_Interface_StrategieFilter with private;
   overriding function filterPressure(This : access T_Filter_Dassault; pressure : in Float) return Float;
   
private
   
   type T_Filter_Dassault is new T_Interface_StrategieFilter with null record;

end Filter_Dassault;
