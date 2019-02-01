with Mesure; use Mesure;
package Interface_Device is

   type T_Interface_Device is interface;
   type T_Interface_Device_Access is access all T_Interface_Device'Class;

   function simuleVitesse (This : access T_Interface_Device) return T_Mesure_Access is abstract;
   function getMyType (This : access T_Interface_Device) return Integer is abstract;
end Interface_Device;
