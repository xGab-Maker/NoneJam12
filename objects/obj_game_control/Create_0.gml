randomize();

#region Cria Blocos

cria_bloco = function(_ind, _cor, _bloco) constructor 
{
    indice = _ind;
    
    cor = _cor;
    
    bloco = _bloco;
}

bloco1 = new cria_bloco(1, c_white, []);

bloco_grandao = new cria_bloco(9, c_orange, [[1, "hori"], [1, "hori"]]);

bloco_curva1 = new cria_bloco(1, c_navy, [[1, "hori"], [1, "vert"]]);
bloco_curva2 = new cria_bloco(1, c_olive, [[-1, "hori"], [1, "vert"]]);
bloco_curva3 = new cria_bloco(1, c_teal, [[1, "vert"], [1, "hori"]]);
bloco_curva4 = new cria_bloco(1, c_silver, [[1, "vert"], [-1, "hori"]]);

bloco_inv_l1 = new cria_bloco(2, c_yellow, [[1, "hori"], [1, "vert"], [1, "vert"]]); 
bloco_inv_l2 = new cria_bloco(3, c_lime, [[-1, "vert"], [1, "hori"], [1, "hori"]]); 
bloco_inv_l3 = new cria_bloco(4, c_blue, [[-1, "hori"], [-1, "vert"], [-1, "vert"]]); 
bloco_inv_l4 = new cria_bloco(5, c_red, [[1, "vert"], [-1, "hori"], [-1, "hori"]]); 

bloco_l1 = new cria_bloco(7, c_aqua, [[-1, "hori"], [1, "vert"], [1, "vert"]]);
bloco_l2 = new cria_bloco(8, c_fuchsia, [[-1, "vert"], [-1, "hori"], [-1, "hori"]]);
bloco_l3 = new cria_bloco(9, c_green, [[1, "hori"], [1, "vert"], [1, "vert"]]);
bloco_l4 = new cria_bloco(1, c_maroon, [[1, "vert"], [1, "hori"], [1, "hori"]]);

todos_blocos = [bloco_inv_l1, bloco_inv_l2, bloco_inv_l3, bloco_inv_l4, bloco_l1, bloco_l2, bloco_l3, bloco_l4, bloco_curva1, bloco_curva2, 
                bloco_curva3, bloco_curva4, bloco_grandao];

#endregion


inix = 200;
iniy = 200;

width_block = 32;
height_block = 32;

width  = 14;
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

checa_livres = function()
{
    var _rand = -1;
    
    var _limit = 80;
    
    while (true) {
        if (_limit <= 0){
            break;
        }
        
    	_rand = [irandom_range(1, width)-1, irandom_range(1, height)-1];
        
        var _rand_spawn = irandom(array_length(todos_blocos)-1);
        
        var _spawn = todos_blocos[_rand_spawn];
        
        var _return = return_livre(_spawn, [_rand[0], _rand[1]])
        
        if (_return == false){
            //show_message("ERRO");
            
            _limit--;
            
            continue;
        }else{
            for (var i = 0; i < array_length(_return); i++) {
            	global.mapa[_return[i][1]][_return[i][0]] = _spawn.indice;
            }
            
            var _all_blocks = [];
            
            for (var i = 0; i < array_length(_return); i++) { 
                var _addx = _return[i][0]*width_block;
                var _addy = _return[i][1]*height_block;
                
                var _block = instance_create_layer(inix+_addx, iniy+_addy, "Instances", obj_bloco1x1);
                
                _block.sprite_index = spr_bloco1x1;
                _block.image_blend = _spawn.cor;
                
                array_push(_all_blocks, _block.id);
            }
            
            for (var i = 0; i < array_length(_all_blocks); i++) {
            	_all_blocks[i].conjunto = _all_blocks;
            }
            
            break;
        }
    }
}