% que 1 
% it will display  all the equilibrium points. (b) the eigenvalues and corresponding
% eigenvectors. (c) plot the eigenvectors got from (b). (d) Plot the direction field of
% the corresponding difference equation. (e) and its
% stability.

% Enter the matrix in the form [1 2 ; 2 1]
clear;
close all;
A=input('enter element : ');

% do a part
X=[A(1,1)-1 A(1,2); A(2,1) A(2,2)-1];     % linear equation
B=[0 0]';                               %RHS is 0
eq=linsolve(X,B);                       % solve the linear equation to calculate equilibrium value
disp('Equilibrium values');
disp(eq);                               % equilibrium values
[V,E1]=eig(A);                          % calculate eigen value and vector

disp('Eigen Values');
disp(E1(1,1));
disp(E1(2,2));
disp('Eigen Vectors');
disp(V);

x = -10:0.25:10;                        % scaling

m1=(V(2,1)/V(1,1));                     % slope
m2=(V(2,2)/V(1,2));                     % slope

y1=m1*x;                        
y2=m2*x;

figure(1);
hold on;

if V(1,1)==0
    m1=(V(1,1)/V(2,1));
    y1=m1*x;
    a1=plot(y1,x);% M1='c1';                            %plot eigen vector
else 
    a1=plot(x,y1);% M1='c1';         
end
    M1='c1';
    a2=plot(x,y2); M2='c2';                             %plot eigen vector
plot(0,0,'+');
xlabel('x');ylabel('y');         
   title('Direction field and eigen vector');
legend([a1;a2],M1,M2);

[xt,yt] = meshgrid(-10:2:10,-10:2:10);      
xt1=A(1,1).*xt + A(1,2).*yt;
yt1=A(2,1).*xt + A(2,2).*yt;

dx=xt1-xt;                      % find delta x
dy=yt1-yt;                      % find delta y

quiver(xt,yt,dx,dy);            %direction filed plot

lmda1=abs(E1(1,1));
lmda2=abs(E1(2,2));

if(lmda1<1 && lmda2 <1)
    disp('It is stable');
    elseif(lmda1>1 && lmda2 >1)
        disp('It is un-stable');
    elseif(lmda1>1 && lmda2 <1 || lmda1<1 && lmda2 >1)
        disp('It is un-stable');
end 

