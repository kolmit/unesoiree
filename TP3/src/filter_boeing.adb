with GNAT.IO; use GNAT.IO;

package body Filter_Boeing is

   overriding function filterPressure (This : access T_Filter_Boeing; pressure : in Float) return Float
   is
      filterOutput : Float := 0.0;
   begin
      -- Pas de filtrage pour la 1ère valeur p(0)
      if (This.isItFirstMeasure = True) then
        This.isItFirstMeasure := False;
         filterOutput := pressure;
      else
         filterOutput := (pressure + This.lastPressure)/2.0;
      end if;

      Put_Line("   [Filtrage] = BOEING");
      This.lastPressure := pressure;


      return filterOutput;
   end filterPressure;

end Filter_Boeing;
