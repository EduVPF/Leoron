if (mouse_check_button(mb_left))
{

    if (mouse_x >= x && mouse_x <= x + largura && mouse_y >= y && mouse_y <= y + altura)
    {

        var porcentagem = (mouse_x - x) / largura;
        

        porcentagem = clamp(porcentagem, 0, 1);
        

        if (tipo == "musica")
        {
            global.vol_musica = porcentagem;
            audio_group_set_gain(ag_musica, global.vol_musica, 0);
        }
        else if (tipo == "efeitos")
        {
			 audio_play_sound(sndjump, 1, false); 
            global.vol_efeitos = porcentagem;
            audio_group_set_gain(ag_efeitos, global.vol_efeitos, 0);
        }
    }
}