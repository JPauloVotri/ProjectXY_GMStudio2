if (place_meeting(x, y, obj_water) && !inWater)
{
  m_speed          *= m_waterFriction;   // Se estiver na água, é reduzida a velocidade,
  xSpeed           *= m_waterFriction;   // força de pulo, gravidade e velocidade de
  m_jumpForce      *= m_waterFriction;   // subida, além de alterar o valor da variavel
  m_gForce         *= m_waterFriction;   // que diz se o personagem está na água ou não
  m_hangingUpSpeed *= m_waterFriction;

  inWater = true;
}
else if (!place_meeting(x, y, obj_water) && inWater)
{
  m_speed          /= m_waterFriction;   // Reseta os valores das váriáveis quando não
  m_jumpForce      /= m_waterFriction;   // está na água
  m_gForce         /= m_waterFriction;
  m_hangingUpSpeed /= m_waterFriction;

  inWater = false;
}

if (place_free(x, y+1))
{
  m_jumpDirection = sign(xSpeed);   // Se o personagem não estiver em cima de nada sólido,
  state           = st_air;         // é guardada a direçao na qual o jogador estava andando,
  exit;                             // o estado é mudado e o script é encerrado
}

if (keyboard_check(key.right))
  xSpeed = m_speed;                // Move o personagem dependendo da tecla de direção
else if (keyboard_check(key.left)) // precionada
  xSpeed = -m_speed;
else
{
  state = st_idle;                // Se nenhuma tecla de direção for precionada, muda
  exit;                           // o estado e encerra o script
}

if (keyboard_check_pressed(key.jump) && !place_free(x,y+1))
{
  ySpeed          = -m_jumpForce;  // Se a tecla de pulo for precionada e o personagem
  m_jumpDirection = sign(xSpeed);  // estiver no chao, pula, guarda a direção atual, muda o
  state           = st_air;        // estado e encerra o script
  exit;
}
