m_speed = 4;
m_airSpeed = 3;
m_jumpForce = 12;
m_gForce = 0.75;
m_hangingUpSpeed = 4;
m_canMoveInAir = false;
m_friction = 0.97;
m_waterFriction = 0.5;
m_maxHp = 99;

hp = m_maxHp;

state = st_idle; // Variavel que ira gerenciar o estado atual do personagem
scr_keys();      // Inicia as variáveis das teclas

inWater = false;
hangingUp = false;

ySpeed = 0;
xSpeed = 0;
grav = 0;