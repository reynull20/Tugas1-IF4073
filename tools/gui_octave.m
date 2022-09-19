clear();
addpath "gui/octave";

li = @() loadimage("../img/bard.bmp");
im = li();

histFigure(li, im);
linearFigure(li, im);
logFigure(li, im);
powerFigure(li, im);
contrastStretchFigure(li, im);
histEqualizeFigure(li, im);
histSpecifyFigure(li, im);
