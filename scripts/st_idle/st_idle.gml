if (place_free(x, y+1))
{
  state = st_air; // Se tiver pixel vago abaixo do personagem, é por que está no ar
}

if (place_meeting(x, y+1, obj_ice))
{
  xSpeed *= m_friction;     // Se o personagem estiver sobre o gelo, ele adiciona
                            // a fricção e zera a velocidade caso ela seja muito
  if (abs(xSpeed) < 0.001)  // próxima de zero
    xSpeed = 0;
}
else if (!wantMove) // Se as teclas direita e esquerda não estiverem precionadas
  xSpeed = 0;       // a velocidade horizintal é zerada

if (wantMove)
{                     // Se as teclas direita e esquerda estiverem precionadas, muda
  state = st_moving;  // o estado e encerra o script
  exit;
}
else if (keyboard_check_pressed(key.jump) && !place_free(x,y+1))
{
  ySpeed = -m_jumpForce;  // Se a tecla de pulo for precionada, ele adiciona a força
  m_jumpDirection = 0;    // de pula na velocidade, indica a direção do pulo, muda
  state = st_air;         // o estado e encerra o script
  exit;
}
