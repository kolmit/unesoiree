with Interface_Adaptateur; use Interface_Adaptateur;
with Interface_Device; use Interface_Device;
package Adaptateur is

   type T_Adaptateur is new T_Interface_Adaptateur with private;
   type T_Adaptateur_Access is access all T_Adaptateur'Class;
   
   function getSpeedFromDevice(This : in not null T_Adaptateur_Access; device : in T_Interface_Device_Access) return Float
      with post => getSpeedFromDevice'Result > 0.0;
   not overriding procedure setDeviceType(This : access T_Adaptateur; deviceType : in Integer);
   not overriding function getIsLastSpeedCorrect(This : access T_Adaptateur) return Boolean;

private
   

   type T_Adaptateur is new T_Interface_Adaptateur with record
      currentDeviceType : Integer;
      isLastSpeedCorrect : Boolean;
   end record;
   
   
end Adaptateur;
