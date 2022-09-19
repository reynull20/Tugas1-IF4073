function out = specifyHistogram (h, g)
  h_s = cumsum(h, 2);
  h_s = h_s ./ h_s(:,size(h_s,2));
  g_s = cumsum(g, 2);
  g_s = g_s ./ g_s(:,size(g_s,2));
  out = zeros(size(h_s));
  for i = 1:size(h_s,1)
    out(i,:) = lookup(g_s(i,:), h_s(i,:), 'r');
  end
  out = cast(out, 'uint8');
end
