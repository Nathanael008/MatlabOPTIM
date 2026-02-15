nvars = 2;

lb = [-5,-5];

ub = [10,10];

[x, fval] = gamultiobj(@objective_function, nvars, [], [], [], [], lb, ub) ;

figure(1)
plot(fval(:,1),fval(:,2),'r*')
xlabel ('f1')
ylabel ('f2')
title ('Pareto Front')
legend ('Pareto Front')

figure(2)
plot(x(:,1),x(:,2),'ko')
t = linspace(0, 5);
y = t;
hold on
plot(t,y,'b--')
xlabel ('x')
ylabel ('y')
title ('Pareto set')
legend ('Pareto set')