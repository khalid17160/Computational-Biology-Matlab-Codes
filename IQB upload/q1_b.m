%p=rand(1);                           % initialize population for testing formula
r=1.5;
next_p= @(r,p) r*p*(1-p);
%next_p =@(r,p) p+.7*p*(1-p/10);
%p=eval(next_p);
limits=[0 0.35]; % [pmin pmax] range of population to be shown on the graph
%0.35
n=10;   %time   %Enter the number of time steps for iteration (time)

figure;

for g=1:4
    
    if g==1
        r=0.5;
    elseif g==2
        r= 1.5;
    elseif g==3
        r= 2.5;
    else
        r=3.5;
    end    
           
 subplot(2,2,g);

axis([ [0 n] limits]); grid on;    
xlabel('Time');ylabel('Population p(t+1)');
caption = sprintf('r = %f', r);
title(caption); 
hold on;

times=[0:n];

p=0.1;         % initialize population for testing formula



pops=p;
      for i=1:n                 % build up vector of iterated populations
         p=next_p(r,p);
         pops=[pops,p];
      end
      plot(times,pops);         % plot time vs. population
      
end      