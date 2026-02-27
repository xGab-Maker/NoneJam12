depth = -y;

colide_invert();

x += hspd;
y += vspd;

angle = point_direction(0, 0, hspd, vspd);

xscale = elastic("xs", xscale, xscale_obj);
yscale = elastic("xs", yscale, yscale_obj);

switch (tipo) {
	case PODER.PERF: image_alpha = .5 break;
}