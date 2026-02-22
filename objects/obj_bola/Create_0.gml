hspd = 0;
vspd = 0;

colide_invert = function()
{
    var _inst_hs = instance_place(x+hspd, y, obj_bloco1x1);
    var _inst_vs = instance_place(x, y+vspd, obj_bloco1x1);
    
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
        }
    }
}