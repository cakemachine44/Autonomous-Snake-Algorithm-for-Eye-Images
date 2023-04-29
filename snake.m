tic
originalEye = imread('P6a.png'); % P2a,P3a,P4a,P5a,P6a
figure()
imshow(originalEye)
title('Orginal Eye');

contouredEye = myActiveContour(originalEye,1000); 

test = removePupil(contouredEye);
 
cleanedImg = myCleaner(test,10000);

toc

