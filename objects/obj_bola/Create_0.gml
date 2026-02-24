screen_shake(1);

hspd = 0;
vspd = 0;

xscale = 1;
yscale = 1;
angle  = 0;

colidi = 0;

lim_colide = 6;

entrou = false;

colide_invert = function()
{
    var _inst_hs = instance_place(x+hspd, y, obj_bloco1x1);
    var _inst_vs = instance_place(x, y+vspd, obj_bloco1x1);
    
    var _meet_wallx = place_meeting(x+hspd, y, obj_colisao_bola);
    var _meet_wally = place_meeting(x, y+vspd, obj_colisao_bola);
    
    var _enter = place_meeting(x, y, obj_entrou);
    
    if (_enter) entrou = true;
    
    if (entrou){
        if (_meet_wallx){
            hspd = -hspd;
            
            xscale = .6;
            yscale = 1.5;
            
            colidi++;
        }
        
        if (_meet_wally){
            vspd = -vspd;
            
            xscale = 1.5;
            yscale = .6;
            
            colidi++;
        }
    }
    
    if (_inst_hs){
        if (_inst_hs.estados != _inst_hs.estado_morre){
            hspd = -hspd;
            
            var _r1 = random_range(-10, -5);
            var _r2 = random_range(-10, -5);
            
            _inst_hs.alpha_branco = 1;
            _inst_hs.angle = choose(_r1, _r2);
            
            with (_inst_hs) {
                if (inven == false and instance_exists(conjunto[0])){
            	    conjunto[0].vida_perdida++; 
                    inven = true;
                    
                    cria_vida();
                }
            }
            
            xscale = .6;
            yscale = 1.5;
            
            colidi++;
        }
    }
    
    if (_inst_vs){
        if (_inst_vs.estados != _inst_vs.estado_morre){
            vspd = -vspd;
            
            var _r1 = random_range(-10, -5);
            var _r2 = random_range(-10, -5);
            
            _inst_vs.alpha_branco = 1;
            _inst_vs.angle = choose(_r1, _r2);
            
            with (_inst_vs) {
                if (inven == false and instance_exists(conjunto[0])){
            	    conjunto[0].vida_perdida++; 
                    inven = true;
                    
                    cria_vida();
                }
            }
            
            xscale = 1.5;
            yscale = .6;
            
            colidi++;
        }
    }
    
    if (colidi >= lim_colide){
        instance_destroy(self);
    }
}