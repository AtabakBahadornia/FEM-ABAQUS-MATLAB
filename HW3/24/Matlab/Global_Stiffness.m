function [kbar]=Global_Stiffness(num_element,DOF,Slope,Length,I,Elasticity,connections)
    ktemp=zeros(DOF);
    k=zeros(DOF);
    
         for i=1:num_element
             Local_k=[12 6*Length(i,2) -12 6*Length(i,2) ;6*Length(i,2) 4*Length(i,2)^2 -6*Length(i,2) 2*Length(i,2)^2 ;
                     -12 -6*Length(i,2) 12 -6*Length(i,2) ;6*Length(i,2) 2*Length(i,2)^2 -6*Length(i,2) 4*Length(i,2)^2];
            Global_k(:,:,i)=I(i,1)*Elasticity(i,1)/Length(i,2)^3*Local_k;
             k(2*connections(i,2)-1:2*connections(i,2),2*connections(i,2)-1:2*connections(i,2))=Global_k(1:2,1:2,i);
             k(2*connections(i,2)-1:2*connections(i,2),2*connections(i,3)-1:2*connections(i,3))=Global_k(1:2,3:4,i);
             k(2*connections(i,3)-1:2*connections(i,3),2*connections(i,2)-1:2*connections(i,2))=Global_k(3:4,1:2,i);
             k(2*connections(i,3)-1:2*connections(i,3),2*connections(i,3)-1:2*connections(i,3))=Global_k(3:4,3:4,i);
             ktemp=ktemp+k;
             k=zeros(DOF);
         end
         kbar=ktemp;
end