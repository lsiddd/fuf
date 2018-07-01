## Copyright (C) 2018 Lucas Pacheco
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} loadMNISTImages (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Lucas Pacheco <lucas@koffee>
## Created: 2018-07-01

function images = loadMNISTImages (filename)
  %loadMNISTImages returns a 28x28x[number of MNIST images] matrix containing
  %the raw MNIST images
  
  fp = fopen(filename, 'rb');
  assert(fp ~= -1, ['Could not open ', filename, '']);
  
  magic = fread(fp, 1, 'int32', 0, 'ieee-be');
  assert(magic == 2051, ['Bad magic number in ', filename, '']);
  
  numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
  numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
  numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
  
  images = fread(fp, inf, 'unsigned char');
  images = reshape(images, numCols, numRows, numImages);
  images = permute(images,[2 1 3]);
  
  fclose(fp);
  
  % Reshape to #pixels x #examples
  images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
  % Convert to double and rescale to [0,1]
  images = double(images) / 255;
  images = images';
endfunction
