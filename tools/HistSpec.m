function [oImage,oRef] = HistSpec(iImage,iRef)
    %Fungsi Perbaikan Citra dengan metode Histogram Specification
    %   iImage -> gambar yang ingin diubah
    %   iRef -> gambar yang dijadikan referensi
    %   oimage -> output gambar

    %BUTUH PERBAIKAN

    %Check if both image is colored or not
    if (size(iImage,3) ~= size(iRef,3))
        msg = 'one image is in rgb and the other is in b&w';
        error(msg)
    end

    maxGrayLevel = 255;
    oImage = zeros(size(iImage,1),size(iImage,2));
    Isize = size(iImage,1)*size(iImage,2);
    colorDim = size(iImage,3); %var to determine rgb or not (3 if rgb, 1 if gray)

    %finding CDF
    imageF = cumDisFreq(iImage);
    refImgF = cumDisFreq(iRef);

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
    oRef = refImgF;
end

