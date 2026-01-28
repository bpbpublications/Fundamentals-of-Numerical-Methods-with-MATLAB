
%Example3: Write_a_program_for_Runge_kutta_method


% Runge-Kutta 4th order with MATLAB
% It calculates an ODE using Runge-Kutta 4th order method
% Equation to solve: Y'=3*exp(-t)-0.4*Y; Y(0)=5; t=[0,3];
% Author Ido Schwartz, modified by Marco Arocha
clc, clear all, close all
% instruction to write results on external file
fid=fopen('RKout.m','w');
h=0.1; a=0; b=3; % h is the step size, t=[a,b] t-range
t = a:h:b; % Computes t-array up to t=3
y = zeros(1,numel(t)); % Memory preallocation
y(1) = 5; % initial condition; in MATLAB indices start at 1
Fyt = @(t,y) 3.*exp(-t)-0.4*y; % change the function as you desire
% the function is the expression after (t,y)
% table title
fprintf(fid,'%7s %7s %7s %7s %7s %7s %7s \n','i','t(i)','k1','k2','k3','k4','y(i)');
for ii=1:1:numel(t)
 k1 = Fyt(t(ii),y(ii));
 k2 = Fyt(t(ii)+0.5*h,y(ii)+0.5*h*k1);
 k3 = Fyt((t(ii)+0.5*h),(y(ii)+0.5*h*k2));
 k4 = Fyt((t(ii)+h),(y(ii)+h*k3));
 y(ii+1) = y(ii) + (h/6)*(k1+2*k2+2*k3+k4); % main equation
% table data
fprintf(fid,'%7d %7.2f %7.3f %7.3f',ii, t(ii), k1, k2);
fprintf(fid,' %7.3f %7.3f %7.3f \n', k3, k4, y(ii));
end
y(numel(t))=[ ]; % erase the last computation of y(n+1)
% Solution PLOT:
plot(t,y,' ok')
title('RK-4--Numerical Solution---');
ylabel('y'); xlabel('t'); legend('numerical');
grid on
fclose(fid);

