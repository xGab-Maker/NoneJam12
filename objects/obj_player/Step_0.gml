if (global.pause) exit;

inputs();

estado();

iniy = margemx*margem_multiy;
inix = 95+margemy*margem_multix;

xscale = elastic("xs", xscale, nxscale, , .3);
yscale = elastic("ys", yscale, nyscale, , .3);

alp_branco = lerp(alp_branco, 0, .15);

angle = lerp(angle, nangle, .15);

if (instance_exists(obj_seta)){
    with (obj_seta) {
    	paix = obj_player.x;
    	paiy = obj_player.y;
    }
}

if (global.upg.protect > 1 and !instance_exists(obj_bolha) and bolhado == noone){
    cooldown_bolhado--;
    cooldown_bolhado = clamp(cooldown_bolhado, 0, infinity);
    
    if (cooldown_bolhado <= 0){
        bolhado = instance_create_depth(x, y, depth-1, obj_bolha);

        cooldown_bolhado = game_get_speed(gamespeed_fps)*10;
    }
}

if (global.combus_qnt <= 0){
    if (!instance_exists(obj_tela_mortifera)){
        instance_create_layer(0, 0, "Passivas", obj_tela_mortifera);
    }
}