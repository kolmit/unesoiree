pragma Ada_2012;
package body Filter_Boeing is

   overriding function filterPressure (This : access T_Filter_Boeing; pressure : in Float) return Float
   is
      result : Float := (pressure + This.lastPressure)/2.0;
   begin
      This.lastPressure := pressure;
      return result;
   end filterPressure;

end Filter_Boeing;
