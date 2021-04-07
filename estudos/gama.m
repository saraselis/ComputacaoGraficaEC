function img_original = gama(path_img_original)
%{
TODO : RECEBER A OPCAO DO USUARIO
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
% identificando a intensidade
img_cinza = rgb2gray(img_original);
mean_intensity_cinza = mean(img_cinza(:));
fprintf('Média de intensidade de pixels: %d\n', mean_intensity_cinza);

img_claro = img_cinza.^(1.5);
img_escura = img_cinza.^(0.6);

if mean_intensity_cinza < 150.0
  % caralho claro
  display('Imagem escura, vitiligo')
  mean_intensity_claro = mean(img_claro(:));
  fprintf('Média de intensidade de pixels CLARO: %d\n', mean_intensity_claro);

else
  % caralho escuro
  display('Imagem clara, anti vitiligo')
  mean_intensity_escuro = mean(img_escura(:));
  fprintf('Média de intensidade de pixels ESCURO: %d\n', mean_intensity_escuro);
end

figure;
subplot(2, 2, 1); imshow(img_original);
title('Imagem RBG'); ylabel(path_img_original);
subplot(2, 2, 2); imshow(img_original);
title('Imagem escala de cinza', "color", "red");ylabel(path_img_original);
subplot(2, 2, 3); imshow(img_escura);
title('Imagem escurecida', "color", "green");ylabel(path_img_original);
subplot(2, 2, 4); imshow(img_claro);
title('Imagem enclarecida', "color", "blue");ylabel(path_img_original);

% visualizando o histograma
% x1 = double(img_cinza);
% hist(x1);