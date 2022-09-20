function oImage = HistSpec(iImage,iRef)
    %Fungsi Perbaikan Citra dengan metode Histogram Specification
    %   iImage -> gambar yang ingin diubah
    %   iRef -> gambar yang dijadikan referensi
    %   oimage -> output gambar

    %BUTUH PERBAIKAN

    %Check if both image is colored or not
    imgRef = iRef;
    if (size(iImage,3) ~= size(iRef,3))
        if size(iImage,3) == 1
            imgRef = rgb2gray(iRef);
        else
            imgRef = repmat(iRef,[1 1 3]);
        end
    end

%     maxGrayLevel = 255;
%     oImage = zeros(size(iImage,1),size(iImage,2));
%     Isize = size(iImage,1)*size(iImage,2);
    colorDim = size(iImage,3); %var to determine rgb or not (3 if rgb, 1 if gray)

    %finding CDF
    imageF = cumDisFreq(iImage);
    refImgF = cumDisFreq(imgRef);

    %finding closest value
    matrix = repmat(permute(refImgF, [2 1 3]),[1 length(imageF)]);
    [~, closestIdx] = min(abs(matrix-imageF));

    oImage = uint8(zeros(size(iImage,1),size(iImage,2),size(iImage,3)));
    for n3=1:colorDim
        for n1=1:size(iImage,1)
            for n2=1:size(iImage,2)
                oImage(n1,n2,n3) = closestIdx(1,iImage(n1,n2,n3)+1,n3);
            end
        end
    end

%     %map histSpec to original image
%     oImage = uint8(closestIdx(iImage));
%     oRef = refImgF;
end

function result = cumDisFreq(image)
    %finding freq
    result = pxlFreqAlt(image);

    %cumulative freq
    for lvl=1:size(image,3)
        for n=2:size(result,2)
            result(1,n,lvl) = result(1,n,lvl) + result(1,n-1,lvl);
        end
    end

    result = result/(size(image,1)*size(image,2));
    result = result*255;
end

function res = pxlFreqAlt(image)
    %Finding pixel occurence frequency
    res = zeros(1,256,size(image,3));
    for n1=1:size(image,3)
        for n2=1:size(image,1)
            for n3=1:size(image,2)
                res(1,image(n2,n3,n1)+1,n1) = res(1,image(n2,n3,n1)+1,n1) + 1;
            end
        end
    end
end