if (audio_group_is_loaded(ag_musica))
{

    if (!audio_is_playing(saul))
    {

        audio_play_sound(saul, 10, true);
        

        audio_group_set_gain(ag_musica, global.vol_musica, 0);
    }
}