function [x, y] = SRD2SRN(i, j, L, C)
  x = (2*((j-1)/(C-1))-(1/2));
  y = (2*((L-i)/(L-1))-(1/2));
end