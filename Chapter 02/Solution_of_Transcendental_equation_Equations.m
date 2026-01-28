%Example 3: Solution_of_Transcendental_equation_Equations

k2  = @(E) sqrt(2*m*(E-Vi1))/hb
k3  = @(E) sqrt(2*m*(E+Vi2))/hb
Eqn = @(E) (k2(E)+k3(E)).*sin((k2(E)+k3(E))*L/2)-(k2(E)-k3(E)).*sin((k2(E)-k3(E))*L/2)

k2 = 
    @(E)sqrt(2*m*(E-Vi1))/hb
k3 = 
    @(E)sqrt(2*m*(E+Vi2))/hb

