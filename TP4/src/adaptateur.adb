with Mesure; use Mesure;
with Ada.Text_IO; use Ada.Text_IO;
package body Adaptateur is


   not overriding function getSpeedFromDevice(This : in not null T_Adaptateur_Access; device : in T_Interface_Device_Access) return Float is
      returnSpeed : Float := -1.0;
      res : T_Mesure_Access;
   begin
      This.isLastSpeedCorrect := False;
      res := device.simuleVitesse;

      case device.getMyType is
         when 1 =>
            if (res.getState = OK and res.getSpeed > 0.0 and res.getSpeed < 1300.0) then -- Exigence 4
               returnSpeed := res.getSpeed * 0.514; -- Conversion de la vitesse de l'ADM en m/s
               This.isLastSpeedCorrect := True;
            elsif (res.getState = FAIL or res.getState = UNDEFINED) then
               This.isLastSpeedCorrect := False;
            end if;

         when 2 =>
            if (res.getState = UNDEFINED and res.getSpeed > 0.0 and res.getSpeed < 900.0) then -- Exigence 5
                returnSpeed := res.getSpeed;

               if (res.getSpeed > 800.0) then -- Exigence 5
                  This.isLastSpeedCorrect := False;
               else
                  This.isLastSpeedCorrect := True;
               end if;
            end if;

         when 3 =>
             if (res.getState = UNDEFINED and res.getSpeed > 0.0 and res.getSpeed < 1000.0) then -- Exigence 6
               returnSpeed := res.getSpeed;

               if (res.getSpeed > 800.0) then -- Exigence 6
                  returnSpeed := 800.0;
               end if;

               This.isLastSpeedCorrect := True;
            end if;

         when others =>
            This.isLastSpeedCorrect := False;
      end case;

      return returnSpeed;

   end getSpeedFromDevice;


   not overriding function getIsLastSpeedCorrect(This : access T_Adaptateur) return Boolean is
   begin
      return This.isLastSpeedCorrect;
   end getIsLastSpeedCorrect;


   not overriding procedure setDeviceType(This : access T_Adaptateur; deviceType : in Integer) is
   begin
      This.currentDeviceType := deviceType;
   end setDeviceType;



end Adaptateur;
