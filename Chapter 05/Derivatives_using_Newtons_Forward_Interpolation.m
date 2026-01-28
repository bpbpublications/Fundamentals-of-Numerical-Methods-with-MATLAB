%Example 1: Derivatives_using_Newtons_Forward_Interpolation

x1=[0 2 4 7 10 12]; % inputting values of x1 
fx1=[20 20 12 7 6 6]; % inputting values of y
dt=zeros(6,10); % function 
for i=1:6 dt(i,1)=x1(i);% for loop 
dt(i,2)=fx1(i); % calling function 
end 
n=5; % number of iterations 
for j=3:10
for i=1:n
dt(i,j)=dt(i+1,j-1)-dt(i,j-1)
end
n=n-1;
end 
h=x1(2)-x1(1) % finding the value of h
x1p=1.5; % defining the value of x1p 
for i=1:5
q=(x1p-x1(i))/h; % calculating number of intervals 
if (q>0&&q<1)
p=q;
 end
 end
 p
l=x1p-(p*h)
 for i=1:5 
 if(l==x1(i))
 r=i;
 end
 end % calculating different value of y
 f0=fx1(r);
 f01=dt(r,3); 
 f02=dt(r,(3+1));
 f03=dt((r),(3+2));
 f04=dt((r),(3+3));
% using the forward interpolation formula 

 fp=(f0)+((p*f01)+(p*(p-1)*f02)/(2))+((p*(p-1)*(p-2)*f03)/(6))+((p*(p-1)*(p-2)*(p
3)*f04)/(24))

