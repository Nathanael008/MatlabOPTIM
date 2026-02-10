v = 100000 ;

x0 = [1 100];

lb = [5 0.1];

ub = [100 Inf];

[x_opt , A_opt] = fmincon(@area,x0,[],[],[],[],lb,ub,@(x) volume_constraint(x,v));

d_opt = x_opt(1);

h_opt = x_opt(2);

fprintf("optimum diameter = %f mm\n", d_opt);
fprintf("optimum height = %f mm\n", h_opt);
fprintf("Minimum Surface Area = %f mm\n", A_opt);

V_check = (pi*d_opt^2*h_opt)/4 ;

fprintf("Volume with the optimum values = %f mm\n", V_check);