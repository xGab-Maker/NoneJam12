depth = -y;

colide_invert();

x += hspd;
y += vspd;

angle = point_direction(0, 0, hspd, vspd);

xscale = elastic("xs", xscale, 1);
yscale = elastic("xs", yscale, 1);