

%Example 5: MATLAB_code_to_Schrödinger_Equation_using_Crank-Nicolson
% Parameters
Nx = 100; Nt = 100;
L = 10; T = 1;
dx = L/Nx; dt = T/Nt;
hbar = 1; m = 1;
x = linspace(-L/2, L/2, Nx);
psi = exp(-x.^2); % Initial wave function

% Time evolution using Crank-Nicolson
A = diag(ones(Nx-1,1),1) - 2*eye(Nx) + diag(ones(Nx-1,1),-1);
A = -1i * hbar / (2*m*dx^2) * A;

for n = 1:Nt
    psi = (eye(Nx) - 0.5*dt*A) \ ( (eye(Nx) + 0.5*dt*A) * psi );

    plot(x, abs(psi).^2, 'b', 'LineWidth', 2);
axis([-L/2 L/2 0 1.2]);
title(['Time Step: ', num2str(n)]);
drawnow;
end

Output:
Refer to the following figure:
