Example 1: MATLAB_code_to_solve_1D_Heat_Equation_using_Finite_Difference_Method
% Parameters
L = 1;       % Length of the rod (meters)
Nx = 20;     % Number of spatial steps
dx = L/Nx;   % Spatial step size

T = 0.1;     % Total simulation time (seconds)
Nt = 1000;   % Number of time steps
dt = T/Nt;   % Time step size

alpha = 0.01; % Thermal diffusivity
r = alpha * dt / dx^2; % Stability parameter (should be <= 0.5 for explicit method)

% Initial condition
x = linspace(0, L, Nx+1);
u = sin(pi*x);  % Initial temperature distribution

% Boundary conditions
u(1) = 0;
u(end) = 0;

% Time-stepping loop
for n = 1:Nt
u_new = u;
    for i = 2:Nx  % Update interior points
u_new(i) = u(i) + r * (u(i+1) - 2*u(i) + u(i-1));
end
    u = u_new;

    % Plot results every few steps
    if mod(n, 50) == 0
plot(x, u, 'b-', 'LineWidth', 2);
axis([0 L 0 1]);
title(['Time: ', num2str(n*dt), ' s']);
xlabel('Position (m)');
ylabel('Temperature');
pause(0.05);
    end
end

