pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;

package body ExternalADM is


   procedure registerObserver
     (This: in out T_ExternalADM;
      Observer : in not null T_Interface_ObserverPressure_Access) is
   begin
      -- On ajoute Observer à la "liste" des observateurs d'ExternalADM.
      This.observerCollection := Observer;
   end registerObserver;



   procedure NotifyAllObservers (This: in out T_ExternalADM) is
   begin

      if (This.observerCollection /= null) then
         This.observerCollection.notifyChange(idDevice      => This.getDeviceId,
                                              measureValue  => This.getMeasureValue,
                                              measureStatus => This.getMeasureStatus);
      end if;

   end NotifyAllObservers;



   procedure simuleMeasure(This: in out T_ExternalADM;
                           valeurMesure : in Integer;
                           idDevice : in Integer;
                           measureStatus : in Boolean) is
   begin
      This.currentMeasureValue := valeurMesure;
      This.currentMeasureStatus := measureStatus;
      This.deviceId := idDevice;

      Put_Line("ExternalADM: Nouvelle mesure :" & Integer'Image(This.getMeasureValue) & " Pa");
      This.NotifyAllObservers;
   end simuleMeasure;


   function getMeasureValue(This: in out T_ExternalADM) return Integer is
   begin
      return This.currentMeasureValue;
   end getMeasureValue;


   function getDeviceId(This: in out T_ExternalADM) return Integer is
   begin
      return This.deviceId;
   end getDeviceId;


   function getMeasureStatus(This: in out T_ExternalADM) return Boolean is
   begin
      return This.currentMeasureStatus;
   end getMeasureStatus;


end ExternalADM;
