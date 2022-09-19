function out = logMap (c)
  out = log1p(linspace(0, 1, 256)) .* (255 / log(2)) .* c;
  out(out <= 0) = 0;
  out(out >= 255) = 255;
  out = cast(out, 'uint8');
end
