screen_shake(2);

randomize();

depth = -y;

image_alpha = 1;

estados = noone;

cria_part = true;

conjunto = [];
cord     = [];

predio     = noone;
num_predio = irandom(sprite_get_number(spr_predios_1)-1);

xscale = .5;
yscale = 0;
angle  = 0;

col_right = false;
col_left  = false;
col_up    = false;
col_down  = false;

ind_destroy = 0;

cooldown_part = 0;

shake = false;

checa_in = function(_id)
{
    for (var i = 0; i < array_length(conjunto); i++) {
    	if (conjunto[i] == _id){
            return true;
        }
    }
}

pega_numb = function(_analyse)
{
    var _num = 0;
    
    switch (_analyse) {
    	case 2: _num = 1 break;
    	case 8: _num = 2 break;
    	case 10: _num = 3 break;
    	case 11: _num = 4 break;
    	case 16: _num = 5 break;
    	case 18: _num = 6 break;
    	case 22: _num = 7 break;
    	case 24: _num = 8 break;
    	case 26: _num = 9 break;
    	case 27: _num = 10 break;
    	case 30: _num = 11 break;
    	case 31: _num = 12 break;
    	case 64: _num = 13 break;
    	case 66: _num = 14 break;
    	case 72: _num = 15 break;
    	case 74: _num = 16 break;
    	case 75: _num = 17 break;
    	case 80: _num = 18 break;
    	case 82: _num = 19 break;
    	case 86: _num = 20 break;
    	case 88: _num = 21 break;
    	case 90: _num = 22 break;
    	case 91: _num = 23 break;
    	case 94: _num = 24 break;
    	case 95: _num = 25 break;
    	case 104: _num = 26 break;
    	case 106: _num = 27 break;
    	case 107: _num = 28 break;
    	case 120: _num = 29 break;
    	case 122: _num = 30 break;
    	case 123: _num = 31 break;
    	case 126: _num = 32 break;
    	case 127: _num = 33 break;
    	case 208: _num = 34 break;
    	case 210: _num = 35 break;
    	case 214: _num = 36 break;
    	case 216: _num = 37 break;
    	case 218: _num = 38 break;
    	case 219: _num = 39 break;
    	case 222: _num = 40 break;
    	case 223: _num = 41 break;
    	case 248: _num = 42 break;
    	case 250: _num = 43 break;
    	case 251: _num = 44 break;
    	case 254: _num = 45 break;
    	case 255: _num = 46 break;
    	case 0: _num = 47 break;
    }
    
    return _num;
}

checa_pusha = function(_var)
{
    var _find = array_get_index(conjunto, _var);
    
    if (_find == -1){
        if (_var){
            array_push(conjunto, _var);
            
            _var.conjunto = conjunto;
        }
    }
}

auto_tile = function()
{
    var _add = 32;
    var _mask = 0;
    
    var _instlef = instance_place(x-_add, y, obj_bloco1x1);
    var _instrig = instance_place(x+_add, y, obj_bloco1x1);
    var _instup  = instance_place(x, y-_add, obj_bloco1x1);
    var _instdow = instance_place(x, y+_add, obj_bloco1x1);
    
    var _instlefup   = instance_place(x-_add, y-_add, obj_bloco1x1);
    var _instlefdow  = instance_place(x-_add, y+_add, obj_bloco1x1);
    var _instrighup  = instance_place(x+_add, y-_add, obj_bloco1x1);
    var _instrighdow = instance_place(x+_add, y+_add, obj_bloco1x1);
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlef){
        if (_instlef.image_blend == image_blend){
            _mask += 8;
            
            checa_pusha(_instlef);
        }
    }
    if (_instrig){
        if (_instrig.image_blend == image_blend){
            _mask += 16;
            
            checa_pusha(_instrig);
        }
    }
    if (_instup){
        if (_instup.image_blend == image_blend){
            _mask += 2;
            
            checa_pusha(_instup);
        } 
    }
    if (_instdow){
        if (_instdow.image_blend == image_blend){
            _mask += 64;
            
            checa_pusha(_instdow);
        }
    }
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlefup and _instlef and _instup){
        if (_instlefup.image_blend == image_blend and _instlef.image_blend == image_blend and _instup.image_blend == image_blend) {
            _mask += 1;
            
            //checa_pusha(_instlefup);
        }
    }
    if (_instlefdow and _instdow and _instlef){
        if (_instlefdow.image_blend == image_blend and _instdow.image_blend == image_blend and _instlef.image_blend == image_blend){
            _mask += 32;
            
            //checa_pusha(_instlefdow);
        }
    }
    if (_instrighup and _instup and _instrig){
        if (_instrighup.image_blend == image_blend and _instup.image_blend == image_blend and _instrig.image_blend == image_blend){
            _mask += 4;
            
            //checa_pusha(_instrighup);
        }
    }
    if (_instrighdow and _instdow and _instrig){
        if (_instrighdow.image_blend == image_blend and _instdow.image_blend == image_blend and _instrig.image_blend == image_blend){
            _mask += 128;
            
            //checa_pusha(_instrighdow);
        } 
    }
    
    var _ret = pega_numb(_mask);
    
    image_index = _ret;
}

auto_tile();

checa_todos_scales = function()
{
    var _segue = true;
    
    for (var i = 0; i < array_length(conjunto); i++) {
    	if (conjunto[i].yscale < .999 and conjunto[i].xscale < .999){
            _segue = false;
            
            break;
        }
    }
    
    if (_segue){
        for (var i = 0; i < array_length(conjunto); i++) {
        	conjunto[i].yscale = 1;
        	conjunto[i].xscale = 1;
        }
        
        estados = estado_parado;
    }
}

aumenta_scale = function()
{
    var _find = array_get_index(conjunto, id);
    
    if (_find != -1){
        if (_find == 0){
            yscale = lerp(yscale, 1, .2);
            xscale = lerp(yscale, 1, .2);
            
            cooldown_part--;
            cooldown_part = clamp(cooldown_part, 0, infinity);
            
            if (cooldown_part <= 0){
                if (point_distance(xscale, yscale, 1, 1) > .05){
                    var _addx = random_range(-sprite_width/2-5, sprite_width/2+5);
                    var _img = choose(spr_part_fumaca, spr_part_fumaca2);
                
                    cria_particula(_img, x+_addx, y, depth-1, true, image_blend);  
                    
                    cooldown_part = game_get_speed(gamespeed_fps)*random_range(.015, .15);
                }
            }
        }else{
            if (conjunto[_find-1].xscale >= .7 and conjunto[_find-1].yscale >= .7){
                if (shake == false){
                    screen_shake(1);
                    
                    shake = true;
                }
                
                xscale = lerp(xscale, 1, .15); 
                yscale = lerp(yscale, 1, .15);
                
                cooldown_part--;
                cooldown_part = clamp(cooldown_part, 0, infinity);
                
                if (cooldown_part <= 0){
                    if (point_distance(xscale, yscale, 1, 1) > .05){
                        var _addx = random_range(-sprite_width/2-5, sprite_width/2+5);
                        var _img = choose(spr_part_fumaca, spr_part_fumaca2);
                    
                        cria_particula(_img, x+_addx, y, depth-1, true, image_blend);  
                        
                        cooldown_part = game_get_speed(gamespeed_fps)*random_range(.015, .15);
                    }
                }
            }
        }
    }
    
    checa_todos_scales();
}

dim_morre = function()
{
    screen_shake(1);
    
    xscale = lerp(xscale, 1.2, .05);
    yscale = lerp(yscale, 0, .4);
    
    cooldown_part--;
    cooldown_part = clamp(cooldown_part, 0, infinity);
    
    if (cooldown_part <= 0){
        if (yscale > .1){
            var _addx = random_range(-sprite_width/2-5, sprite_width/2+5);
            var _img = choose(spr_part_fumaca, spr_part_fumaca2);
        
            cria_particula(_img, x+_addx, y, depth-1, true, image_blend);  
            
            cooldown_part = game_get_speed(gamespeed_fps)*random_range(.015, .15);
        }
    }
}

estado_aparece = function()
{
    aumenta_scale();
}

estado_parado = function()
{
    if (position_meeting(mouse_x, mouse_y, id)){
        if (mouse_check_button_pressed(mb_left)){
            for (var i = 0; i < array_length(conjunto); i++) {
                conjunto[i].estados = conjunto[i].estado_transicao;
            }
            
            conjunto[ind_destroy].estados = conjunto[ind_destroy].estado_morre;
        }
    }
}

estado_transicao = function() {}

estado_morre = function()
{
    dim_morre();
    
    if (yscale <= .1){
        var _find = array_get_index(conjunto, id);
        
        if (array_length(conjunto) > 0 and _find < array_length(conjunto)-1){
            ind_destroy++;
        
            conjunto[ind_destroy].estados = conjunto[ind_destroy].estado_morre;
            
            conjunto[ind_destroy].ind_destroy = ind_destroy;
        }
        
        instance_destroy(self);
    }
}

estados = estado_aparece;