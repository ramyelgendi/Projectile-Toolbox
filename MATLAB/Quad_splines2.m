function [xo,fx] = Quad_splines2(t,x)
[~,n]=size(t);
[~,m]=size(x);
if((n ~= m))
    disp('Invalid input')
    return
end
iternum=n-1;    % the number of intervals
count = 0;      % counters
count2=0;
a=zeros(3*iternum,3*iternum);       % creating the matrices of coeffs.
b=zeros(3*iternum,3*iternum);
c=zeros(3*iternum,3*iternum);
fx=zeros(1,3*(iternum)-1);         
for i=1:iternum                 %% getting the 2n equations
    for j = (i-1):i        % fixing the coloumn, and looping twice on each
        count = count+1;   % 2 consecative rows to put the coeffs
        a(count,(3*i)-2)=t(j+1)^2;
        b(count,(3*i)-1)=t(j+1);
        c(count,(3*i))=1;
        fx(count)= x(j+1);  %% the same algorithm is applied here
                            % to make the fx coeffs equal [ fx0 fx1 fx1 fx2
                            % fx2 fx3 fx3 ...fxn fxn 0 0 0n]
    end
end
for i = 1:(iternum-1)           %% getting the n-1 equations
    for ii = 1:2                % again looping on all the intermediate 
    % intervals, for a coffs: once the coeff is +ve and once is -ve
    % for b cofs: the coff is 1 once and -1 once in the same row
        a(i+(2*iternum),(3*(ii))-2+(3*(count2)))=(-1)^(ii-1)*2*t(i+1);
        b(i+(2*iternum),(3*(ii))-1+(3*(count2)))=(-1)^(ii-1)*1;
        %%a+b+c
    end
    count2=count2+1;
end
xo = a+b+c;                     %adding the coffs matrix
xo=xo(1:((3*iternum)-1),2:(3*iternum));     % trimming the cofs matrix 
fx;                                         % to ignore a0
end