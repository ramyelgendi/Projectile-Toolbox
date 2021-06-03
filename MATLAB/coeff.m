function [co] = coeff(t,x)
[~,k] = size(x);
As = zeros(1,k-1);    % initializing As and bs and cs with zeros
Bs = As;
Cs = As;
[cof_matx,bx]= Quad_splines2(t,x);    %calling quad splines to get
                                      %the coeffs matrix
[~,nn]=size(cof_matx);
n=nn+1;
cof_matx(:,n) = bx;           % adding the f(X) coffs matrix as a column
                              % at the end of the main coffs matrix for
                              % easier computations
tempx = rref(cof_matx);       % gauss jordan
cofs_x = tempx(:,3*(k-1));
%%assuming a0 = 0 , cofs_X returns b0 c0 a1 b1 c1.....an bn cn
for i = 1:(k-1)
    if i~= 1
     As(i) = cofs_x((3*i)-3);   %elements at indecies 3,6,9,... are As
    end                         % elements at indecies 1,4,7,... are Bs
    Bs(i) = cofs_x((3*i)-2);    % elements ar indecies 2,5,7 are Cs
    Cs(i) = cofs_x((3*i)-1);
end
co = [As ; Bs; Cs];             % concatenating the numeric coffs matricies
end