pragma Ada_2012;
with Ada.Numerics.Generic_Elementary_Functions;



package body ADM is


   not overriding function New_And_InitializeADM
     (Le_Calculator : in not null T_PressureCalculator_Access) return T_ADM_Access
   is begin
      return ADM: constant T_ADM_Access := new T_ADM do
         registerObserverADM (Le_Calculator.all, Observer => T_Interface_ObserverCalculator_Access(ADM));
      end return;
   end New_And_InitializeADM;



   overriding procedure notifyChangeADM(This: access T_ADM; averagePressure : in Float)
   is
   altitude : Float;
   begin
      Put_Line("      ADM : La pression moyenne a change !");
      This.averagePressureFromCalculator := averagePressure;
      altitude := This.calculAltitude;
      Put_Line("      ADM : Altitude calculee ---> " & Float'Image(This.altitude) & "m");
   end notifyChangeADM;



   not overriding function calculAltitude (This : access T_ADM) return Float is
      g : Float := 9.807;
      p0 : Float := 101315.0;
      R : Float := 8.314;
      T0 : Float := 288.0;
      M : Float := 0.02896;
      ln: Float := 0.0;
      package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions (Float);

   begin
      -- ln(p0/p)
      ln := Float_Functions.Log(p0/This.averagePressureFromCalculator, Ada.Numerics.e);

      This.altitude := (R*T0)/(M*g)*ln;
      return This.altitude;
   end calculAltitude;

end ADM;
