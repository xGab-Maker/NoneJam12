if (alpha_dano > 0){
    var _quebra = 3;
    
    var _dim = 0;
    var _addy = 0;
    
    for (var i = 0; i < vida; i++) {
        var _inew = i mod _quebra;
        
        if (i mod _quebra == 0){
            _addy++;
        }
        
        var _spr = spr_vida_cheia;
        
        if (i > vida-(vida_perd+1)){     
            _spr = spr_vida_vazia;
        }
    
        var _width = sprite_get_width(_spr);
        var _height = sprite_get_height(_spr);
        
        if (vida != 1){
            _dim = (vida/2)*_width/2+_width/2.5;
        }
        
    	draw_sprite_ext(_spr, 0, x+(_inew*_width)-_dim, y-sprite_height+(_addy*_height), xscale_dano, yscale_dano, 0, c_white, alpha_dano);
    }
}