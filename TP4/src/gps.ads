with Mesure; use Mesure;
with Interface_Device; use Interface_Device;

package GPS is

   type T_GPS is new T_Interface_Device with private;
   type T_GPS_Access is access all T_GPS;

   package Constructor is
     function Initialize return T_GPS;
   end Constructor;
  

   function simuleVitesse (This : access T_GPS) return T_Mesure_Access;   
--       with post => mesure.getSpeed >= 0.0 and 
--       mesure.getSpeed <= 1000.0 and
--       mesure.getState = UNDEFINED;
   function getMyType (This : access T_GPS) return Integer;

private

   type T_GPS is new T_Interface_Device with record 
      currentMesure : T_Mesure_Access; 
   end record;
end GPS;
