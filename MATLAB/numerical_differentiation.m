function [vx, vz, vr,a] = numerical_differentiation(t, x,z, method)
%UNTITLED5 Summary of this function goes here 
%   Detailed explanation goes here   

n = length(x);
vx = zeros(1,length(x));
vz = zeros(1,length(z));
vr = zeros(1,length(x));
a = zeros(1,length(x));
h = round(t(2)-t(1),4);
h_consistent = true;
n_consistent =true;


if (method == 4)
    disp("warning! This method has a limation for not being able to calculate the velocity and angle for the first and last two points");
end


if (length(x) ~= length(z) || length(x) ~= length(t) || length(t) ~= length(z))
    n_consistent = false;
    disp("length of x, z and t are not consistent");
end


for k=3:length(t)
    if(round(t(k)- t(k-1) , 4) ~= h  )
        disp("h is not consistent");
        h_consistent = false;
        break;
    end
end

if (h_consistent == true && n_consistent == true)
    if method == 2
        for k=1:n
            if k == 1
                vx(k)=(-x(k+2)+4*x(k+1)- 3*x(k))/(2*h);
                vz(k)=(-z(k+2)+4*z(k+1)- 3*z(k))/(2*h);
            elseif k == n
                 vx(k)=(3*x(k)-4*x(k-1)+ x(k-2))/(2*h);
                 vz(k)=(3*z(k)-4*z(k-1)+ z(k-2))/(2*h);
            else
                vx(k)=(x(k+1)- x(k-1))/(2*h);
                vz(k)=(z(k+1)- z(k-1))/(2*h);
            end

        end
        
    elseif method == 4
        for k=3:n-2
            vx(k)=(-x(k+2)+ 8*x(k+1) - 8*x(k-1)+ x(k-2))/(12*h);
            vz(k)=(-z(k+2)+ 8*z(k+1) - 8*z(k-1)+ z(k-2))/(12*h);
        end
    end
    

    for k=1:n
        vr(k)=sqrt(vx(k)^2 + vz(k)^2);
        a(k) = atan(vz(k)/vx(k));
    end
    
end

end

