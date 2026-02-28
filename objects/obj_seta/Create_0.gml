pai = noone;

paix = 0;
paiy = 0;

cooldown_atira_ref = game_get_speed(gamespeed_fps)*.4;
cooldown_atira     = 0;

xscale = 1;
yscale = 1;

qnt = 20;

tipo_bola = noone;

atira = function(_direction, _qnt)
{
    var _randx = 0;
    var _randy = 0;
    
    var _spd = 5;
    
    switch (tipo_bola) {
    	case PODER.MULTI:
            var _add = 30;
            var _add_ang = _add/3;
            
            var _ang_at = -_add/3;
            
            for (var i = 0; i < 3; i++) { 
                var _tiro = instance_create_layer(pai.x+lengthdir_x(_qnt+10, _direction+_ang_at), pai.y+lengthdir_y(_qnt+10, _direction+_ang_at), "Tiros", obj_bola);
            
                _tiro.hspd = lengthdir_x(_spd, _direction+_randx+_ang_at);
                _tiro.vspd = lengthdir_y(_spd, _direction+_randy+_ang_at);
                _tiro.depth = depth+1;
                _tiro.image_angle = _direction;
                _tiro.tipo = tipo_bola;
                _tiro.spd = _spd;
                
                _tiro.xscale = .5;
                _tiro.yscale = .5;
                
                _ang_at += _add_ang;
            }
        
            if (instance_exists(pai)){
                with (pai) {
                    if (lado == "b" or lado == "c" or lado == "a" or lado == "d"){
                        xscale = .9;
                	    yscale = 1.3;
                    }else{
                        xscale = 1.3;
                	    yscale = .9;
                    }
                }
            }
        break;
        
        case PODER.LASER:
            if (instance_exists(obj_player)){
                var _laser = instance_create_depth(obj_player.x, obj_player.y, obj_player.depth+1, obj_laser);
                
                switch (obj_player.lado) {
                	case "Norm": _laser.image_angle = 0 break;
                	case "a": _laser.image_angle = -90 break;
                	case "d": _laser.image_angle = -90 break;
                	case "b": _laser.image_angle = 90 break;
                	case "c": _laser.image_angle = 90 break;
                }
            }    
        
            if (instance_exists(pai)){
                with (pai) {
                    if (lado == "b" or lado == "c" or lado == "a" or lado == "d"){
                        xscale = .5;
                	    yscale = 2;
                    }else{
                        xscale = 2;
                	    yscale = .5;
                    }
                }
            }
        break;
        
        default:
            var _tiro = instance_create_layer(pai.x+lengthdir_x(_qnt+10, _direction), pai.y+lengthdir_y(_qnt+10, _direction), "Tiros", obj_bola);
        
            _tiro.hspd = lengthdir_x(_spd, _direction+_randx);
            _tiro.vspd = lengthdir_y(_spd, _direction+_randy);
            _tiro.depth = depth+1;
            _tiro.image_angle = _direction;
            _tiro.tipo = tipo_bola;
            _tiro.spd = _spd;
            
            _tiro.xscale = .5;
            _tiro.yscale = .5;
        
            if (instance_exists(pai)){
                with (pai) {
                    if (lado == "b" or lado == "c" or lado == "a" or lado == "d"){
                        xscale = .9;
                	    yscale = 1.3;
                    }else{
                        xscale = 1.3;
                	    yscale = .9;
                    }
                }
            }
        break;
    }
    
    xscale = 1.2;
    yscale = .6;  
    
    qnt = 10;
}