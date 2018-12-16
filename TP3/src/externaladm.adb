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
         This.observerCollection.notifyChange(idDevice      => This.deviceId,
                                              measureValue  => This.currentMeasureValue,
                                              measureStatus => This.currentMeasureStatus,
                                             isStaticMeasure => This.isStaticMeasure);
      end if;

   end NotifyAllObservers;



   procedure simuleMeasure(This: in out T_ExternalADM;
                           valeurMesure : in Integer;
                           idDevice : in Integer;
                           measureStatus : in Boolean;
                           isStaticMeasure : in Boolean) is
   begin
      This.currentMeasureValue := valeurMesure;
      This.currentMeasureStatus := measureStatus;
      This.isStaticMeasure := isStaticMeasure;
      This.deviceId := idDevice;

      Put_Line(ASCII.LF & ASCII.LF & "ExternalADM: Nouvelle mesure :" & Integer'Image(This.currentMeasureValue) & " Pa");
      This.NotifyAllObservers;
   end simuleMeasure;



end ExternalADM;
