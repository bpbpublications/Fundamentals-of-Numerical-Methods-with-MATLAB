
%Example 2: Write_a_program_for_Euler's_method

% Euler Method with MATLAB
% Solves IVP-ODE using Euler's method
% Equation to solve: y'=t+y; y(0)=1; t=[0,1];
% Author: Marco Arocha
clc, clear all, close all
% instruction to write results on external file
fid=fopen('EulerOut.m','w');
h=0.1;
forjj=1:1:5 % 5 Different solutions by different h's
 a=0; b=1;
 t = a:h:b;
 y = zeros(1,length(t));
 y(1) = 1; % initial condition
 F = @(t,y) t+y; % change the function as you desire
% table title
fprintf(fid,'%7s %7s %7s \n','i','t(i)','y(i)');
for ii=1:1:length(t)
 k1 = F(t(ii),y(ii));
 y(ii+1) = y(ii) + h*k1; % Euler equation
fprintf(fid,'%7d %7.2f %7.3f \n',ii, t(ii), y(ii));
end
 y(length(t))=[ ]; % erase the last computation of y(n+1)

 data=['+r';'og';'xb';'*k';'^m']; % 5 different markers
celldata = cellstr(data); % cell array of strings

 plot(t,y,celldata{jj});

 title('Euler-O(h)---Numerical Solution---');
ylabel('y'); xlabel('t');

leyendas=[' h1 ';' h2 ';' h3 ';' h4 ';' h5 '];
leyendata=cellstr(leyendas);
 legend(leyendata);
 grid on
 hold on
 h=h/2.0; % In each new iteration program halves the step size
end
hold off
fclose(fid);


