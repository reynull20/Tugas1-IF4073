function out = powerMap (c, gamma)
  out = (linspace(0, 1, 256) .^ gamma) .* 255 .* c;
  out(out <= 0) = 0;
  out(out >= 255) = 255;
  out = cast(out, 'uint8');
end
