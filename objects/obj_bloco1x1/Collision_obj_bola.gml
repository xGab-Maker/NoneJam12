var _dir = point_direction(x, y, other.x, other.y);

var _hspd = lengthdir_x(5, _dir);
var _vspd = lengthdir_x(5, _dir);

other.x += _hspd;
other.y += _vspd;