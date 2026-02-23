randomize();

#region Cria Blocos

cria_bloco = function(_ind, _cor, _bloco) constructor 
{
    indice = _ind;
    
    cor = _cor;
    
    bloco = _bloco;
}

rua1 = new cria_bloco(9, c_white, [[1, "hori"], [1, "hori"], [1, "hori"]]);
rua2 = new cria_bloco(9, c_white, [[1, "hori"], [1, "hori"]]);
rua3 = new cria_bloco(9, c_white, [[1, "hori"], [1, "hori"], [1, "hori"]]);
rua4 = new cria_bloco(9, c_white, [[1, "vert"], [1, "vert"], [1, "vert"]]);
rua5 = new cria_bloco(9, c_white, [[1, "vert"], [1, "vert"]]);

//rua3  = new cria_bloco(9, c_white, [[1, "hori"], [1, "vert"], [1, "vert"]]);
//rua4  = new cria_bloco(9, c_white, [[-1, "vert"], [1, "hori"], [1, "hori"]]);
//rua5  = new cria_bloco(9, c_white, [[1, "vert"], [-1, "hori"], [-1, "hori"]]);
//rua6  = new cria_bloco(9, c_white, [[-1, "vert"], [1, "hori"], [1, "hori"]]);
//rua7  = new cria_bloco(9, c_white, [[-1, "hori"], [1, "vert"], [1, "vert"]]);
//rua8  = new cria_bloco(9, c_white, [[-1, "vert"], [-1, "hori"], [-1, "hori"]]);
//rua9  = new cria_bloco(9, c_white, [[1, "hori"], [1, "vert"], [1, "vert"]]);
//rua10 = new cria_bloco(9, c_white, [[1, "vert"], [1, "hori"], [1, "hori"]]);

array_ruas = [rua1, rua2, rua3, rua4, rua5];

bloco1 = new cria_bloco(1, c_purple, []);

//1x2
bloco_grandao = new cria_bloco(9, c_orange, [[1, "hori"], [1, "hori"]]);

//Curva
bloco_curva1 = new cria_bloco(1, c_navy, [[1, "hori"], [1, "vert"]]);
bloco_curva2 = new cria_bloco(1, c_olive, [[-1, "hori"], [1, "vert"]]);
bloco_curva3 = new cria_bloco(1, c_teal, [[1, "vert"], [1, "hori"]]);
bloco_curva4 = new cria_bloco(1, c_silver, [[1, "vert"], [-1, "hori"]]);

//L (todos)
bloco_inv_l1 = new cria_bloco(2, c_yellow, [[1, "hori"], [1, "vert"], [1, "vert"]]); 
bloco_inv_l2 = new cria_bloco(3, c_lime, [[-1, "vert"], [1, "hori"], [1, "hori"]]); 
bloco_inv_l3 = new cria_bloco(4, c_blue, [[-1, "hori"], [-1, "vert"], [-1, "vert"]]); 
bloco_inv_l4 = new cria_bloco(5, c_red, [[1, "vert"], [-1, "hori"], [-1, "hori"]]); 

bloco_l1 = new cria_bloco(7, c_aqua, [[-1, "hori"], [1, "vert"], [1, "vert"]]);
bloco_l2 = new cria_bloco(8, c_fuchsia, [[-1, "vert"], [-1, "hori"], [-1, "hori"]]);
bloco_l3 = new cria_bloco(9, c_green, [[1, "hori"], [1, "vert"], [1, "vert"]]);
bloco_l4 = new cria_bloco(1, c_maroon, [[1, "vert"], [1, "hori"], [1, "hori"]]);

//1x3
bloco_1x3 = new cria_bloco(9, c_dkgray, [[1, "hori"], [1, "hori"], [1, "hori"]]);

//3x1
bloco_3x1 = new cria_bloco(9, c_dkgrey, [[1, "vert"], [1, "vert"], [1, "vert"]]);

//2x1
bloco_2x1 = new cria_bloco(9, #4e584a, [[1, "vert"], [1, "vert"], [1, "vert"]]);

//T (todas as variacoes)

//2x2

//Z (todas as variacoes)

//1x4

todos_blocos = [bloco1, bloco_inv_l1, bloco_inv_l2, bloco_inv_l3, bloco_inv_l4, bloco_l1, bloco_l2, bloco_l3, bloco_l4, bloco_curva1, bloco_curva2, 
                bloco_curva3, bloco_curva4, bloco_grandao, bloco_1x3, bloco_3x1, bloco_2x1];

#endregion


inix = 208;
iniy = 96;

width_block = sprite_get_width(spr_bloco1x1);
height_block = sprite_get_height(spr_bloco1x1);

width  = 12;
height = 7;

if (!variable_global_exists("mapa")){
    global.mapa = [];
}

global.mapa = array_create(height, []);

for (var i = 0; i < height; i++) {
    global.mapa[i] = array_create(width, 0);
}

livres = [];

return_livre = function(_obj, _num)
{
    var _check1 = _num[0];
    var _check2 = _num[1];
    
    //show_message(string("1-{0}  2-{1}", _check1, _check2));
    
    var _block = _obj.bloco;
    
    var _passados = [[_num[0], _num[1]]];
    
    for (var i = 0; i < array_length(_block); i++) {
        switch (_block[i][1]) {
            case "hori": _check1 += _block[i][0] break;
            case "vert": _check2 += _block[i][0] break;
        }
        
        //show_message(string("1-{0}  2-{1}", _check1, _check2));
        
        array_push(_passados, [_check1, _check2]);
    }
    
    var _lengthx_map = array_length(global.mapa[0])-1;
    var _lengthy_map = array_length(global.mapa)-1;
    
    var _out = false;
    
    for (var i = 0; i < array_length(_passados); i++) {
    	if (_passados[i][0] > _lengthx_map or _passados[i][0] < 0 or _passados[i][1] > _lengthy_map or _passados[i][1] < 0){
            _out = true;
        }
    }
    
    if (_out){
        return false;
    }else{
        var _segue = true;
        
        for (var i = 0; i < array_length(_passados); i++) {
        	if (global.mapa[_passados[i][1]][_passados[i][0]] != 0) return false;
        }
        
        return _passados;
    }
}

checa_livres = function(_blocks = todos_blocos, _obj = obj_bloco1x1)
{
    var _sai = false;
    
    for (var i = 0; i < array_length(global.mapa); i++) {
    	for (var j = 0; j < array_length(global.mapa[i]); j++) {
        	if (global.mapa[i][j] == 0){
                _sai = true;
                
                break;
            }
        }
    }
    
    if (!_sai) exit;
    
    var _rand = -1;
    
    while (true) {
    	_rand = [irandom_range(1, width)-1, irandom_range(1, height)-1];
        
        
        var _quem = _blocks;
        
        
        var _rand_spawn = irandom(array_length(_quem)-1);
        
        var _spawn = _quem[_rand_spawn];
        
        var _return = return_livre(_spawn, [_rand[0], _rand[1]])
        
        if (_return == false){
            //show_message("ERRO");
            
            continue;
        }else{
            for (var i = 0; i < array_length(_return); i++) {
            	global.mapa[_return[i][1]][_return[i][0]] = _spawn.indice;
            }
            
            var _all_blocks = [];
            
            for (var i = 0; i < array_length(_return); i++) { 
                var _addx = _return[i][0]*width_block;
                var _addy = _return[i][1]*height_block;
                
                var _block = 0;
                
                if (_blocks == todos_blocos){
                    _block = instance_create_layer(inix+_addx, iniy+_addy, "Instances", _obj);
                    
                    _block.sprite_index = spr_bloco1x1;
                    _block.image_blend = _spawn.cor;
                }else{
                    _block = instance_create_layer(inix+_addx, iniy+_addy, "Instances", _obj);
                }
                
                array_push(_all_blocks, _block.id);
                _block.cord = [_return[i][0], _return[i][1]];
            }
            
            var _num_rand = random_range(-1000, 1000);
            
            for (var i = 0; i < array_length(_all_blocks); i++) {
            	_all_blocks[i].conjunto = _all_blocks;
                _all_blocks[i].tipo = string("{0}{1}", _all_blocks[0], _num_rand);
            }
            
            if (_blocks == todos_blocos){
                var _pega1 = irandom(array_length(_all_blocks)-1);
                
                for (var i = 0; i < array_length(_all_blocks); i++) {
                	if (i == _pega1){
                        _all_blocks[i].predio = spr_predios_1;
                    }
                }
            }
                
            break;
        }
    }
}

repeat (5) {
	checa_livres(array_ruas, obj_rua);
}