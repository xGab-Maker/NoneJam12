depth = -9999;

image_alpha = 0;

randomize();

sprite_index = choose(spr_heli_amarelo, spr_heli_vermleho);

estado = noone;

spd  = 4;
vspd = 0;
hspd = 0;

pointx = 0;
pointy = 0;

xscale = 1;
yscale = 1;
angle  = 0;

al_white = 0;

multi_x = 1;

vida = 0;

multi_y = 1;

grav = .2;

vida      = 3+global.numwave;
vida_perd = 0;

vida_predio = noone;

cai_pont = 0;

suba = false;

cooldown_muda  = game_get_speed(gamespeed_fps);
cooldown_atira = game_get_speed(gamespeed_fps)*2;

anda = function()
{
    var _xobj = 208+(pointx*32);
    var _yobj = 96+(pointy*32);
    
    var _dir = point_direction(x, y, _xobj, _yobj);
    
    hspd = lerp(hspd, lengthdir_x(spd, _dir), .15);
    vspd = lerp(vspd, lengthdir_y(spd, _dir), .15);
    
    if (point_distance(x, y, _xobj, _yobj) <= 2){
        estado = estado_para;
    }
}

para = function()
{
    hspd = lerp(hspd, 0, .15);        
    vspd = lerp(vspd, 0, .15);    
    
    cooldown_muda--;
    cooldown_muda = clamp(cooldown_muda, 0, infinity);
    
    if (cooldown_muda <= 0){
        estado = estado_anda;
        
        pointx = irandom_range(1, array_length(global.mapa[0])-2);
        pointy = irandom_range(1, array_length(global.mapa)-2);
        
        cooldown_muda = game_get_speed(gamespeed_fps)*random_range(1, 3);
    }    
}

atira = function()
{
    switch (sprite_index) {
    	case spr_heli_amarelo:
            cooldown_atira--;
            cooldown_atira = clamp(cooldown_atira, 0, infinity);
            
            if (cooldown_atira <= 0){
                if (instance_exists(obj_player)){
                    if (obj_player.estado == obj_player.estado_move){
                        var _rand = random_range(-10, 10);
                        
                        var _dir = point_direction(x, y, obj_player.x, obj_player.y);
                        
                        var _tiro = instance_create_depth(x-(21*multi_x)+lengthdir_x(10, _dir),y+(10)+lengthdir_y(10, _dir), depth-1, obj_tiro_heli_amr);
                        
                        xscale -= .2;
                        yscale += .3;
                        
                        al_white = .2;
                        
                        with (_tiro) {
                        	spd = 1.5;
                            dir = _dir+_rand;
                            image_angle = dir+90;
                            image_xscale = 1;
                            image_yscale = 1;
                        }
                        
                        cooldown_atira = game_get_speed(gamespeed_fps)*.8;
                    }
                }
            }
        break;
        
        case spr_heli_vermleho:
            cooldown_atira--;
            cooldown_atira = clamp(cooldown_atira, 0, infinity);
            
            if (cooldown_atira <= 0 and !instance_exists(obj_tiro_heli_verm)){
                if (instance_exists(obj_player)){
                    if (obj_player.estado == obj_player.estado_move){
                        var _rand = random_range(-10, 10);
                        
                        var _dir = point_direction(x, y, obj_player.x, obj_player.y);
                        
                        var _tiro = instance_create_depth(x+lengthdir_x(5, _dir), y+lengthdir_y(5, _dir), depth+1, obj_tiro_heli_verm);
                        
                        xscale -= .2;
                        yscale += .3;
                        
                        with (_tiro) {
                        	spd = 1.5;
                        }
                        
                        cooldown_atira = game_get_speed(gamespeed_fps)*.8;
                    }
                }
            }
        break;
    }

}

estado_anda = function() 
{
    anda();
    
    if (instance_exists(obj_player)){
        var _px = obj_player.x;
        
        if (_px < x){
            if (multi_x == -1){
                xscale += .1;
                yscale -= .1;
            }
            
            multi_x = 1;
        }else if (_px > x){
            if (multi_x == 1){
                xscale += .1;
                yscale -= .1;
            }
            
            multi_x = -1;
        }
    }
}

estado_para = function()
{
    para();
    
    if (instance_exists(obj_player)){
        var _px = obj_player.x;
        
        if (_px < x){
            if (multi_x == -1){
                xscale += .1;
                yscale -= .1;
            }
            
            multi_x = 1;
        }else if (_px > x){
            if (multi_x == 1){
                xscale += .1;
                yscale -= .1;
            }
            
            multi_x = -1;
        }
    }
}

estado_morre_sobe = function()
{
    hspd = lerp(hspd, 0, .15);
    vspd = lerp(vspd, 0, .1);
    
    if (vspd >= -.05){
        multi_y = -1;
        
        xscale = 1.4;
        yscale = .7;
        
        cai_pont = y+50;
        
        estado = estado_morre_desce;
    }
}

estado_morre_desce = function()
{
    hspd = lerp(hspd, 0, .15);
    
    vspd += grav;
    
    if (y >= cai_pont){
        instance_destroy(self);
    }
}


estado = estado_para;