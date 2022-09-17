function out = mapHistogram(image, map)
  if (ndims(image) == 3)
    out = zeros(size(image), 'like', image);
    for i = 1:size(image, 3)
      m = map(i,:);
      out(:,:,i) = m(image(:,:,i) + 1);
    end
  else
    out = map(image + 1);
  end
end
