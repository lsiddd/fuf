%inicializzação das matrizes
X = [];
D = [];

%iterar nos arquivos de imagem
for i = [0:9]
  directory = sprintf("*/0001_CH4M/%d/*png", i);
  j = dir(directory);
  for k = j'
    %ler aquivos tanto com 8 bits de cor ou só 1
    try
      image = double(rgb2gray(imread(sprintf("%s/%s", k.folder, k.name))))(1:8100);
    catch exception
      image = imread(sprintf("%s/%s", k.folder, k.name))(1:9200);
    end_try_catch
    X = [X;image];
    
    %conjunto de valores alvo
    d = [0 0 0 0 0 0 0 0 0 0];
    d(i + 1) = 1;
    D = [D; d];
  endfor
endfor

X_tests = [];
D_tests = [];
%separar metade dos valores para testes e metade para treinamento
for i = randperm(100, 100)
  X_tests = [X_tests; X(i,:)];
  D_tests = [D_tests; D(i,:)];
  
  %X(i, :) = [];
  %D(i, :) = [];
endfor
%limpar variáveis
clear i k directory j image;
