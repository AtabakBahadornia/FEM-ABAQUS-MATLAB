clear all;  clc;
Dim=2;   num_nodes=9;    num_element=15;
xy=xlsread('Truss.xlsx','A:C');
connections=xlsread('Truss.xlsx','D:F');
Area=xlsread('Truss.xlsx','G:G');
Elasticity=xlsread('Truss.xlsx','H:H');
DOF=Dim*num_nodes;
Force(1:DOF,1)=0;
Force(6:4:14)=-1000; Force(18)=-500;
BC(1:DOF,1)=1;
BC(1)=0;BC(2)=0;BC(17)=0;
k=zeros(DOF);
[Length,Slope]=Length_Slope(xy,num_element,connections);
k=Global_Stiffness(num_element,DOF,Slope,Length,Area,Elasticity,connections);
[newxy,Force]=Prim_solve(DOF,num_nodes,xy,k,BC,Force)
Plot(num_element,connections,newxy,xy)
title(['\fontsize{16}Problem #62       (x5000)'])
