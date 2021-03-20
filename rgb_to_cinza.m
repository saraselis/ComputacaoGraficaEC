function img_cinza = rgb_to_cinza(path_img_original)
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

% transformando
img_cinza = rgb2gray(img_original);

figure;
subplot(2, 1, 1); imshow(img_original); title('Imagem RBG', "color", "red");
ylabel(path_img_original);
subplot(2, 1, 2); imshow(img_cinza); title('Imagem em escala de cinza');
ylabel(path_img_original);
