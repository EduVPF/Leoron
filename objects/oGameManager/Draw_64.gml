if (global.camuflado == true)
{
draw_set_colour(c_blue);

draw_set_alpha(0.1);

var largura_tela = display_get_gui_width();
var altura_tela = display_get_gui_height();

draw_rectangle(0, 0, largura_tela, altura_tela, false);

draw_set_color(c_white);
draw_set_alpha(1);
}