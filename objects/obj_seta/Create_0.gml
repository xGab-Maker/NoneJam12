pai = noone;

paix = 0;
paiy = 0;

cooldown_atira = 0;

atira = function(_direction, _qnt)
{
    var _randx = 0;
    var _randy = 0;
    
    var _spd = 5;
    
    var _tiro = instance_create_layer(pai.x+lengthdir_x(_qnt+10, _direction), pai.y+lengthdir_y(_qnt+10, _direction), "Tiros", obj_bola);
    
    _tiro.hspd = lengthdir_x(_spd, _direction+_randx);
    _tiro.vspd = lengthdir_y(_spd, _direction+_randy);
    _tiro.depth = depth+1;
    _tiro.image_angle = _direction;
    
    _tiro.xscale = .5;
    _tiro.yscale = .5;
}