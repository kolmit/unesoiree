pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
package body Pilote is



   package body Constructor is
      function Initialize (This : in not null T_Pilote_Access; acpos1 : in T_ACPOS_Access; acpos2 : in T_ACPOS_Access) return T_Pilote_Access
      is
      begin
         This.ACPOS1 := acpos1;
         This.ACPOS2 := acpos2;
         return This;
      end Initialize;

   end Constructor;


   procedure envoyerCommandeACPOS (This : access T_Pilote; acposToNotify : in T_ACPOS_Access; cmd : in T_Commande_Pilote)
   is
   begin
      acposToNotify.changePriority(cmd => cmd);
   end envoyerCommandeACPOS;


   function getSpeedFromACPOS (This : access T_Pilote; acposQueried : in T_ACPOS_Access) return Float is
      f: Float;
   begin
      f := acposQueried.selectSpeedForPilot;
      if (f > 0.0) then
         Put_Line("Vitesse recue de l'ACPOS : " & Float'Image(f));
      else
         Put_Line("Vitesse recue de l'ACPOS : INVALIDE");
      end if;

      return f;
   end getSpeedFromACPOS;


end Pilote;
