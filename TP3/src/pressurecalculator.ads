with Interface_ObserverPressure; use Interface_ObserverPressure;
with Interface_ObserverCalculator; use Interface_ObserverCalculator;
with ExternalADM; use ExternalADM;
with ObjetAncetre; use ObjetAncetre;

package PressureCalculator is

  type T_PressureCalculator is new T_ObjetAncetre and T_Interface_ObserverPressure with private;
  type T_PressureCalculator_Access is access all T_PressureCalculator;

   
  not overriding function New_And_Initialize (Le_Adm_Externe : in not null T_ExternalADM_Access) return T_PressureCalculator_Access;
  overriding procedure notifyChange (This: access T_PressureCalculator;
                                     idDevice : in Integer; 
                                     measureValue : in Integer; 
                                     measureStatus : in Boolean);
   -- <Pour l'ADM en listen>
   procedure registerObserverADM (This: in out T_PressureCalculator; Observer : in not null T_Interface_ObserverCalculator_Access);
   procedure NotifyAllObserversADM (This: in out T_PressureCalculator);
   -- </Pour l'ADM en listen>

   
private
   function calculAveragePressure (This : access T_PressureCalculator) return Float;
  
   type T_Sources_Array is array (0..10) of Integer; 
   type T_PressureCalculator is new T_ObjetAncetre and T_Interface_ObserverPressure with record
      mesureCollection : T_Sources_Array; -- tableau pour stocker les valeurs des capteurs
      averagePressure : Float;
      observerCollectionADM : T_Interface_ObserverCalculator_Access;
   end record;

   function getAveragePressure(This: in out T_PressureCalculator) return Float;


end PressureCalculator;
