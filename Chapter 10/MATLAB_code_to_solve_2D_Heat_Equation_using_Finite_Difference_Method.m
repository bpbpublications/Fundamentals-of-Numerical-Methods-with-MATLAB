

%Example 2: MATLAB_code_to_solve_2D_Heat_Equation_using_Finite_Difference_Method

% Parameters
Lx = 1; Ly = 1; % Domain size (meters)
Nx = 20; Ny = 20; % Number of spatial steps
dx = Lx/Nx; dy = Ly/Ny; % Spatial step sizes

T = 0.1; % Total simulation time (seconds)
Nt = 500; % Number of time steps
dt = T/Nt; % Time step size

alpha = 0.01; % Thermal diffusivity
r_x = alpha * dt / dx^2;
r_y = alpha * dt / dy^2;

% Initialize temperature field
x = linspace(0, Lx, Nx+1);
y = linspace(0, Ly, Ny+1);
[X, Y] = meshgrid(x, y);
u = sin(pi*X) .* sin(pi*Y); % Initial condition

% Time-stepping loop
for n = 1:Nt
u_new = u;
    for i = 2:Nx
        for j = 2:Ny
u_new(i,j) = u(i,j) + r_x * (u(i+1,j) - 2*u(i,j) + u(i-1,j)) + ...
                                  r_y * (u(i,j+1) - 2*u(i,j) + u(i,j-1));
end
    end
    u = u_new;

    % Plot results every few steps
    if mod(n, 50) == 0
surf(X, Y, u);
        shading interp;
title(['Time: ', num2str(n*dt), ' s']);
xlabel('X Position (m)');
ylabel('Y Position (m)');
zlabel('Temperature');
axis([0 Lx 0 Ly 0 1]);
pause(0.05);
    end
end

