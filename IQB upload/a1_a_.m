%x(1)=2;
%for i=1:99
%    x(i+1)= (-0.9)*x(i)*(1-x(i));
   % plot([x(i),x(i)],[x(i),x(i+1)]);
%    hold on
%   plot([x(i),x(i+1)],[x(i+1),x(i+1)]);
%    hold on
%end

 close all;
 clear;
 r=1.6;
 xn0=rand(1);            % pick a random initial N(0)
 x=0:0.01:1;
 n=500;
 %nf=10;
% 
for g=1:4
    
    if g==1
        r=0.6;
    elseif g==2
        r= 1.6;
    elseif g==3
        r= 2.6;
    else
        r=3.6;
    end    
           
 subplot(2,2,g);
 y=r.*x.*(1-x);           % y is N(t+1) and x is N(t)
 plot(x,y);               % plot N(t+1) vs N(t)
 
 xlabel('N(t)'); ylabel('N(t+1)');
caption = sprintf('r = %f COBWEB PLOT ', r);
 title(caption);
 axis([0, 1, 0, 1]);
 hold on;                 % to put more stuf on figure
 plot(x,x,'r--');

 %hjg
   
for(i=1:n)
        if(i==1)
          xn=xn0;
          orbit=xn0;
        else
            %xn=xn1;
            xn=r*xn*(1-xn);
            orbit(i)=xn;
        end
end
 %subplot(2,2,1:2)
 
 %plot(orbit);
axis([0, 1, 0, 1]);
 hold on;
 subplot(2,2,g);
     xn=orbit(1);
     line([orbit(1) orbit(1)],[0 orbit(2)]);
      for(i=1:(n-2))
         line([orbit(i) orbit(i+1)],[orbit(i+1) orbit(i+1)]);
         line([orbit(i+1) orbit(i+1)],[orbit(i+1) orbit(i+2)]);
     end
%  subplot(2,2,4);
%  plot(x,x,'r');
% axis([0, 1, 0, 1]);
%  hold on;
%  y=r.*x.*(1-x);
%  plot(x,y);
%  for(i=(n-nf):(n-2))
%         line([orbit(i) orbit(i+1)],[orbit(i+1) orbit(i+1)]);
%         line([orbit(i+1) orbit(i+1)],[orbit(i+1) orbit(i+2)]);
%     end

end
