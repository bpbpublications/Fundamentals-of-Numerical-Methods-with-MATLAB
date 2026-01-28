
% Example 4: Write_a_program_for _Power _Method

n=input('Enter dimension of the matrix, n:  ');
 A = zeros(n,n);
 x = zeros(1,n);
 y = zeros(1,n);
tol = input('Enter the tolerance, tol: ');
 m = input('Enter maximum number of iterations, m:  ');


 A=[1 2 0; -2 1 2; 1 3 1];
 x=[1 1 1];




 k = 1; lp = 1;
amax = abs(x(1));
fori = 2 : n
if abs(x(i)) >amax
amax = abs(x(i));
lp = i;


end
end
fori = 1 : n
x(i) = x(i)/amax;
end

fprintf('\n\n  Ite.    Eigenvalue     ............Eigenvectores............\n');
while k <= m 


fori = 1 : n
y(i) = 0;
for j = 1 : n
y(i) = y(i) + A(i,j) * x(j);
end
end
ymu = y(lp);
lp = 1;
amax = abs(y(1));


fori = 2 : n
if abs(y(i)) >amax
amax = abs(y(i));
lp = i;
end
end
ifamax<= 0
fprintf('0 eigenvalue - select another ');


fprintf('initial vector and begin again\n');
else
err = 0;
fori = 1 : n
              t = y(i)/y(lp);
if abs(x(i)-t) > err
err = abs(x(i)-t);
end


x(i) = t;
end
fprintf('%4d     %11.8f', k, ymu);
fori = 1 : n
fprintf('   %11.8f', x(i));
end


fprintf('\n');
if err <= tol
fprintf('\n\nThe eigenvalue after %d iterations is: %11.8f \n',k, ymu);
fprintf('The corresponding eigenvector is: \n');
fori = 1 : n


fprintf('                                 %11.8f \n', x(i));
end
fprintf('\n');
break;
end
           k = k+1;


end
end
if k > m
fprintf('Method did not converge within %d iterations\n', m);
end

Output:
>> Untitled2
Enter dimension of the matrix, n:  3
Enter the tolerance, tol: 0.0001
Enter maximum number of iterations, m:  3


Ite.    Eigenvalue     ............Eigenvectores............
   1      3.00000000    0.60000000    0.20000000    1.00000000
   2      2.20000000    0.45454545    0.45454545    1.00000000
   3      2.81818182    0.48387097    0.54838710    1.00000000
Method did not converge within 3 iterations
