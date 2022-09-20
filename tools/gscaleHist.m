function OHist = gscaleHist(img)
    if size(img,3) == 3
        gImg = rgb2gray(img);
        OHist = pxlFreq(gImg);
    else
        OHist = pxlFreq(img);
    end
end

