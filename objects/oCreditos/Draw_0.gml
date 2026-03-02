draw_set_font(fnt_dialogo); 
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_color(c_white);

var meio_da_tela_x = room_width / 2;
var meio_da_tela_y = room_height / 2;

var texto_final = "OBRIGADO POR JOGAR!\n\nProgramação:Zeno \nArtes: Zeno & Free Assets\nLevel Design: Zeno\n\nA Mosca Dourada está a salvo!";

draw_text_transformed(meio_da_tela_x, meio_da_tela_y, texto_final, 2, 2, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);