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

  % removendo os espectros azul e verde
  img_filtrada(:, :, 2) = 0;
  img_filtrada(:, :, 3) = 0;

  figure;
  subplot(1, 2, 1); imshow(img_filtrada);
  title('Imagem com filtro vermelho'); ylabel(path_img_original);
  subplot(1, 2, 2); imshow(img_original);
  title('Imagem original'); ylabel(path_img_original);

elseif cor_escolhida == 'g'
  display('Filtro verde escolhido!')
  img_filtrada = img_original;

  % removendo os espectros azul e vermelho
  img_filtrada(:, :, 1) = 0;
  img_filtrada(:, :, 3) = 0;
  
  figure;
  subplot(1, 2, 1); imshow(img_filtrada);
  title('Imagem com filtro verde'); ylabel(path_img_original);
  subplot(1, 2, 2); imshow(img_original);
  title('Imagem original'); ylabel(path_img_original);

elseif cor_escolhida == 'b'
  display('Filtro azul escolhido!')
  img_filtrada = img_original;
  
  % removendo os espectros verde e vermelho
  img_filtrada(:, :, 1) = 0;
  img_filtrada(:, :, 2) = 0;
  
  figure;
  subplot(1, 2, 1); imshow(img_filtrada);
  title('Imagem com filtro azul'); ylabel(path_img_original);
  subplot(1, 2, 2); imshow(img_original);
  title('Imagem original'); ylabel(path_img_original);
  
else
  display('Opção inválida! \n Escolha R, G ou B!')
end