inputs();
move();

iniy = 100+margem*margem_multiy;
iniy = 100+margem*margem_multix;

x = lerp(x, inix+indicex*33, .15);
y = lerp(y, iniy+indicey*33, .15);