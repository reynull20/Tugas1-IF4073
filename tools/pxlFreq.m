function ret = pxlFreq(image)
  if (ndims(image) == 3)
    ret = zeros(3,256);
    % Optimize using sum()
    for b = 1:256
      temp = (image >= b) & (image < (b + 1));
      temp = reshape(temp, 1, [], size(image, 3));
      ret(:,b) = sum(temp, 2);
    end
  else
    ret = zeros(1,256);
    % Optimize using sum()
    for b = 1:256
      temp = (image >= b) & (image < (b + 1));
      temp = reshape(temp, 1, []);
      ret(1,b) = sum(temp, 2);
    end
  end
end
