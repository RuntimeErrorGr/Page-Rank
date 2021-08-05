function A = Adjancency_matrix(nume)
  % Functia construieste matricea de adiacenta pe baza grafului citit.
  
  % Pentru inceput, deschid fisierul cu datele de input pentru citire.
   inFile = fopen(nume, 'r');
   
   % Citesc numarul de noduri din graf.
   % Citind in format char cu fgetl, folosesc functia str2double pentru
   % conversie in format real.
   nrNodes = str2double(fgetl(inFile));
   
   % Initializez matricea de adiacenta.
   A = zeros(nrNodes);
   
   % Citesc un nr. de liste de adiacenta egal cu nr. de noduri si retin
   % lungimea fiecarei liste.
   % Incepand de la pozitia 3 din lista (tratata ca un vector) verific ce noduri
   % sunt legate de nodul curent si modific valoarea corespunzatoare din matrice
   for i = 1 : nrNodes
     vector = str2num(fgetl(inFile));
     len = size(vector, 2);
     for j = 3 : len
       A(vector(1), vector(j)) = 1;
       % Ignor cazurile in care o pagina are legatura spre ea insasi. 
       % Daca se intalneste acest caz, valoarea de pe diagonala principala este
       % modificata in 0.
       if vector(1) == vector(j)
         A(vector(1), vector(j)) = 0;
       endif
     endfor
     % A fost completata linia i din matrice. Trec la linia urmatoare.
   endfor
   
   % Inchid fisierul de citire.
   fclose(inFile);
endfunction
