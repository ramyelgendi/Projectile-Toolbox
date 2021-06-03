
function [l] = tool_5_shooting(V_i,Theta_i,D,m,t_f,h,resistance, x_f, z_f)

%[v_i, theta_i]=shooting(V_i,Theta_i, D,m,t_f,h,x_f, z_f)
[v_i, theta_i]=shooting_with_tools(V_i,Theta_i, D,m,t_f,h,x_f, z_f, resistance);


[vx,vz]= velocity(v_i,theta_i,t_f,h,resistance,D,m);
v=zeros(1,length(vx));
Theta=zeros(1,length(vx));
t=zeros(1,length(vx));

for i=1:length(vx)
    v(i)=sqrt(vx(i)^2+vz(i)^2);
    Theta(i)=atan(vz(i)/vx(i));
end

t(1)=0;
for i=1:length(vx)-1
    t(i+1)= t(i)+h;
end
disp(t)   
[X,Z]=tool_3(t, vx, vz)
[l]= fcts(t,X,Z,0.1);
end