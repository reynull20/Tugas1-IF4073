function out = linearMap(a, b)
  out = b + 0:255 .* a;
  out(out <= 0) = 0;
  out(out >= 255) = 255;
  out = cast(out, 'uint8');
end
