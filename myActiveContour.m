function contouredImg = myActiveContour(inputImg,Iterations)
%keep Iterations=1000

grayEye=rgb2gray(inputImg);
% figure()
% imshow(grayEye)
% title('Gray Eye');

% Active contour
mask = zeros(size(grayEye));
mask(25:end-25,25:end-25) = 1;
% imshow(mask)
% title('Initial Contour Location')

bw = activecontour(grayEye,mask,Iterations);

% figure()
% imshow(bw)
% title('Segmented Image, ?? Iterations')

%Extractiing exterior eye
[r c] = size(bw);

for i=1:r
    for j=1:c
        if bw(i,j)== 0
            inputImg(i,j,1)=255;
            inputImg(i,j,2)=255;
            inputImg(i,j,3)=255;
        end
    end
end

% figure()
% imshow(inputImg)
% title('Contoured and Cropped Image');
contouredImg=inputImg;
end