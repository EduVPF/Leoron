alpha += velocidade * estado;


if (alpha >= 1 && estado == 1)
{

    room_goto_next(); 
    

    estado = -1; 
}


if (alpha <= 0 && estado == -1)
{

    instance_destroy(); 
}