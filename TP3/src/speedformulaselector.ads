with Interface_StrategieVitesse; use Interface_StrategieVitesse;
with Vitesse_EcoulementCompressible; use Vitesse_EcoulementCompressible;
with Vitesse_EcoulementIncompressible; use Vitesse_EcoulementIncompressible;
with Interface_StrategieFilter; use Interface_StrategieFilter;
package SpeedFormulaSelector is

   type T_SpeedFormulaSelector is new T_Interface_StrategieVitesse with private;
   overriding function calculVitesse(This : access T_SpeedFormulaSelector; totalPressure, staticPressure : in Float) return Float
   with post => calculVitesse'Result >= 0.0;


   
private 
      type T_SpeedFormulaSelector is new T_Interface_StrategieVitesse with record
      lastSpeed : Float := 0.0;
      count : Integer := 0; --debug
      countT : Integer := 0; --debug
      formula_incompressible : T_Interface_StrategieVitesse_Access := new T_Vitesse_EcoulementIncompressible;
      formula_compressible : T_Interface_StrategieVitesse_Access := new T_Vitesse_EcoulementCompressible;
      strategySelected : T_Interface_StrategieVitesse_Access;
      
   end record;
end SpeedFormulaSelector;
