depth = -y;

inputs();
move();

iniy = margemx*margem_multiy;
inix = 95+margemy*margem_multix;

x = lerp(x, inix+indicex*margemx, .15);
y = lerp(y, iniy+indicey*margemy, .15);

xscale = lerp(xscale, nxscale, .15);
yscale = lerp(yscale, nyscale, .15);

angle = lerp(angle, nangle, .15);

if (instance_exists(obj_seta)){
    with (obj_seta) {
    	paix = obj_player.x;
    	paiy = obj_player.y;
    }
}