function histFigure (loadimage, im)
  fig = figure("name", "Image Histogram");
  ax1 = axes(fig, "position", [0, 0.1, 0.5, 0.9]);
  ax2 = axes(fig, "outerposition", [0.5, 0.1, 0.5, 0.9]);
  hax = [ax1, ax2];

  panel = uipanel(fig, "position", [0, 0, 1.0, 0.1]);
  btn = uicontrol(panel, "style", "pushbutton", "string", "Open new image", "units", "normalized", "position", [0, 0, 1, 1], "callback", {@reloadImage, fig, hax, loadimage});

  set(fig, "userdata", im);
  draw(fig, hax);
end

function reloadImage(h, e, fig, hax, loadimage)
  set(fig, "userdata", loadimage());
  draw(fig, hax);
end

function draw (fig, hax)
  im = get(fig, "userdata");
  axes(hax(1));
  cla();
  imshow(im);

  axes(hax(2));
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
