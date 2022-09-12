clear all;  clc;
Dim=2;   num_nodes=19;    num_element=35;
xy=xlsread('Truss.xlsx','A:C');
connections=xlsread('Truss.xlsx','D:F');
Area=xlsread('Truss.xlsx','G:G');
Elasticity=xlsread('Truss.xlsx','H:H');
DOF=Dim*num_nodes;
Force(1:DOF,1)=0;
Force(6)=-2000;Force(12)=-2000;Force(16)=-1000;Force(20)=-2000;Force(24)=-1000;Force(28)=-2000; Force(32)=-2000;
BC(1:DOF,1)=1;
BC(1)=0;BC(2)=0;BC(37)=0;BC(38)=0;
k=zeros(DOF);
[Length,Slope]=Length_Slope(xy,num_element,connections);
k=Global_Stiffness(num_element,DOF,Slope,Length,Area,Elasticity,connections);
[newxy,Force]=Prim_solve(DOF,num_nodes,xy,k,BC,Force)
Plot(num_element,connections,newxy,xy)
title(['\fontsize{16}Problem #74       (x100)'])
