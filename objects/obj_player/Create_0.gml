estado = noone;

vspd = 0;

indicex = round((array_length(global.mapa[0])-1)/2);
indicey = array_length(global.mapa)-1;

var _seta = instance_create_depth(x, y, depth, obj_seta);

_seta.pai = id;

left  = noone;
right = noone;

sobe = false;

sombray = y;
sombrax = x;

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

shakeado = false;

cooldown_sobe = game_get_speed(gamespeed_fps)*.5;

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
        
        var _vel = _add;
        
        if (!sobe){
            indicex += ((_vel/8)*ladox)*global.upg.velplay;
            
            nangle = -20*(_add*ladox);
            
            nyscale = 1;
            nxscale = 1;
        }else{
            indicey += ((_vel/8)*ladoy)*global.upg.velplay;
            
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
                
        indicex = clamp(indicex, 0, array_length(global.mapa[0])-1);
        indicey = clamp(indicey, 0, array_length(global.mapa)-1);
        
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
    }else{
        nangle = 0;
        
        nyscale = 1;
        nxscale = 1;
    }
}

estado_move = function()
{
    depth = -y;
    
    move();
    
    x = lerp(x, inix+indicex*margemx, .15);
    y = lerp(y, iniy+indicey*margemy, .15);
    
    global.last_pos.py = y;
    global.last_pos.px = x;
    global.last_pos.gridpx = indicex;
    global.last_pos.gridpy = indicey;
    global.last_pos.sobep = sobe;
    
    sombrax = x;
    sombray = y;
}

estado_sobe = function()
{
    depth = -9999;
    
    if (instance_exists(obj_seta)) obj_seta.invisible = true;
    
    nangle = 0;
    
    cooldown_sobe--;
    cooldown_sobe = clamp(cooldown_sobe, 0, infinity);
    
    if (cooldown_sobe <= 0){
        if (!shakeado){
            xscale = 1.2;
            yscale = .7;
            
            repeat (5) {
            	cria_particula(spr_part_fumaca, x, y+sprite_height/2, depth+1, true, obj_player, true);
            }
            
            screen_shake(5);
            
            pisca(1, c_yellow);
            
            shakeado = true;
        }
        
        vspd -= .5;
        
        nyscale = 1.4;
        nxscale = .7;
        
        y += vspd;
    }else{
        x = lerp(x, inix+indicex*margemx, .15);
        y = lerp(y, iniy+indicey*margemy, .15);
        
        sombrax = x;
        sombray = y;
        
        global.last_pos.py = y;
        global.last_pos.px = x;
    }
    
    global.last_pos.gridpx = indicex;
    global.last_pos.gridpy = indicey;
    global.last_pos.sobep = sobe;
    
    if (y <= 0){
        transciona(rm_upgrades);
    }
}

estado_cai = function()
{
    depth = -9999;
    
    if (instance_exists(obj_seta)) obj_seta.invisible = true;
    
    nangle = 0;
    
    vspd += .5;
    
    nyscale = 1.4;
    nxscale = .7;
    
    y += vspd;
    
    if (y >= global.last_pos.py){
        estado = estado_move;
        
        xscale = 1.5;
        yscale = .5;
        
        vspd = 0;
        
        repeat (5) {
        	cria_particula(spr_part_fumaca, x, y+sprite_height/2, depth-1, true, obj_player, true);
        }
        
        pisca(1, c_yellow);
        
        screen_shake(5);
        
        if (instance_exists(obj_seta)) obj_seta.invisible = false;
    }    
}

estado = estado_cai;