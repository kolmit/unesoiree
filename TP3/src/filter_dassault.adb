package body Filter_Dassault is

   overriding function filterPressure
     (This : access T_Filter_Dassault;
      pressure : in Float)
      return Float
   is
   begin
      return pressure;
   end filterPressure;

end Filter_Dassault;
