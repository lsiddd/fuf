%treinamento
clear all;
X = loadMNISTImages("mnist/train-images.idx3-ubyte");
d = loadMNISTLabels("mnist/train-labels.idx1-ubyte");
D = [];

for i = d(:)'
  d_line = [0 0 0 0 0 0 0 0 0 0];
  d_line(i+1) = 1;
  D = [D; d_line];
endfor

train;

X = loadMNISTImages("mnist/t10k-images.idx3-ubyte");
d = loadMNISTLabels("mnist/t10k-labels.idx1-ubyte");
D = [];

for i = d(:)'
  d_line = [0 0 0 0 0 0 0 0 0 0];
  d_line(i+1) = 1;
  D = [D; d_line];
endfor

taxa
