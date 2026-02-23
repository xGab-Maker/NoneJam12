depth = -y;

colide_invert();

x += hspd;
y += vspd;

xscale = elastic("xs", xscale, 1);
yscale = elastic("xs", yscale, 1);