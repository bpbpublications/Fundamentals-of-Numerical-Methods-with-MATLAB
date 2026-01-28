%Example 1: Write_a_program_for_Taylor's_series_method

function out = centraldifference (x, dx)
% analytical function is (exp(x))*(cos(x))
% for second order derivative f"(x)
% f"(x) = -2*exp(x)*sin(x)
analytical_derivative = -2*exp(x)*sin(x);
%central_difference
central_differencing = ((-1*exp(x-2*dx)*cos(x-2*dx))+(16*exp(x-dx)*cos(x-dx))-(30*exp(x)*cos(x))+
(16*exp(x+dx)*cos(x+dx))-(1*exp(x+2*dx)*cos(x+2*dx)))/(12*(dx^2));
%error
out = abs(central_differencing - analytical_derivative);
end


function out = skewedleftsided(x, dx)
% analytical function is (exp(x))*(cos(x))
% for second order derivative f"(x)
% f"(x) = -2*exp(x)*sin(x)
analytical_derivative = -2*exp(x)*sin(x);
%skewed left
skewed_left_sided = (35*exp(x)*cos(x)-104*exp(x-1*dx)*cos(x-1*dx)+114*exp(x-2*dx)*cos(x-2*dx)-56*exp(x-
3*dx)*cos(x-3*dx)+11*exp(x-4*dx)*cos(x-4*dx))/(12*(dx^2));
%error
out = abs(skewed_left_sided - analytical_derivative);
end


function out = skewedrightsided (x, dx)
% analytical function is (exp(x))*(cos(x))
% for second order derivative f"(x)
% f"(x) = -2*exp(x)*sin(x)
analytical_derivative = -2*exp(x)*sin(x);
%skewed right
skewed_right_sided =
(35*exp(x)*cos(x)-104*exp(x+dx)*cos(x+dx)+114*exp(x+2*dx)*cos(x+2*dx)-56*exp(x+3*dx)*cos(x+3*dx)+11*exp(
x+4*dx)*cos(x+4*dx))/(12*(dx^2));
%error
out = abs(skewed_right_sided - analytical_derivative);
end



clear all
close all
clc
x = pi/3;
dx = linspace(pi/4,pi/400,30);
fori = 1:length(dx)
central_difference(i)= centraldifference (x, dx(i));
skewed_right(i)= skewedrightsided (x, dx(i));
skewed_left(i) = skewedleftsided(x, dx(i));
end
%plotting
loglog(dx,central_difference,'b')
hold on
loglog(dx,skewed_right,'g')
hold on
loglog(dx,skewed_left,'r')
title('Comparing 4th order approximations for second order derivative:')
legend('central difference','skewedright','skewed left')
%labeling
xlabel('dx')
ylabel('error')

