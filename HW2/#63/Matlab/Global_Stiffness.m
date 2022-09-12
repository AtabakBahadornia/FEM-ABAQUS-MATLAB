function [kbar]=Global_Stiffness(num_element,DOF,Slope,Length,Area,Elasticity,connections)
    ktemp=zeros(DOF);
    k=zeros(DOF);
    Local_k=[1 0 -1 0 ;0 0 0 0 ;
             -1 0 1 0 ;0 0 0 0];
         for i=1:num_element
            theta=Slope(i,2);
            Transfer_Matrix=[cosd(theta) sind(theta) 0 0 ;-sind(theta) cosd(theta) 0 0;
                             0 0 cosd(theta) sind(theta) ;0 0 -sind(theta) cosd(theta)];
            Global_k(:,:,i)=Area(i,1)*Elasticity(i,1)/Length(i,2)*Transfer_Matrix'*Local_k*Transfer_Matrix;
             k(2*connections(i,2)-1:2*connections(i,2),2*connections(i,2)-1:2*connections(i,2))=Global_k(1:2,1:2,i);
             k(2*connections(i,2)-1:2*connections(i,2),2*connections(i,3)-1:2*connections(i,3))=Global_k(1:2,3:4,i);
             k(2*connections(i,3)-1:2*connections(i,3),2*connections(i,2)-1:2*connections(i,2))=Global_k(3:4,1:2,i);
             k(2*connections(i,3)-1:2*connections(i,3),2*connections(i,3)-1:2*connections(i,3))=Global_k(3:4,3:4,i);
             ktemp=ktemp+k;
             k=zeros(DOF);
         end
         kbar=ktemp;
end