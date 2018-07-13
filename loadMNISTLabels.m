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
## @deftypefn {} {@var{retval} =} loadMNISTLabels (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Lucas Pacheco <lucas@koffee>
## Created: 2018-07-01

function labels = loadMNISTLabels (filename)
  fp = fopen(filename, 'rb');
  assert(fp ~= -1, ['Could not open ', filename, '']);
  
  magic = fread(fp, 1, 'int32', 0, 'ieee-be');
  assert(magic == 2049, ['Bad magic number in ', filename, '']);
  
  numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');
  
  labels = fread(fp, inf, 'unsigned char');
  
  assert(size(labels,1) == numLabels, 'Mismatch in label count');
  
  fclose(fp);
end
