

inputs();

estado();

iniy = margemx*margem_multiy;
inix = 95+margemy*margem_multix;

xscale = elastic("xs", xscale, nxscale, , .3);
yscale = elastic("ys", yscale, nyscale, , .3);

angle = lerp(angle, nangle, .15);

if (instance_exists(obj_seta)){
    with (obj_seta) {
    	paix = obj_player.x;
    	paiy = obj_player.y;
    }
}

if (keyboard_check_pressed(ord("Y"))){
    estado = estado_sobe;
}
