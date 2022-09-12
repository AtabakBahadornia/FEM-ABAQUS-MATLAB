clear all;  clc;
Dim=2;   num_nodes=5;    num_element=4;
xy=xlsread('Beam.xlsx','A:C');
connections=xlsread('Beam.xlsx','D:F');
I=xlsread('Beam.xlsx','G:G');
Elasticity=xlsread('Beam.xlsx','H:H');
DOF=Dim*num_nodes;
Force(1:DOF,1)=0;
Force(3)=-10000; Force(7)=-10000;
BC(1:DOF,1)=1;
BC(1)=0;BC(2)=0;BC(5)=0;BC(9)=0;BC(10)=0;
k=zeros(DOF);
[Length,Slope]=Length_Slope(xy,num_element,connections);
k=Global_Stiffness(num_element,DOF,Slope,Length,I,Elasticity,connections);
[newxy,Force]=Prim_solve(DOF,num_nodes,xy,k,BC,Force)
Plot(num_element,connections,newxy,xy)
title(['\fontsize{16}Problem #62       (x5000)'])
