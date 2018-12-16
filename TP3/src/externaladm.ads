with ObjetAncetre; use ObjetAncetre;
with Interface_ObserverPressure; use Interface_ObserverPressure;



package ExternalADM is
  
   type T_ExternalADM is new T_ObjetAncetre with private;
   type T_ExternalADM_Access is access all T_ExternalADM;
   
   procedure registerObserver (This: in out T_ExternalADM; Observer : in not null T_Interface_ObserverPressure_Access);
   procedure NotifyAllObservers (This: in out T_ExternalADM);
   procedure simuleMeasure(This: in out T_ExternalADM;
                           valeurMesure : in Integer;
                           idDevice : in Integer;
                           measureStatus : in Boolean;
                           isStaticMeasure : in Boolean);


private

   
   type T_ExternalADM is new T_ObjetAncetre with record
      observerCollection: T_Interface_ObserverPressure_Access;
      currentMeasureValue: Integer;
      currentMeasureStatus: Boolean;
      isStaticMeasure: Boolean;
      deviceId: Integer;
   end record;
   
end ExternalADM;
