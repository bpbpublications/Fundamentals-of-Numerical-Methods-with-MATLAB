

%Example 3:MATLAB_code_to_Wave_Equation_(1D)_using_Finite_Difference

% Parameters
L = 1; % Length of string
c = 1; % Wave speed
dx = 0.01; dt = 0.005; % Discretization steps
x = 0:dx:L;
t = 0:dt:1;

% Initial conditions
u = sin(pi*x); % Initial displacement
v = zeros(size(x)); % Initial velocity
u_old = u;
u_new = zeros(size(x));

% Time stepping using finite difference
for n = 2:length(t)
    for i = 2:length(x)-1
u_new(i) = 2*(1 - (c*dt/dx)^2)*u(i) + (c*dt/dx)^2*(u(i+1) + u(i-1)) - u_old(i);
    end
u_old = u;
    u = u_new;

plot(x, u, 'b', 'LineWidth', 2);
axis([0 1 -1 1]);
title(['Time Step: ', num2str(n)]);
drawnow;
end

