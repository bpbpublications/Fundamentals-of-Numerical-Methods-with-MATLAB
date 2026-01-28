%Example 4: Write_a_program_for_Adams_bashforth_method

close all;

clc;
h = 0.02;     % Step size
Tmax = 0.5;    % Maximum time
N = Tmax / h;  % Maximum number of steps
alpha=0.5;
t = linspace(0,0.5,N+1);  % Time range

% Analytical solution of the differential equation
y_real = -(((9.*sqrt(19))/760).*exp(-5.*t).*sin(5.*sqrt(19).*t)) - ((1/40).*exp(-5.*t).*cos(5.*sqrt(19).*t));
plot(t,y_real);
hold on

%Numerical solution
f=@(t,y) [y(2); -500*y(1)-10*y(2)]; % Governing system of equations

% Initial Conditions
Y = [-0.025; -1];
% Initialization with second order Runge-Kutta method
k1 = h.*f(t(1),Y(:,1));
    k2 = h.*f(t(1)+alpha.*h, Y(:,1)+alpha.*k1);
    Y(:,2) = Y(:,1) + (1-1/2/alpha).*k1 + k2/2/alpha;

% Second Order Adams-Bashforth method steps
fori=2:N
    Y(:,i+1) = Y(:,i) + 3/2*h*f(t(i),Y(:,i)) - h/2*f(t(i-1),Y(:,i-1));
end

plot(t,Y(1,:),'o:')
legend('Exact Solution','Adams-Bashforth Solution','Location','NorthEast')
title('When h = 0.02')
xlabel('t')
ylabel('y')
