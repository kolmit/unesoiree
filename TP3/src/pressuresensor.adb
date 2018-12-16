pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;

package body PressureSensor is




   procedure registerObserver
     (This: in out T_PressureSensor;
      Observer : in not null T_Interface_ObserverPressure_Access) is
   begin
      -- On ajoute Observer à la "liste" des observateurs de PressureSensor.
      This.observerCollection := Observer;
   end registerObserver;



   procedure NotifyAllObservers (This: in out T_PressureSensor) is
   begin

      if (This.observerCollection /= null) then
         This.observerCollection.notifyChange(idDevice      => This.deviceId,
                                              measureValue  => This.currentMeasureValue,
                                              measureStatus => This.currentMeasureStatus,
                                              isStaticMeasure => This.isStaticMeasure);
      end if;

   end NotifyAllObservers;



   procedure simuleMeasure(This: in out T_PressureSensor;
                           valeurMesure : in Integer;
                           idDevice : in Integer;
                           measureStatus : in Boolean;
                           isStaticMeasure : in Boolean) is
   begin
      This.currentMeasureValue := valeurMesure;
      This.currentMeasureStatus := measureStatus;
      This.isStaticMeasure := isStaticMeasure;
      This.deviceId := idDevice;

      Put_Line(ASCII.LF & ASCII.LF & "Sensor: Nouvelle mesure :" & Integer'Image(This.currentMeasureValue) & " Pa");
      This.NotifyAllObservers;
   end simuleMeasure;




end PressureSensor;
