clear all, close all, clc;

gamma = 2.2;

%Read original and target images
origimg = imread([pwd filesep '1000.png']);
targetimg = imread([pwd filesep '70.png']);

%Convert them to double and remove gamma
linorigimg = (double(origimg)/255).^(gamma);
lintargetimg = (double(targetimg)/255).^(gamma);

%Calculate compensation image
lindiff = lintargetimg-linorigimg;
lindiff(lindiff<0) = 0;
diff = uint8((lindiff.^(1/gamma))*255);

figure,imshow(diff);

%imwrite(diff,[pwd filesep 'compensation.png'])