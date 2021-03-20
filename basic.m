%photo = imread('photo.jpg');
%size(photo)
%[lin, col] = size(photo)
%imshow(photo);

%photo2 = imread('photo2.jpg');
%imshow(photo);

%%
%figure;
%subplot(1, 2, 1); % 1 linha, 2 colunas, pos 1
%imshow(photo);
%subplot(1, 2, 2); % 1 linha, 2 colunas, pos 2
%imshow(photo2);

%%
%figure;
%subplot(2, 1, 1);
%imshow(photo);
%subplot(2, 1, 2);
%imshow(photo2);

%% cinza
clear;
photo = imread('photo3.jpg');
pb = rgb2gray(photo);

e = imrotate(photo, 45, 'nearest');
figure(1); imshow(photo); figure(2); imshow(pb)

%d = imresize(pb, [1000, 1000], 'nearest');
%figure(2); imshow(d);

%y1 = double(xgray);
%y = y1/255;



