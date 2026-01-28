%Example 8: Solution_of_Newton-Raphson_method.

The solution to x = cos(x), 
we let f(x) = x - cos(x)

i = 1;
a0 = 0.5*pi;           
N = 100;               
error = 0.0001;        

syms 'x'
f(x) = x - cos(x);     
df = diff(f);           

while i<= N
    p = a0 - (f(a0)/df(a0));          

    if (abs(p - a0)/abs(p)) < error                     
fprintf('Solution is %f \n', double(p))
        return
    end

i = i + 1;
    a0 = p;             
end

