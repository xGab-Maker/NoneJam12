screen_shake(2);

randomize();

depth = -y;

image_alpha = 1;

arvore = false;

estados = noone;

cria_part = true;

conjunto     = [];
cord         = [];
vida         = 1;
vida_perdida = 0;

roda = 0;

predio     = noone;
num_predio = irandom(sprite_get_number(predio)-1);

xscale = .5;
yscale = 0;

var _r1 = random_range(-10, -20);
var _r2 = random_range(10, 20);

angle  = choose(_r1, _r2);

col_right = false;
col_left  = false;
col_up    = false;
col_down  = false;

qnt_blocos = 0;

ind_destroy = 0;

cooldown_part = 0;

shake = false;

alpha_branco = 0;

inven = false;

tipo = 0;

cooldown_dano = game_get_speed(gamespeed_fps)*.1;

vida_predio = noone;

rodou = false;

fogo = {
    img_fogo   : false,
    fogoso     : false,
    alp_fogoso : 0,
    temp_fogo  : 3,
    alp_icon   : 0,
    
    cooldown_fogoso     : game_get_speed(gamespeed_fps),
    cooldown_end_fogoso : 0,
}

fogo.cooldown_end_fogoso = game_get_speed(gamespeed_fps)*fogo.temp_fogo;



da_fogo = function()
{
    if (fogo.fogoso){
        for (var i = 0; i < array_length(conjunto); i++) {
            if (conjunto[i] != id){
            	conjunto[i].fogo.alp_fogoso = lerp(conjunto[i].fogo.alp_fogoso, 1, .15);
                conjunto[i].fogo.img_fogo = true;
            }
        }
        
        fogo.alp_icon = lerp(fogo.alp_icon, 1, .15);
        
        fogo.alp_fogoso = lerp(fogo.alp_fogoso, 1, .15);
        
        fogo.cooldown_end_fogoso--;
        fogo.cooldown_end_fogoso = clamp(fogo.cooldown_end_fogoso, 0, infinity);
        
        if (fogo.cooldown_end_fogoso <= 0){
            fogo.fogoso = false;
            
            for (var i = 0; i < array_length(conjunto); i++) {
                if (conjunto[i] != id) conjunto[i].fogo.img_fogo = false;
            }
            
            fogo.cooldown_end_fogoso = game_get_speed(gamespeed_fps)*fogo.temp_fogo;
            
            exit;
        }
        
        fogo.cooldown_fogoso--;
        fogo.cooldown_fogoso = clamp(fogo.cooldown_fogoso, 0, infinity);
        
        if (fogo.cooldown_fogoso <= 0){
            if (instance_exists(conjunto[0])){
                conjunto[0].vida_perdida++; 
                
                var _r1 = random_range(-10, -5);
                var _r2 = random_range(-10, -5);
                
                alpha_branco = 1;
                angle = choose(_r1, _r2);
                
                cria_vida();
            }
            
            fogo.cooldown_fogoso = game_get_speed(gamespeed_fps);
        }
    }else{
        if (fogo.img_fogo == false){
            fogo.alp_fogoso = lerp(fogo.alp_fogoso, 0, .15);
        }
        
        fogo.alp_icon = lerp(fogo.alp_icon, 0, .15);
        
        fogo.cooldown_fogoso = game_get_speed(gamespeed_fps);
        fogo.cooldown_end_fogoso = game_get_speed(gamespeed_fps)*fogo.temp_fogo;
    }
}

cria_vida = function()
{
    var _segue = true;
    
    for (var i = 0; i < array_length(conjunto); i++) {
    	if (conjunto[i].vida_predio != noone){
            _segue = false;
        }
    }
    
    if (vida_predio == noone and _segue){
        vida_predio = instance_create_depth(x, y-sprite_height/2, -9999, obj_mostra_vida);
        
        vida_predio.vida = vida;
        
        if (instance_exists(conjunto[0])){
            vida_predio.vida_perd = conjunto[0].vida_perdida;
        }
        
        vida_predio.pai = id;
    }
}

checa_in = function(_id)
{
    for (var i = 0; i < array_length(conjunto); i++) {
    	if (conjunto[i] == _id){
            return true;
        }
    }
}

checa_pusha = function(_var)
{
    var _find = array_get_index(conjunto, _var);
    
    if (_find == -1){
        if (_var){
            array_push(conjunto, _var);
            
            vida = array_length(conjunto)-1;
            
            if (instance_exists(_var)){
                _var.conjunto = conjunto;
            }
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
        if (_instlef.image_blend == image_blend and _instlef.tipo == tipo and _instlef.arvore == arvore){
            _mask += 8;
            
            checa_pusha(_instlef);
        }
    }
    if (_instrig){
        if (_instrig.image_blend == image_blend and _instrig.tipo == tipo and _instrig.arvore == arvore){
            _mask += 16;
            
            checa_pusha(_instrig);
        }
    }
    if (_instup){
        if (_instup.image_blend == image_blend and _instup.tipo == tipo and _instup.arvore == arvore){
            _mask += 2;
            
            checa_pusha(_instup);
        } 
    }
    if (_instdow){
        if (_instdow.image_blend == image_blend and _instdow.tipo == tipo and _instdow.arvore == arvore){
            _mask += 64;
            
            checa_pusha(_instdow);
        }
    }
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlefup and _instlef and _instup){
        if (_instlefup.image_blend == image_blend and _instlef.image_blend == image_blend and _instup.image_blend == image_blend and _instlefup.tipo == tipo and _instlefup.arvore == arvore) {
            _mask += 1;
            
            //checa_pusha(_instlefup);
        }
    }
    if (_instlefdow and _instdow and _instlef){
        if (_instlefdow.image_blend == image_blend and _instdow.image_blend == image_blend and _instlef.image_blend == image_blend and _instlefdow.tipo == tipo and _instlefdow.arvore == arvore){
            _mask += 32;
            
            //checa_pusha(_instlefdow);
        }
    }
    if (_instrighup and _instup and _instrig){
        if (_instrighup.image_blend == image_blend and _instup.image_blend == image_blend and _instrig.image_blend == image_blend and _instrighup.tipo == tipo and _instrighup.arvore == arvore){
            _mask += 4;
            
            //checa_pusha(_instrighup);
        }
    }
    if (_instrighdow and _instdow and _instrig){
        if (_instrighdow.image_blend == image_blend and _instdow.image_blend == image_blend and _instrig.image_blend == image_blend and _instrighdow.tipo == tipo and _instrighdow.arvore == arvore){
            _mask += 128;
            
            //checa_pusha(_instrighdow);
        } 
    }
    
    var _ret = pega_numb(_mask);
    
    image_index = _ret;
}

checa_todos_scales = function()
{
    var _segue = true;
    
    for (var i = 0; i < array_length(conjunto); i++) { 
        if (instance_exists(conjunto[i])){
        	if (conjunto[i].yscale < .999 and conjunto[i].xscale < .999){
                _segue = false;
                
                break;
            }
        }
    }
    
    if (_segue){
        for (var i = 0; i < array_length(conjunto); i++) {
            if (instance_exists(conjunto[i])){
            	conjunto[i].yscale = 1;
            	conjunto[i].xscale = 1;
            }
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
            xscale = lerp(xscale, 1, .2);
            
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
            if (instance_exists(conjunto[_find-1])){
                if (conjunto[_find-1].xscale >= .6 and conjunto[_find-1].yscale >= .6){
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
    if (vida_perdida >= vida){
        for (var i = 0; i < array_length(conjunto); i++) {
            if (instance_exists(conjunto[i])){
                conjunto[i].estados = conjunto[i].estado_transicao;
            }
        }
        
        add_prog(7);
        
        if (instance_exists(conjunto[ind_destroy])){
            conjunto[ind_destroy].estados = conjunto[ind_destroy].estado_morre;
        }
        
        screen_shake(5);
    }
    
    da_fogo();
}

estado_transicao = function() {
    auto_tile();
    
    fogo.alp_fogoso = lerp(fogo.alp_fogoso, 0, .15);
}

estado_morre = function()
{
    fogo.alp_fogoso = lerp(fogo.alp_fogoso, 0, .15);
    
    if (vida_predio != noone){
        if (vida_predio.estado != vida_predio.estado_morre){
            vida_predio.vspd = -.5;
        }
        
        vida_predio.estado = vida_predio.estado_morre;
    }
    
    dim_morre();
    
    if (yscale <= .1){
        var _find = array_get_index(conjunto, id);
        
        if (array_length(conjunto)-1 > 0 and _find < array_length(conjunto)-1){
            ind_destroy++;
        
            if (ind_destroy < array_length(conjunto) and instance_exists(conjunto[ind_destroy])){
                conjunto[ind_destroy].estados = conjunto[ind_destroy].estado_morre;
                
                conjunto[ind_destroy].ind_destroy = ind_destroy;
            }
        }
        
        instance_destroy(self);
    }
}

estados = estado_aparece;

vida = array_length(conjunto);   