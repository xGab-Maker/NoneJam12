indicex = 2;
indicey = array_length(global.mapa)-1;

instance_create_depth(x, y, depth, obj_seta);

left  = noone;
right = noone;

sobe = false;

margemx = sprite_width-7;
margemy = sprite_height+8;

inix = 100+margemx;
iniy = 100+margemy;

ladox = 1;
ladoy = 1;

margem_multix = 1;
margem_multiy = 1;

xscale  = 1;
nxscale = 1;

yscale  = 1;
nyscale = 1;

angle   = 0;
nangle  = 0;

cooldown_atira = 0;

inputs = function()
{
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
}

move = function()
{
    if (right xor left){
        var _add = right-left;
        
        if (!sobe){
            indicex += (_add/8)*ladox;
            
            nangle = -20*(_add*ladox);
            
            nyscale = 1;
            nxscale = 1;
        }else{
            indicey += (_add/8)*ladoy;
            
            nyscale = 1.2;
            nxscale = .8;
            
            nangle = 0;
        }
        
        if (indicex == 0 and indicey == array_length(global.mapa)-1){
            switch (_add) {
            	case -1:
                    sobe = true;
            
                    ladox = -1;
                    ladoy = 1;
                break;
                
            	case 1:
                    sobe = false;
            
                    ladox = 1;
                    ladoy = -1;
                
                    //margem_multiy = .5;
                break;
            }
            
            show_debug_message("a");
        }
        
        if (indicex == array_length(global.mapa[0])-1 and indicey == array_length(global.mapa)-1){
            switch (_add) {
            	case -1:
                    sobe = false;
                    
                    ladox = 1;
                    ladoy = -1;
                break;
                
            	case 1:
                    sobe = true;
                    
                    ladox = -1;
                    ladoy = -1;
                break;
            }
            
            show_debug_message("b");
        }
        
        if (indicex == array_length(global.mapa[0])-1 and indicey == 0){
            switch (_add) {
            	case -1:
                    sobe = true;
                    
                    ladoy = -1;
                    ladox = 1;
                
                    //margem_multiy = 1;
                break;
                
            	case 1:
                    sobe = false;
                    
                    ladoy = 1;
                    ladox = -1;
                break;
            }
            
            show_debug_message("c");
        }
        
        if (indicex == 0 and indicey == 0){
            switch (_add) {
            	case -1:
                    sobe = false;
                    
                    ladoy = 1;
                    ladox = -1;
                
                    //margem_multiy = -1;
                break;
                
            	case 1:
                    sobe = true;
                    
                    ladoy = 1;
                    ladox = -1;
                
                    //margem_multiy = 1;
                break;
            }
            
            show_debug_message("d");
        }
        
        indicex = clamp(indicex, 0, array_length(global.mapa[0])-1);
        indicey = clamp(indicey, 0, array_length(global.mapa)-1);
    }else{
        nangle = 0;
        
        nyscale = 1;
        nxscale = 1;
    }
}

atira = function()
{
    var _dir = 0;
    
    var _randx = 0;
    var _randy = 0;
    
    var _mousedir = point_direction(x, y, mouse_x, mouse_y);
    
    switch (sobe) {
    	case true: 
            switch (ladoy) {
            	case 1: _dir = 0 break;
            	case -1: 
                    _dir = 180
                    _mousedir = -_mousedir;
                break;
            }
        
            _randy = random_range(-5, 5);
        
            xscale = .9;
            yscale = 1.2;
        break;
        
        case false:
            switch (ladox) {
            	case 1: _dir = 90 break;
            	case -1: _dir = -90 break;
            }
        
            _randx = random_range(-5, 5);
        
            xscale = 1.2;
            yscale = .9;
        break;
    }
    
    var _spd = 5;
    
    var _tiro = instance_create_layer(x, y, "Tiros", obj_bola);
    
    _tiro.hspd = lengthdir_x(_spd, _mousedir+_randx);
    _tiro.vspd = lengthdir_y(_spd, _mousedir+_randy);
}