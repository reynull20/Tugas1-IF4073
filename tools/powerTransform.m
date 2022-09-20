function imgOutput = powerTransform(img,c,y)
    %POWERTRANSFORM Summary of this function goes here
    %   Detailed explanation goes here
    imgOutput = c * power(double(img),y);
%     imgOutput = zeros(size(img,1),size(img,2),size(img,3));
%     for n3=1:size(img,3)
%         for n2=1:size(img,2)
%             for n1=1:size(img,1)
%                 imgOutput(n1,n2,n3) = c * power(double(img(n1,n2,n3)),y);
%             end
%         end
%     end
    imgOutput = uint8(imgOutput);
    imgOutput(imgOutput >= 255) = 255;
    imgOutput(imgOutput <= 0) = 0;
end

