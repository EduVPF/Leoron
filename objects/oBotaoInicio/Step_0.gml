if (place_meeting(x, y, oPlayer) && pressionado == false)
{
    pressionado = true; 
    audio_play_sound(sndbutton, 1, false);

    sprite_index = sBotaoPortaPress; 
    

    if (instance_exists(oPortaInicio))
    {
        oPortaInicio.abrindo = true;
    }
}