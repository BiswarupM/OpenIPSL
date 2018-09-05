within FOSSEE1.Examples.Loads.PSAT;
model Loadtest1 "TODO Document what this model is about"
  import FOSSEE1;
  extends LoadTestBase(order3_Inputs_Outputs1(
      Q_0=0.0570163388727956*0.2,
      Sn=20,
      Vn=400,
      ra=0.001*0.2,
      x1d=0.302*0.2,
      M=10,
      D=0,
      xd=1.9*0.2,
      T1d0=8,
      xq=1.7*0.2,
      V_0=0.99744659,
      P_0=0.0800989878477798*0.2));
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant Tref(k=70)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Sources.Constant T_a(k=10)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  FOSSEE1.Loads.PSAT.Thermostat_Load thermostat_Load(
    Sn=10,
    P_0=0.8,
    Q_0=0.6,
    Ti=12,
    Kl=1)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
equation
  connect(T_a.y, thermostat_Load.t_a) annotation (Line(points={{41,-70},{46,-70},
          {50,-70},{50,-56},{58,-56}}, color={0,0,127}));
  connect(Tref.y, thermostat_Load.t_ref) annotation (Line(points={{41,-30},{50,
          -30},{50,-44},{58,-44}}, color={0,0,127}));
  connect(thermostat_Load.p, pwLine3.n) annotation (Line(points={{70,-40},{70,0},
          {62,0},{62,-10},{59,-10}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=150,
      Tolerance=0.1,
      __Dymola_fixedstepsize=0.02,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end Loadtest1;
