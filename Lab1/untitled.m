p = @(x) x.^5 - 5*x.^4 - 16*x.^3 + 16*x.^2 - 17*x + 21;

%a
x_values = linspace(-4, 7.2, 1000);

y_values = p(x_values);

subplot(3,1,1);
plot(x_values, y_values);
title('Graph of p(x)');

%b
value=p(-2.5)

%c
p=[1 -5 -16 16 -17 21]
r=roots(p)

%2

f=@(x) sin(x);
g=@(x) sin(2*x);
h=@(x) sin(3*x);

x1_values=linspace(0,2*pi,1000);

f_res=f(x1_values);
g_res=g(x1_values);
h_res=h(x1_values);

subplot(3,1,2);
plot(x1_values, f_res, 'r', x1_values, g_res, 'g', x1_values, h_res, 'b');

%3

R = 3.8;
r = 1;

t = linspace(0, 10*pi, 1000);     

x = (R + r) * cos(t) - r * cos((R/r + 1) * t);
y = (R + r) * sin(t) - r * sin((R/r + 1) * t);

subplot(3,1,3)
plot(x, y);
xlabel('x');
ylabel('y');
axis equal; 
grid on;