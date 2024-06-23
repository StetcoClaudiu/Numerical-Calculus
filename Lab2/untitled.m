%1
%a
syms x
f = exp(x);

p1 = taylor(f, 'Order', 1);
p2 = taylor(f, 'Order', 2);
p3 = taylor(f, 'Order', 3);
p4 = taylor(f, 'Order', 4);

figure;
fplot([f p1 p2 p3 p4])
xlim([-3 3]);
grid on;

approx = taylor(f, x, 0, 'Order', 11)

x_value = 1;
approx_numerical = double(subs(approx, x, x_value));

fprintf('Approximation: %.6f\n', approx_numerical);
figure;
%2
%a
x1 = linspace(-pi, pi, 1000);
f1 = @(x) sin(x);
y1 = f1(x1);
hold on;
plot(x1, y1)
grid on;
hold off;
%b
x = pi/5;

sin_approx = 0;

for n = 0:5
    sin_approx = sin_approx + (-1)^n * x^(2*n+1) / factorial(2*n+1);
end
sin_approx

%3
%a
syms x
f = log(1 + x);

t1 = taylor(f, 'Order', 2);
t2 = taylor(f, 'Order', 5);

figure;
fplot([f t1 t2])
xlim([-0.9 1])
title('a) ln(1 + x), Order 2, Order 5')
legend('ln(1+x)', 'order 2', 'order 5')
grid on;

% b)
fprintf('b) 2*10^5-1 = %d\n', 2*10.^5-1);

% c)
fm = log(1 - x);
order = 5;
tm = taylor(fm, x, 'Order', order);
fprintf('c) ');
disp(tm);

% d)
fd = log(1 + x) - log(1 - x);
td = taylor(fd, x, 'Order', order);
fprintf('d) ');
disp(td);

% e)
approx = taylor(fd, x, 0, 'Order', 11);

x_value = 1/3;
approx_numerical = double(subs(approx, x, x_value));

fprintf('e) Approximation: %.5f\n', approx_numerical);
