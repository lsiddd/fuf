X = [];
D = [];
for i = [0:9]
  directory = sprintf("*/0001_CH4M/%d/*png", i);
  j = dir(directory);
  for k = j'
    X = [X; imread(sprintf("%s/%s", k.folder, k.name))(1:9800)];
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