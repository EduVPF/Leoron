if (estado == "ESCONDIDO")
{
    sprite_index = sEspinhoJuca;
}
else if (estado == "SUBINDO")
{
    sprite_index = sEspinhoJuca_1;
    
    if (image_index >= image_number - 1)
    {
        estado = "ESPERANDO"; 
    }
}
else if (estado == "ESPERANDO")
{
    sprite_index = sEspinhoJuca_2;

    if (place_meeting(x, y, oJuca))
    {

        if (oJuca.estado != "MORTO")
        {
            oJuca.vida -= 1;
            
            if (oJuca.vida > 0)
            {

                oJuca.v_speed = -8; 
                oJuca.estado = "PULANDO"; 
            }
            else
            {

                oJuca.estado = "MORTO";
                oJuca.timer_morte = 60;
                oJuca.x_morte = oJuca.x;
                oJuca.y_morte = oJuca.y;
            }
            
            estado = "DESCENDO";
        }
    }
}
else if (estado == "DESCENDO")
{

    estado = "ESCONDIDO";
    sprite_index = sEspinhoJuca; 
    

    visible = false; 

    if (instance_exists(oBotaoJuca))
    {
        var pos1 = [55, 242];
        var pos2 = [287, 242];
        var pos3 = [353, 242];
        var pos4 = [82, 242];
        var pos5 = [200, 242];
        
        var novo_lugar = choose(pos1, pos2, pos3, pos4, pos5);
        
        while (oBotaoJuca.x == novo_lugar[0] && oBotaoJuca.y == novo_lugar[1])
        {
            novo_lugar = choose(pos1, pos2, pos3, pos4, pos5);
        }
        
        oBotaoJuca.x = novo_lugar[0];
        oBotaoJuca.y = novo_lugar[1];
        
        oBotaoJuca.ativo = true;
        oBotaoJuca.visible = true; 
    }
}