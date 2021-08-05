function x = SST(A, b)
  % Functia rezolva un sistem superior triunghiulat.
  [m n] = size(A);
  x = zeros(n, 1);
  for i = m : -1 : 1
    x(i) = (b(i) - A(i, i+1 : n) * x(i + 1 : n)) / A(i, i);
  endfor
endfunction
