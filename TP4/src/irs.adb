with TestValues; use TestValues;
package body IRS is

   package body Constructor is

      function Initialize return T_IRS is
         This : T_IRS;
      begin
         return This;
       end Initialize;

   end Constructor;


   function simuleVitesse (This : access T_IRS)
      return T_Mesure_Access
   is
   begin
      This.currentMesure := Mesure.Constructor.Initialize(This => new T_Mesure,
                                                                 value  => TestValues.valueIRS,
                                                                 status => TestValues.statusIRS);
      return This.currentMesure;
   end simuleVitesse;

   function getMyType (This : access T_IRS) return Integer is
   begin

         return 2;
      -- On return 2 dans tous les cas car on a pas de hashmap pour le type...

   end getMyType;


end IRS;
