with Mesure; use Mesure;
with Interface_Device; use Interface_Device;

package IRS is

   type T_IRS is new T_Interface_Device with private;
   type T_IRS_Access is access all T_IRS; 

   package Constructor is
     function Initialize return T_IRS;
   end Constructor;
  

   function simuleVitesse (This : access T_IRS) return T_Mesure_Access;
--       with pre => mesure.getSpeed >= 0.0 and
--       mesure.getSpeed <= 900.0 and
--       mesure.getState = UNDEFINED;   

   function getMyType (This : access T_IRS) return Integer;

private

   type T_IRS is new T_Interface_Device with record 
      currentMesure : T_Mesure_Access; 
   end record;
end IRS;
