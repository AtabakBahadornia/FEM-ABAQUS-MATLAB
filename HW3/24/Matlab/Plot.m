function Draw=Plot(num_element,connections,newxy,xy)
for i=1:num_element
    xold=[xy(connections(i,2),2) xy(connections(i,3),2)];
    yold=[xy(connections(i,2),3) xy(connections(i,3),3)];
    plot(xold,yold,'k')
    hold on;
syms a b c d
eqn1 = a*newxy(i,1)^3 + b*newxy(i,1)^2 + c*newxy(i,1) + d == newxy(i,2);
eqn2 = a*newxy(i+1,1)^3 + b*newxy(i+1,1)^2 + c*newxy(i+1,1) + d == newxy(i+1,2);
eqn3 = 3*a*newxy(i,1)^2 + 2*b*newxy(i,1) + c == newxy(i,3);
eqn4 = 3*a*newxy(i+1,1)^2 + 2*b*newxy(i+1,1) + c ==newxy(i+1,3);
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4], [a, b, c, d]);
X = linsolve(A,B);
X=double(X);
x=[newxy(connections(i,2),1):0.1:newxy(connections(i,3),1)];
y=X(1)*x.^3+X(2)*x.^2+X(3)*x+X(4);
plot(x,y,'b','linewidth',2);
ylim([-1 1]);
end
end

