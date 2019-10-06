%  onepop.m
%
%  Single Species Population Model  
%
%  The user is asked for an equation defining the model. Then by clicking
%  on an initial population in the figure, the population as a function of
%  time will be graphed.  By pressing `d', numerical data may be displayed 
%  to the MATLAB command window after a simulation.
%
%  8/2/03

p=0;                          % initialize population for testing formula
%
disp(' ')
disp('Enter a formula defining the population model, using "p" to denote')
disp('the size of the population: (Ex: next_p = p+.2*p*(1-p/10))')
next_p=input ('next_p = ','s');
%
p=eval(next_p);               % test formula
% 
disp(' ')
disp('Enter the range of population to be shown on the graph:'); 
limits=input('(Default is [pmin pmax] = [0 20]) ');
if isempty(limits) limits=[0 20]; end;
% 
disp(' ')
n=input('Enter the number of time steps for iteration: (Default is n = 20) ');
if isempty(n) n=20; end;
%
disp(' ')
disp('Position the cursor on the graph to choose initial population and')
disp('click left to iterate. Press `d'' to display the population values')
disp('to the command window.  Press any other key to exit.')
disp('  ')
disp('Hit any key to begin.')
pause
%
figure;                         % set up display of new figure
axis([ [0 n] limits]); grid on;    
xlabel('Time');ylabel('Population p');
title(['next\_p=',next_p]); 
hold on;
%
times=[0:n];                    % generate time vector for plotting       
% 
newcontinue=1;
while newcontinue               % loop until non-left button is hit
   [t,p,button]=ginput(1);      % get initial population
   if button==1
      pops=p;
      for i=1:n                 % build up vector of iterated populations
         p=eval(next_p);
         pops=[pops,p];
      end
      plot(times,pops);         % plot time vs. population
   else 
      newcontinue=0;            % don't loop again
      if button==100
         [times;pops]'          % display times and populations to command window
         newcontinue=1;  		  % loop again after displaying values
                                % if user hits `d' for display
      end
   end
end
%
hold off
