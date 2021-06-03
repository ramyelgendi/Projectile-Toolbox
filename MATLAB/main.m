V_i = 20;
Theta_i = 0.25*pi;
m=1;
D = 0.5;
h = 0.1;
t_f = 0.6;
resistance = 1;

prompt = "Please Enter tool number from 1 to 5: ";
tool_num = input(prompt);
if(tool_num == 1)
    prompt = "Please Enter the array X ";
    X = input(prompt);
    prompt = "Please Enter the array Z ";
    Z = input(prompt);
    prompt = "Please Enter the step value ";
    step = input(prompt);
    [l]= fcts(X,Z,step);
    disp("The total projectile length is: ");
    disp(l);
    
elseif (tool_num ==2)
    prompt = "Please Enter the array t ";
    t = input(prompt);
    prompt = "Please Enter the array X ";
    X = input(prompt);
    prompt = "Please Enter the array Z ";
    Z = input(prompt);
    prompt = "Please Enter the method (2 for O(h^2) or 4 for O(h^4))";
    method = input(prompt);
    [vx, vz, vr,a] = numerical_differentiation(t, X,Z, method);
    disp("The velocity in x: ");
    disp(vx);
    disp("The velocity in z: ");
    disp(vz);
    disp("The resultant velocities are:");
    disp(vr);
    disp("The angles are: ");
    disp(a);
       
elseif (tool_num ==3)
    prompt = "Please Enter the array t ";
    t = input(prompt);
    prompt = "Please Enter the array Vx ";
    vx = input(prompt);
    prompt = "Please Enter the array Vz ";
    vz = input(prompt);
    [X,Z]=tool_3(t, vx, vz);
    disp(" The resultant Xs are: ")
    disp(X)
    disp(" The resultant Zs are: ")
    disp(Z)
elseif (tool_num==4)
    prompt = "Please Enter the initial velocity ";
    V_i = input(prompt);
    prompt = "Please Enter the initial angle ";
    Theta_i = input(prompt);
    prompt = "Please Enter the total time ";
    t_f = input(prompt);
    prompt = "Please Enter h value (time step) ";
    h = input(prompt);
    prompt = "Please Enter the mass ";
    m = input(prompt);
    prompt = "Please Enter the diameter ";
    D = input(prompt);
    prompt = "Please Enter whether you want resistance or not (0 for no air resistance or 1 for Euler or 2 for RK4)";
    resistance = input(prompt);
    [vx,vz]= velocity(V_i,Theta_i,t_f,h,resistance,D,m);
    
    disp("The velocity in x: ");
    disp(vx);
    disp("The velocity in z: ");
    disp(vz);
    
elseif (tool_num==5)
    %prompt = "Please Enter the initial velocity";
    %V_i = input(prompt);
    prompt = "Please Enter the initial angle ";
    Theta_i = input(prompt);
    prompt = "Please Enter the total time ";
    t_f = input(prompt);
    prompt = "Please Enter h value (time step)";
    h = input(prompt);
    prompt = "Please Enter the mass ";
    m = input(prompt);
    prompt = "Please Enter the diameter ";
    D = input(prompt);
    prompt = "Please Enter whether you want resistance or not (0 for no air resistance or 1 for Euler or 2 for RK4)";
    resistance = input(prompt);
    prompt = "Please Enter whether you want to use shooting method or not (0 for no shooting or 1 for shooting)";
    sh = input(prompt);
    if(sh==0)
       prompt = "Please Enter the initial velocity";
       V_i = input(prompt);
       length=tool_5(V_i,Theta_i,D,m,t_f,h,resistance);
    else
       prompt = "Please Enter the targeted X position ";
       x_f = input(prompt); 
       length=tool_5_shooting(V_i,Theta_i,D,m,t_f,h,resistance,x_f, 0);
    end
    disp("The total length of the projectile is: ");
    disp(length);
else
    disp("This is not a valid tool number. Bye..." );
    
end
    
