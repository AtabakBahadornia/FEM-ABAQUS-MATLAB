clear all;  clc;
w=4000;
Dim=2;   num_nodes=3;    num_element=2;
xy=xlsread('Beam.xlsx','A:C');
connections=xlsread('Beam.xlsx','D:F');
I=xlsread('Beam.xlsx','G:G');
Elasticity=xlsread('Beam.xlsx','H:H');
DOF=Dim*num_nodes;
Force(1:DOF,1)=0;
Force(4)=-w*4^2/12; Force(5)=-w*4/2; Force(6)=w*4^2/12;
BC(1:DOF,1)=1;
BC(1:3)=0;
k=zeros(DOF);
[Length,Slope]=Length_Slope(xy,num_element,connections);
k=Global_Stiffness(num_element,DOF,Slope,Length,I,Elasticity,connections);
[newxy,Force]=Prim_solve(DOF,num_nodes,xy,k,BC,Force)
Plot(num_element,connections,newxy,xy)
title(['\fontsize{16}Problem #21'])
