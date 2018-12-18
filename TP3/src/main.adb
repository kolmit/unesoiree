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

   begin
   -- Le PressureCalculator s'enregistre auprès des 2 capteurs internes :
   registerObserver(This     => Un_Sensor.all,
                    Observer => T_Interface_ObserverPressure_Access(Un_Pressure_Calculator));

   registerObserver(This     => Un_Autre_Sensor.all,
                    Observer => T_Interface_ObserverPressure_Access(Un_Pressure_Calculator));



   -- Test 1
   -- TP2 Exigence 4 : Si toutes les mesures KO, L'altitude n'est pas calculée.
   Un_External_ADM.simuleMeasure(valeurMesure  => 100044,
                                 idDevice      => 2,
                                 measureStatus => False,
                                 isStaticMeasure => True);

   -- Test 1
   -- TP2 Exigence 4 : Si toutes les mesures KO, L'altitude n'est pas calculée.
   Un_External_ADM.simuleMeasure(valeurMesure  => 100045,
                                 idDevice      => 1,
                                 measureStatus => False,
                                 isStaticMeasure => True);

   -- Test 2
   -- TP2 Exigence 1 : Une mesure produit un nouveau calcul d'altitude.
   Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                 idDevice      => 1,
                                 measureStatus => True,
                                 isStaticMeasure => True);
   -- Test 3.1
   -- TP2 Exigence 2 : Faux car p > p0
   Un_External_ADM.simuleMeasure(valeurMesure  => 101316,
                                 idDevice      => 2,
                                 measureStatus => True,
                                 isStaticMeasure => True);
   -- Test 3.2
   -- TP2 Exigence 2 : Faux car p < 0
   Un_External_ADM.simuleMeasure(valeurMesure  => -100,
                                 idDevice      => 3 ,
                                 measureStatus => True,
                                 isStaticMeasure => True);

   -- Test 3.3
   -- TP2 Exigence 2 : Faux car le status de la mesure est à False = KO.
   Un_External_ADM.simuleMeasure(valeurMesure  => 100000,
                                 idDevice      => 5,
                                 measureStatus => False,
                                 isStaticMeasure => False);


   Un_Sensor.simuleMeasure(valeurMesure  => 19000,
                           idDevice      => 7,
                           measureStatus => True,
                                 isStaticMeasure => True);

   Un_Autre_Sensor.simuleMeasure(valeurMesure  => 19000,
                           idDevice      => 8,
                                 measureStatus => True,
                                 isStaticMeasure => True);


end Main;
