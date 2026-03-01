if (place_meeting(x, y, oPlayer) && pressionado == false)
{
    pressionado = true; 
    

    sprite_index = sBotaoPortaPress; 
    

    if (instance_exists(oPortaInicio))
    {
        oPortaInicio.abrindo = true;
    }
}