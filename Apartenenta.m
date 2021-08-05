function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2.
  % Calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  if x < val1
    y = 0;
  elseif x >= val1 && x <= val2
    y = (1 / (val2 - val1)) * x + val1 / (val1 - val2);
  elseif x > val2
    y = 1;
  endif
endfunction