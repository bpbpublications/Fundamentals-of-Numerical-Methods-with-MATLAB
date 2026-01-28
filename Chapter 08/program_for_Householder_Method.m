Example 3: Write_a_program_for_Householder_Method

A=[60,41,-88;42,60,51;0,-28,56;126,82,-71];
disp(A)
m=length(A(:,1));
n=length(A(1,:));
I=eye(m);
e1=I(:,1)';


beta=-sqrt(A(:,1)'*A(:,1));
    y=A(:,1)'-beta.*e1;
alpha=sqrt(2)/(sqrt(y*y'));
    v=alpha*y;
    U=I-(v'*v);
disp(U)
    R1=U*A;
disp(R1)


