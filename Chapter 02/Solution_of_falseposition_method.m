%Example6: Solution_of_falseposition_method

  A0 = input('enter the value of A0 = ');
     A1 = input('enter the value of A1 = ');
     tolerance=input('inter the tolerance =  ');
     f =@(x) sin(2*pi*x)+ exp(1.2*x) + x - 2.5;
   for i=0:inf
            A2= A1 - (f(A1)* (A1-A0)/(f(A1)-f(A0))) 
            c = f(A2)
absolute_c= abs(c);
if  absolute_c< tolerance
                 break 
            end
            if f(A0)*c <0
                          A1=A2;
                  continue
            else
                A0=A2;
                continue
            end
     end

