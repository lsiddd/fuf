X = [];
D = [];
for i = [0:9]
  directory = sprintf("*/0001_CH4M/%d/*png", i);
  j = dir(directory);
  for k = j'
    X = [X; imread(sprintf("%s/%s", k.folder, k.name))(1:9800)];
    D = [0 0 0 0 0 0 0 0 0 0];
    D(i + 1) = 1;
  endfor
endfor

clear i k directory j;