function out = specifyHistogram (h, g)
  h_s = cumsum(h, 2);
  h_s = h_s ./ h_s(:,size(h_s,2));
  g_s = cumsum(g, 2);
  g_s = g_s ./ g_s(:,size(g_s,2));
  if (size(h_s, 1) < size(g_s, 1))
    h_s = repmat(h_s, size(g_s, 1), 1);
  elseif (size(h_s, 1) > size(g_s, 1))
    g_s = repmat(g_s, size(h_s, 1), 1);
  end
  g_s = permute(g_s, [1,3,2]);
  sz = size(h_s,2);
  out = sz - sum(h_s < g_s, 3);
  out(out > sz) = sz;
  out = cast(out, 'uint8');
end
