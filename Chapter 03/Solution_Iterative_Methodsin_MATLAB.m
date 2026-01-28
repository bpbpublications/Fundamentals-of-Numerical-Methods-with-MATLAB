% Example 6: Solution_Iterative_Methodsin_MATLAB
function itrav(m,n)
b = ones(m+2,1); % array of 1's - downward forces
x = zeros(m+2,1); % array of 0's - initial guess of position
xnew = x;
fprintf('Iteration 0: ');
fprintf('%.4f ',x);
fprintf('\n');
for i = 1:n % n iterations
 for j = 2:m+1 % miss out end points
xnew(j) = 0.5*(x(j-1) + x(j+1) - b(j));
 end
 x = xnew;
fprintf('Iteration %2d: ', i);
fprintf('%.4f ',x);
fprintf('\n');
end
end

itrav(5,10)

