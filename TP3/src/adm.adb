pragma Ada_2012;
with Ada.Numerics.Generic_Elementary_Functions;



package body ADM is

   package body Constructor is
     function Initialize (strategyChosen : T_Interface_StrategieVitesse_Access) return T_ADM is
         This: T_ADM;
      begin
         -- On initialise les variables
         This.currentAltitude := 0.0;
         This.currentSpeed := 0.0;
         This.speedStrategy := strategyChosen;

         This.averageStaticPressureFromCalculator := 0.0;
         This.averageTotalPressureFromCalculator := 0.0;
         return This;
      end Initialize;
   end Constructor;


   not overriding function New_And_InitializeADM
     (Le_Calculator : in not null T_PressureCalculator_Access;
      strategyChosen : in T_Interface_StrategieVitesse_Access) return T_ADM_Access
   is
   begin
      return ADM: constant T_ADM_Access := new T_ADM'(Constructor.Initialize(strategyChosen => strategyChosen)) do
         registerObserverADM (Le_Calculator.all, Observer => T_Interface_ObserverCalculator_Access(ADM));
      end return;
   end New_And_InitializeADM;



   overriding procedure notifyChangeADM(This: access T_ADM;
                                        averageStaticPressure : in Float;
                                        averageTotalPressure : in Float;
                                        isStaticChange : in boolean)
   is
   begin
      This.averageStaticPressureFromCalculator := averageStaticPressure;
      This.averageTotalPressureFromCalculator := averageTotalPressure;
      This.currentAltitude := This.calculAltitude(isStaticChange);
      Put_Line("      ADM : Altitude calculee ---> " & Integer'Image(Integer(This.currentAltitude)) & "m");
      This.currentSpeed := This.calculVitesse(This.averageTotalPressureFromCalculator,
                                              This.averageStaticPressureFromCalculator);
   end notifyChangeADM;



   not overriding function calculAltitude (This : access T_ADM; isStaticChange : in boolean) return Float is
      g : Float := 9.807;
      p0 : Float := 101315.0;
      R : Float := 8.314;
      T0 : Float := 288.0;
      M : Float := 0.02896;
      ln: Float := 0.0;

      tmpAverage: Float := 0.0;
      package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions (Float);

   begin
      if (isStaticChange = true) then
         tmpAverage := This.averageStaticPressureFromCalculator;
      else
         tmpAverage := This.averageTotalPressureFromCalculator;
      end if;


      -- ln(p0/p)
      ln := Float_Functions.Log(p0/tmpAverage, Ada.Numerics.e);

      This.currentAltitude := (R*T0)/(M*g)*ln;
      return This.currentAltitude;
   end calculAltitude;



   overriding function calculVitesse(This : access T_ADM; totalPessure, staticPressure : in Float) return Float
   is
   begin
       This.currentSpeed := This.speedStrategy.calculVitesse(totalPessure   => totalPessure,
                                                             staticPressure => staticPressure);

      Put_Line("      ADM : Vitesse calculee ---> " & Integer'Image(Integer(This.currentSpeed)) & " m/s" & ASCII.LF);

      return This.currentSpeed;
   end calculVitesse;


end ADM;
