%Example 7: Solution_of_fixedpoint_method
find the fixed point of y = cos(x).
g = @(x) cos(x);
 a0 = input('please enter initial aaaroximation, a0:  ');
 n = input('please enter no. of ierations, n: ');
tol = input('please enter tolerance, tol: ');

i = 1;
 while i<= n
     a = g(a0);
     if abs(a-a0) <tol
fprintf('\nAaaroximate solution a = %11.8f \n\n', a)
        break;
     else
i = i+1;


        a0 = a;
     end
 end

