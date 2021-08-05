function R = Algebraic(nume, d)
  % Implementarea algoritmului Algebraic.
  
  % Obtin matricea de adiacenta a grafului.
  A = Adjancency_matrix(nume);
  
  % Deschid fisierul cu datele de input pentru citire.
	inFile = fopen(nume, 'r');
  
  % Citesc numarul de noduri din graf.
  % Citind in format char cu fgetl, folosesc functia str2double pentru
  % conversie in format real.
  nrNodes = str2double(fgetl(inFile));
  K = zeros(nrNodes);
  
  % Citesc un nr. de liste de adiacenta egal cu nr. de noduri si retin
  % lungimea fiecarei liste.
  for i = 1 : nrNodes
    vector = str2num(fgetl(inFile));
    % Retin in variabila contor k nr. de legaturi recursive la o pagina
    k = 0;
    % Iterez lista curenta pentru a numara legaturile recursive
    for q = 3 : size(vector, 2);
      if vector(1) == vector(q) 
        k++;
      endif
    endfor
    % Impart fiecare element din linia matricii de adiacenta la gradul de iesire
    % corespunzator nodului curent din matrice.
    % De asemenea, daca am legaturi recursive, acestea sunt ignorate, iar
    % numarul lor este scazut din gradul de iesire al nodului. 
    M(i, :) = A(i, :) / (vector(2) - k);
  endfor
  
  % Inchid fisierul de citire.
  fclose(inFile);
  
  % Transpun matricea M.
  M = M';
  
  % Initializez matricea identitate.
  I = eye(nrNodes);
  
  % Obtin matricea ortogonala, respectiv matricea superior triunghiulata cu 
  % ajutorul algoritmului Gram-Schmidt pe baza matricei I - d * M.
  [Q U] = PR_Inv(I - d * M);
  
  % Rezolv cate un sistem superior triunghiulat pentru fiecare nod al grafului,
  % obtinand coloana termenilor liberi ai sistemului din matricea ortogonala si
  % salvez solutia in coloana unei matrice X.
  for i = 1 : nrNodes
    b = Q' * I(: , i);
    X(:, i) = SST(U, b);
  endfor
  % Calculez vectorul R pe baza formulei din algoritm.
  R = X * (1 - d) / nrNodes * ones(nrNodes, 1);
endfunction