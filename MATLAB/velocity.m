% air = 0, if you want to ignore air resistance
% air = 1, if you want to incorporate air resistance ( euler's method )
% air = 2, if you want to incorporate air resistance ( RK4 method )
% t is the period of the projectile, ex: if t =2 , the function is from 0 to 2 
% Note: Degrees not radians
function [vx,vz] = velocity(vi,theta,t,h,air,diam,mass)
%theta = deg2rad(degree);      % turning degree to radians
vx = zeros(0,round((t/h)+1));        % size of vector vx including v initial
vz = zeros(0,round((t/h)+1));        
vx(1) = vi * cos(theta);   %vx and vz components of v initial
vz(1) = vi * sin(theta);
period = (2*vz(1))/9.8;
multiconst = -0.5*1.225*pi*(diam^2)*0.25;    % drag coeff constant
p = 1.204;      % constant
u =18.13*10^-6;       % constant

if ( air == 0)              % if air resistance is ignored
    disp('No air resistance');
   %if (t>=period)          % this part checks that the time entered by the user within the range of the projectile
   %disp('the body has already reached the ground');
   %return;
   %end
    count = 1;             % counter of option 1
    for i = 0:h:t
        vx(count) = vx(1);            % v`x(t) = 0
        vz(count) = vz(1) - 9.8*i;    % normal SUVAT equation
        v(count) = sqrt( vx(count)^2 + vz(count)^2);
        count = count+1;
    end
end
if (air ~= 0)
    if air == 1             % euler method
    disp('euler');
      count2 = 1;           % counter of option 1
      for i = 0:h:(t-h)     % looping on all the intervals
        v(count2) = sqrt( vx(count2)^2 + vz(count2)^2);   % lines 36-42 calculates the drag coeff.
        Re = p * v(count2) *diam/u;
        if ((Re>= 0.2 )|| (Re<2000))
        Cd = (21.12/Re)+(6.3/sqrt(Re))+0.25;
        else
        Cd = 24/Re;
        end
        k1_x = Cd*multiconst*v(count2)*vx(count2)/mass;     % calculating k of vx
        vx(count2+1)= vx(count2) + (k1_x*h);           % calculating Vx using euler's formula
  
        k1_z = -9.81 + (Cd*multiconst*v(count2)*vz(count2)/mass); % calculating k of Vy
        vz(count2+1)= vz(count2) + (k1_z*h);                     % calculating Vx using euler's formula
  
        count2 = count2+1;
      end
        v(count2) = sqrt( vx(count2)^2 + vz(count2)^2);
        
      
        
    elseif air == 2         % RK4 method
        disp('RK4');
      count3 = 1;           % counter of option 1
      %{
      this part applies RK4 by two nested loops, one loop
      goes through all the intervals one by one, and the loop inside
      does 4 iterations in each interval to calculate k1 k2 k3 and k4
      %}
      for i = 0:h:(t-h)
       v(count3) = sqrt( vx(count3)^2 + vz(count3)^2);  

          hvec = [ 0.5 0.5 1 0 ];       % this vector is used to calc. k2 and k3
          vxtemp(1)=vx(count3);         % by calc. vx and vz at the middle of each interval
          vztemp(1)=vz(count3);
        for j = 1:4
        vtemp(j) = sqrt( vxtemp(j)^2 + vztemp(j)^2);
        Re = p * vtemp(j) *diam/u;      % just like euler's, but k is calc. 4 times with diff conditions
        if ((Re>= 0.2 )|| (Re<2000))
        Cd = (21.12/Re)+(6.3/sqrt(Re))+0.25;
        else
        Cd = 24/Re;
        end
        
        k1_x(j) = Cd*multiconst*vtemp(j)*vxtemp(j)/mass;
        vxtemp(j+1)= vxtemp(j) + (k1_x(j)*h*hvec(j));
  
        k1_z(j) = -9.81 + (Cd*multiconst*vtemp(j)*vztemp(j)/mass);
        vztemp(j+1)= vztemp(j) + (k1_z(j)*h*hvec(j));
        end
        % after calc. all the Ks, the RK coff is calculated for vx and vz
        RK_x = (1/6)*(k1_x(1)+2*k1_x(2)+2*k1_x(3)+k1_x(4));
        RK_z = (1/6)*(k1_z(1)+2*k1_z(2)+2*k1_z(3)+k1_z(4));
        vx(count3+1)= vx(count3) + (RK_x*h);
        vz(count3+1)= vz(count3) + (RK_z*h);
        count3 = count3+1;
      end
        v(count3) = sqrt( vx(count3)^2 + vz(count3)^2);  
    else
        disp('Choose the air = 0 or 1 or 2');
    end
end
% this part is commented, if you want to compute the path of the projectile
% AKA utilitzing tool 3
%{
i = 0:h:(t);
x = trapezoidal(vx,i);
z = trapezoidal(vz,i);
plot(x,z);
grid on;
%}

end