function im = loadimage (p)
  [fname, fpath, ~] = uigetfile(p);
  fname = cstrcat(fpath, fname);
  im = imread(fname);
end
