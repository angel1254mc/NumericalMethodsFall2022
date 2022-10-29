% This code seeks to use the matlab norm function to determine whether magenta is closer to pink or purple.
% I'll use the 2-norm on each one using their vector of RGB values, then compare the distance between each norm

magenta = [255, 0, 255];
purple = [128, 0, 128];
pink = [255, 192, 203];

mage_norm = norm(magenta, 2);
purp_norm = norm(purple, 2);
pink_norm = norm(pink, 2);

if (abs(mage_norm - purp_norm) < abs(mage_norm - pink_norm))
    fprintf("Magenta is closer to purple than it is to pink.\n");
elseif (abs(mage_norm - purp_norm) > abs(mage_norm - pink_norm))
    fprintf("Magenta is closer to pink than it is to purple.\n");
else
    fprintf("Magenta is equally as close to pink as it is to purple.\n");
end