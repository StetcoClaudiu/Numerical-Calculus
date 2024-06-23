function f = newtonElement(func, funcD, prev)
  f = prev - func(prev) / funcD(prev);
end
