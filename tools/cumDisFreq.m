function result = cumDisFreq(image)
    %finding freq
    result = pxlFreq(image);

    %cumulative freq
    for lvl=1:size(image,3)
        for n=2:size(result,2)
            result(1,n,lvl) = result(1,n,lvl) + result(1,n-1,lvl);
        end
    end

    result = result/(size(image,1)*size(image,2));
    result = result*255;
end

