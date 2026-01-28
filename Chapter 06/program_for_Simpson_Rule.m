
%Example 2: Write a_program_for_Simpson_Rule
Sol: 
The approach is similar to the trapezoidal rule, however with Simpson’s rule we subdivide the interval across which we wish to integrate and approximate the integral of the function with a number of quadradics

%Step (1)
n=10;
fori=2:2:10
h=i-1
end


>> Untitled2

h =

     1


h =

     3


h =

     5


h =

     7


h =

     9

>>


%Step (2)
fori=3:2:n
h=i-1
end

>> Untitled2

h =

     1


h =

     3


h =

     5


h =

     7


h =

     9

>> Untitled2

h =

     2


h =

     4


h =

     6


h =

     8

>>



% Simpsonex.m - A program for composite Simpsons 1/3 rule
% to numerically integrate a function between a and b with
% n subintervals.
% The example program integrates exp(-x^2)
format long% sets MATLAB to report more decimal places
clear; help simpsonex;
a=input('input a (starting value)->');
b=input('input b (end value) ->');
n=input('input number of intervals (n) ->');
h=(b-a)/n; % interval with
fa=exp(-(a^2)); % f(a)
fb=exp(-(b^2)); % f(b)
ff=0;
fori=2:2:n; % all 4*f(a+nh) terms to f(b) h=(1,3,5,7,…..,n-1)
 x = (a+(i-1)*h);
fx = exp(-x^2);
 ff = ff + 4*fx;
end
fori=3:2:n; % all 2*f(a+nh) terms to f(b) h=(2,3,4,6,…..,n-2)
 x = (a+(i-1)*h);
fx = exp(-x^2);
 ff = ff + 2*fx;
end
result=(h/3)*(fa+fb+ff) % integral result
% with approximation to area under curve


>> Untitled2

simpsonex not found.

Use the Help browser search field to search the documentation, or
type "help help" for help command options, such as help for methods.

input a (starting value)->10
input b (end value) ->100
input number of intervals (n) ->5

result =

     2.232045585612502e-43

>>




