with GNAT.IO; use GNAT.IO;
with Filter_Boeing; use Filter_Boeing;
with Filter_Dassault; use Filter_Dassault;
with Filter_Airbus; use Filter_Airbus;

package body PressureCalculator is

   package body Constructor is
     function Initialize(filter_staticPressure, filter_totalPressure : in T_Interface_StrategieFilter_Access) return T_PressureCalculator is
         This: T_PressureCalculator;
         i : Integer := 0;
      begin
         -- On initialise les variables
         for tmpValue : Integer of This.mesureStaticCollection loop
            This.mesureStaticCollection(i) := 0;
            i := i+1;
         end loop;
         i := 0;
         for tmpValue : Integer of This.mesureTotalCollection loop
            This.mesureTotalCollection(i) := 0;
            i := i+1;
         end loop;
         This.filter_staticPressure := filter_staticPressure;
         This.filter_totalPressure := filter_totalPressure;
         This.averageTotalPressure := 0.0;
         This.averageStaticPressure := 0.0;
         return This;
      end Initialize;
   end Constructor;


   not overriding function New_And_Initialize (Le_Adm_Externe : in not null T_ExternalADM_Access;
                                               filter_total : in T_Interface_StrategieFilter_Access;
                                               filter_static : in T_Interface_StrategieFilter_Access) return T_PressureCalculator_Access
   is
   begin
--        if (filter_total in T_Filter_Airbus'Class) then
--           T_Filter_Airbus'(Filter_Airbus.Constructor.Initialize(a => 0.1));
--        elsif (filter_static in T_Filter_Airbus) then
--           Filter_Airbus.Constructor.Initialize(a => 0.01);
--        end if;

      return PressureCalculator: constant T_PressureCalculator_Access := new T_PressureCalculator'(Constructor.Initialize(filter_staticPressure => filter_static,
                                                                                                                          filter_totalPressure  => filter_total)) do
         registerObserver (Le_Adm_Externe.all, Observer => T_Interface_ObserverPressure_Access(PressureCalculator)); -- CAST DE PressureCalculator VERS L'INTERFACE
      end return;
   end New_And_Initialize;



   overriding procedure notifyChange (This: access T_PressureCalculator;
                                      idDevice : in Integer;
                                      measureValue : in Integer;
                                      measureStatus : in Boolean;
                                      isStaticMeasure : in Boolean) is
      p0 : Integer := 101315;
   begin

      -- Le tableau "mesureStaticCollection" stocke les valeurs dont le status est OK.
      -- ex: pour le device dont l'ID est 1, la valeur sera stockée à l'index 1 du tableau: mesureStaticCollection(1)
      -- Note : Un tableau associatif serait plus adapté.
         if measureStatus then
            if measureValue > 0 and measureValue < p0 then

               --------------
               -- STATIQUE --
               --------------
              This.mesureStaticCollection(idDevice) := measureValue;
               Put_Line("   PressureCalculator: Mesure du device " & Integer'Image(idDevice) & " :" & Integer'Image(This.mesureStaticCollection(idDevice)) & " Pa ---> OK" );
               Put_Line("   PressureCalculator: Calcul d'une nouvelle moyenne STATIQUE ...");

               -- On calcule la pression statique moyenne :
               This.averageStaticPressure := This.calculAverageStaticPressure;

               -- On filtre la pression reçue en utilisant la méthode de l'interface_strategiefilter
               This.filteredStaticPressure := This.filter_staticPressure.filterPressure(pressure => Float(measureValue));

               Put_Line("   PressureCalculator: Pression STATIQUE moyenne actuelle : " & Float'Image(This.averageStaticPressure) & "Pa");
               Put_Line("   PressureCalculator: Pression STATIQUE filtree actuelle : " & Float'Image(This.filteredStaticPressure) & "Pa");
               This.observerCollectionADM.notifyChangeADM(averageStaticPressure => This.averageStaticPressure,
                                                          averageTotalPressure => This.averageTotalPressure,
                                                          isStaticMeasure => True); -- On notifie l'ADM de la nouvelle pression moyenne)

               -----------
               -- TOTAL --
               -----------
               This.mesureTotalCollection(idDevice) := measureValue;
               Put_Line("   PressureCalculator: Mesure du device " & Integer'Image(idDevice) & " :" & Integer'Image(This.mesureTotalCollection(idDevice)) & " Pa ---> OK" );
               Put_Line("   PressureCalculator: Calcul d'une nouvelle moyenne TOTALE ...");

               -- On calcule la pression totale moyenne :
               This.averageTotalPressure := This.calculAverageTotalPressure;

               -- On filtre la pression reçue en utilisant la méthode de l'interface_strategiefilter
               This.filteredTotalPressure := This.filter_totalPressure.filterPressure(pressure => Float(measureValue));

               Put_Line("   PressureCalculator: Pression TOTALE moyenne actuelle : " & Float'Image(This.averageTotalPressure) & "Pa");
               Put_Line("   PressureCalculator: Pression TOTALE filtree actuelle : " & Float'Image(This.filteredTotalPressure) & "Pa");
               This.observerCollectionADM.notifyChangeADM(averageStaticPressure => This.averageStaticPressure,
                                                          averageTotalPressure => This.averageTotalPressure,
                                                          isStaticMeasure => False); -- On notifie l'ADM de la nouvelle pression moyenne)
            else
               Put_Line("   PressureCalculator: Mesure KO.");
               Put_Line("   PressureCalculator: Pression STATIQUE moyenne inchangee.");
         end if;
      end if;
   end notifyChange;



   -- TP3 - Exigence 1 : Moyenner la pression statique
   not overriding function calculAverageStaticPressure (This : access T_PressureCalculator) return Float is
      index: Integer := 0;
      okValueCounter : Integer := 0;
      totalStaticPressure : Integer := 0;

      tmpAverageStaticPressure : Float := 0.0;
   begin

      for tmpValue : Integer of This.mesureStaticCollection loop
         if (tmpValue /= 0) then
            okValueCounter := okValueCounter + 1;
            totalStaticPressure := totalStaticPressure + tmpValue;
            Put_Line("   [" & Integer'Image(index) & " ] = " & Integer'Image(tmpValue));
         end if;
         index := index + 1;

      end loop;

      if (okValueCounter > 0) then
         tmpAverageStaticPressure := Float(totalStaticPressure/okValueCounter);
      end if;

        return tmpAverageStaticPressure;
   end calculAverageStaticPressure;


   -- TP3 - Exigence 1 : Moyenner la pression totale
   not overriding function calculAverageTotalPressure (This : access T_PressureCalculator) return Float is
      index: Integer := 0;
      okValueCounter : Integer := 0;
      totalTotalPressure : Integer := 0;

      tmpAverageTotalPressure : Float := 0.0;
   begin

      for tmpValue : Integer of This.mesureTotalCollection loop
         if (tmpValue /= 0) then
            okValueCounter := okValueCounter + 1;
            totalTotalPressure := totalTotalPressure + tmpValue;
            Put_Line("   [" & Integer'Image(index) & " ] = " & Integer'Image(tmpValue));
         end if;
         index := index + 1;

      end loop;

      if (okValueCounter > 0) then
         -- Calcul de la pression moyenne avant de l'envoyer au filtre.
         tmpAverageTotalPressure := Float(totalTotalPressure/okValueCounter);
      end if;

      return tmpAverageTotalPressure;
   end calculAverageTotalPressure;

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
         null;
         --This.observerCollectionADM.notifyChangeADM(averageStaticPressure => This.getAverageStaticPressure,
         --                                           averageTotalPressure => This.getAverageTotalPressure);
      end if;
   end NotifyAllObserversADM;


   function getAverageStaticPressure(This: in out T_PressureCalculator) return Float is
   begin
      return This.averageStaticPressure;
   end getAverageStaticPressure;


      function getAverageTotalPressure(This: in out T_PressureCalculator) return Float is
   begin
      return This.averageTotalPressure;
   end getAverageTotalPressure;
   -- </Pour l'ADM en listen>
   -- </Pour l'ADM en listen>


   overriding function filterPressure(This : access T_PressureCalculator; pressure : in Float) return Float
   is
   begin
      return 0.0;
   end filterPressure;


end PressureCalculator;
