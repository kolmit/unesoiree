package Interface_ObserverPressure is

  type T_Interface_ObserverPressure is interface;
  type T_Interface_ObserverPressure_Access is access all T_Interface_ObserverPressure'Class ;


   -- la m�thode qui va �tre impl�ment�e par le PressureCalculator 
   procedure notifyChange (This : access T_Interface_ObserverPressure; 
                           idDevice : in Integer; 
                           measureValue : in Integer; 
                           measureStatus : in Boolean) is abstract; 




end Interface_ObserverPressure;
