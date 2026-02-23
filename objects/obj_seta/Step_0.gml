depth = -y;

var _dir = point_direction(paix, paiy, mouse_x, mouse_y);

var _qnt = 20;

x = lerp(x, paix+lengthdir_x(_qnt, _dir), .5);
y = lerp(y, paiy+lengthdir_y(_qnt, _dir), .5);

image_angle = 90+_dir;