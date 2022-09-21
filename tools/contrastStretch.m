function out = contrastStretch (h)
  if (size(h, 1) ~= 1)
    out = zeros(size(h), "uint8");
    for i = 1:size(h,1)
      out(i,:) = contrastStretch(h(i,:));
    end
    return
  end
  ix = find(h);
  if (prod(size(ix)) == 0)
    out = 0:255;
  else
    rmin = min(ix);
    rmax = max(ix);
    a = 255 / (rmax - rmin);
    b = -rmin * a;
    out = linearMap(a, b);
  end
end
