% Este trecho de código pega posições e implementa uma tecnica de pontos de
% passagem com polinomios 4-3-4 para o braço ROBIX (6 DoF)

% Trecho adicional ao código para inserir manualmente as posições para os
% pontos de passagem (necessário para utilização fora da estrutura
% robótica)

tf = 5;

% -----------------
% --- 1º Motor ----
% -----------------
posicoes_movimento1(1) = 0;
posicoes_movimento2(1) = 10;
posicoes_movimento3(1) = 20;
posicoes_movimento4(1) = 30;
% -----------------
% --- 2º Motor ----
% -----------------
posicoes_movimento1(2) = 0;
posicoes_movimento2(2) = 10;
posicoes_movimento3(2) = 20;
posicoes_movimento4(2) = 30;
% -----------------
% --- 3º Motor ----
% -----------------
posicoes_movimento1(3) = 0;
posicoes_movimento2(3) = 10;
posicoes_movimento3(3) = 20;
posicoes_movimento4(3) = 30;
% -----------------
% --- 4º Motor ----
% -----------------
posicoes_movimento1(4) = 0;
posicoes_movimento2(4) = 10;
posicoes_movimento3(4) = 20;
posicoes_movimento4(4) = 30;
% -----------------
% --- 5º Motor ----
% -----------------
posicoes_movimento1(5) = 0;
posicoes_movimento2(5) = 10;
posicoes_movimento3(5) = 20;
posicoes_movimento4(5) = 30;
% -----------------
% --- 6º Motor ----
% -----------------
posicoes_movimento1(6) = 0;
posicoes_movimento2(6) = 10;
posicoes_movimento3(6) = 20;
posicoes_movimento4(6) = 30;

% Iniciando o algoritmo de cálculo dos pontos de passagem

% -----------------
% --- 1º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(posicoes_movimento1(1)))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(posicoes_movimento2(1)))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(posicoes_movimento3(1)))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(posicoes_movimento4(1)))/180)*255;
vf     = 0;
af     = 0;

theta_motor1 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 1 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 2 0 0 0 0 0 0 0 0 0 0 0;
       1 tf_1 tf_1^2 tf_1^3 tf_1^4 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 1 0 0 0 0 0 0 0 0;
       0 1 2*tf_1 3*tf_1^2 4*tf_1^3 0 -1 0 0 0 0 0 0 0;
       0 0 2 6*tf_1 12*tf_1^2 0 0 -2 0 0 0 0 0 0;
       0 0 0 0 0 1 tf_2 tf_2^2 tf_2^3 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 1 0 0 0 0;
       0 0 0 0 0 0 1 2*tf_2 3*tf_2^2 0 -1 0 0 0;
       0 0 0 0 0 0 0 2 6*tf_2 0 0 -2 0 0;
       0 0 0 0 0 0 0 0 0 1 tf_3 tf_3^2 tf_3^3 tf_3^4;
       0 0 0 0 0 0 0 0 0 0 1 2*tf_3 3*tf_3^2 4*tf_3^3;
       0 0 0 0 0 0 0 0 0 0 0 2 6*tf_3 12*tf_3^2;];

c = inv(a)*theta_motor1;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor1(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor1(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor1(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor1(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor1(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor1(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor1(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor1(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor1(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor1 = [theta1_motor1 theta2_motor1 theta3_motor1];
v_f_motor1     = [v1_motor1 v2_motor1 v3_motor1];
a_f_motor1     = [a1_motor1 a2_motor1 a3_motor1];

% -----------------
% --- 2º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(posicoes_movimento1(2)))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(posicoes_movimento2(2)))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(posicoes_movimento3(2)))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(posicoes_movimento4(2)))/180)*255;
vf     = 0;
af     = 0;

theta_motor2 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor2;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor2(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor2(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor2(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor2(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor2(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor2(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor2(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor2(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor2(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor2 = [theta1_motor2 theta2_motor2 theta3_motor2];
v_f_motor2     = [v1_motor2 v2_motor2 v3_motor2];
a_f_motor2     = [a1_motor2 a2_motor2 a3_motor2];

% -----------------
% --- 3º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(posicoes_movimento1(3)))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(posicoes_movimento2(3)))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(posicoes_movimento3(3)))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(posicoes_movimento4(3)))/180)*255;
vf     = 0;
af     = 0;

theta_motor3 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor3;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor3(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor3(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor3(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor3(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor3(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor3(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor3(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor3(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor3(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor3 = [theta1_motor3 theta2_motor3 theta3_motor3];
v_f_motor3     = [v1_motor3 v2_motor3 v3_motor3];
a_f_motor3     = [a1_motor3 a2_motor3 a3_motor3];

% -----------------
% --- 4º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(posicoes_movimento1(4)))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(posicoes_movimento2(4)))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(posicoes_movimento3(4)))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(posicoes_movimento4(4)))/180)*255;
vf     = 0;
af     = 0;

theta_motor4 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor4;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor4(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor4(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor4(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor4(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor4(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor4(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor4(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor4(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor4(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor4 = [theta1_motor4 theta2_motor4 theta3_motor4];
v_f_motor4     = [v1_motor4 v2_motor4 v3_motor4];
a_f_motor4     = [a1_motor4 a2_motor4 a3_motor4];

% -----------------
% --- 5º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(posicoes_movimento1(5)))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(posicoes_movimento2(5)))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(posicoes_movimento3(5)))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(posicoes_movimento4(5)))/180)*255;
vf     = 0;
af     = 0;

theta_motor5 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor5;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor5(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor5(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor5(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor5(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor5(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor5(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor5(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor5(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor5(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor5 = [theta1_motor5 theta2_motor5 theta3_motor5];
v_f_motor5     = [v1_motor5 v2_motor5 v3_motor5];
a_f_motor5     = [a1_motor5 a2_motor5 a3_motor5];

% -----------------
% --- 6º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(posicoes_movimento1(6)))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(posicoes_movimento2(6)))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(posicoes_movimento3(6)))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(posicoes_movimento4(6)))/180)*255;
vf     = 0;
af     = 0;

theta_motor6 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor6;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor6(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor6(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor6(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor6(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor6(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor6(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor6(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor6(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor6(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor6 = [theta1_motor6 theta2_motor6 theta3_motor6];
v_f_motor6     = [v1_motor6 v2_motor6 v3_motor6];
a_f_motor6     = [a1_motor6 a2_motor6 a3_motor6];

g=linspace(0,tf,300)
figure(1)
subplot(2,3,1)
plot(g,theta_f_motor1,g,v_f_motor1,g,a_f_motor1)
legend('Posição','Velocidade','Aceleração')
title('motor 1')
subplot(2,3,2)
plot(g,theta_f_motor2,g,v_f_motor2,g,a_f_motor2)
legend('Posição','Velocidade','Aceleração')
title('motor 2')
subplot(2,3,3)
plot(g,theta_f_motor3,g,v_f_motor3,g,a_f_motor3)
legend('Posição','Velocidade','Aceleração')
title('motor 3')
subplot(2,3,4)
plot(g,theta_f_motor4,g,v_f_motor4,g,a_f_motor4)
legend('Posição','Velocidade','Aceleração')
title('motor 4')
subplot(2,3,5)
plot(g,theta_f_motor5,g,v_f_motor5,g,a_f_motor5)
legend('Posição','Velocidade','Aceleração')
title('motor 5')
subplot(2,3,6)
plot(g,theta_f_motor6,g,v_f_motor6,g,a_f_motor6)
legend('Posição','Velocidade','Aceleração')
title('motor 6')

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------