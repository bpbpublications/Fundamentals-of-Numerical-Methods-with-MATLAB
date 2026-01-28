Example 1: Write_a_program_for_least_square_polynomial_approximation_MATLAB
Function
function [ S ] = MySum( xi)
% this little auxiliary routine just computes a summation of the n xi
% values given as an array in input
 
S=0;
for i=1:length(xi)
    S= S + xi(i);
end
end
 

xi=0:0.3:3;
yi=[-1.466,-0.062,0.492,0.822,1.068,1.944,2.583,3.239,4.148,4.464,5.185];
n=length(yi);
 
% the sum of the elements xi
sumx1=MySum(xi);
% we need the sum of the xi squars
xi2=xi.^2;
sumx2=MySum(xi2);
% the sum of the yi
sumy1=MySum(yi);
% we need the sum of the xi*yi
xiyi=xi.*yi;
sumx1y1=MySum(xiyi);
 
% set the linear system in matrix form
A=[n sumx1; sumx1 sumx2];
b=[sumy1; sumx1y1];
 
% solve the linear system in matrix form using the built-in MATLAB "\" operator:
x=A\b;
fhat=@(t) x(1) + x(2)*t;
SumLeastSquares=MySum(((fhat(xi) - yi)).^2);
Err1= sqrt((1/n)*SumLeastSquares);
fprintf('The Error for the first order approximation is: %10.8e\n',Err1);
%check with Matlab built-in
P=polyfit(xi,yi,1);
fMatlab=polyval(P,xi);
ErrMatlab=norm(fhat(xi)-fMatlab,inf);
fprintf('The Error with Matlab is: %10.8e\n',ErrMatlab);
% an array of x-values to plot the function
xx=0:0.001:3;
plot(xi,yi,'ro','MarkerSize',4,'MarkerFaceColor','r');
hold on
plot(xx, fhat(xx),'b-');
title('Linear Least Squares Approximation Fit')
legend({'data','$\hat{f}$'},'interpreter','latex','Location','best')
xlabel('x')
ylabel('y')

Output:
The Error for the first order approximation is: 2.35649032e-01
The Error with Matlab is: 1.77635684e-15
>>

 