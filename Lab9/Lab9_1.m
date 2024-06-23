xi = -2:4;
xx = linspace(-2, 4);
fi = (xi + 1) ./ (3 * xi.^2 + 2 * xi + 1);
f = (xx + 1) ./ (3 * xx.^2 + 2 * xx + 1);
dfi = -(3 * xi.^2 + 6 * xi + 1) ./ (3 * xi.^2 + 2 * xi + 1).^2;

% Plot the function
plot(xx, f);
hold on;

% Compute and plot Lagrange interpolant
d = divided_diff(xi, fi);
plot(xx, newton_int(xi, d, xx));

% Compute and plot Hermite interpolant
[zi, d2] = divided_diff2(xi, fi, dfi);
plot(xx, newton_int(zi, d2, xx));

% Compute and plot de Boor spline interpolant
S = spline(xi, fi, xx);
plot(xx, S);

legend('Function f(x)', 'Lagrange Interpolant', 'Hermite Interpolant', 'de Boor Spline Interpolant');
