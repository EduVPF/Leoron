if (ativo == true)
{
    if (place_meeting(x, y - 1, oPlayer) || place_meeting(x, y, oPlayer))
    {
        ativo = false;
        visible = false;
audio_play_sound(sndbutton, 1, false);
        if (instance_exists(oEspinhoJuca))
        {
            oEspinhoJuca.x = x;
            oEspinhoJuca.y = y;
            oEspinhoJuca.estado = "SUBINDO";
            oEspinhoJuca.image_index = 0; 
            
            oEspinhoJuca.visible = true;
        }
    }
}