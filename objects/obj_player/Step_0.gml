depth = -y;

inputs();
move();

iniy = margemx*margem_multiy;
inix = 108+margemy*margem_multix;

x = lerp(x, inix+indicex*margemx, .15);
y = lerp(y, iniy+indicey*margemy, .15);

cooldown_atira--;
cooldown_atira = clamp(cooldown_atira, 0, infinity);

if (mouse_check_button(mb_left) and cooldown_atira <= 0){
    atira();
    
    cooldown_atira = game_get_speed(gamespeed_fps)*.4;
}

xscale = lerp(xscale, nxscale, .15);
yscale = lerp(yscale, nyscale, .15);

angle = lerp(angle, nangle, .15);

if (instance_exists(obj_seta)){
    with (obj_seta) {
    	paix = obj_player.x;
    	paiy = obj_player.y;
    }
}