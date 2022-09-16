function res = pxlFreq(image)
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

