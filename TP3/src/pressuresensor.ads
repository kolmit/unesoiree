with ObjetAncetre; use ObjetAncetre;
with Interface_ObserverPressure; use Interface_ObserverPressure;



package PressureSensor is
  
   type T_PressureSensor is new T_ObjetAncetre with private;
   type T_PressureSensor_Access is access all T_PressureSensor;
   
   procedure registerObserver (This: in out T_PressureSensor; Observer : in not null T_Interface_ObserverPressure_Access);
   procedure NotifyAllObservers (This: in out T_PressureSensor);
   procedure simuleMeasure(This: in out T_PressureSensor; valeurMesure : in Integer; idDevice : in Integer; measureStatus : in Boolean);

   
   function getMeasureValue(This: in out T_PressureSensor) return Integer;
   function getMeasureStatus(This: in out T_PressureSensor) return Boolean;
   function getDeviceId(This: in out T_PressureSensor) return Integer;


private
   
   type T_PressureSensor is new T_ObjetAncetre with record
      observerCollection: T_Interface_ObserverPressure_Access;
      currentMeasureValue: Integer;
      currentMeasureStatus: Boolean;
      deviceId: Integer;
  end record;
end PressureSensor;
