%que 2
%(a) determine the jacobian using the program and plot the steady state and
% direction field for the population values close to equilibrium point (P? , Q?) =
% (.4375, 1.4625). Determine the type of dynamics from both the phase plane and
% time series plot. displayed answer of the que that Is the dynamics stable or unstable? 
% displayed the answer to the que that is it possible to plot the
% eigenvectors in this case?
clear;
syms Pt1 Pt Qt1 Qt; 
Pt1=Pt.*(1+1.3.*(1-Pt))-0.5.*Pt.*Qt;
Qt1=0.3.*Qt+1.6.*Pt.*Qt;

jac1=jacobian([Pt1;Qt1],[Pt,Qt]);       % Calculate Jacobian
disp('Jacobian matrix');
disp(jac1);

figure(1);
hold on;
xlabel('Polulation p');ylabel('Populations q');
title('Phase plane plot');
p=1.1;                          % initial population for p
q=0.4;  %(.4375, 1.4625).       % initial population for q
n=100
    pops=[p;q];
   for i=1:n               % loop to build up matrix of population values 
      newp=cal_p(p,q);
      newq=cal_q(p,q);
      p=newp;
      q=newq;
      pops=[pops,[p;q]];
   end
   plot(pops(1,:),pops(2,:),pops(1,:),pops(2,:),'o');   % plot populations in phase space
   %
   figure(2)                                    
   plot([0:n], pops(1,:), [0:n], pops(2,:));     % plot populations in time series 
   xlabel('Time');ylabel('Populations');         
   title('Time Series Plot');
   legend('p','q');
   %
   figure(3);
   hold on;
   %Matrix corresponding to equilibrium value
A=[0.43125 -0.21875; 2.34 1];                   % calcalute direction field
[pt,qt] = meshgrid(-10:2:10,-10:2:10);      
pt1=A(1,1).*pt + A(1,2).*qt;
qt1=A(2,1).*pt + A(2,2).*qt;

dx=pt1-pt;
dy=qt1-qt;
title('Direction field');
quiver(pt,qt,dx,dy);            %direction filed plot

disp('in time series plot It is Damped oscillation and reaches equilibrium independent of initial conditions. in Phase plane plot it is spiral inwards towards equilibrium value. It is stable dynamic.');
disp('in this case we cant plot eigen vector as they are coming out to be imaginary');

% function to calculate pt+1
function pt_next=cal_p(pt,qt)
     pt_next=pt*(1+1.3*(1-pt))-0.5*pt*qt;   
end
% function to calculate qt+1
function qt_next=cal_q(pt,qt)
     qt_next=0.3*qt+1.6*pt.*qt;  
end