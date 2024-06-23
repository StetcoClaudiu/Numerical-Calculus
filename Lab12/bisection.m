function f = bisection(func, a, b, eps, N)
  c = 0;
  for i = 0 : N
    c = (a + b) / 2;
    if (abs(func(c)) >= eps)
      
      if (func(a) * func(c) < 0)
        b = c;
       else
        a = c;
      end
      
   else
      f = c;
      return;
    end
  end
  
  f = c;
end