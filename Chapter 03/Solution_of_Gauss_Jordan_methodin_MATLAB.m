
% Example 4: Solution_of_Gauss_Jordan_methodin_MATLAB

function s = search(M,i)
[x, y] = size(M); %x is rows, y is columns
submatrix = M([i:x],[1:y]); %output is rows below and equal to i
column_index = any(submatrix,1); %gives logical array
s = find(column_index,1); %gives column index
end
function m = move(M,i,j)
[x, y] = size(M); %x is rows and y is columns


submatrix = M([i:x],[1:y]); %creates submatrix of ith row down
column_j = submatrix(:,j); %gives jth column
row = find(column_j,1); %gives row number of first nonzero
i_row = M(i,:); %gives ith row of M
row_zero = M(row+1,:); %gives row that has nonzero in M
M(i,:) = row_zero;
M(row+1,:) = i_row
end
function n = normalize(M,i,j)
[x,y] = size(M); %x is rows and y is columns
element = M(i,j); %gives (i,j)th element
row_i = M(i,:); %gives ith row

div = row_i/element; %divides ith row by element
M(i,:) = div
end
function r = reduce(M,i,j,k)
[x,y] = size(M); %x is rows and y is columns
row_i = M(i,:); %gives ith row
row_k = M(k,:); %gives kth row
row_ik = row_i.*row_k; %multiplies rows i and k
new = row_k-row_ik; %makes jth position 0
M(k,:) = new %puts reduced row in kth position
end

function GJE = GJ(M)
[x, y] = size(M);
z = search(M,x); %finds first nonzero column
for i=z;j=1;k=1;
    if M(i,j) == 0
        move(M,i,j)
    else
        normalize(M,i,j)
    end %of if
end %of for
end %of function

