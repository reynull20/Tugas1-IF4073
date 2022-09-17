
% Get image
[fname, fpath, ~] = uigetfile('*.bmp');
fname = cstrcat(fpath, fname);
im = imread(fname);

% Convert to grayscale
if (ndims(im) == 3)
  im = rgb2gray(im);
end

% Show image and histogram
figure();
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
h = pxlFreq(im);
bar(0:255, h);
xlim([0,255]);

% Contrast stretch
h_ = contrastStretch(h);
im_ = mapHistogram(im, h_);
figure();
subplot(2,2,[1,3]);
imshow(im_);
subplot(2,2,2);
plot(linspace(0,1,size(h_,2)), cast(h_, 'double') / 255);
xlim([0,1]);
subplot(2,2,4);
bar(0:255, pxlFreq(im_));
xlim([0,255]);

% Histogram equalization
h_ = equalizeHistogram(h);
im_ = mapHistogram(im, h_);
figure();
subplot(2,2,[1,3]);
imshow(im_);
subplot(2,2,2);
plot(linspace(0,1,size(h_,2)), cast(h_, 'double') / 255);
xlim([0,1]);
subplot(2,2,4);
bar(0:255, pxlFreq(im_));
xlim([0,255]);

% Get second image
[fname, fpath, ~] = uigetfile('*.bmp');
fname = cstrcat(fpath, fname);
im2 = imread(fname);

% Histogram specification
h_ = specifyHistogram(h, pxlFreq(im2));
im_ = mapHistogram(im, h_);
figure();
subplot(2,2,1);
imshow(im2);
subplot(2,2,3);
imshow(im_);
subplot(2,2,2);
plot(linspace(0,1,size(h_,2)), cast(h_, 'double') / 255);
xlim([0,1]);
subplot(2,2,4);
bar(0:255, pxlFreq(im_));
xlim([0,255]);
