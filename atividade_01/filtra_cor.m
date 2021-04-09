function img_original = filtra_cor(path_img_original, cor)
%{
  * Este script recebe um caminho de imagem, realiza a leitura
      e seleciona um filtro de cor a escolha do usuário.

  Input
  :path_img_original: string - caminho para a imagem a ser transformada
  :cor: string - R, G ou B, cor escolhida, as outras serão filtradas.
  
  Retorno
  :img_original: matriz - imagem original
%}

% realizando a leitura da imagem
img_original = imread(path_img_original);

% convertendo de uint8 para reais de 0~1
img_original = double(img_original)/255;

% conferindo se a imagem está no espectro RGB
tam = size(img_original);
[lin, col] = size(img_original);
fprintf('Linhas: %d | Colunas %d\n', lin, col);

if length(tam) ~= 3
  display('A variavel de entrada não é uma imagem no espaço RGB');
end

% convertendo a variavel recebida para minuscula
cor_escolhida = tolower(cor)

if cor_escolhida == 'r'
  display('Filtro vermelho escolhido!')
 
  img_filtrada = img_original;

  % removendo as componentes azul e verde
  img_filtrada(:, :, 2) = 0;
  img_filtrada(:, :, 3) = 0;
  
  img_filtrada = rgb2gray(img_filtrada);

  figure;
  subplot(1, 2, 1); imshow(img_original);
  title('Imagem com filtro vermelho');
  subplot(1, 2, 2); imshow(img_filtrada);
  title('Imagem original'); 

elseif cor_escolhida == 'g'
  display('Filtro verde escolhido!')
  img_filtrada = img_original;

  % removendo as componentes azul e vermelho
  img_filtrada(:, :, 1) = 0;
  img_filtrada(:, :, 3) = 0;
  
  img_filtrada = rgb2gray(img_filtrada);
  
  figure;
  subplot(1, 2, 1); imshow(img_original);
  title('Imagem com filtro verde'); 
  subplot(1, 2, 2); imshow(img_filtrada);
  title('Imagem original'); 

elseif cor_escolhida == 'b'
  display('Filtro azul escolhido!')
  img_filtrada = img_original;
  
  % removendo as componentes do verde e vermelho
  img_filtrada(:, :, 1) = 0;
  img_filtrada(:, :, 2) = 0;
  
  img_filtrada = rgb2gray(img_filtrada);
  
  figure;
  subplot(1, 2, 1); imshow(img_original);
  title('Imagem com filtro azul'); 
  subplot(1, 2, 2); imshow(img_filtrada);
  title('Imagem original'); 
  
else
  display('Opção inválida! \n Escolha R, G ou B!')
end
