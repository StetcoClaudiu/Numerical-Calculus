function f = newton(func, funcD, x0, eps, N)
  prev = x0;
  current = newtonElement(func, funcD, prev);
  
  for i = 0 : N
    if abs(current - prev) > eps
      newCurrent = newtonElement(func, funcD, current);
      prev = current;
      current = newCurrent;
    else
      f = current;
      return;
    end
  end
  
  f = current;
end