#region Variaveis
global.camuflado = false;
move_speed = 0;
speed_max = 1.25;
v_speed = 0;
v_max = 3.5;
grav = 0.2;
chao = false;
parede = false;
vida = 3;
energia_maxima = 1000;
energia_atual = 1000;      
poder = true;
pulos = 1;
chaves = 0;
caracteres_escritos = 0;
velocidade_texto = 0.5;
#endregion
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

textos = [
    "Olá, Leoron!",
    "Como você sabe os sapos estão cada vez mais fortes...",
    "Precisamos recuperar a mosca dourada",
    "Eu anos atrás invadi o território deles",
	"Estudei por meses, e espalhei armadilhas escondidas no nosso mundo espiritual",
	"Você ainda sabe como entrar lá né?",
	"Apertando C você se camufla e entra no outro mundo, eles não conseguem te ver lá, mas cuidado com sua energia, se ela acabar você volta pro mundo normal",
	"Consegue ver os blocos azuis agora? Subindo neles você encontrará os botões verdes para acionar as armadilhas e os amarelos as portas",
	"Os sapos te darão uma chave ao morrerem, utilize para avançar",
	"Mas lembre-se eles estão muito mais fortes que nós e eles te detectam facilmente se não estiver camuflado, não seja pego de JEITO NENHUM",
	"O maldito Joca, O Imperador Sapo estará no final do caminho, e lá será mais difícil...",
	"Mas sei que você vai conseguir, Boa sorte garoto.",
	
];

pagina = 0; 
falando = false; 
distancia_interacao = 60; 
passagem_liberada = false; 