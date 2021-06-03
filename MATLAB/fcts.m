function [fx] = fcts(x,z,step)

[~,m] = size(x);

n = m-1;                % number of equations
int=0;
coxm= transpose(coeff(x,z))    %coeff functions return As Bs and Cs for x(m) vs z(m)
                                % transpose is taken to rotate the matrix
                                % (easier for computations)
for i = 1:n   % looping on all the splines to calculate the length of z(x)
    X = x(i):step:x(i+1);            %the length of each spline
    yx = coxm(i,1)*(X.^2) + coxm(i,2)*(X) + coxm(i,3); % the quadratic equation of each spline11
    dx = 2*coxm(i,1).*X + coxm(i,2);                % the derivative of z(x)
    lol = sqrt(1+(dx).^2);           % the final form of the function that will be integrated
    for j = 1:length(lol)-1  %Numerical integration using trapezoidal method
        int = int + step*(lol(j)+lol(j+1))/2;
    end  
    plot(X,yx);         % plotting the function
    xlabel('x(m)');
    ylabel('z(m)');
    hold on;            % holding at the end of each spline to plot
end                     % the whole function alltogether


fx = int;

end