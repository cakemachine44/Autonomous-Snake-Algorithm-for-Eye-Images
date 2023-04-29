function cleanedImg = myCleaner(inputImg,rate)
%keep rate=10000

bw=im2bw(inputImg,0.999999999999);

% figure()
% imshow(bw)
% title('bw');

bwClean = bwareaopen(imcomplement(bw), rate);
bwClean=imcomplement(bwClean);

% figure()
% imshow(bwClean)
% title('bwClean');

[r c] = size(bw);

for i=1:r
 for j=1:c
  if bwClean(i,j)==1 
    inputImg(i,j,1)=255; 
    inputImg(i,j,2)=255;  
    inputImg(i,j,3)=255;  
  end
 end
end
   
% figure()
% imshow(bwClean)
% title('bwClean');

figure()
imshow(inputImg)
title('inputImg');

cleanedImg=inputImg;
end