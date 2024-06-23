% a
p_coeffs = [1 2 -4 -14 -5];
% roots
roots_poly = roots(p_coeffs);

% solve
syms x;
p = x^4 + 2*x^3 - 4*x^2 - 14*x - 5;
solve_poly = double(solve(p, x));

% fsolve for numerical solutions
f = @(x) x.^4 + 2*x.^3 - 4*x.^2 - 14*x - 5;
x0 = [0, 1, -1, 2];  % initial guesses
fsolve_roots = arrayfun(@(x) fsolve(f, x), x0);

fprintf('Roots using roots function: \n');
disp(roots_poly);
fprintf('Roots using solve function: \n');
disp(solve_poly);
fprintf('Roots using fsolve function: \n');
disp(fsolve_roots);

% b
figure;
fplot(@(x) polyval(p_coeffs, x), [-1, 3]);
xlabel('x');
ylabel('p(x)');
title('Graph of p(x) = x^4 + 2x^3 - 4x^2 - 14x - 5');
grid on;

% c
a = -1; b = 3;  % interval for bisect
x0_secant = -3 - 2i; x1_secant = -1 - 1i;  % initial guesses (secant)
x0_newton = 3 + 1i;  % initial guess (newton)
eps = 1e-6;
N = 100;

real_root_bisection = bisection(@(x) polyval(p_coeffs, x), a, b, eps, N);
complex_root_secant = secant(@(x) polyval(p_coeffs, x), x0_secant, x1_secant, eps, N);
complex_root_newton = newton(@(x) polyval(p_coeffs, x), @(x) polyval(polyder(p_coeffs), x), x0_newton, eps, N);

fprintf('Bisection Method Root: %.6f\n', real_root_bisection);
fprintf('Secant Method Root: %.6f + %.6fi\n', real(complex_root_secant), imag(complex_root_secant));
fprintf('Newton Method Root: %.6f + %.6fi\n', real(complex_root_newton), imag(complex_root_newton));

% d
x0_secant = -3 - 2i; x1_secant = -1 - 1i;  % initial guesses (secant)
complex_root_secant = secant(@(x) polyval(p_coeffs, x), x0_secant, x1_secant, eps, N);
fprintf('Secant Method with Complex Initial Values: %.6f + %.6fi\n', real(complex_root_secant), imag(complex_root_secant));

x0_newton = 3 + 1i;  % initial guess (newton)
complex_root_newton = newton(@(x) polyval(p_coeffs, x), @(x) polyval(polyder(p_coeffs), x), x0_newton, eps, N);
fprintf('Newton Method with Complex Initial Value: %.6f + %.6fi\n', real(complex_root_newton), imag(complex_root_newton));

% they both converge to real roots despite complex initial guesses