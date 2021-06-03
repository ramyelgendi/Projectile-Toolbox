function [v_i,theta_i]=shooting(V_i,Theta_i, D,m,t_f,h,x_f, z_f)

% constants
g = 9.81;
p_air = 1.204;
DV = 18.13*10^-6;
Af = (pi*(D^2))/4;


% d^2x/dt^2 = (-1/(2m))* CD * Af * p_air * dx/dt * sqr((dx/dt)^2+(dz/dt)^2)
% d^2z/dt^2 = -g -(1/(2m))* CD * Af * p_air * dz/dt * sqr((dx/dt)^2+(dz/dt)^2)
% dx/dt = W
% dz/dt = R
% dW/dt = (-1/(2m))* CD * Af * p_air * W * sqr((W^2)+(R^2))
% dR/dt = -g -(1/(2m))* CD * Af * p_air * R * sqr((W^2)+(R^2))

% initial conditions
x_i = 0;  % X(0) = 0
z_i = 0;  % Z(0) = 0

%initial Geusses
W_i_1 = randi(round(V_i)); %dx/dt(0)=W(0)
W_i_2 = randi(round(V_i)); %%dz/dt(0)=R(0)

while(W_i_1==W_i_2)
   W_i_2 = randi(V_i); 
end


%W_i_1 = x_f; % W(0)= x_f (random guess and X_f is given bu user)
%W_i_2 = - x_f; % W(0)= 2 x_f (random guess and X_f is given bu user)

R_i_1 = sqrt(V_i^2 - W_i_1^2); % R(0)is calculated according to V initial and W guess
R_i_2 = sqrt(V_i^2 - W_i_2^2); 

disp(W_i_1);
disp(R_i_1);

% X_i+1 = X_i + f_1(t,x,W,R) h 
% Z_i+1 = Z_i + f_2(t,x,W,R) h
% W_i+1 = W_i + f_3(t,x,W,R) h
% R_i+1 = R_i + f_4(t,x,W,R) h 

t = zeros(1,round((t_f/h)+1)); 
X = zeros(1,round((t_f/h)+1));        
Z = zeros(1,round((t_f/h)+1));
W = zeros(1,round((t_f/h)+1));        
R = zeros(1,round((t_f/h)+1));

t(0+1) = 0;
X(0+1) = x_i;
Z(0+1) = z_i;
W(0+1) = W_i_1;
R(0+1) = R_i_1;

for i=1:(round(t_f/h))
    if(i==1)
      Re = (p_air*V_i*D)/DV;
    else
      Re = (p_air*sqrt((W(i)^2)+(R(i)^2))*D)/DV;
    end 
    if (Re<0.2)
        CD=24/Re;
    else
        %if (Re>=0.2 && Re<2000)
           CD=21.12/Re + 6.3/sqrt(Re) + 0.25;
    end
    % dx/dt = W
    % dz/dt = R
    % dW/dt = (-1/(2m))* CD * Af * p_air * W * sqr((W^2)+(R^2))
    % dR/dt = -g -(1/(2m))* CD * Af * p_air * R * sqr((W^2)+(R^2))
    f_1 = W(i); 
    f_2 = R(i);
    f_3 = (-1/(2*m))* CD * Af * p_air * W(i) * sqrt((W(i)^2)+(R(i)^2));
    f_4 = -g -(1/(2*m))* CD * Af * p_air * R(i) * sqrt((W(i)^2)+(R(i)^2));
    t(i+1) = t(i) + h;
    X(i+1) = X(i) + f_1*h;
    Z(i+1) = Z(i) + f_2*h;
    W(i+1) = W(i) + f_3*h;
    R(i+1) = R(i) + f_4*h;
    
end

t_2 = zeros(1,round((t_f/h)+1)); 
X_2 = zeros(1,round((t_f/h)+1));        
Z_2 = zeros(1,round((t_f/h)+1));
W_2 = zeros(1,round((t_f/h)+1));        
R_2 = zeros(1,round((t_f/h)+1));

t_2(0+1) = 0;
X_2(0+1) = x_i;
Z_2(0+1) = z_i;
W_2(0+1) = W_i_2;
R_2(0+1) = R_i_2;

for i=1:round(t_f/h)
    if(i==1)
      Re = (p_air*V_i*D)/DV;
    else
      Re = (p_air*sqrt((W(i)^2)+(R(i)^2))*D)/DV;
    end 
    if (Re<0.2)
        CD=24/Re;
    else
        %if (Re>=0.2 && Re<2000)
        CD=21.12/Re + 6.3/sqrt(Re) + 0.25;
    end
  
    % dx/dt = W
    % dz/dt = R
    % dW/dt = (-1/(2m))* CD * Af * p_air * W * sqr((W^2)+(R^2))
    % dR/dt = -g -(1/(2m))* CD * Af * p_air * R * sqr((W^2)+(R^2))
    f_1 = W_2(i); 
    f_2 = R_2(i); 
    f_3 = (-1/(2*m))* CD * Af * p_air * W_2(i) * sqrt((W_2(i)^2)+(R_2(i)^2)); 
    f_4 = -g -(1/(2*m))* CD * Af * p_air * R_2(i) * sqrt((W_2(i)^2)+(R_2(i)^2));
    t_2(i+1) = t_2(i) + h;
    X_2(i+1) = X_2(i) + f_1*h;
    Z_2(i+1) = Z_2(i) + f_2*h;
    W_2(i+1) = W_2(i) + f_3*h;
    R_2(i+1) = R_2(i) + f_4*h;
    
end

%Linear interpolation:

%f(x) = Wi
%x = x(t_f/h)
x0 = X(round(t_f/h)+1);
x1 = X_2(round(t_f/h)+1);
x = x_f;
f_x0 = W(0+1);
f_x1 = W_2(0+1);

f_x = f_x0 + ((f_x1-f_x0)/(x1-x0))*(x-x0);

%Vx
W_i_3 = f_x;
Vx = W_i_3;
%Vz
R_i_3 = sqrt(abs(V_i^2 - W_i_3^2));

Vz = R_i_3;

disp(t);
%disp(X);
%disp(W);
%disp(X_2);
%disp(W_2);
disp(Z);
disp(R);
disp(Z_2);
disp(R_2);
disp(Vx);
disp(Vz);

theta_i = atan(Vz/Vx);
v_i = V_i;

end