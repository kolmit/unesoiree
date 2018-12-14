pragma Ada_2012;
with GNAT.IO; use GNAT.IO;
package body SpeedFormulaSelector is


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
         This.countT := This.countT + 1;
      else
         This.count := This.count + 1;
      end if;
         Put_Line("Compteur de vitesse nulle : " & Integer'Image(This.count) & " / " & Integer'Image(This.countT));

      return (This.lastSpeed);
   end calculVitesse;

end SpeedFormulaSelector;
