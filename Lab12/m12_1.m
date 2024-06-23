f = @(x) (x - exp(-x));
df = @(x) (1 + exp(-x));

% prove root graphically
fplot(f, [-1, 2]);
hold on;
fplot(@(x) 0, [-1, 2]);
xlabel('x');
ylabel('f(x)');
title('Graphical Solution of f(x) = x - e^{-x}');
grid on;
hold off;

a = 0; b = 1;
x0 = 0; x1 = 1;
x_init = 0.5;
eps = 1e-6;
N = 100;

root_bisection = bisection(f, a, b, eps, N);
root_secant = secant(f, x0, x1, eps, N);
root_newton = newton(f, df, x_init, eps, N);

fprintf('Bisection Method Root: %.6f\n', root_bisection);
fprintf('Secant Method Root: %.6f\n', root_secant);
fprintf('Newton Method Root: %.6f\n', root_newton);