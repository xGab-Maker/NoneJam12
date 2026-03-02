if (global.pause) exit;

cooldown_morre--;
cooldown_morre = clamp(cooldown_morre, 0, infinity);

if (cooldown_morre > 0){
    spd += .01;
    
    if (instance_exists(obj_player)){
        var _dir = point_direction(x, y, obj_player.x, obj_player.y);
        var _diff = angle_difference(_dir, image_angle);
        
        image_angle += _diff*.05;
        
        hspd = lengthdir_x(spd, image_angle);
        vspd = lengthdir_y(spd, image_angle);
    }
    
    cooldown_part--;
    cooldown_part = clamp(cooldown_part, 0, infinity);
    
    if (cooldown_part <= 0) {
        cria_particula(choose(spr_part_fumaca, spr_part_fumaca2), x-lengthdir_x(sprite_width/2, direction), y-lengthdir_y(sprite_height/2, direction), depth+1, false, noone);
        
        cooldown_part = game_get_speed(gamespeed_fps)*.2;
    }
}else{
    hspd = lerp(hspd, 0, .15);
    vspd = lerp(vspd, 0, .15);
    
    if (point_distance(hspd, vspd, 0, 0) <= .01){
        instance_destroy(self);
    }
}

image_xscale = clamp(image_xscale, .5, 1.5);
image_yscale = clamp(image_yscale, .5, 1.5);

x += hspd;
y += vspd;