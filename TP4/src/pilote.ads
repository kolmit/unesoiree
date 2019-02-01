with ACPOS; use ACPOS;
with Commande; use Commande;

package Pilote is

   type T_Pilote is tagged private;
   type T_Pilote_Access is access all T_Pilote'Class; 
   
   package Constructor is
      function Initialize (This : in not null T_Pilote_Access; acpos1 : in T_ACPOS_Access; acpos2 : in T_ACPOS_Access) return T_Pilote_Access;
   end Constructor;
   
   function getSpeedFromACPOS (This : access T_Pilote; acposQueried : in T_ACPOS_Access) return Float; 
   procedure envoyerCommandeACPOS (This : access T_Pilote; acposToNotify : in T_ACPOS_Access; cmd : in T_Commande_Pilote);

   
private
   
   type T_Pilote is tagged record 
      ACPOS1, ACPOS2 : T_ACPOS_Access;
   end record;
   
end Pilote;
