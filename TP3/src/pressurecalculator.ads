with Interface_ObserverPressure; use Interface_ObserverPressure;
with Interface_ObserverCalculator; use Interface_ObserverCalculator;
with ExternalADM; use ExternalADM;
with ObjetAncetre; use ObjetAncetre;
with Interface_StrategieFilter; use Interface_StrategieFilter;


package PressureCalculator is
        
   type T_PressureCalculator is new T_Interface_StrategieFilter and T_Interface_ObserverPressure with private;
   type T_PressureCalculator_Access is access all T_PressureCalculator;
   
   package  Constructor is
     function Initialize(filter_staticPressure, filter_totalPressure : in T_Interface_StrategieFilter_Access) return T_PressureCalculator;
   end Constructor;
   
   not overriding function New_And_Initialize (Le_Adm_Externe : in not null T_ExternalADM_Access; 
                                               filter_total : in T_Interface_StrategieFilter_Access;
                                               filter_static : in T_Interface_StrategieFilter_Access) return T_PressureCalculator_Access;
  overriding procedure notifyChange (This: access T_PressureCalculator;
                                     idDevice : in Integer; 
                                     measureValue : in Integer; 
                                     measureStatus : in Boolean;
                                     isStaticMeasure : in Boolean);
   -- <Pour l'ADM en listen>
   procedure registerObserverADM (This: in out T_PressureCalculator; Observer : in not null T_Interface_ObserverCalculator_Access);
   procedure NotifyAllObserversADM (This: in out T_PressureCalculator);
   -- </Pour l'ADM en listen>
   function filterPressure(This : access T_PressureCalculator; pressure : in Float) return Float;

   
private
   function calculAverageTotalPressure (This : access T_PressureCalculator) return Float;
   function calculAverageStaticPressure (This : access T_PressureCalculator) return Float;

   type T_Sources_Array is array (0..10) of Integer; 
   type T_PressureCalculator is new T_Interface_StrategieFilter and T_Interface_ObserverPressure with record
      mesureStaticCollection : T_Sources_Array; -- tableau pour stocker les valeurs statiques/totales des capteurs
      mesureTotalCollection : T_Sources_Array;
      averageStaticPressure, averageTotalPressure : Float;
      filteredStaticPressure,filteredTotalPressure : Float;
      filter_staticPressure, filter_totalPressure : T_Interface_StrategieFilter_Access;
      
      observerCollectionADM : T_Interface_ObserverCalculator_Access;
   end record;



end PressureCalculator;
