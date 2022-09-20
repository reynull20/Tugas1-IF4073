function imgOutput = imgBright  (img,a,b)
    %IMGBRIGHTMULT Summary of this function goes here
    %   Detailed explanation goes here
    imgOutput = img*a + b;
    imgOutput(imgOutput >= 255) = 255;
    imgOutput(imgOutput <= 0) = 0;
end

