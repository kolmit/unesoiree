with GNAT.IO; use GNAT.IO;

package body Filter_Dassault is

   overriding function filterPressure
     (This : access T_Filter_Dassault;
      pressure : in Float)
      return Float
   is
   begin
      Put_Line("KRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR DASSAULT");
      return pressure;
   end filterPressure;

end Filter_Dassault;
