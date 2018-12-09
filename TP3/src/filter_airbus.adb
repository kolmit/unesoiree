with GNAT.IO; use GNAT.IO;
package body Filter_Airbus is

   package body Constructor is
      
      function Initialize(a : in Float) return T_Filter_Airbus is
         This : T_Filter_Airbus;
      begin
         This.cst_a := a;
         return This;
      end Initialize;
      
   end Constructor;
   

   overriding function filterPressure (This : access T_Filter_Airbus; pressure : in Float) return Float
   is
      filterOutput : Float := 0.0;
   begin
      -- Pas de filtrage pour la 1ère valeur p(0)
      if (This.isItFirstMeasure = True) then
        This.isItFirstMeasure := False;
         filterOutput := pressure;
      else      
         -- Pf(n) = P(n) + a*Pf(n-1) --
         filterOutput := pressure + This.cst_a*This.lastPressure;
      end if;
   
      Put_Line("   [Filtrage] = AIRBUS");
      This.lastPressure := filterOutput;

   
      return filterOutput;
   end filterPressure;
end Filter_Airbus;
