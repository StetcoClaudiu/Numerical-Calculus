function f = secant(func, x0, x1, eps, N)
  preprev = x0;
  prev = x1;
  current = secantElement(func, prev, preprev);
  
  for i = 0 : N
    if abs(current - prev) > eps
      newCurrent = secantElement(func, current, prev);
      preprev = prev;
      prev = current;
      %fprintf("%d --> ", i)
      current = newCurrent;
    else
      f = current;
      return;
    end
  end
  
  f = current;
end