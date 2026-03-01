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
        oJuca.vida -= 1;
        oJuca.v_speed = -8;
        oJuca.estado = "PULANDO"; 
        
        estado = "DESCENDO";
    }
}
else if (estado == "DESCENDO")
{

    estado = "ESCONDIDO";
    

    if (instance_exists(oBotaoJuca))
    {

        var novo_lugar_x = choose(57, 150, 390);
        
        while (oBotaoJuca.x == novo_lugar_x)
        {
            novo_lugar_x = choose(57, 150, 390);
        }
        
        oBotaoJuca.x = novo_lugar_x;
        oBotaoJuca.ativo = true;
        oBotaoJuca.visible = true; 
    }
}