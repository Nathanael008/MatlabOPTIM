function f = objective_function(x)
x1= x(1);
y1= x(2);

f1 = (x1^2)+(y1^2);
f2 = (x1-5)^2 + (y1-5)^2;

f = [f1,f2];

end