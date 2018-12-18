with PressureCalculator;  use PressureCalculator;
with Interface_ObserverCalculator; use Interface_ObserverCalculator;
with Ada.Text_IO; use Ada.Text_IO;
with Interface_StrategieFilter; use Interface_StrategieFilter;
with Interface_StrategieVitesse; use Interface_StrategieVitesse;


package ADM is

   type T_ADM is new T_Interface_ObserverCalculator and T_Interface_StrategieVitesse with private;
   type T_ADM_Access is access all T_ADM'Class;

   package Constructor is
     function Initialize (strategyChosen : T_Interface_StrategieVitesse_Access) return T_ADM;
   end Constructor;
  
  
  
   
   not overriding function New_And_InitializeADM (Le_Calculator : in not null T_PressureCalculator_Access;
                                                  strategyChosen : in T_Interface_StrategieVitesse_Access) return T_ADM_Access;
   overriding procedure notifyChangeADM(This: access T_ADM;
                                        averageStaticPressure : in Float;
                                        averageTotalPressure : in Float;
                                        isStaticChange : in boolean);
   overriding function calculVitesse(This : access T_ADM; totalPessure, staticPressure : in Float) return Float;
   
   
private

   type T_ADM is new T_Interface_ObserverCalculator and T_Interface_StrategieVitesse with record
      currentAltitude, currentSpeed : Float; 
      
      averageStaticPressureFromCalculator, averageTotalPressureFromCalculator : Float;
      speedStrategy : T_Interface_StrategieVitesse_Access;
   end record;

   -- TP2 Exigence 5 : L'altitude est OK si elle est >= 0 
   not overriding function calculAltitude (This : access T_ADM; isStaticChange : in Boolean) return Float
     with post => calculAltitude'Result >= 0.0; 
   
   

end ADM;
