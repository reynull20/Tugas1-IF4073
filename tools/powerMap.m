function out = powerMap (c, gamma)
  out = c .* (0:255 .^ gamma);
  out(out <= 0) = 0;
  out(out >= 255) = 255;
  out = cast(out, 'uint8');
end
