function out = equalizeHistogram (h)
  out = cumsum(h, 2);
  out = out .* (255.0 ./ out(:,size(out,2)));
  out = cast(out, 'uint8');
end
