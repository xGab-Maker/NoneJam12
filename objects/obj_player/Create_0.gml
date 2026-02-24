indicex = 2;
indicey = array_length(global.mapa)-1;

var _seta = instance_create_depth(x, y, depth, obj_seta);

_seta.pai = id;

left  = noone;
right = noone;

sobe = false;

margemx = sprite_width+2;
margemy = sprite_height+16;

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

lado = 0;

inputs = function()
{
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
}

if (indicey == array_length(global.mapa)-1){
    lado = "Norm";
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
            
            var _segue = true;
            
            if (lado == "c" and _add == 1) _segue = false;
            if (lado == "d" and _add == -1) _segue = false;
                
            if (_segue){
                nyscale = 1.2;
                nxscale = .8;
            }else{
                nyscale = 1;
                nxscale = 1;
            }
            
            nangle = 0;
        }
        
        if (indicey == array_length(global.mapa)-1){
            lado = "Norm";
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
            
            lado = "a"
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
            
            lado = "b"
        }
        
        if (indicex == array_length(global.mapa[0])-1 and indicey == 0){
            switch (_add) {
            	case -1:
                    sobe = true;
                    
                    ladoy = -1;
                    ladox = 1;
                
                    //margem_multiy = 1;
                break;
            }
            
            lado = "c";
        }
        
        if (indicex == 0 and indicey == 0){
            switch (_add) {
            	case 1:
                    sobe = true;
                    
                    ladoy = 1;
                    ladox = -1;
                
                    //margem_multiy = 1;
                break;
            }
            
            lado = "d";
        }
        
        indicex = clamp(indicex, 0, array_length(global.mapa[0])-1);
        indicey = clamp(indicey, 0, array_length(global.mapa)-1);
    }else{
        nangle = 0;
        
        nyscale = 1;
        nxscale = 1;
    }
}