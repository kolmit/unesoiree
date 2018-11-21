with GNAT.IO; use GNAT.IO;

package body PressureCalculator is


   not overriding function New_And_Initialize
     (Le_Adm_Externe : in not null T_ExternalADM_Access)
      return T_PressureCalculator_Access

   is begin
      return PressureCalculator: constant T_PressureCalculator_Access := new T_PressureCalculator do
         registerObserver (Le_Adm_Externe.all, Observer => T_Interface_ObserverPressure_Access(PressureCalculator));
      end return;
   end New_And_Initialize;



   overriding procedure notifyChange (This: access T_PressureCalculator;
                                      idDevice : in Integer;
                                      measureValue : in Integer;
                                      measureStatus : in Boolean) is
      p0 : Integer := 101315;
      begin

      -- Le tableau "mesureCollection" stocke les valeurs dont le status est OK.
      -- ex: pour le device dont l'ID est 1, la valeur sera stockée à l'index 1 du tableau: mesureCollection(1)
      -- Note : Un tableau associatif serait plus adapté.
      if measureStatus then
         if measureValue > 0 and measureValue < p0 then
            This.mesureCollection(idDevice) := measureValue;
            Put_Line("   PressureCalculator: Mesure du device " & Integer'Image(idDevice) & " :" & Integer'Image(This.mesureCollection(idDevice)) & " Pa ---> OK" );
         end if;

         Put_Line("   PressureCalculator: Calcul d'une nouvelle moyenne ...");
         This.averagePressure := This.calculAveragePressure;
         Put_Line("   Pression moyenne actuelle : " & Float'Image(This.averagePressure) & "Pa");


         This.observerCollectionADM.notifyChangeADM(averagePressure => This.averagePressure); -- On notifie l'ADM de la nouvelle pression moyenne)
      end if;
   end notifyChange;



   not overriding function calculAveragePressure (This : access T_PressureCalculator) return Float is
      index: Integer := 0;
      okValueCounter : Integer := 0;
      totalPressure : Integer := 0;
   begin

      for tmpValue : Integer of This.mesureCollection loop
         index := index + 1;

         if (tmpValue /= 0) then
            okValueCounter := okValueCounter + 1;
            totalPressure := totalPressure + tmpValue;
            Put_Line("   [" & Integer'Image(index) & " ] = " & Integer'Image(tmpValue));
         end if;
      end loop;

      if (okValueCounter > 0) then
        return Float(totalPressure/okValueCounter);
      end if;

      return 0.0;
   end calculAveragePressure;


   -- <Pour l'ADM en listen>
   -- <Pour l'ADM en listen>
   procedure registerObserverADM
     (This: in out T_PressureCalculator;
      Observer : in not null T_Interface_ObserverCalculator_Access) is
   begin
      -- On ajoute Observer à la "liste" des observateurs de PressureCalculator.
      This.observerCollectionADM := Observer;
   end registerObserverADM;


   procedure NotifyAllObserversADM (This: in out T_PressureCalculator) is
   begin
      if (This.observerCollectionADM /= null) then
         This.observerCollectionADM.notifyChangeADM(averagePressure => This.getAveragePressure);
      end if;
   end NotifyAllObserversADM;


   function getAveragePressure(This: in out T_PressureCalculator) return Float is
   begin
      return This.averagePressure;
   end getAveragePressure;
   -- </Pour l'ADM en listen>
   -- </Pour l'ADM en listen>


end PressureCalculator;
