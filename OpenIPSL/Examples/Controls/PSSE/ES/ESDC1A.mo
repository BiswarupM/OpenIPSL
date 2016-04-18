within OpenIPSL.Examples.Controls.PSSE.ES;
model ESDC1A "SMIB system with one load and GENROE model"
  import iPSL = OpenIPSL;
  extends iPSL.Examples.SMIBpartial;
  iPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2)
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-28,-46},{-38,-36}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-28,-60},{-38,-50}})));
  iPSL.Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_R=0.04,
    T_F1=1,
    E_1=2.47,
    S_EE_1=0.035,
    E_2=4.5,
    S_EE_2=0.47,
    K_A=75,
    T_A=0.05,
    T_B=1,
    T_C=1,
    V_RMIN=-3.9,
    K_E=0,
    T_E=0.5,
    K_F=0.07,
    V_RMAX=0)
    annotation (Placement(transformation(extent={{-60,-50},{-100,-36}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(eSDC1A.EFD, gENROE.EFD) annotation (Line(points={{-101.111,-43},{-106,-43},{-106,-10},{-99.6,-10}}, color={0,0,127}));
  connect(eSDC1A.EFD0, gENROE.EFD0) annotation (Line(points={{-75.5556,-48.95},{-75.5556,-58},{-48,-58},{-48,-14},{-58.4,-14}}, color={0,0,127}));
  connect(gENROE.ETERM, eSDC1A.ECOMP) annotation (Line(points={{-58.4,10},{-54,10},{-54,-38},{-58,-38},{-58,-37.925},{-61.1111,-37.925}}, color={0,0,127}));
  connect(eSDC1A.VOTHSG, const.y) annotation (Line(points={{-61.1111,-41.25},{-49.5556,-41.25},{-49.5556,-41},{-38.5,-41}}, color={0,0,127}));
  connect(eSDC1A.VOEL, const.y) annotation (Line(points={{-61.1111,-44.75},{-42,-44.75},{-42,-41},{-38.5,-41}}, color={0,0,127}));
  connect(eSDC1A.VUEL, const1.y) annotation (Line(points={{-61.1111,-48.25},{-54,-48.25},{-54,-55},{-38.5,-55}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-58,0},{-58,0},{-40,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end ESDC1A;
