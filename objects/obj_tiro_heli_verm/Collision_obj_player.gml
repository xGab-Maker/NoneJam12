other.xscale += .4;
other.yscale -= .3;

global.combus_qnt -= .1;

instance_destroy(self);

screen_shake(5);

pisca(.5, c_red);

other.alp_branco = 1;