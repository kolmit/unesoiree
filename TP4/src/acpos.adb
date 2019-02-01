pragma Ada_2012;
with Mesure; use Mesure;
with Pilote; use Pilote;
with Ada.Text_IO; use Ada.Text_IO;

package body ACPOS is

   package body Constructor is
      function Initialize(This : in not null T_ACPOS_Access; a : in T_Interface_Adaptateur_Access) return T_ACPOS_Access is
      begin
         This.adaptateur := a;

         return This;
      end Initialize;


   end Constructor;



   procedure InitializeDevices(This : access T_ACPOS; listDevices : in T_DeviceCollection) is
   begin
      This.deviceCollection := listDevices;

      for curDev of This.deviceCollection loop -- On compte les différents devices (usefull pour changePriority)
         This.deviceCounter(curDev.getMyType) := This.deviceCounter(curDev.getMyType) + 1;
      end loop;
   end InitializeDevices;


   procedure changePriority(This : access T_ACPOS; cmd : in T_Commande_Pilote) is
      tmpArray : T_DeviceCollection;
   begin
      case cmd is
         when IRS_FIRST =>
            New_Line;
            Put_Line("Test Exigence 2 : Commande IRS_FIRST recue");
            if This.deviceCollection(1).getMyType = 2 then
               return;
            end if;

            for i in 1..This.deviceCounter(1) loop
               tmpArray(i) := This.deviceCollection(i);
            end loop ;

            for j in 1..This.deviceCounter(2) loop
               This.deviceCollection(j) := This.deviceCollection(This.deviceCounter(1) + j);
            end loop;

            for k in 1..This.deviceCounter(1) loop
               This.deviceCollection(This.deviceCounter(2) + k) := tmpArray(k);
            end loop;

            Put_Line("Ordre de priorite des devices : ");
            for cur of This.deviceCollection loop
               case cur.getMyType is
                  when 1 => Put("ADM - ");
                  when 2 => Put("IRS - ");
                  when 3 => Put("GPS - ");
                  when others => null;
               end case;
            end loop;
            New_Line;


         when ADM_FIRST =>
            New_Line;
            Put_Line("Test Exigence 2 : Commande ADM_FIRST recue");
            if This.deviceCollection(1).getMyType = 1 then
               return;
            end if;

            for i in 1..This.deviceCounter(2) loop
               tmpArray(i) := This.deviceCollection(i);
            end loop ;

            for j in 1..This.deviceCounter(1) loop
               This.deviceCollection(j) := This.deviceCollection(This.deviceCounter(2) + j);
            end loop;

            for k in 1..This.deviceCounter(2) loop
               This.deviceCollection(This.deviceCounter(1) + k) := tmpArray(k);
            end loop;

            Put_Line("Ordre de priorite des devices : ");
            for cur of This.deviceCollection loop
               case cur.getMyType is
                  when 1 => Put("ADM - ");
                  when 2 => Put("IRS - ");
                  when 3 => Put("GPS - ");
                  when others => null;
               end case;
            end loop;
            New_Line;

      end case;
   end changePriority;


   function selectSpeedForPilot (This : access T_ACPOS) return Float is
      resFromAdapteur : Float;
   begin
      for curDevice of This.deviceCollection loop
         resFromAdapteur := Adaptateur.getSpeedFromDevice(This => T_Adaptateur_Access(This.adaptateur), device => T_Interface_Device_Access( curDevice ));

         if (T_Adaptateur_Access(This.adaptateur).getIsLastSpeedCorrect = True) then
            return resFromAdapteur;
         end if;

      end loop;

      return -1.0; -- Viole la post-condition, si aucun device ne retourne de vitesse correcte.
   end selectSpeedForPilot;




end ACPOS;
