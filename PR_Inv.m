function [Q R] = PR_Inv(A)
  % Algoritmul Gram-Schmidt modificat.
  % Functie ce determina matricea ortogonala Q si matricea superior
  % triunghiulata R pe baza unei matrici date ca input.
  
  % Calculez dimensiunea matricei.
	[m n] = size(A);
  % Initializez matricea ortogonala.
	Q = A;
  % Initializez matricea superior triunghiulata.
	R = zeros(m, n);
  % Calculez elementele diagonalei principale ale matricei superior triunghiulate
  % ca fiind normele vectorilor coloana din matricea initiala.
  % Normez elementele matricei Q.
	for k = 1 : n
    R(k, k) = norm(Q(1 : m, k));
	  Q(1 : m, k) = Q(1 : m, k) / R(k, k);
    % Incepand de la coloana imediat urmatoare coloanei curente, calculez 
    % elementele corespunzatoare celor 2 matrice.
	  for j = k + 1 : n
		  R(k, j) = Q(1 : m, k)' * Q(1 : m, j);
		  Q(1 : m, j) = Q(1 : m, j) - Q(1 : m, k) * R(k, j);
	  endfor
	endfor
endfunction