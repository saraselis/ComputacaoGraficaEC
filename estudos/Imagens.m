clc;
clear all;
close all;
%% Porcessamento de imagens
% help images
%mathworks -->  images

B = imread('eight.tif');
figure
imshow(B)

A = imread('Imagem_1.jpg');
figure
imshow(A);

%% tamanho
B = imread('eight.tif');
% figure
% imshow(B)
size(B);
[lin, col] = size(B);

A = imread('Imagem_1.jpg');
size(A);
[lin, col,plan] = size(A)

figure
subplot(2,1,1)
imshow(A);
subplot(2,1,2)
imshow(B);

%% Histograma
B = imread('eight.tif');
figure
imhist(B);

%% escurecer imagem
B =B-100;
imshow(B);
%%
A = imread('Imagem_1.jpg');
% figure 
% subplot(3,1,1)
% imshow(A);
% A = A-100;
% subplot(3,1,2)
% imshow(A);
% A = A+100;
% subplot(3,1,3)
 A = A+100;
figure
imshow(A);
%
B = imread('eight.tif');
figure
imhist(B);

% escurecer imagem
B =B-100;
figure
imhist(B);

mean2(B);
std2(B);

%% deixar imagem preto e branco
A = imread('planeta.jpg');
% imshow(A)
pb = im2bw(A,0.5);
imshow(pb);
cinza = rgb2gray(A);
imshow(cinza)
%
B = imread('Imagem_1.jpg');
cinza = rgb2gray(B);
imshow(cinza)
%% tamanho
D = imresize(B,10,'nearest');
imshow(D)
%%
C = imresize(B,[1800 2200],'bilinear');
imshow(C)

E = imrotate(B,180,'nearest');
imshow(E);
%%
clear all;
%% Ruídos
B = imread('Imagem_1.jpg');
Q = imnoise(B, 'gaussian');

figure
subplot(2,2,1)
imshow(B)
subplot(2,2,2)
Q = imnoise(B, 'gaussian');
imshow(Q)
subplot(2,2,3)
Q = imnoise(B, 'salt & pepper');
imshow(Q)
subplot(2,2,4)
Q = imnoise(B, 'speckle');
imshow(Q)

%% filtro
J = imread('peppers.png');
figure
subplot(2,1,1)
imshow(Q);
h = [1 5 1;1 0 1; -1 -5 -1];
I = imfilter(Q,h);
subplot(2,1,2)
imshow(I);
