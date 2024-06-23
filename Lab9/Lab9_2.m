xi = [-1,-1/2,0,1/2,1,3/2];
xx = linspace(-1,3/2);

f = xx .* sin(pi*xx);

fi = xi .* sin(pi*xi);

dfi = sin(pi*xi) + pi*xi .* cos(pi*xi);

% cubic spline
s = spline(xi, fi, xx);

hold on
plot(xx, s);

fci = [pi, fi, -1]; 

% complete spline using given nodes
s2 = spline(xi, fci, xx)

plot(xx, s2);

% Hermite cubic spline
fp = pchip(xi, fi, xx)

plot(xx, fp);

plot(xx, f);



