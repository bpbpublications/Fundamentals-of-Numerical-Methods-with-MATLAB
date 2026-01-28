
%Example 3: program_simpson_3/8_rule

f=inline('1/(1+x^2)');

a=input('Enter lower limit of integral=');
b=input('Enter upper limit of integral=');
n=input('Enter number of intervals (multiple of 3)=');

h=(b-a)/n;

sum1=0.0;
sum2=0.0;
sum3=0.0;

fori=1:3:n-2
    x=a+i*h;
    sum1=sum1+f(x);
end
fori=2:3:n-1
    x=a+i*h;
    sum2=sum2+f(x);
end
fori=3:3:n-3
    x=a+i*h;
    sum3=sum3+f(x);
end

simp=3*h*(f(a)+3.0*sum1+3.0*sum2+2.0*sum3+f(b))/8.0;

fprintf('Integrated value is %f',simp)

