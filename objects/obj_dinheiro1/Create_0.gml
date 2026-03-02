estado = noone;

pontox = 20;
pontoy = 169;

off_depth = false;

ind = 0;

spd  = 0;
hspd = 0;
vspd = 0;

last_speed = speed;

vspd = -random_range(2, 4);

estado_sobe = function()
{
    vspd = lerp(vspd, 0, .1);
    
    if (vspd >= -.05){
        estado = estado_segue;
        
        vspd = 0;
    }
}

estado_segue = function()
{
    spd += .1;
    
    var _dir = point_direction(x, y, pontox, pontoy);
    
    hspd = lengthdir_x(spd, _dir);
    vspd = lengthdir_y(spd, _dir);
    
    if (point_distance(x, y, pontox, pontoy) <= sprite_width/2){
        if (instance_exists(obj_ui_general)){
            var _ind = ind;
            
            with (obj_ui_general) {
            	money_info.xs[_ind] = random_range(.1, 2);
            	money_info.ys[_ind] = random_range(.1, 2);
                
            	money_info.txt_xs[_ind] = random_range(.5, 1.2);
            	money_info.txt_ys[_ind] = random_range(.5, 1.2);
            }
        }
        
        play_sound(snd_moeda, 1.7, .8, false);
        
        instance_destroy(self);
    }
}

estado = estado_sobe;