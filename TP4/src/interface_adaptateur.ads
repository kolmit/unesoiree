with Interface_Device; use Interface_Device;
package Interface_Adaptateur is
   
  type T_Interface_Adaptateur is interface;
  type T_Interface_Adaptateur_Access is access all T_Interface_Adaptateur'Class;

   function getSpeedFromDevice(This : in not null T_Interface_Adaptateur_Access; device : in T_Interface_Device_Access) return Float is abstract;

end Interface_Adaptateur;
