% longterm.m
%
% Produces a bifurcation diagram, varying one parameter in a one-population model. 
% The user is asked for an equation and variables defining the model.  Then,
% population as a function of "r" will be graphed.
%
% 8/2/03

r=1; p=0.2;                              % initialize population and "r" value
%                                      %                 for testing formula
%
disp (' ')
disp('Enter a formula defining the population model, using "p" to denote')
disp('the size of the population and "r" to denote the parameter to be')
disp('varied.   (Ex:  next_p = p+r*p*(1-p) )');
next_p=input('next_p = ','s');
p=eval(next_p);                        % test population formula
%
disp (' ')
disp ('Enter the upper and lower extremes of "r" to be shown on the graph:')
rlimits=input ('(Default is [rmin rmax]=[1.5 2.9])   [rmin rmax] = ');
if isempty(rlimits) rlimits=[1.5 2.9]; end;
%
disp (' ')
disp ('Enter the number of increments between rmin and rmax that will be') 
disp ('used to plot the graph:')
num=input ('(Default is set at 400)          # of increments = ');
if isempty(num) num=400; end;
%
%
disp (' ')
a=rlimits(1);
b=rlimits(2);
rinc=(b-a)/num;                        % sets up interval between "r" values
%
disp('Enter the range of population to be shown on the graph:');
limits=input('(Default is [pmin pmax]=[0 1.6])     [pmin pmax] = ');
if isempty(limits) limits=[0 1.6]; end;
disp (' ')
%
c=rlimits(1)-1/6*(b-a);                % centers plot on the screen
d=rlimits(2)+1/6*(b-a);

% begin a new figure and get handle
figure 
ax=gca;
axis ([c d, limits]);            % set up display 
xlabel (' "r" value '); ylabel ( 'Attracting Population Cycle');
title (['next\_p=',next_p] );           
set(ax,'DefaultLineLineStyle','none');
%
%
N=32;                            % establishes number of time intervals
for r=rlimits(1):rinc:rlimits(2) % loop to establish "r" range 
   p=.1; 
   for w=1:3                     % loop that keeps only the last N
                                 %     population values
      pops=zeros(1,N);           % creates memory storage vector
      for i=1:N                  % loop to build up matrix of 
         p=eval (next_p);        %     population values
         pops(i)=p;
      end
   end
   % plots attracting population cycle
   l=line('XData', r*ones(1,N), 'YData',pops);   %,'Marker','.', 'MarkerSize',1,'none' );       %pause(.01)
end                             
