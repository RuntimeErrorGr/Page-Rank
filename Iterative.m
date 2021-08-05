function R = Iterative(nume, d, eps)
  % Implementarea algoritmului Iterative.
  
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
  
  % Initializez vectorul R la t = 0.
  last_R(1 : nrNodes, 1) = 1 / nrNodes;
  
  % Cat timp eroarea este mai mare decat eps
  while 1
    % Calculez R la pasul t = t + 1 conform formulei din algoritm.
    R = d * M * last_R + ((1 - d) / nrNodes) * ones(nrNodes, 1);
    if norm(R - last_R) < eps break endif 
    % Actualizez R la pasul curent.
    last_R = R;
  endwhile
  
  % Intrucat a fost efectuata cu o iteratie in plus fata de cat era nevoie 
  % actualizez vectorul R cu R la pasul t = t - 1.
  R = last_R;
endfunction