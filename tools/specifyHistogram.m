function out = specifyHistogram (h, g)
  h_s = cumsum(h);
  h_s = h_s / h_s(columns(h_s));
  g_s = cumsum(g);
  g_s = g_s / g_s(columns(g_s));
  out = lookup(g_s, h_s, 'l') - 1;
  out = cast(out, 'uint8');
end
