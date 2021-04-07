function y = parte2(~)
  %recebendo o input já em escala de cinza
  x = imread('hualian5.jpg');
  
  % calculando a media dos pixels da imagem
  val_media_pixels = mean(x(:));
  
  % colocando a entrada em numeros reais 
  x = double(x);
  x = x/255;
  
  %%%% definindo se a imagem é mais clara ou escura %%%%
  % foi acordado que 128 seria o valor de referência para fazer a decisão
  
  if val_media_pixels > 128
    %imagem mais clara
    % valor de gama deve ser maior q 1
    y = x.^(1.5);
    
    
    subplot(1,2,1);
    imshow(x);
    title('imagem binária');

    subplot(1,2,2);
    imshow(y);
    title('escurecendo');
  
  else
    % imagem mais escura
    %valor de gama deve ser menor q 1 e maior q 0
    y = x.^(0.5);
    
    subplot(1,2,1);
    imshow(x);
    title('imagem binária');

    subplot(1,2,2);
    imshow(y);
    title('iluminando');
    
  end
  
end