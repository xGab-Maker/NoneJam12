screen_shake(1);

tipo = PODER.NORMAL;

hspd = 0;
vspd = 0;

spd = 0;

xscale = 1;
yscale = 1;
angle  = 0;

colidi = 0;

lim_colide = 6;

entrou = false;

last_col = noone;

dano = 1;

xscale_obj = 1;
yscale_obj = 1;

qnt_mini_balls = 3;

cria_mini_bolas = function(_direction, _spd)
{
    var _qnt = 5;
    
    var _tiro = instance_create_layer(x+lengthdir_x(_qnt, _direction), y+lengthdir_y(_qnt, _direction), "Tiros", obj_bola);
        
    _tiro.hspd = lengthdir_x(_spd, _direction);
    _tiro.vspd = lengthdir_y(_spd, _direction);
    _tiro.depth = depth-1;
    _tiro.image_angle = _direction;
    _tiro.lim_colide = 3;
    
    _tiro.xscale_obj = .8;
    _tiro.yscale_obj = .8;
    
    _tiro.xscale = .5*_tiro.xscale_obj;
    _tiro.yscale = .5*_tiro.yscale_obj;
}

da_dano = function(_dano, _quem)
{
    switch (tipo) {
        case PODER.FOGO: 
            _quem.fogo.fogoso = true;
        break;	
        
        case PODER.FRAG:
            for (var i = 0; i < qnt_mini_balls; i++) {
            	cria_mini_bolas(random_range(0, 359), spd*1.5);
            }
        break;
    }
    
    var _r1 = random_range(-10, -5);
    var _r2 = random_range(-10, -5);
    
    _quem.alpha_branco = 1;
    _quem.angle = choose(_r1, _r2);
    
    with (_quem) {
        if (inven == false and instance_exists(conjunto[0])){
            conjunto[0].vida_perdida += _dano; 
            inven = true;
            
            cria_vida();
        }
    }
}

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
            
            xscale = 1.5;
            yscale = .6;
            
            colidi++;
            
            last_col = noone;
        }
        
        if (_meet_wally){
            vspd = -vspd;
            
            xscale = 1.5;
            yscale = .6;
            
            colidi++;
            
            last_col = noone;
        }
    }
    
    if (_inst_hs){
        if (_inst_hs.estados != _inst_hs.estado_morre and last_col != _inst_hs){
            if (tipo != PODER.PERF){
                hspd = -hspd;
                colidi++;
            }
            
            da_dano(dano, _inst_hs);
            
            xscale = 1.5;
            yscale = .6;
            
            last_col = _inst_hs;
        }
    }
    
    if (_inst_vs){
        if (_inst_vs.estados != _inst_vs.estado_morre and last_col != _inst_vs){
            if (tipo != PODER.PERF){
                vspd = -vspd;
                colidi++;
            }
            
            da_dano(dano, _inst_vs);
            
            xscale = 1.5;
            yscale = .6;
            
            last_col = _inst_vs;
        }
    }
    
    if (colidi >= lim_colide){
        instance_destroy(self);
    }
}