% a
f = @(x, B) (x + exp(-B*x^2) * cos(x));
df = @(x, B) (1 - 2*B*x*exp(-B*x^2)*cos(x) - exp(-B*x^2)*sin(x));

% given values
B_values = [1, 5, 50, 100];
x_range = [-1.2, 0.5];
eps = 1e-6;
N = 100;

figure;
hold on;
for B = B_values
    fplot(@(x) f(x, B), x_range, 'DisplayName', ['B = ' num2str(B)]);
end
xlabel('x');
ylabel('f(x)');
title('Graph of f(x) = x + e^{-Bx^2} cos(x) for various B values');
legend('show');
grid on;
hold off;

% b
B1 = 1;
B5 = 5;
x0 = 0;

root_newton_B1 = newton(@(x) f(x, B1), @(x) df(x, B1), x0, eps, N);
root_newton_B5 = newton(@(x) f(x, B5), @(x) df(x, B5), x0, eps, N);

fprintf('Newton Method Root for B = 1: %.6f\n', root_newton_B1);
fprintf('Newton Method Root for B = 5: %.6f\n', root_newton_B5);

% c
B50 = 50;
B100 = 100;

% 50
root_newton_B50 = newton(@(x) f(x, B50), @(x) df(x, B50), x0, eps, N);
fprintf('Newton Method Root for B = 50: %.6f\n', root_newton_B50);

% 100
root_newton_B100 = newton(@(x) f(x, B100), @(x) df(x, B100), x0, eps, N);
fprintf('Newton Method Root for B = 100: %.6f\n', root_newton_B100);

% for larger values of B (50 and 100), newton's method may fail due to the 
% function's steep gradient and up-down near the root.\n");

% so we use bisection method for B = 50 and 100
a = -1; b = 0;
root_bisection_B50 = bisection(@(x) f(x, B50), a, b, eps, N);
root_bisection_B100 = bisection(@(x) f(x, B100), a, b, eps, N);

fprintf('Bisection Method Root for B = 50: %.6f\n', root_bisection_B50);
fprintf('Bisection Method Root for B = 100: %.6f\n', root_bisection_B100);
