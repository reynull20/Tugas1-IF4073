function out = logMap (c)
  out = log1p(0:255) / log(c);
  out(out <= 0) = 0;
  out(out >= 255) = 255;
  out = cast(out, 'uint8');
end
