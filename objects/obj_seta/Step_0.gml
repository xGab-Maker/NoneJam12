depth = -y;

var _dir = point_direction(paix, paiy, mouse_x, mouse_y);

var _qnt = 20;

if (pai != noone){
    //45 a 135
    switch (pai.lado) {
    	case "Norm": 
            if (_dir <= 45 or _dir > 270){
                _dir = 45;
            }
        
            if (_dir >= 135 and _dir < 270){
                _dir = 135;
            }
        break;
        
        //pad 180
        case "b": _dir = clamp(_dir, 135, 225) break;
        case "c": _dir = clamp(_dir, 135, 225) break;
        
        case "a": 
            if (_dir >= 45 and _dir < 180){
                _dir = 45;
            }
        
            if (_dir <= 315 and _dir > 180){
                _dir = 315;
            }
        break;
        case "d":
    }
}

x = lerp(x, paix+lengthdir_x(_qnt, _dir), .5);
y = lerp(y, paiy+lengthdir_y(_qnt, _dir), .5);

image_angle = _dir+90;

cooldown_atira--;
cooldown_atira = clamp(cooldown_atira, 0, infinity);

if (mouse_check_button(mb_left)){
    if (cooldown_atira <= 0){
        atira(_dir, _qnt);
        
        cooldown_atira = game_get_speed(gamespeed_fps)*.4;
    }
}
