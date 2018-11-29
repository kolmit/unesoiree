with PressureCalculator;  use PressureCalculator;
with Interface_ObserverCalculator; use Interface_ObserverCalculator;
with Ada.Text_IO; use Ada.Text_IO;
with Interface_StrategieFilter; use Interface_StrategieFilter;


package ADM is

  type T_ADM is new T_Interface_ObserverCalculator with private;
  type T_ADM_Access is access all T_ADM;

   
  not overriding function New_And_InitializeADM (Le_Calculator : in not null T_PressureCalculator_Access) return T_ADM_Access;
  overriding procedure notifyChangeADM(This: access T_ADM; averagePressure : in Float);

private

   type T_ADM is new T_Interface_ObserverCalculator with record
      altitude : Float; 
      averagePressureFromCalculator : Float;
      staticPressure, totalPressure : T_Interface_StrategieFilter_Access;

   end record;

   
   not overriding function calculAltitude (This : access T_ADM) return Float
   with post => calculAltitude'Result >= 0.0; -- Exigence 5


end ADM;
