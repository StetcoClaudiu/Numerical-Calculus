function f = secantElement(func, prev, preprev)
  f = prev - func(prev) * (prev - preprev) / (func(prev) - func(preprev));
end