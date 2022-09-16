function transformedImage = EqHist(image)
    %Butuh Perbaikan

    maxGrayLevel = 255;
    Isize = size(image,1)*size(image,2);
    colorDim = size(image,3); %var to determine rgb or not (3 if rgb, 1 if gray)

    %finding freq
    f = pxlFreq(image);

    %cumulative freq
    for lvl=1:colorDim
        for n=2:size(f,2)
            f(1,n,lvl) = f(1,n,lvl) + f(1,n-1,lvl);
        end
    end

    %map to grayscale level
    f = f/Isize;
    f = round(f*maxGrayLevel);

    %transform the image
    transformedImage = uint8(zeros(size(image,1),size(image,2),colorDim));
    for lvl=1:colorDim
        for n1=1:size(image,1)
            for n2=1:size(image,2)
                transformedImage(n1,n2,lvl) = f(1,image(n1,n2,lvl)+1,lvl);
            end
        end
    end
end