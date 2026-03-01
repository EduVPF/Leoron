if (ativo == true)
{

    if (place_meeting(x, y - 1, oPlayer) || place_meeting(x, y, oPlayer))
    {
        ativo = false;
        visible = false;
        

        if (instance_exists(oEspinhoJuca))
        {
            oEspinhoJuca.x = x;
            oEspinhoJuca.y = y +35;
            
            oEspinhoJuca.estado = "SUBINDO";
            oEspinhoJuca.image_index = 0; 
        }
    }
}