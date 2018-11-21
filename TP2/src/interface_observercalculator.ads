package Interface_ObserverCalculator is

   
  type T_Interface_ObserverCalculator is interface;
  type T_Interface_ObserverCalculator_Access is access all T_Interface_ObserverCalculator'Class;


   -- la méthode qui va être implémentée par l'ADM 
   procedure notifyChangeADM (This : access T_Interface_ObserverCalculator; 
                           averagePressure : in Float) is abstract; 




end Interface_ObserverCalculator;
