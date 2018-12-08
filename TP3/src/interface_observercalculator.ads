package Interface_ObserverCalculator is

   
  type T_Interface_ObserverCalculator is interface;
  type T_Interface_ObserverCalculator_Access is access all T_Interface_ObserverCalculator'Class;


   -- la m�thode qui va �tre impl�ment�e par l'ADM 
   procedure notifyChangeADM (This : access T_Interface_ObserverCalculator; 
                              averageStaticPressure : in Float;
                              averageTotalPressure : in Float;
                              isStaticMeasure : in Boolean) is abstract; 




end Interface_ObserverCalculator;
