% Trajetória trapezoidal
% Para simular, digite na área de trabalho:
% [q, qd,  qdd] = linear_parabolic_vel(Posição Inicial, Posição Final, Velocidade Máxima);
% EX: [q, qd,  qdd] = linear_parabolic_vel(30, 70, 5);

% Entrada de dados:
C = input('Cálculo da trajetória: [1] Por Tempo, [2] Pela Velocidade: ')

if C == 1
    qi = input('Posição Inicial: ');
    qf = input('Posição Final: ');
    tfc1  = input('Tempo da trajetória: ');

qcdd = 4 *(qf - qi) / ( tfc1 ^ 2) + 3 % (4.7)
tc = tf/2 - (1/2)*sqrt((tfc1^2*qcdd-4*(qf-qi))/qcdd ) %(4.6)

for t = 0.01:0.01:tfc1;
    if  t  <= tc, 
            q = [q, qi + 1/2*qcdd*t^2];
            qd = [qd, qcdd*t];
            qdd = [qdd, qcdd];
    end
    if  (t > tc) & t <=(tfc1 - tc)
            q = [q,  qi + qcdd*tc *(t - tc/2)];
            qd = [qd, qcdd*tc*(1)];
            qdd = [qdd, 0];
    end
    if (t > (tf - tc)) & (t <= tfc1)
            q = [q, qf - 1/2 * qcdd *(tfc1 - t)^2];
            qd = [qd, qcdd*(tfc1-t)];
            qdd = [qdd, -qcdd];
    end
end
% Plots
t = [0: 0.01: tfc1];
figure
  subplot(3,1,1), plot(t, q),  title 'Posição'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Aceleração'
end
