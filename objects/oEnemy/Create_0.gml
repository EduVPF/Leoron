#region Variaveis
move_speed = 0;
speed_max = 1; 
v_speed = 0;
v_max = 4.9; 
grav = 0.25;
chao = false;
parede = false;
vida = 3;
distancia_visao = 120; 
x_inicial = x; 
y_inicial = y;
estado = "PARADO";
limite_perseguicao = 250;

tempo_de_espera = 60; 
timer = tempo_de_espera; 
#endregion

ia_inimigo = function()
{
	if (chao)
	{
		move_speed = 0; 
		
		timer -= 1; 
		
		if (chao == true && estado == "ATACANDO" ){
			sprite_index = sEnemyIdle;
		}
		if (chao == true && estado == "VOLTANDO" ){
			sprite_index = sEnemyIdle;
		}

		if (timer <= 0)
		{
			var vai_pular = false;
			var direcao_do_pulo = 0;
	
			if (instance_exists(oPlayer))
			{
				var distancia = distance_to_object(oPlayer);
				
                var bloqueio_chao = collision_line(x, y - 15, oPlayer.x, oPlayer.y - 15, oChao, false, true);
                var bloqueio_parede = collision_line(x, y - 15, oPlayer.x, oPlayer.y - 15, oParede, false, true);
                
                var visao_livre = (bloqueio_chao == noone && bloqueio_parede == noone);

				if (distancia <= distancia_visao && global.camuflado == false && visao_livre == true)
				{
					estado = "ATACANDO";
					direcao_do_pulo = sign(oPlayer.x - x);
					vai_pular = true;
					sprite_index = sEnemyPulo;
				}
				else if (abs(x - x_inicial) > speed_max) 
				{
					estado = "VOLTANDO";
					direcao_do_pulo = sign(x_inicial - x); 
					vai_pular = true;
					tempo_de_espera = 30; 
					move_speed = 2;
					sprite_index = sEnemyPulo;
				}
				else
				{
					estado = "PARADO";
					x = x_inicial; 
					sprite_index = sEnemy;
				}
			}
			
			if (vai_pular == true)
			{
				v_speed = -v_max; 
				move_speed = direcao_do_pulo * speed_max; 
				
				if (direcao_do_pulo != 0) image_xscale = -direcao_do_pulo;
			}
			
			timer = tempo_de_espera; 
		}
	}
}

movimento = function()
{
	if (!chao)
	{
		v_speed += grav;
	}
	else
	{
		if (v_speed >= 0)
		{
			v_speed = 0;
			y = round(y);
		}
	}
	
	move_and_collide(move_speed, v_speed, [oChao, oParede]);
}

checa_chao = function()
{
	chao = place_meeting(x, y + 1, oChao);
}

checa_parede = function()
{
	parede = place_meeting(x - 1, y, oParede) || place_meeting(x + 1, y, oParede);
}