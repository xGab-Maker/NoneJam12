other.xscale += .2;
other.yscale -= .15;

global.combus_qnt -= .05;

instance_destroy(self);

screen_shake(5);

pisca(.5, c_red);

other.alp_branco = 1;