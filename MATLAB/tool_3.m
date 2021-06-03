function[X,Z]=tool_3(T, V_x, V_z)
prompt = "Do you want to use (Trapezoidal Integration (t) or Simpson's 1/3 Integration (s). Enter t or s: \n";

func = input(prompt,'s');

% Trapezoidal Integration
if(func=='t')
    x_t = trapezoidal(V_x,T);
    z_t = trapezoidal(V_z,T);
    X = x_t;
    Z = z_t;
end

% Simpson's 1/3
if(func=='s')
    x_s = simpson1_3(V_x,T);
    z_s = simpson1_3(V_z,T);
    X = x_s;
    Z = z_s;
end

% X vs Z Plot
if(func=='t')
    plot(x_t,z_t)
    legend('Trapezoidal Integration')

end
if(func=='s')
    plot(x_s,z_s)
    legend("Simpson's 1/3 Integration")
end
xlabel('x-plane')
ylabel('z-plane')
title('Tool 3');
grid

end