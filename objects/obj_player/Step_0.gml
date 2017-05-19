/// Iniciação dos Scripts

dir = keyboard_check(key.right) - keyboard_check(key.left); // Direção na qual o jogador está tentando andar, onde 1 é direita, -1 é esquerda e 0 é nulo;
wantMove = abs(dir); // Variável booleana, que diz se o jogador quer mover o personagem ou não, pois precionando uma das teclas de movimento, os valores possíveis são 1 e -1, sendo que o absoluto destes valores, é 1, ou seja, 1 é "quer mover" e 0 é "não quer mover";

script_execute(state); // Executa o script correspondente ao estado atual do personagem;

scr_movement(); // Executa o script de movimento limpo - By: Willy (GMBR);

if (keyboard_check_pressed(key.close))
    game_end();

/*if (keyboard_check_pressed(key().damage))
    takeDamage(5);*/