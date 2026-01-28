% Example 1: Solution_of_Cramer’s_rule_in_MATLAB

xi = det(Ai) det(A) ,i = 1, 2,…,n

A = magic(5);  
 b = [1;2;3;4;5];  
format rat;  
for i=1:5                          
C=A; C(:,i)=b; X(i,:)=det(C)/det(A);  
   end                                
format rat; X  

