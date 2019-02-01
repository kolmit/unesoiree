with ADM; use ADM;
with IRS; use IRS;
with GPS; use GPS;
with ACPOS; use ACPOS;
with Pilote; use Pilote;
with Commande; use Commande;
with Ada.Text_IO; use Ada.Text_IO;
with Mesure; use Mesure;
with Interface_Device; use Interface_Device;
with Adaptateur; use Adaptateur;
with Interface_Adaptateur; use Interface_Adaptateur;
with TestValues; use TestValues;


procedure Main is
   ADM1 : T_Interface_Device_Access := new T_ADM;
   ADM2 : T_Interface_Device_Access := new T_ADM;
   ADM3 : T_Interface_Device_Access := new T_ADM;

   IRS1 : T_Interface_Device_Access := new T_IRS;
   IRS2 : T_Interface_Device_Access := new T_IRS;

   GPS1 : T_Interface_Device_Access := new T_GPS;
   GPS2 : T_Interface_Device_Access := new T_GPS;

   listDev : T_DeviceCollection;
   Adaptateur : T_Interface_Adaptateur_Access := new T_Adaptateur;


   ACPOS1 : T_ACPOS_Access := ACPOS.Constructor.Initialize(This => new T_ACPOS,
                                                           a => Adaptateur);
   ACPOS2 : T_ACPOS_Access := ACPOS.Constructor.Initialize(This => new T_ACPOS,
                                                           a => Adaptateur);
   resF : Float := 0.0;
   res : T_Mesure_Access := new T_Mesure;
   piloteAvion : T_Pilote_Access := Pilote.Constructor.Initialize(This => new T_Pilote,
                                                                  Acpos1 => ACPOS1,
                                                                  Acpos2 => ACPOS2);

begin

   listDev(1) := ADM1;
   listDev(2) := ADM2;
   listDev(3) := ADM3;

   listDev(4) := IRS1;
   listDev(5) := IRS2;

   listDev(6) := GPS2;
   listDev(7) := GPS1;
   ACPOS1.InitializeDevices(listDevices => listDev); -- Exigence 1

   listDev(1) := ADM3;
   listDev(2) := ADM2;
   listDev(3) := ADM1;

   listDev(4) := IRS2;
   listDev(5) := IRS1;

   listDev(6) := GPS1;
   listDev(7) := GPS2;
   ACPOS2.InitializeDevices(listDevices => listDev); -- Exigence 1

   piloteAvion.envoyerCommandeACPOS(acposToNotify => ACPOS1,
                                    cmd           => Commande.IRS_FIRST); -- Exigence 2
   piloteAvion.envoyerCommandeACPOS(acposToNotify => ACPOS1,
                                    cmd           => Commande.ADM_FIRST); -- Exigence 2

   -- Test 1 : cf TestValues.ads
   Put_Line(ASCII.LF &  "Test ALL : cf TestValues.ads (Resultat attendue : 2.05600E+02)");
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS2);

   ------------------------------------------------------------------
   ---------------------------- EXIGENCE 4 --------------------------
   ------------------------------------------------------------------
   Put_Line(ASCII.LF & "Test Exigence 4 ADM.1 : Valeur negative (incorrect) / Status OK (correct). (Resultat attendue : 5.00000E+02)");
   -- Test ADM.1 : Valeur < 0, Status OK.
   -- Les ADM donneront le relais aux équipements qui les suivent dans l'ordre de priorité (IRS par défaut)
   TestValues.valueADM := -100.0;
   TestValues.statusADM := OK;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 4 ADM.2 : Valeur positive (correct) / Status FAIL (correct, mais FAIL). (Resultat attendue : 5.00000E+02)");
   -- Test ADM.2 : Valeur > 0, Status FAIL.
   -- Les ADM donneront le relais aux équipements qui les suivent dans l'ordre de priorité (IRS par défaut)
   TestValues.valueADM := 100.0;
   TestValues.statusADM := FAIL;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 4 ADM.3 : Valeur > 1300 (incorrect) / Status OK (correct). (Resultat attendue : 5.00000E+02)");
   -- Test ADM.3 : Valeur > 1300, Status OK.
   -- Les ADM donneront le relais aux équipements qui les suivent dans l'ordre de priorité (IRS par défaut)
   TestValues.valueADM := 1400.0;
   TestValues.statusADM := OK;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);



   ------------------------------------------------------------------
   -- Après les tests de l'exigence 4, le statusADM reste à FAIL, ---
   ---- ce qui nous permet de tester les IRS pour l'exigence 5 ------
   ------------------------------------------------------------------
   ---------------------------- EXIGENCE 5 --------------------------
   ------------------------------------------------------------------
   Put_Line(ASCII.LF & "Test Exigence 5 IRS.1 : Valeur negative (incorrect) / Status UNDEFINED (correct). (Resultat attendue : 6.00000E+02)");
   -- Test IRS.1 : Valeur < 0, Status UNDEFINED.
   -- Les IRS donneront le relais aux équipements qui les suivent dans l'ordre de priorité (GPS par défaut)
   TestValues.valueIRS := -100.0;
   TestValues.statusIRS := UNDEFINED;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 5 IRS.2 : Valeur positive (correct) / Status OK (incorrect). (Resultat attendue : 6.00000E+02)");
   -- Test IRS.2 : Valeur > 0, Status OK.
   -- Les IRS donneront le relais aux équipements qui les suivent dans l'ordre de priorité (GPS par défaut)
   TestValues.valueIRS := 100.0;
   TestValues.statusIRS := OK;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 5 IRS.3 : Valeur > 900 (incorrect) / Status UNDEFINED (correct). (Resultat attendue : 6.00000E+02)");
   -- Test IRS.3 : Valeur > 900, Status UNDEFINED.
   -- Les IRS donneront le relais aux équipements qui les suivent dans l'ordre de priorité (GPS par défaut)
   TestValues.valueIRS := 901.0;
   TestValues.statusIRS := UNDEFINED;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 5 IRS.4 : Valeur > 800 (incorrect) / Status UNDEFINED (correct). (Resultat attendue : 6.00000E+02)");
   -- Test IRS.4 : Valeur > 800, Status UNDEFINED.
   -- Les IRS donneront le relais aux équipements qui les suivent dans l'ordre de priorité (GPS par défaut)
   TestValues.valueIRS := 850.0;
   TestValues.statusIRS := UNDEFINED;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);




   ------------------------------------------------------------------
   ------- Après les tests de l'exigence 5, les IRS renvoient -------
   ---- des vitesses ignorées (car > 800),ce qui nous permet de -----
   -------------- tester les GPS pour l'exigence 6 ------------------
   ------------------------------------------------------------------
   ---------------------------- EXIGENCE 6 --------------------------
   ------------------------------------------------------------------
   Put_Line(ASCII.LF & "Test Exigence 6 GPS.1 : Valeur negative (incorrect) / Status UNDEFINED (correct). (Resultat attendue : INVALIDE)");
   -- Test GPS.1 : Valeur < 0, Status UNDEFINED.
   TestValues.valueGPS := -100.0;
   TestValues.statusGPS := UNDEFINED;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 6 GPS.2 : Valeur > 1000 (incorrect) / Status UNDEFINED (correct). (Resultat attendue : INVALIDE)");
   -- Test GPS.2 : Valeur > 1000, Status UNDEFINED.
   TestValues.valueGPS := 1200.0;
   TestValues.statusGPS := UNDEFINED;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);

   Put_Line(ASCII.LF & "Test Exigence 6 GPS.3 : Valeur > 0 (correct) / Status OK (incorrect). (Resultat attendue : INVALIDE)");
   -- Test GPS.3 : Valeur > 0, Status OK.
   TestValues.valueGPS := 600.0;
   TestValues.statusGPS := OK;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);


   Put_Line(ASCII.LF & "Test Exigence 6 GPS.4 : Valeur > 800 (correct, mais sature a 800) / Status UNDEFINED (correct). (Resultat attendue : 8.00000E+02)");
   -- Test GPS.4 : Valeur > 800, Status UNDEFINED.
   TestValues.valueGPS := 900.0;
   TestValues.statusGPS := UNDEFINED;
   resF := piloteAvion.getSpeedFromACPOS(acposQueried => ACPOS1);
end Main;
