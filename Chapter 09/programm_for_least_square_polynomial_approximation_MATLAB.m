
 
%Example 2: Write_a_program_for_least_square_polynomial_approximation_MATLAB

input = [...
  1, 2;...
  2, 4.5;...
  3, 5.9;...
  4, 8.1;...
  5, 9.8;...
  6, 12.3];
 
m = size(input, 1);
n = size(input, 2);
x = input(:,1:n-1);
y = input(:,n);
 
% The first column of matrix X is populated with ones,
% and the rest columns are the x columns of the input.
X = ones(m, n);
X(:,2:n) = input(:,1:n-1);
 
% Try to find the a that minimizes the least square error Xa - y.
% Project y onto the C(X) will give us b which is Xa.
 
% The relationship is X'Xa = X'b
 
% Use left division \ to solve the equation, which is equivalent
% to a = inverse(X'*X)*X'*y, but computationally cheaper.
a = (X' * X) \ (X' * y)
b = X*a
least_square_error = sum((b - y) .^ 2)
 
% Plot the best fit line.
plot(x, b);
title(sprintf('y = %f + %fx', a(1), a(2)));
xlabel('x');
ylabel('y');
 
hold on;
% Plot the input data.
plot(x, y, '+r');
hold off;
pause;
