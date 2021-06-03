
function [l] = tool_5(V_i,Theta_i,D,m,t_f,h,resistance)

[vx,vz]= velocity(V_i,Theta_i,t_f,h,resistance,D,m)
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
disp("The time: ")
disp(t)
disp("The resultant velocity: ")
disp(v)
disp("The direction (in rads): ")
disp(Theta)
[X,Z]=tool_3(t, vx, vz)
[l]= fcts(X,Z,0.1);
end