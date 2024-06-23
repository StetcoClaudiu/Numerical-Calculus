xi = [0, 1/3, 1/2, 1];
fi = cos(pi * xi)

% a) Find the Lagrange polynomial
d = divdiff(xi, fi)

% b) Find a bound for the error R3f
% c) Plot f and L3f
xx = linspace(0, 1, 100);
plot(xx, cos(pi * xx), xx, newton_int(xi, d, xx));

% d) Approximate cos (π/5);
xx = 1/5;
newton_int(xi, d, xx)