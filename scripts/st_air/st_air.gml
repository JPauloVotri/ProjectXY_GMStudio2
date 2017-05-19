if (place_meeting(x, y, obj_water) && !inWater)
{
           m_speed *= m_waterFriction;  // Se estiver na água, é reduzida a velocidade,
            xSpeed *= m_waterFriction;  // força de pulo, gravidade e velocidade de
       m_jumpForce *= m_waterFriction;  // subida, além de alterar o valor da variavel
          m_gForce *= m_waterFriction;  // que diz se o personagem está na água ou não
  m_hangingUpSpeed *= m_waterFriction;

  inWater = true;
}
else if (!place_meeting(x, y, obj_water) && inWater)
{
           m_speed /= m_waterFriction;  // Reseta os valores das váriáveis quando não
       m_jumpForce /= m_waterFriction;  // está na água
          m_gForce /= m_waterFriction;
  m_hangingUpSpeed /= m_waterFriction;

  inWater = false;
}

if (place_free(x, y+1))
  grav = m_gForce;  // Aplica a gravidade se o personagem estiver no ar
else
{
  grav = 0;             // Se não, zera a gravidade e a direção do pulo, muda o
  m_jumpDirection = 0;  // estado e encerra o Script
  state = st_idle;
  exit;
}

if (keyboard_check_released(key.jump) && ySpeed < 0)
  ySpeed /= 2;  // Se soltar a tecla de pulo enquanto sobre, a velocidade é dividida

if (keyboard_check(key.right))
{
  if (m_jumpDirection != 1) || (xSpeed == 0)
  {                       // Se a tecla de movimento para a direita for
    m_jumpDirection = 0;  // pressionada e estiver indo para a esquerda, zera
    xSpeed = m_airSpeed;  // a direção do pulo, e muda a velocidade no ar
  }
}
else if (keyboard_check(key.left))
{
  if ((m_jumpDirection != -1) || (xSpeed == 0))
  {
    m_jumpDirection = 0;  // Mesma coisa do if acima, porem na direção inversa
    xSpeed = -m_airSpeed;
  }
}

if (place_meeting(x, y, obj_grab) and !place_meeting(x, y+ySpeed, obj_grab) &&
    ySpeed > 0 && !place_free(x+dir, y))
{
    repeat (abs(ySpeed))
    {
        y++;
        
        if (!place_meeting(x, y, obj_grab))
        {
            hangingDirection = dir;
            ySpeed = 0;
            grav = 0;
            state = st_hanging;
            exit;
        }
    }
}
