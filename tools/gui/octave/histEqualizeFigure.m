function histEqualizeFigure (loadimage, im)
  fig = figure("name", "Histogram Equalization");
  ax1 = axes(fig, "position", [0, 0.1, 0.5, 0.9]);
  ax2 = axes(fig, "outerposition", [0.5, 0.1, 0.5, 0.45]);
  ax3 = axes(fig, "outerposition", [0.5, 0.55, 0.5, 0.45]);
  hax = [ax1, ax2, ax3];

  panel = uipanel(fig, "position", [0, 0, 1.0, 0.1]);
  btn = uicontrol(panel, "style", "pushbutton", "string", "Open new image", "units", "normalized", "position", [0, 0, 1, 1]);
  ctrls = [];

  set(btn, "callback", {@reloadImage, fig, hax, ctrls, loadimage});
  set(fig, "userdata", im);
  draw(fig, hax, ctrls);
end

function reloadImage(h, e, fig, hax, ctrls, loadimage)
  set(fig, "userdata", loadimage());
  draw(fig, hax, ctrls);
end

function draw (fig, hax, ctrls)
  im = get(fig, "userdata");

  h = equalizeHistogram(pxlFreq(im));
  im = mapHistogram(im, h);

  axes(hax(1));
  cla();
  imshow(im);

  axes(hax(2));
  cla();
  h = plot(0:255, h', "color", "k");
  if (size(h, 1) == 3)
    set(h(1), "color", "r");
    set(h(2), "color", "g");
    set(h(3), "color", "b");
  end
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
