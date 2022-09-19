function logFigure (loadimage, im)
  fig = figure("name", "Log Histogram");
  ax1 = axes(fig, "position", [0, 0.2, 0.5, 0.8]);
  ax2 = axes(fig, "outerposition", [0.5, 0.2, 0.5, 0.4]);
  ax3 = axes(fig, "outerposition", [0.5, 0.6, 0.5, 0.4]);
  hax = [ax1, ax2, ax3];

  panel = uipanel(fig, "position", [0, 0, 1.0, 0.2]);
  btn = uicontrol(panel, "style", "pushbutton", "string", "Open new image", "units", "normalized", "position", [0, 0, 1, 0.5]);
  uicontrol(panel, "style", "text", "string", "C:", "units", "normalized", "position", [0, 0.5, 0.025, 0.5], "horizontalalignment", "left");
  txt1 = uicontrol(panel, "style", "edit", "string", "1", "units", "normalized", "position", [0.025, 0.5, 0.975, 0.5], "horizontalalignment", "left");
  ctrls = [txt1];

  set(btn, "callback", {@reloadImage, fig, hax, ctrls, loadimage});
  cb = {@update, fig, hax, ctrls};
  set(txt1, "callback", cb);

  set(fig, "userdata", im);
  draw(fig, hax, ctrls);
end

function reloadImage(h, e, fig, hax, ctrls, loadimage)
  set(fig, "userdata", loadimage());
  draw(fig, hax, ctrls);
end

function update(h, e, fig, hax, ctrls)
  draw(fig, hax, ctrls);
end

function draw (fig, hax, ctrls)
  im = get(fig, "userdata");
  c = real(str2double(get(ctrls(1), "string")));

  h = logMap(c);
  if (ndims(im) == 3)
    h = cat(1,h,h,h);
  end
  im = mapHistogram(im, h);

  axes(hax(1));
  cla();
  imshow(im);

  axes(hax(2));
  cla();
  plot(0:255, h, "color", "k");
  xlim([0, 255]);
  ylim([0, 255]);

  axes(hax(3));
  cla();
  h = bar(0:255, pxlFreq(im)', "hist", "linestyle", "none", "facecolor", "k");
  if (size(h, 1) == 3)
    set(h(1), "facecolor", "r");
    set(h(2), "facecolor", "g");
    set(h(3), "facecolor", "b");
  end
  xlim([0, 255]);

  refresh(fig);
end
