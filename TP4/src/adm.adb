with TestValues; use TestValues;
package body ADM is

   package body Constructor is

      function Initialize return T_ADM is
         This : T_ADM;
      begin
         return This;
       end Initialize;

   end Constructor;


   function simuleVitesse (This : access T_ADM) return T_Mesure_Access is
   begin
      This.currentMesure := Mesure.Constructor.Initialize(This => new T_Mesure,
                                                                 value  => TestValues.valueADM,
                                                                 status => TestValues.statusADM);

      return This.currentMesure;
   end simuleVitesse;


   function getMyType (This : access T_ADM) return Integer is
   begin
      return 1;
   end getMyType;

end ADM;
