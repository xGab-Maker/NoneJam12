if (global.pause) exit;

spd = lerp(spd, 7, .1);

hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

image_xscale = clamp(image_xscale, 1, 2);
image_yscale = clamp(image_yscale, .5, 1.5);

x += hspd;
y += vspd;

image_angle = dir+90;