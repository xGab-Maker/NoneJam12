global.combus_qnt = 1;

switch (part_tutorial) {
	case 0: 
        global.para_sobe = true;
    
        escrita = "Clique MB para atirar";
    
        if (alp_txt > .9){
            if (mouse_check_button_pressed(mb_left) and !passa){
                true_pass()
            }
        }
        
        logica_pass();
    break;
    
    case 1:
        global.para_sobe = true;    
    
        escrita = "Ande usando A ou D";
    
        if (alp_txt > .9){
            if ((keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D"))) and !passa){
                true_pass()
            }
        }
    
        logica_pass();
    break;
     
	case 2: 
        if (instance_exists(obj_bloco1x1)){
            blocks = true;
        }
    
        global.para_sobe = blocks;
    
        escrita = "Destrua as Casas e/ou Arvores";
    
        if (!instance_exists(obj_bloco1x1) and !passa and blocks){
            true_pass();
        }
    
        logica_pass();
    break;
    
    case 3:
        global.para_sobe = true;
    
        escrita = "A barra de cima mostra o seu progresso\n(Clique ENTER para prosseguir)";
    
        if (keyboard_check_pressed(vk_enter) and !passa){
            true_pass()
        }
    
        logica_pass();
    break;
    
    case 4:
        global.para_sobe = true;
    
        escrita = "A barra embaixo de seu rosto\né o seu combustivel (Sua Vida)\n(Clique ENTER para prosseguir)";
    
        if (keyboard_check_pressed(vk_enter) and !passa){
            true_pass()
        }
    
        logica_pass();
    break;
    
    case 5:
        global.para_sobe = true;
    
        escrita = "Quando concluir a barra de progresso\nvocê voltara ao seu planeta\n(Clique ENTER para prosseguir)";
    
        if (keyboard_check_pressed(vk_enter) and !passa){
            true_pass();
        }
    
        logica_pass();
    break;
    
    case 6:
        global.para_sobe = true;
    
        escrita = "Ao voltar ao planeta você ganhara 1 melhoria\ne também melhorias compraveis!\n(Clique ENTER para prosseguir)";
    
        if (keyboard_check_pressed(vk_enter) and !passa){
            true_pass()
        }
    
        logica_pass();
    break;
    
    case 7:
        global.para_sobe = true;
    
        escrita = "Com isso explicado não deixe a Cidade LOTAR\nNem seu Combustivel ACABAR\n(Ass. Base de Comando)\n(Clique ENTER para prosseguir)";
    
        if (keyboard_check_pressed(vk_enter) and !passa){
            true_pass();
        }
    
        logica_pass();
    break;
}

xscale = elastic("xs", xscale, 1);
yscale = elastic("ys", yscale, 1);