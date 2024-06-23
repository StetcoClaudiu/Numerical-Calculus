xi = 1980:10:2020;
fi = [4451 5287 6090 6970 7821];
x = [2005, 2015];

% Lagrange_b inline
lagrange_b = @(xi, fi, x) lagrange(xi, fi, x);

est_y = lagrange_b(xi, fi, x);

actual_y = [6474 7405];
abs(actual_y - est_y)

function f = lagrange(xi, fi, x)
  n = length(xi);
  w = ones(1,n);
  for j = 1:n
    w(j) = prod(xi(j) - xi([1:j-1,j+1:n]));
  end
  w = 1./w;
  numer = zeros(size(x));
  denom = numer;
  exact = numer;
  for j = 1:n
    xdiff = x - xi(j);
    term = w(j)./xdiff;
    numer = numer + fi(j)*term;
    denom = denom + term;
    exact(xdiff == 0) = j;
  end
  f = numer./denom;
  k = find(exact);
  f(k) = fi(exact(k));
end
