with Mesure; use Mesure;
with Interface_Device; use Interface_Device;

package ADM is

   type T_ADM is new T_Interface_Device with private;
   type T_ADM_Access is access all T_ADM; 

   package Constructor is
     function Initialize return T_ADM;
   end Constructor;



private
   function getMyType (This : access T_ADM) return Integer;
   function simuleVitesse (This : access T_ADM) return T_Mesure_Access;
   --with post => simuleVitesse'Result();
--       with pre => mesure.getSpeed >= 0.0 and 
--       mesure.getSpeed <= 1300.0 and
--       (mesure.getState = OK or mesure.getState = FAIL);
   
   type T_ADM is new T_Interface_Device with record 
      currentMesure : T_Mesure_Access; 
   end record;
end ADM;
