draw_set_color(c_dkgray);
draw_rectangle(x, y, x + largura, y + altura, false);


var volume_atual = 0;
if (tipo == "musica") volume_atual = global.vol_musica;
else if (tipo == "efeitos") volume_atual = global.vol_efeitos;


draw_set_color(c_green);
var tamanho_preenchido = largura * volume_atual;
draw_rectangle(x, y, x + tamanho_preenchido, y + altura, false);


draw_set_color(c_white);
var texto_porcentagem = string(round(volume_atual * 100)) + "%";
draw_text(x, y - 25, "Volume (" + tipo + "): " + texto_porcentagem);


draw_set_color(c_white);