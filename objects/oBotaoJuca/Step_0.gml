if (ativo == true)
{
    if (place_meeting(x, y - 1, oPlayer) || place_meeting(x, y, oPlayer))
    {
        ativo = false;
        visible = false; // O botão some
        
        // Chama o espinho e mostra ele!
        if (instance_exists(oEspinhoJuca))
        {
            oEspinhoJuca.x = x;
            oEspinhoJuca.y = y;
            oEspinhoJuca.estado = "SUBINDO";
            oEspinhoJuca.image_index = 0; 
            
            oEspinhoJuca.visible = true; // FAZ O ESPINHO APARECER AQUI!
        }
    }
}