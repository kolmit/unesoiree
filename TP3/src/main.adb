with Ada.Text_IO; use Ada.Text_IO;
with ExternalADM; use ExternalADM;
with PressureCalculator; use PressureCalculator;
with PressureSensor; use PressureSensor;
with Interface_ObserverPressure; use Interface_ObserverPressure;
with ADM; use ADM;

procedure Main is
   Un_External_ADM : constant T_ExternalADM_Access := new T_ExternalADM;
   Un_Sensor : constant T_PressureSensor_Access := new T_PressureSensor;
   Un_Autre_Sensor : constant T_PressureSensor_Access := new T_PressureSensor;

   -- L'observateur s'enregistre auprès de l'ADM externe :
   Un_Pressure_Calculator : constant T_PressureCalculator_Access := New_And_Initialize(Un_External_ADM);
   Un_ADM : constant T_ADM_Access := New_And_InitializeADM(Un_Pressure_Calculator);
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
                                 measureStatus => False);


   if (1 = 0) then
   Un_External_ADM.simuleMeasure(valeurMesure  => 101316,
                                 idDevice      => 2,
                                 measureStatus => True);

   --Un_External_ADM.simuleMeasure(valeurMesure  => 101011,
   --                              idDevice      => 3,
   --                              measureStatus => True);

   Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                 idDevice      => 5,
                                 measureStatus => True);

   Un_Sensor.simuleMeasure(valeurMesure  => 19000,
                           idDevice      => 7,
                           measureStatus => True);

   Un_Autre_Sensor.simuleMeasure(valeurMesure  => 18000,
                           idDevice      => 8,
                                 measureStatus => False);
   delay 0.5;

    --Jeu de Test 1: La pression ne doit pas varier
    Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                  idDevice      => 1,
                                 measureStatus => True);

    Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                  idDevice      => 2,
                                  measureStatus => True);

    Un_Sensor.simuleMeasure(valeurMesure  => 100000,
                            idDevice      => 7,
                            measureStatus => True);

    Un_Autre_Sensor.simuleMeasure(valeurMesure  => 100000,
                            idDevice      => 8,
                            measureStatus => True);


    delay 0.5;


    -- Jeu de Test 2: La pression doit augmenter
    Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
                                  idDevice      => 1,
                                 measureStatus => True);

    Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
                                  idDevice      => 2,
                                  measureStatus => True);

    Un_Sensor.simuleMeasure(valeurMesure  => 101500,
                            idDevice      => 7,
                            measureStatus => True);

    Un_Autre_Sensor.simuleMeasure(valeurMesure  => 101600,
                            idDevice      => 8,
                            measureStatus => True);

    delay 0.5;

    -- Jeu de Test 3: Pression négative
    Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
                                  idDevice      => 1,
                                 measureStatus => True);

    Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
                                  idDevice      => 2,
                                  measureStatus => True);

    Un_Sensor.simuleMeasure(valeurMesure  => -101500,
                            idDevice      => 7,
                            measureStatus => True);

    Un_Autre_Sensor.simuleMeasure(valeurMesure  => 101600,
                            idDevice      => 8,
                            measureStatus => True);


    delay 0.5;


    -- Jeu de Test 4: Un seul capteur
    Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
                                  idDevice      => 1,
                                  measureStatus => True);

    Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
                                  idDevice      => 1,
                                  measureStatus => True);

    Un_External_ADM.simuleMeasure(valeurMesure  => 101500,
                                  idDevice      => 1,
                                 measureStatus => True);

       delay 0.5;

    -- Jeu de Test 5: La pression doit augmenter, et seulement tenir comptes des mesures 1 et 4
    Un_External_ADM.simuleMeasure(valeurMesure  => 101300,
                                  idDevice      => 1,
                                 measureStatus => True);

    Un_External_ADM.simuleMeasure(valeurMesure  => 101400,
                                  idDevice      => 2,
                                  measureStatus => True);

    Un_Sensor.simuleMeasure(valeurMesure  => 101500,
                            idDevice      => 7,
                            measureStatus => True);

    Un_Autre_Sensor.simuleMeasure(valeurMesure  => 101600,
                            idDevice      => 8,
                            measureStatus => True);

    Un_Autre_Sensor.simuleMeasure(valeurMesure  => 100000000,
                            idDevice      => 9,
                            measureStatus => True);

      -- Un_Sensor.simuleMeasure(nb+500);
      end if;

end Main;
