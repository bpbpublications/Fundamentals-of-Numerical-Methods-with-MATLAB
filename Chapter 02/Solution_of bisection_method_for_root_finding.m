%Example5: Solution_of bisection_method_for_root_finding
There are various terminologies which we are using:
% A1 is the left point
% A2 is the right point
% A3 is the average value, otherwise A3=(A1+A2)/2
% value takes the value of function when A3 substitute it in the function 
% previousA1Value takes the value of function when A1 substitute it in the function
% nextA2Value takes the value of function when A2 substitute it in the function
format long;
syms x;
sym value;
f(x) = x^2 -4*x -13;
A1 = -2.2;
A2 = -2.1;
n=1; 
while n<50
A3 = (A1 + A2)/2;
value = f(A3);
previousA1Value = f(A1);
nextA2Value = f(A2);

if ( value * previousA1Value )<0
A2 = A3;
else
A1 = A3;
end

if value <0
value = -1*value;
end

%programe displays all solutions which are smaller than 0.000000000001
if value<0.000000000001
disp(double(A3));
end

n=n+1;

end   %end of while

