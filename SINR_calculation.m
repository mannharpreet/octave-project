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
## @deftypefn {Function File} {@var{retval} =} SINR (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: bond <harpreet@superComp>
## Created: 2017-04-14

function sinr =  SINR_calculation (cluster_user_loc,cluster_users,ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq)

sinr = zeros (17,cluster_users);
LOS = zeros (17,1);

for i = 1:cluster_users
  x= cluster_user_loc (i,1);
  y = cluster_user_loc (i,2);
  p1 = [x; y];
  for j = 1:16
    m = ueNB_loc(j,1);
    n = ueNB_loc(j,2);
    p2 = [m; n];
    d = norm(p1 - p2);
    LOS(i) = 42.6 + 20*log10(d/1000) + 20*log10(freq);
    sinr(i,j) = 10* log10(30) - LOS(i) - (Bu * (-174)) - (log10(10)* (sum(LOS)-LOS(i))); 
    % display (sinr(i))
   end
 end 
 
 

endfunction
