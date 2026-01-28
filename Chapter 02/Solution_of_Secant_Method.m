%Example 9:  Solution_of_Secant_Method

approximate solution to x = cos(x), we let f(x) = x - cos(x)
%this is a variation on the Newton-Raphson MEthod, uses two inital guesses
%so that we do not have to explicitly work of the derivative of f(x).

error = 0.0001;         
N = 100;                 
i = 2;

a0 = 2;                 
a1 = 1;

syms 'x'
f(x) = x^2 - 6;         

b0 = f(a0);              
b1 = f(a1);

while i<= N
    p = a1 - (b1*((a1 - a0)/(b1 - b0)));              

if  abs(p - a1) < error                            
fprintf('Solution is %f \n', double(p))
        return
    end

i = i + 1;
    a0 = a1;             
    a1 = p;
    b0 = b1;
    b1 = f(p);
end

