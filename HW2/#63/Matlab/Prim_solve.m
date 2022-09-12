function [newxy,F]=Prim_solve(DOF,num_nodes,xy,k,BC,Force)
displace(1:DOF,1)=0;
TMP(1:DOF,1)=0;
ktmp=k;
for i=DOF:-1:1
    if BC(i)==0
        k(i,:)=[]
        k(:,i)=[]
        Force(i)=[];
    end
end
displaceTMP=inv(k)*Force;
tempmemory=1;
for j=1:DOF
    if BC(j)==1
    displace(j,1)=displaceTMP(tempmemory);
    TMP(j,1)=displaceTMP(tempmemory)*1000;
    tempmemory=tempmemory+1
    end
end
Force=ktmp*displace;
for i=1:num_nodes
    F(i,1)=(Force(2*i-1)^2+Force(2*i)^2)^0.5;
    if F(i,1)<=0.001
        F(i,1)=0;
    end
end
f=reshape(TMP,[2,num_nodes])';
newxy=f+xy(1:num_nodes,2:3);
end