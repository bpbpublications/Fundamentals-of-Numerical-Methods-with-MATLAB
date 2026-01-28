%Example 2: Derivatives using Newton’s Backward Interpolation.

n = input('\nEnter number of data points = ');
h = input('\nEnter step size (h) = ')
x(1) = input('\nx0 = ');
y(1) = input('y0 = ');
for i=2:n
    x(i)=x(i-1)+h;
fprintf('\nX%d = %f',i,x(i));
fprintf('\t\tY%d: ',i);
    y(i) = input('');
end
x_reqd = input('\nEnter X for which value of Y is sought: ');
s=(x_reqd-x(n))/h;
for i=1:n
    diff(i,1)=y(i);
end
%% Calculate Backward Difference Table
for j=2:n
    for i=n:-1:j
        diff(i,j)=diff(i,j-1)-diff(i-1,j-1);
    end
end
%% Print Backward Difference Table
fprintf('\n\tX\t Backward Difference Table');
for i=1:n
fprintf('\n %.3f',x(i));
    for j=1:i
fprintf('\t%.3f',diff(i,j));
    end
end
ans=y(n);
for i=1:n-1
    term=1;
    for j=1:i
        term=term*(s+j-1)/j;
    end
ans=ans+term*diff(n,i+1);
end
fprintf('\nValue of Y at(X=%f) = %f',x_reqd,ans);

