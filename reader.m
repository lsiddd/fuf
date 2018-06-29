%inicializzação das matrizes
X = [];
D = [];

%iterar nos arquivos de imagem
for i = [0:9]
  directory = sprintf("*/0010_CH3M/%d/*png", i);
  j = dir(directory);
  for k = j'
    try
      image = double(rgb2gray(imread(sprintf("%s/%s", k.folder, k.name))))(1:8100);
    catch exception
      image = imread(sprintf("%s/%s", k.folder, k.name))(1:8100);
    end_try_catch
  X = [X;image];
    d = [0 0 0 0 0 0 0 0 0 0];
    d(i + 1) = 1;
    D = [D; d];
  endfor
endfor
X_tests = X(1:2:end,:);
D_tests = D(1:2:end,:);

X = X(2:2:end,:);
D = D(2:2:end,:);
clear i k directory j;