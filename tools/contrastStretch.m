function out = contrastStretch (h)
  ix = find(h);
  if (prod(size(ix)) == 0)
    out = 0:255;
  else
    rmin = min(ix);
    rmax = max(ix);
    a = 255 / (rmax - rmin);
    b = rmin * a;
    out = linearMap(a, b);
  end
end
