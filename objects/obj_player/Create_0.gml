indicex = 2;
indicey = array_length(global.mapa)-1;

left  = noone;
right = noone;

sobe = false;

margem = 30;

inix = 100+margem;
iniy = 100+margem;

ladox = 1;
ladoy = 1;

margem_multix = 1;
margem_multiy = 1;

inputs = function()
{
    left = keyboard_check_pressed(ord("A"));
    right = keyboard_check_pressed(ord("D"));
}

move = function()
{
    if (right xor left){
        var _add = right-left;
        
        if (!sobe){
            indicex += _add*ladox;
        }else{
            indicey += _add*ladoy;
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
                break;
            }
            
            show_message("a");
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
                
                    margem_multiy = 4;
                break;
            }
            
            show_message("b");
        }
        
        if (indicex == array_length(global.mapa[0])-1 and indicey == 0){
            switch (_add) {
            	case -1:
                    sobe = true;
                    
                    ladoy = -1;
                    ladox = 1;
                break;
                
            	case 1:
                    sobe = false;
                    
                    ladoy = 1;
                    ladox = -1;
                break;
            }
        }
        
        if (indicex == 0 and indicey == 0){
            switch (_add) {
            	case -1:
                    sobe = false;
                    
                    ladoy = 1;
                    ladox = -1;
                break;
                
            	case 1:
                    sobe = true;
                    
                    ladoy = 1;
                    ladox = -1;
                break;
            }
            
            show_message("d");
        }
        
        indicex = clamp(indicex, 0, array_length(global.mapa[0])-1);
        indicey = clamp(indicey, 0, array_length(global.mapa)-1);
    }    
}