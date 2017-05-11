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
## @deftypefn {Function File} {@var{retval} =} Calc_User_Rate (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: bond <harpreet@superComp>
## Created: 2017-04-16

function [Rj] = Calc_User_Rate (Nj)
      Avg = 960/48.375;
      for i =1:16
        if (Nj(i)==0)
          Rj(i)=0;
        else
        Rj(i) = 960 + (48.375-Nj(i))* Avg;
        end
      end
endfunction
