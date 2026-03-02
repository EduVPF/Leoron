
#region Variaveis
global.camuflado = false;
move_speed = 0;
speed_max = 1.75;
v_speed = 0;
v_max = 3.5;
grav = 0.2;
chao = false;
parede = false;
vida = 3;
tempo_invulneravel = 0;
energia_maxima = 300;
energia_atual = 300;      
poder = true;
pulos = 1;
chaves = 0;
coyote_max = 20;
coyote_timer = 0;
#endregion

right = false
left = false
jump = false

inputs = function()
{
    right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	jump = keyboard_check(vk_space);
	esc = keyboard_check(vk_escape);
if (keyboard_check_pressed(ord("C")) && poder == true)
    {
		if (!place_meeting(x, y, oPlataformaD))
        {
            global.camuflado = !global.camuflado; 
        }
    }
}

movimento = function()
{
	var lista_de_colisao = [oChao, oParede, oPorta, oPortaInicio];
	move_speed = (right - left) * speed_max;

	// ==========================================
	// 1. O CRONÔMETRO DO COYOTE
	// ==========================================
	if (chao == true) 
	{
		coyote_timer = coyote_max; // Enche o tempo!
	}
	else 
	{
		coyote_timer -= 1; // Esvazia enquanto cai
	}

	// ==========================================
	// 2. A FÍSICA E ANIMAÇÕES
	// ==========================================
	if (!chao)
	{
		v_speed += grav; // Aplica gravidade
		
		if (v_speed < 0 && (keyboard_check(ord("A")))){
			image_xscale = -1;
		}
		else if(keyboard_check(ord("D"))){
			image_xscale = 1;
		}
		if (v_speed >= 0 && ((keyboard_check(ord("A"))))){
			image_xscale = -1;
		}
		
		if (v_speed < 0) {
			sprite_index = sPlayerPULO; 
		} else {
			sprite_index = sPlayerCAI; 
		}
	}
	else
	{
		// Se está no chão, zera a gravidade e ajusta a sprite
		if (v_speed >= 0) // Segurança para não cancelar o pulo!
		{
			v_speed = 0;
			y = round(y);
		}
		
		sprite_index = sPlayer;
		
		if(parede && keyboard_check(ord("A"))){
			x = round(x);
			y = round(y);
		}
	}

	// ==========================================
	// 3. O PULO COYOTE (LIVRE DO ELSE!)
	// ==========================================
	if (jump && pulos > 0 && coyote_timer > 0)
	{
		v_speed = -v_max;
		coyote_timer = 0; // ZERA O TEMPO para ele não pular duas vezes no ar!
		audio_play_sound(sndjump, 1, false); 
	}

	// ==========================================
	// 4. COLISÕES
	// ==========================================
	if (global.camuflado == true)
	{
		array_push(lista_de_colisao, oPlataformaD);
	}
	
	move_and_collide(move_speed, v_speed, lista_de_colisao, 24);
	move_and_collide(0, v_speed, lista_de_colisao, 24);
	
	// Fricção da Parede
	if (parede && v_speed > 0){
		v_speed = 0.5;
		sprite_index = sPlayerPAREDE;
	}
	if (parede && chao == true && v_speed > 0){
		v_speed = 0;
		sprite_index = sPlayer;
	}
}

checa_chao = function()
{
	var pisou_chao = place_meeting(x, y + 1, oChao);
	var pisou_magico = global.camuflado && place_meeting(x, y + 1, oPlataformaD);
	chao = pisou_chao || pisou_magico;
}


checa_parede = function()
{
	var bateu_parede = place_meeting(x - 1, y, oParede) || place_meeting(x + 1, y, oParede);
	var bateu_magico = global.camuflado && (place_meeting(x - 1, y, oPlataformaD) || place_meeting(x + 1, y, oPlataformaD));
	parede = bateu_parede || bateu_magico;
}

var pegou_chave = instance_place(x, y, oChave);


if (pegou_chave != noone)
{
    chaves += 1;                 
    instance_destroy(pegou_chave); 
}
