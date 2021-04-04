function y = func_prof(x)
% Algoritmo de exemplo - turma de Computação Gráfica
% x: imagem representada no espaco RGB, uint8 (intervalo 0-255)
% y: versao, em escala de cinza, da imagem x, em reais (intervalo 0-1)

img_original = imread(x);

tam = size(img_original);

if length(tam) ~= 3
  display('A variavel de entrada nao e uma imagem no espaco RGB');
end

x = double(x);

for i=1:tam(1)
  for j=1:tam(2)
    
    y(i,j) = (x(i,j,1) + x(i,j,2) + x(i,j,3) ) / 3;
    y(i,j) = y(i,j)/255;
    
  end
end

fprintf('Linhas: %d \n', y);