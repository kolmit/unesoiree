
package Mesure is

   type T_Mesure is tagged private;
   type T_Mesure_Access is access all T_Mesure'Class; 
   type T_Status is (OK, FAIL, UNDEFINED);

   package Constructor is
      function Initialize (This : in not null T_Mesure_Access; value : in Float; status : in T_Status) return T_Mesure_Access;
   end Constructor;
   
   function getSpeed(This : access T_Mesure) return Float;
   function getState(This : access T_Mesure) return T_Status;
     
private
   type T_Mesure is tagged record 
      speed : Float; 
      status : T_Status; 
   end record;
end Mesure;
