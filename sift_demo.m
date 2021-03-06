clear all;
close all;
clc;

run('C:\Users\Dilin\Documents\MATLAB\vlfeat-0.9.20\toolbox\vl_setup');

I1 = imread('C:\Users\Dilin\Documents\MATLAB\machine vision\project2\shanghai\shanghai01.jpg');
I1g = single(rgb2gray(I1));
I2 = imread('C:\Users\Dilin\Documents\MATLAB\machine vision\project2\shanghai\shanghai02.jpg');
I2g = single(rgb2gray(I2));

[F1,D1] = vl_sift(I1g);
[F2,D2] = vl_sift(I2g);

figure;
imshow(I1);
hold on;
scatter(F1(1,:),F1(2,:));

matches = vl_ubcmatch(D1,D2);

pts1 = F1(1:2,matches(1,:));
pts2 = F2(1:2,matches(2,:));

Iss = zeros(size(I1g,1),2*size(I1g,2),3);
figure;
Iss(1:size(I1g,1),1:size(I2g,2),:) = I1;
Iss(1:size(I1g,1),1+size(I2g,2):size(Iss,2),:) = I2;
imshow(uint8(Iss));
hold on;
o = size(I1g,2) ;
line([pts1(1,:);pts2(1,:)+o], ...
     [pts1(2,:);pts2(2,:)]) ;
title(sprintf('Matches')) ;
axis image off ;

[H,ni,nf,e] = ransacH(pts1,pts2,0.2,2,4000);
tform = projective2d(H');
% tform = estimateGeometricTransform(X1(1:2,:)',X2(1:2,:)','projective');
RI1 = imref2d(size(I1));
RI2 = imref2d(size(I2));
[I3,RI3] = imwarp(I1,RI1,tform);
figure;
I = imfuse(I2,RI2,I3,RI3,'blend');
imshow(I);