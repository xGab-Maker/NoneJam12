estado = noone;

pontox = 20;
pontoy = 169;

ind = 0;

vspeed = -random_range(2, 4);

estado_sobe = function()
{
    vspeed = lerp(vspeed, 0, .1);
    
    if (vspeed >= -.05){
        estado = estado_segue;
        
        vspeed = 0;
    }
}

estado_segue = function()
{
    speed += .1
    
    var _dir = point_direction(x, y, pontox, pontoy);
    
    direction = _dir;
    
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
        
        instance_destroy(self);
    }
}

estado = estado_sobe;