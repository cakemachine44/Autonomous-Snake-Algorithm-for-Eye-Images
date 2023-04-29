function noPupilImg = centerFinder(inputImg)

% figure()
% imshow(inputImg)
% title('Orginal Eye');

low = 0.4;
high = 0.9;
K = imadjust(inputImg,[low high],[]); % I is double
b = imsharpen(K,'Radius',15,'Amount',10);

% figure()
% imshow(b)
% title('b ');

bw=im2bw(b,0.05);

% figure()
% imshow(bw)
% title('bw Eye');

windowSize = 51;
kernel = ones(windowSize) / windowSize ^ 2;
blurryImage = conv2(single(bw), kernel, 'same');
bw = blurryImage > 0.5; % Rethreshold

% figure()
% imshow(bw)
% title('cir Eye');

% d=imdistline;
[centers, radii] = imfindcircles(bw,[100 150],'ObjectPolarity','dark','Sensitivity',0.92);
numCircles = length(centers);
% viscircles(centers, radii,'EdgeColor','b');

[MaxRadii,MaxRadiiIndex]=max(radii);
bigCircleCenter=centers(MaxRadiiIndex,:);

x=bigCircleCenter(2);
y=bigCircleCenter(1);
MaxRadii=MaxRadii-25; 

noPupilImg=[x,y,MaxRadii];
end