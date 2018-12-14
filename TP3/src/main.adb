with Ada.Text_IO; use Ada.Text_IO;
with ExternalADM; use ExternalADM;
with PressureCalculator; use PressureCalculator;
with PressureSensor; use PressureSensor;
with Interface_ObserverPressure; use Interface_ObserverPressure;
with Interface_StrategieFilter; use Interface_StrategieFilter;
with Interface_StrategieVitesse; use Interface_StrategieVitesse;
with Filter_Airbus; use Filter_Airbus;
with Filter_Boeing; use Filter_Boeing;
with Filter_Dassault; use Filter_Dassault;
with Vitesse_EcoulementCompressible; use Vitesse_EcoulementCompressible;
with Vitesse_EcoulementIncompressible; use Vitesse_EcoulementIncompressible;
with ADM; use ADM;
with SpeedFormulaSelector; use SpeedFormulaSelector;

procedure Main is
   Un_External_ADM : constant T_ExternalADM_Access := new T_ExternalADM;
   Un_Sensor : constant T_PressureSensor_Access := new T_PressureSensor;
   Un_Autre_Sensor : constant T_PressureSensor_Access := new T_PressureSensor;

   -- L'observateur s'enregistre auprès de l'ADM externe :
   Un_Pressure_Calculator : constant T_PressureCalculator_Access := New_And_Initialize(Un_External_ADM,
                                                                                       new T_Filter_Dassault,
                                                                                       new T_Filter_Airbus'(Filter_Airbus.Constructor.Initialize(0.01)));

   Un_ADM : constant T_ADM_Access := New_And_InitializeADM(Un_Pressure_Calculator,
                                                           new T_SpeedFormulaSelector);
   nb : Integer := 10;

   begin
   -- L'observateur s'enregistre auprès des 2 capteurs internes :
   registerObserver(This     => Un_Sensor.all,
                    Observer => T_Interface_ObserverPressure_Access(Un_Pressure_Calculator));

   registerObserver(This     => Un_Autre_Sensor.all,
                    Observer => T_Interface_ObserverPressure_Access(Un_Pressure_Calculator));

   -- Jeu de test 0: Pression et Status aléatoire
   Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                 idDevice      => 1,
                                 measureStatus => True,
                                 isStaticMeasure => True);


   -- Faux car p > p0
   Un_External_ADM.simuleMeasure(valeurMesure  => 101316,
                                 idDevice      => 2,
                                 measureStatus => True,
                                 isStaticMeasure => True);

   Un_External_ADM.simuleMeasure(valeurMesure  => 101011,
                                 idDevice      => 3 ,
                                 measureStatus => True,
                                 isStaticMeasure => True);

   Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                 idDevice      => 5,
                                 measureStatus => True,
                                 isStaticMeasure => False);

   Un_Sensor.simuleMeasure(valeurMesure  => 19000,
                           idDevice      => 7,
                           measureStatus => True,
                                 isStaticMeasure => True);

   Un_Autre_Sensor.simuleMeasure(valeurMesure  => 19000,
                           idDevice      => 8,
                                 measureStatus => True,
                                 isStaticMeasure => True);
   delay 0.5;
--     if (1 = 0) then
--      --Jeu de Test 1: La pression ne doit pas varier
--      Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
--                                    idDevice      => 1,
--                                   measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
--                                    idDevice      => 2,
--                                    measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Sensor.simuleMeasure(valeurMesure  => 100000,
--                              idDevice      => 7,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Autre_Sensor.simuleMeasure(valeurMesure  => 100000,
--                              idDevice      => 8,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--
--      delay 0.5;
--
--
--      -- Jeu de Test 2: La pression doit augmenter
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
--                                    idDevice      => 1,
--                                   measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
--                                    idDevice      => 2,
--                                    measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Sensor.simuleMeasure(valeurMesure  => 101500,
--                              idDevice      => 7,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Autre_Sensor.simuleMeasure(valeurMesure  => 101600,
--                              idDevice      => 8,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--      delay 0.5;
--
--      -- Jeu de Test 3: Pression négative
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
--                                    idDevice      => 1,
--                                   measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
--                                    idDevice      => 2,
--                                    measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Sensor.simuleMeasure(valeurMesure  => -101500,
--                              idDevice      => 7,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Autre_Sensor.simuleMeasure(valeurMesure  => 101600,
--                              idDevice      => 8,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--
--      delay 0.5;
--
--
--      -- Jeu de Test 4: Un seul capteur
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
--                                    idDevice      => 1,
--                                    measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
--                                    idDevice      => 1,
--                                    measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101500,
--                                    idDevice      => 1,
--                                   measureStatus => True,
--                                   isStaticMeasure => True);
--
--         delay 0.5;
--
--      -- Jeu de Test 5: La pression doit augmenter, et seulement tenir comptes des mesures 1 et 4
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
--                                    idDevice      => 1,
--                                   measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
--                                    idDevice      => 2,
--                                    measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Sensor.simuleMeasure(valeurMesure  => 101500,
--                              idDevice      => 7,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Autre_Sensor.simuleMeasure(valeurMesure  => 101600,
--                              idDevice      => 8,
--                              measureStatus => True,
--                                   isStaticMeasure => True);
--
--      Un_Autre_Sensor.simuleMeasure(valeurMesure  => 100000000,
--                              idDevice      => 9,
--                              measureStatus => True,
--                                   isStaticMeasure => True);

      -- Un_Sensor.simuleMeasure(nb+500);
--  end if;

end Main;
