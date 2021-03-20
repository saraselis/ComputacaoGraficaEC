function z = conv(path_img_original)
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
img_cinza = rgb2gray(img_original);
img_cinza = double(img_cinza)/255;

% convolução 1
h = [-1 -1 -1; -1 8 -1; -1 -1 -1];
z = conv2(img_cinza, h, 'same');

% convolução 2
N = 11;
H = ones(N,N)/N^2;
Z = conv2(img_cinza, H, 'same');

figure;
subplot(3, 1, 1); imshow(img_cinza); title('Imagem Cinza', "color", "red");
ylabel(path_img_original);
subplot(3, 1, 2); imshow(z); title('Imagem Z1', "color", "green");
ylabel(path_img_original);
subplot(3, 1, 3); imshow(Z); title('Imagem Z2');
ylabel(path_img_original);
