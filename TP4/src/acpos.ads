with Interface_Adaptateur; use Interface_Adaptateur;
with Interface_Device; use Interface_Device;
with ADM; use ADM;
with Adaptateur; use Adaptateur;
with Commande; use Commande;
with IRS; use IRS;
with GPS; use GPS;

package ACPOS is
   type T_ACPOS is new T_Interface_Adaptateur with private;
   type T_ACPOS_Access is access all T_ACPOS'Class; 

   NB_DEV : constant Integer := 7;
   type T_DeviceCollection is array (1..NB_DEV) of T_Interface_Device_Access;

   
   package Constructor is
      function Initialize (This : in not null T_ACPOS_Access; a : in T_Interface_Adaptateur_Access) return T_ACPOS_Access;
   end Constructor;
   
   procedure InitializeDevices(This : access T_ACPOS; listDevices : in T_DeviceCollection);
   procedure changePriority(This : access T_ACPOS; cmd : in T_Commande_Pilote);

   -- Exigence 3 
   function selectSpeedForPilot (This : access T_ACPOS) return Float
     with post => selectSpeedForPilot'Result > 0.0 and selectSpeedForPilot'Result < 800.0; 

private

   
   type T_DeviceCounter is array(1..3) of Integer;

   type T_ACPOS is new T_Interface_Adaptateur with record 
      deviceCollection : T_DeviceCollection;
      deviceCounter : T_DeviceCounter;
      adaptateur : T_Interface_Adaptateur_Access;
   end record;

end ACPOS;
