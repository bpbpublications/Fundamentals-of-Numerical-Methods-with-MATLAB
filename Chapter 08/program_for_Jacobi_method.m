%Example 1: Write_a_program_for_Jacobi_method
% Jacobi method
 n=input('Enter number of equations, n:  ');
 A = zeros(n,n+1);
x1 = zeros(n);
x2 = zeros(n);


tol = input('Enter the tolerance, tol: ');
 m = input('Enter maximum number of iterations, m:  ');

 A=[4 2 3 8; 3 -5 2 -14; -2 3 8 27];
x1=[0 0 0];

 k = 1;
while k <= m
err = 0;
fori = 1 : n
      s = 0;
for j = 1 : n
        s = s-A(i,j)*x1(j);
end
      s = (s+A(i,n+1))/A(i,i);


if abs(s) > err
err = abs(s);
end
x2(i) = x1(i)+s;
end



if err <= tol
break;
else
     k = k+1;
fori = 1 : n
x1(i) = x2(i);
end


end
end

fprintf('Solution vector after %d iterations is :\n', k-1);
fori = 1 : n
fprintf(' %11.8f \n', x2(i));

end



