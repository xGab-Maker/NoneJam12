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