
function cria_particula(_sprite, _x, _y, _depth, _pedra = false, _tipo = noone)
{
    var _part = instance_create_depth(_x, _y, _depth, obj_part);
    
    _part.sprite_index = _sprite;
    _part.tipo = _tipo;
    
    if (_pedra){
        var _pedra_part = instance_create_depth(_x, _y, _depth, obj_part_pedra);
        
        _pedra_part.limite = _y;
    }
}

function pega_numb(_analyse)
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

function add_prog(_porc)
{
    var _add = _porc/100;
    
    global.progressao += _add;
    
    if (instance_exists(obj_ui_general)){
        var _analise = 1;
        
        if (_add > 0){
            _analise = 1;
        }else{
            _analise = -1;
        }
        
        with (obj_ui_general) {
        	if (_analise > 1){
                bar_prog.xs = 1.1;
                bar_prog.ys = .9;
            }else{
                bar_prog.xs = .9;
                bar_prog.ys = 1.1;
            }
        }
    }
}

function pisca(_qnt = 1, _color = c_white, _rainbow = false){
    if (global.pisca_des == false and instance_number(obj_pisca) < 2){
        var _pisca =  instance_create_layer(0, 0, "Passivas", obj_pisca);
        
        if (instance_exists(_pisca)){
            with (_pisca) {
            	qnt = _qnt;
                
                if (_rainbow == false){
                    cor = _color;
                }else{
                    colorido = true;
                }
            }
        }
    }
}