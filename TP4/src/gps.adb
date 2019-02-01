with TestValues; use TestValues;
package body GPS is

   package body Constructor is

      function Initialize return T_GPS is
         This : T_GPS;
      begin
         return This;
       end Initialize;

   end Constructor;


   function simuleVitesse (This : access T_GPS)
      return T_Mesure_Access
   is
   begin
      This.currentMesure := Mesure.Constructor.Initialize(This => new T_Mesure,
                                                          value  => TestValues.valueGPS,
                                                          status => TestValues.statusGPS);

      return This.currentMesure;
   end simuleVitesse;


   function getMyType (This : access T_GPS) return Integer is
   begin
      return 3;
   end getMyType;

end GPS;
