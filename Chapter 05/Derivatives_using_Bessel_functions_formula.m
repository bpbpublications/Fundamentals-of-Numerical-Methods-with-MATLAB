%Example 4: Derivatives_using_Bessel_functions_formula


x = 0.1:0.1:49.9;


maxM=6;   

Y=zeros(length(x),maxM+1);   i.e. order=0,1,2,3,4,5,6
for(i = 1:length(x) )

  Y(i,1)  = getYZero( x(i) );

  Y(i,2)  = getYOne( x(i) , Y(i,1) );

end


for(m=2:maxM+1)

    for(i = 1:length(x) )

  Y(i,m+1)  = (2*m/x(i)) * Y(i,m) - Y(i,m-1);

    end  

end

myLegend=['k' 'b' 'r' 'g' 'c' 'y' 'm'];

legendTags=struct('legendTag','');



for(m=1:maxM+1)


    [X_,Y_] = getTrimmedY(x,Y(:,m)); 

    figure;

    plot(X_,Y_);

    title(sprintf('Bessel function of second order. m=d',m-1));

xlabel('x');

ylabel('Y_m');

    grid on;

end

figure;

for(m=1:maxM+1)


    [X_,Y_] = getTrimmedY(x,Y(:,m)); 

    plot(X_,Y_,myLegend(m));

legendTags(m).legendTag=sprintf('d',m-1);

    hold on;

end

title('Bessel functions of second kind, for different order');

xlabel('x');

ylabel('Y_m');

legend(legendTags(1:maxM+1).legendTag);

grid on;


figure;

for(m=1:maxM+1)

   Y(:,m) = bessely(m-1,x(1:end))';

   plot(x,Y(:,m),myLegend(m));

   hold on;

end


title('Bessel functions of second kind, for different order, MATLAB implementaion');

xlabel('x');

ylabel('Y_m');

legend(legendTags(1:maxM+1).legendTag);

grid on;
function [x_,y_] = getTrimmedY(x,y)

  for(i=1:length(x))

     if( y(i) > -1 )

   x_ = x(i:end);

   y_ = y(i:end);

   return;

     end

  end

  x_ = x;

  y_ = y; 
5

function v=getYZero(x)

lambda = 0.577215664;

maxK   = 10;   10 terms for the sum should be enough

sum=0;

for(k = 1:maxK )

    sum = sum + ( (-1)^k * (1/k) * besselj(2*k,x) );

end


v = (2/pi) * ( log(x/2) + lambda ) * besselj(0,x) - ( (4/pi) * sum );


return;

function v=getYOne(x,Y0)

v =  besselj(1,x)* Y0 / besselj(0,x)  ;

v =  v - ( 2/(pi*x*besselj(0,x)) );
