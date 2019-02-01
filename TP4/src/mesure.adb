pragma Ada_2012;
package body Mesure is

   package body Constructor is

      function Initialize (This : in not null T_Mesure_Access; value : in Float; status : in T_Status) return T_Mesure_Access is
      begin
         This.speed := value;
         This.status := status;
         return This;
      end Initialize;

   end Constructor;

      function getSpeed(This : access T_Mesure) return Float is
      begin
         return This.speed;
      end getSpeed;

      function getState(This : access T_Mesure) return T_Status is
      begin
         return This.status;
      end getState;




end Mesure;
