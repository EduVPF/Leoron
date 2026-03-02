if (abrindo == true)
{
audio_play_sound(sndporta, 1, false);
    if (y > y_inicial - limite_subida)
    {

        y -= velocidade; 
        

        if (choose(true, false, false)) 
        {

            var pos_x = x + random_range(0, sprite_width);
            var pos_y = y + sprite_height;
            

            effect_create_below(ef_smoke, pos_x, pos_y, 0, c_gray);
        }
    }
    else
    {
	audio_stop_sound(sndporta);
        abrindo = false;
        
        mask_index = -1; 
    }
}