function img_cinza = remove_colors(path_img_original)
%{
  * Script que troca a escala de uma imagem de RBG para Gray.

  path_img_original: string - caminho para a imagem a ser transformada
  img_cinza: uint8 - versao, em escala de cinza da imagem
%}

% leitura da imagem
img_original = imread(path_img_original);

% conferindo as dimensões
tam = size(img_original);
[lin, col] = size(img_original);
fprintf('Linhas: %d | Colunas %d\n', lin, col);

if length(tam) ~= 3
  display('A variavel de entrada não e uma imagem no espaco RGB');
end

% transformando em cinza
img_red = img_original;
img_green = img_original;
img_blue = img_original;

img_red(:, :, 1) = 0;
img_green(:, :, 2) = 0;
img_blue(:, :, 3) = 0;

figure;
subplot(2, 2, 1); imshow(img_original);
title('Imagem RBG'); ylabel(path_img_original);
subplot(2, 2, 2); imshow(img_red);
title('Imagem sem o RED', "color", "red");ylabel(path_img_original);
subplot(2, 2, 3); imshow(img_green);
title('Imagem sem o GREEN', "color", "green");ylabel(path_img_original);
subplot(2, 2, 4); imshow(img_blue);
title('Imagem sem o Azul', "color", "blue");ylabel(path_img_original);