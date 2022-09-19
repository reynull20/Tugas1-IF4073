function histSpecifyFigure (loadimage, im)
  im2 = loadimage();
  fig = figure("name", "Histogram Sepcification");
  ax1 = axes(fig, "position", [0, 0.1, 0.5, 0.45]);
  ax2 = axes(fig, "position", [0, 0.55, 0.5, 0.45]);
  ax3 = axes(fig, "outerposition", [0.5, 0.1, 0.5, 0.45]);
  ax4 = axes(fig, "outerposition", [0.5, 0.55, 0.5, 0.45]);
  hax = [ax1, ax2, ax3, ax4];

  panel = uipanel(fig, "position", [0, 0, 1.0, 0.1]);
  btn1 = uicontrol(panel, "style", "pushbutton", "string", "Open new image", "units", "normalized", "position", [0, 0, 0.5, 1]);
  btn2 = uicontrol(panel, "style", "pushbutton", "string", "Open specification image", "units", "normalized", "position", [0.5, 0, 0.5, 1]);
  ctrls = [];

  set(btn1, "callback", {@reloadImage, fig, hax, ctrls, loadimage, 1});
  set(btn2, "callback", {@reloadImage, fig, hax, ctrls, loadimage, 2});
  set(fig, "userdata", {im, im2});
  draw(fig, hax, ctrls);
end

function reloadImage(h, e, fig, hax, ctrls, loadimage, idx)
  a = get(fig, "userdata");
  a{idx} = loadimage();
  set(fig, "userdata", a);
  draw(fig, hax, ctrls);
end

function draw (fig, hax, ctrls)
  a = get(fig, "userdata");
  im = a{1};
  im2 = a{2};

  h = specifyHistogram(pxlFreq(im), pxlFreq(im2));
  im = mapHistogram(im, h);

  axes(hax(1));
  cla();
  imshow(im2);

  axes(hax(2));
  cla();
  imshow(im);

  axes(hax(3));
  cla();
  h = plot(0:255, h', "color", "k");
  if (size(h, 1) == 3)
    set(h(1), "color", "r");
    set(h(2), "color", "g");
    set(h(3), "color", "b");
  end
  xlim([0, 255]);
  ylim([0, 255]);

  axes(hax(4));
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
