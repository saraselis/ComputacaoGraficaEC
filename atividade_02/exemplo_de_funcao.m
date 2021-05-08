function exemplo_de_funcao(path_imagem_original, graus)
%{
  * Este script rotaciona uma imagem RBG.
  
  Input
  :path_imagem_original: string - caminho para a imagem a ser rotacionada
  :graus: int - grau de rotação
%}

% dados
fprintf('Imagem: %s\n', path_imagem_original);
fprintf('Graus: %d\n', graus);

% imagem original
imagem_original = imread(path_imagem_original);

% criando as máscaras de zeros
w1 = zeros([size(imagem_original,1)*size(imagem_original,2) 1]);
w2 = zeros([size(imagem_original,2)*size(imagem_original,1) 1]);

% modificando o tamanho da imagem
mascara=uint8(zeros([size(imagem_original,1) size(imagem_original,2) 3 ]));

% mxn
m = 1;
n = 1;

% encontrando o ponto médio de ancoragem da imagem
x_medio=ceil((size(mascara,1)+1)/2);
y_medio=ceil((size(mascara,2)+1)/2);

for i=1:size(imagem_original,1)
    i1=i-x_medio;
    for j=1:size(imagem_original,2)
        % convertendo as coordenadas de cartesiana para polar
        [t,r]=cart2pol(i1,j-y_medio);
        
        % convertendo de radianos para graus e adicionando o valor do grau de rotação
        t=deg2rad(rad2deg(t)+graus);

        % convertendo novamente para polar
        [x,y]=pol2cart(t,r);
        w1(m)=round(x+x_medio);
        w2(m)=round(y+y_medio);

        m=m+1;
    end
end


% retirando os valores que estão fora do tamanho da imagem
w1(find(w1 < 1))=1;
w2(find(w2 < 1))=1;

% pegando os pixels correspondentes da imagem original
for i=1:size(imagem_original,1)
    for j=1:size(imagem_original,2)
        mascara(w1(n),w2(n),:)=imagem_original(i,j,:);
        n=n+1;
    end
end

% mostrando resultado
imshow(mascara);