% Code by Tejas K
% Feb 2018



% creare a function
function [ images ] = Rsize( directory )
data = cd(directory);          % Here paste your link to the directory/ else it will access your current folder linked in MATLAB

%imagefiles = dir(fullfile(data, '*.tiff');
imagefiles = dir(data, '*.tiff');    % read all the .tiff images, change to .jpg if all images in ur folder are in .jpg format
nfiles = length(imagefiles);   % Num of images in ur folder, loop that many times.
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;  % ii is each image.
   currentimage = imread(currentfilename);
   currentimage = imresize(currentimage, [64 64]); % Resize the image into 64 x 64 cells/ images
   images{ii} = currentimage;  % {} shows that cells are being created for each image. Cell is nothing but duplicated parts of the original images stored in "cell" format
end
                                       % read up on cells in MATLAB.
row=64; col=64; counti=0; countj=0;
Blocks2 = cell(48,48);                    % divide the 64 x 64 image into n num of 48x48 images. That is each image is duplicated into 16 other images.
for ii = 1: nfiles                        % the division can be made any way depending on your need. Can divide each image into 8x8 cells, 3249 images can be formed in one image that way.
    i2=images{ii};
 for i=1:row-47
   
%     for j=1:col-47
%         if (i == j)
        counti=counti+1;
        Blocks2{counti} = i2(i:i+47,i:i+47); % Cells are created in the name of Blocks2. For ex: if u write Blocks2{14} 14th picture among 16 divided pictures will pop up.
        %end
       % imwrite(Blocks2{counti},sprintf('surprise%d.jpg' ,counti));   % disablethis coomand to save each image into your directory.
        
%     end
end
end


end

