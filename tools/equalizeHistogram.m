function out = equalizeHistogram (h)
  out = cumsum(h);
  out = out * (255.0 / out(columns(out)));
  out = cast(out, 'uint8');
end
