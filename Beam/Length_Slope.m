function [length,slope]=Length_Slope(xy,num_element,connections)
for i=1:num_element
length(i,1)=i;
slope(i,1)=i;
length(i,2)=sqrt((xy(connections(i,3),3)-xy(connections(i,2),3))^2+(xy(connections(i,3),2)-xy(connections(i,2),2))^2)*12;
slope(i,2)=atand((xy(connections(i,3),3)-xy(connections(i,2),3))/(xy(connections(i,3),2)-xy(connections(i,2),2)));
end