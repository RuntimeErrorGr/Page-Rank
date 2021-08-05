function F = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  % Deschid fisierul cu datele de input pentru citire.
  inFile = fopen(nume, 'r');
  
  % Citesc numarul de noduri din graf.
  % Citind in format char cu fgetl, folosesc functia str2double pentru
  % conversie in format real.
  nrNodes = str2double(fgetl(inFile));
  
  % Nu mai este nevoie sa operez pe listele de adiacenta, asa ca le parcurg 
  % pur si simplu pentru a duce cursorul in fisierul de input in pozitia 
  % necesara citirii celor 2 valori val1 si val2.
  for i = 1 : nrNodes
    fgetl(inFile);
  endfor
  val1 = str2double(fgetl(inFile));
  val2 = str2double(fgetl(inFile));
  
  % Obtin vectorul PR prin algoritmul Iterative. 
  v_it = Iterative(nume, d, eps);
  
  % Obtin vectorul PR prin algoritmul Algebraic.
  v_alg = Algebraic(nume, d);
  
  % Formez numele fisierului de output prin concatenarea stringului '.out' la 
  % numele fisierului din input.
  numeOut = strcat(nume, '.out');
  
  % Deschid fisierul de output pentru scriere.
  outFile = fopen(numeOut, 'w');
  
  % Afisez numarul de noduri din graf si vectorii obtinuti prin algoritmii
  % Iterative respectiv Algebraic.
  fprintf(outFile, "%d\n", nrNodes);
  fprintf(outFile, "\n");
  fprintf(outFile, "%f\n", v_it);
  fprintf(outFile, "\n");
  fprintf(outFile, "%f\n", v_alg);
  fprintf(outFile, "\n");
  
  % Ordonez vectorul PR obtinut prin algoritmul Algebraic in ordine descrescatoare.
  PR1 = sort(v_alg, 'descend');
  
  % Afisez clasamentul paginilor pe baza functiei de apartenenta, acesta 
  % continand locul obtinut, numarul paginii care a obtinut acest loc si gradul
  % apartenenenta a acestei pagini la multimea paginilor.
  for i = 1 : nrNodes
    F(i, 1) = Apartenenta(PR1(i), val1, val2);
    fprintf(outFile, '%d ', i);
    for j = 1 : nrNodes
      if PR1(i) == v_alg(j)
        fprintf(outFile, '%d ', j);
      endif
    endfor
    fprintf(outFile, '%f\n', F(i));
  endfor
  % Inchid fisierele de input respectiv output.
  fclose(outFile);
  fclose(inFile);
endfunction