## Copyright (C) 2017 bond
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} uenb_distr1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: bond <harpreet@superComp>
## Created: 2017-04-14

function [A] = uenb_distr1 (r,l,m)
r= 50;
l= 1500;
m=16;
A = zeros(m,2);
x = randi(1500);
y = randi(1500);
minAllowableDistance = r;
% Initialize first point.
keeperX = x(1);
keeperY = y(1);
% Try dropping down more points.
% counter = 2;
for counter = 2 : m % number of points
	% Get a trial point.
  k = counter;
	thisX = x(k);
	thisY = y(k);
	% See how far is is away from existing keeper points.
	distances = sqrt((thisX-keeperX).^2 + (thisY - keeperY).^2);
	minDistance = min(distances);
	if minDistance >= minAllowableDistance
		keeperX(counter) = thisX;
		keeperY(counter) = thisY;
		counter = counter + 1;
	end
end
A(:,1) = keeperX;
A(:,2) = keeperY;
plot(keeperX, keeperY, 'b*');
grid on;
endfunction
