%a
xi = linspace(-2, 4, 10);
fi = (xi + 1) ./ (3 .* xi.^2 + 2 .* xi + 1);
x = linspace(-2, 4, 500);

% Lagrange_int
f = zeros(size(x));
n = length(xi);
for i = 1:n
    z = ones(size(x));
    for j = [1:i-1, i+1:n]
        z = z .* (x - xi(j)) ./ (xi(i) - xi(j));
    end
    f = f + fi(i) * z;
end

f_original = (x + 1) ./ (3 .* x.^2 + 2 .* x + 1);

%b
figure;
subplot(2, 1, 1);
plot(x, f_original, x, f, xi, fi, 'o');
title('Original Function and Lagrange Interpolation');
legend('Original Function', 'Lagrange Interpolation', 'Interpolation Points');
xlabel('x');
ylabel('f(x)');

%c
subplot(2, 1, 2);
error = abs(f_original - f);
plot(x, error);
title('Absolute Error');
xlabel('x');
ylabel('Absolute Error');

max_error = max(error);
fprintf('Maximum absolute error: %f\n', max_error);

L9f_at_half = 0;
for i = 1:n
    z = 1;
    for j = [1:i-1, i+1:n]
        z = z * (0.5 - xi(j)) / (xi(i) - xi(j));
    end
    L9f_at_half = L9f_at_half + fi(i) * z;
end

%d
f_at_half = (0.5 + 1) / (3 * 0.5^2 + 2 * 0.5 + 1);
abs_error_at_half = abs(f_at_half - L9f_at_half);
fprintf('Absolute error at x = 0.5: %f\n', abs_error_at_half);
