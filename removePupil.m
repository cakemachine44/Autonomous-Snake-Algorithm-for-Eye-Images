function test = removePupil(inputImg)

inputImageCopy=inputImg;
inputImageCopy2=inputImg;
inputImageCopy3=inputImg;

% figure()
% imshow(inputImg)
% title('Orginal Eye IN REMOVEPUPIL');

low = 0.4;
high = 0.9;
K = imadjust(inputImg,[low high],[]); % I is double
b = imsharpen(K,'Radius',15,'Amount',10);

bb = imsharpen(K,'Radius',1,'Amount',2);

% figure()
% imshow(b)
% title('b ');

bw=im2bw(b,0.05);
bw2=im2bw(bb,0.05);

bw2 = bwareaopen(imcomplement(bw2), 10000);
bw2=imcomplement(bw2);

% figure()
% imshow(bw);
% title('bw pupil');

% figure()
% imshow(bw2);
% title('bw2 pupil');

[r c] = size(bw);

for i=1:r
    for j=1:c
        if bw2(i,j)== 1
            inputImageCopy(i,j,1)=255;
            inputImageCopy(i,j,2)=255;
            inputImageCopy(i,j,3)=255;
        end
    end
end

for i=1:r
    for j=1:c
        if inputImageCopy(i,j)~= 255
            inputImageCopy2(i,j,1)=255;
            inputImageCopy2(i,j,2)=255;
            inputImageCopy2(i,j,3)=255;
        end
    end
end

% figure()
% imshow(inputImageCopy2);
% title('inputImageCopy2');

cc = centerFinder(inputImageCopy3);

for i=1:r
    for j=1:c
        if sqrt((cc(1)-i)^2+(cc(2)-j)^2)<=cc(3)
            inputImageCopy2(i,j,1)=255;
            inputImageCopy2(i,j,2)=255;
            inputImageCopy2(i,j,3)=255;
        end
    end
end

% figure()
% imshow(inputImageCopy2);
% title('end');

test=inputImageCopy2;
end

