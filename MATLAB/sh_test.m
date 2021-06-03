Theta_i = pi/4;
t_f = 0.6;
h=0.1;
resistance=2;
D=0.05;
m=100;
x_f = 100;
z_f = 0;
function[V_i, Theta_i] shooting_with_tools(V_i,Theta_i, D,m,t_f,h,x_f, z_f);
t=zeros(1,round(t_f/h)+1);
t(1)=0;
for i=1:round(t_f/h)
    t(i+1)= t(i)+h;
end
disp(t)
error=0.05;
step = 0.1;
i=1;
method='t';


V_i_1 = randi(100);
V_i_2 = randi(100);
disp(V_i_1);
disp(V_i_2);

[vx,vz]= velocity(V_i_1,Theta_i,t_f,h,resistance,D,m)
[X,Z]=tool_3(t, vx, vz)
n = length(X);

[vx,vz]= velocity(V_i_2,Theta_i,t_f,h,resistance,D,m);
[X_2,Z]=tool_3(t, vx, vz);

%Linear interpolation:
x0 = X(n);
x1 = X_2(n);
x = x_f;
f_x0 = V_i_1;
f_x1 = V_i_2;

disp(X)
disp(X_2)

f_x = f_x0 + ((f_x1-f_x0)/(x1-x0))*(x-x0);

V_i = f_x;
[vx,vz]= velocity(V_i,Theta_i,t_f,h,resistance,D,m);
[X_3,Z]=tool_3(t, vx, vz);
disp(V_i);

disp(X_3);
disp(Z);
plot(X_3, Z);
