al_draw = lerp(al_draw, .6, .15);

sai_xs = elastic("saixs", sai_xs, sai_nxs, , .2);
sai_ys = elastic("saiys", sai_ys, sai_nys, , .2);
sai_an = elastic("saian", sai_an, 0, , .2);

tent_xs = elastic("tentxs", tent_xs, tent_nxs, , .2);
tent_ys = elastic("tentys", tent_ys, tent_nys, , .2);
tent_an = elastic("tentan", tent_an, 0, , .2);

global.pause = true;