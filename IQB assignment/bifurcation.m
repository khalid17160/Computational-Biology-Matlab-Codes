close all;
clear;
%fun= @(x,r) x+r*x*(1-x);
fun= @(x,r) r*x*(1-x);
x0=rand(1);
a0=1.4;
a1=4;
N=261;         %not sure what it is either 0.01
L=500;
p_siz=1;

mat = zeros(N,L);
a = linspace(a0,a1,N);
format long
for i = 1:N
    ca = a(i); % pick one parameter value at each time
    for j = 1:L % generate a sequence with length L
        if j == 1 
            pre = x0; % assign initial value
            for k = 1:500 
               nxt = fun(pre,ca); 
               pre = nxt;
            end
        end
        nxt = fun(pre,ca); 
        mat(i,j) = nxt; 
        pre = nxt;  
    end
end

% plot 
dcolor = [0,0,1]; %        
[r,c] = meshgrid(1:L,a);  
surf(r,c,mat,'Marker','*','MarkerSize',p_siz,'FaceColor','None','MarkerEdgeColor', dcolor,'EdgeColor','None');
zlabel('N(t)');ylabel('a');
view([90,0,0]) 
ylim([a0,a1]) 