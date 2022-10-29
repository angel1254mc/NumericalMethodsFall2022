
user_color = input("Please provide a color I beg you (in []): ");
image = zeros (601, 601, 3);
image(:, :, 1) = 255; % R
image(:, :, 2) = 218; % G
image(:, :, 3) = 185; % B
% Painted Whole Image Peach Puff

x = 601/2;
y = 601/2;
r = 250;

imshow(image);
