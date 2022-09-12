function Draw=Plot(num_element,connections,newxy,xy)
for i=1:num_element
    hold on
    xnew=[newxy(connections(i,2),1) newxy(connections(i,3),1)];
    ynew=[newxy(connections(i,2),2) newxy(connections(i,3),2)];
    xold=[xy(connections(i,2),2) xy(connections(i,3),2)];
    yold=[xy(connections(i,2),3) xy(connections(i,3),3)];
    plot(xnew,ynew,'b--')
    plot(xold,yold,'k')
end
end