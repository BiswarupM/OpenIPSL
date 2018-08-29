within FOSSEE1.Controls;
package OEL
model OELM
outer OpenIPSL.Electrical.SystemBase SysData;
Modelica.Blocks.Interfaces.RealInput P annotation (
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Q annotation (
    Placement(visible = true, transformation(origin = {-100, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput V annotation (
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Math.Feedback feedback1 annotation (
    Placement(visible = true, transformation(origin = {10, 8.88178e-16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput v_ref0 annotation (
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Math.Feedback feedback2 annotation (
    Placement(visible = true, transformation(origin = {74, 56}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
   parameter Modelica.SIunits.Time T0=10;
  parameter Modelica.SIunits.PerUnit xd;
  parameter Modelica.SIunits.PerUnit xq;
  parameter Modelica.SIunits.PerUnit if_lim;
  parameter Modelica.SIunits.PerUnit vOEL_max;
  parameter OpenIPSL.Types.ApparentPowerMega Sn=SysData.S_b
 annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.VoltageKilo Vn=V_b
  annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.VoltageKilo V_b=400;
  FOSSEEsai.OEL.FIELDCURRENTESTIMATOR fieldcurrentestimator1(xd=1, xq=1)
      annotation (Placement(visible=true, transformation(
          origin={-47,-1},
          extent={{-19,-19},{19,19}},
          rotation=0)));
Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(
 k = 10 / T0, outMax = vOEL_max, outMin = 0,strict=true)
annotation (
    Placement(visible = true, transformation(origin = {54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const(k = if_lim)  annotation (
    Placement(visible = true, transformation(origin = {8, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
Modelica.Blocks.Interfaces.RealOutput v_ref annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
    connect(P, fieldcurrentestimator1.P) annotation (
      Line(points={{-100,60},{-74,60},{-74,10},{-66,10},{-66,10.4}},          color = {0, 0, 127}));
    connect(V, fieldcurrentestimator1.V) annotation (
      Line(points={{-100,-60},{-68,-60},{-68,-12.78},{-66,-12.78}},    color = {0, 0, 127}));
    connect(fieldcurrentestimator1.I_field, feedback1.u1) annotation (
      Line(points={{-26.48,-1},{-6,-1},{-6,0},{-2.8,0}},   color = {0, 0, 127}));
    connect(Q, fieldcurrentestimator1.Q) annotation (
      Line(points={{-100,2},{-68,2},{-68,-1},{-66,-1}},        color = {0, 0, 127}));
  connect(feedback2.y, v_ref) annotation (
    Line(points={{88.4,56},{92,56},{92,0},{110,0}},        color = {0, 0, 127}));
  connect(const.y, feedback1.u2) annotation (
    Line(points={{8,-39},{10,-39},{10,-12.8},{10,-12.8}},      color = {0, 0, 127}));
  connect(feedback1.y, limIntegrator1.u) annotation (
    Line(points={{24.4,0},{42,0}},    color = {0, 0, 127}));
  connect(limIntegrator1.y, feedback2.u2) annotation (
    Line(points={{65,0},{74,0},{74,43.2}},      color = {0, 0, 127}));
  connect(v_ref0, feedback2.u1) annotation (
    Line(points={{0,100},{0,56},{61.2,56}},      color = {0, 0, 127}));

end OELM;

model FCE "FIELDCURRENTESTIMATOR"
  Modelica.Blocks.Interfaces.RealInput P annotation (
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Q annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput V annotation (
    Placement(visible = true, transformation(origin = {-100, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput I_field annotation (
    Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 parameter Real xd;
  parameter Real xq;
  protected
  Real gamma_p;
  Real gamma_q;
equation
gamma_p = xq*P/V;
 gamma_q = xq*Q/V;
  I_field = sqrt((V + gamma_q)^2 + P^2) + ((xd/xq - 1)*(gamma_q*(V + gamma_q) +
    gamma_p^2)/sqrt((V + gamma_q)^2 + P^2));
end FCE;
end OEL;
