% Example 1: The_trapezoidal_method_of_integration

a = 0; b = pi
N = 1000 % this is the number of intervals

h = (b - a)/N % this is the width of each interval
x = a:h:b % note there are N+1 elements in this x vector
y = sin(x)
>> Untitled2
>> Untitled2
b =
    3.1416
N =
        1000
h =
    0.0031
x =
  Columns 1 through 10

         0    0.0031    0.0063    0.0094    0.0126    0.0157    0.0188    0.0220    0.0251    0.0283
--
--
--

  Columns 991 through 1000

    3.1102    3.1133    3.1165    3.1196    3.1227    3.1259    3.1290    3.1322    3.1353    3.1385
  Column 1001
    3.1416
y =
  Columns 1 through 10
         0    0.0031    0.0063    0.0094    0.0126    0.0157    0.0188    0.0220    0.0251    0.0283
  --
--
  Columns 991 through 1000
    0.0314    0.0283    0.0251    0.0220    0.0188    0.0157    0.0126    0.0094    0.0063    0.0031
  Column 1001
    0.0000
>>
%Trapezoid method using a loop
%we use the tic and toc functions to time how long it takes to run.

tic
f = 0;
for k=1:N
    f = f + 0.5*((x(k+1)-x(k))*(y(k+1)+y(k)));
end
f
toc

>> Untitled2
f =
    2.0000
Elapsed time is 0.000126 seconds.
>>
%vectorized approach
tic
Xk = x(2:end)-x(1:end-1); % vectorized version of (x(k+1)-x(k))
Yk = y(2:end)+y(1:end-1); % vectorized version of (y(k+1)+y(k))

f = 0.5*sum(Xk.*Yk) % vectorized version of the loop above
toc

% It isn't strictly necessary to calculate Xk this way, since here by
% design every interval is the same width, but this approach would work for
% non-uniform x-values.

