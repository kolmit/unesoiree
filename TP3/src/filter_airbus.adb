package body Filter_Airbus is

   package body Constructor is
      
      function Initialize(a : in Float) return T_Filter_Airbus is
         This : T_Filter_Airbus;
      begin
         This.cst_a := a;
         return This;
      end Initialize;
      
   end Constructor;
   
   overriding function filterPressure(This : access T_Filter_Airbus; pressure : in Float) return Float is
   begin
      -- Pf(n) = P(n) + a*Pf(n-1) --
      This.lastPressure := pressure + This.cst_a*This.lastPressure;
      return This.lastPressure;
   end filterPressure;

end Filter_Airbus;
