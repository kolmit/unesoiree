pragma Ada_2012;
with GNAT.IO; use GNAT.IO;
package body SpeedFormulaSelector is

   -------------------
   -- calculVitesse --
   -------------------

   overriding function calculVitesse
     (This : access T_SpeedFormulaSelector;
      totalPressure, staticPressure : in Float)
      return Float
   is
      tmpSpeed : Float := 0.0;
   begin
      if (This.lastSpeed > 100.0) then
         This.strategySelected := This.formula_compressible;
      else
         This.strategySelected := This.formula_incompressible;
      end if;

      tmpSpeed := This.strategySelected.calculVitesse(totalPessure   => totalPressure,
                                                      staticPressure => staticPressure);

      if (tmpSpeed > 0.0) then
         This.lastSpeed := tmpSpeed;
      end if;

      return (This.lastSpeed);
   end calculVitesse;

end SpeedFormulaSelector;
