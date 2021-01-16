% Trajet�ria trapezoidal
% Para simular, digite na �rea de trabalho:
% [q, qd,  qdd] = linear_parabolic_vel(Posi��o Inicial, Posi��o Final, Velocidade M�xima);
% EX: [q, qd,  qdd] = linear_parabolic_vel(30, 70, 5);

function [q, qd,  qdd] = linear_parabolic_vel(qi, qf, w)
close all
q = 0; qd = 0; qdd = 0;

%Acelera��o m�xima � igual a velocidade m�xima
a = w;

%Calculo do Tempo Final para realizar a trajet�ria
tf = 2*w/a+((qf-qi)*a-w^2)/(w*a);

%Calculo do Tempo Final antes da velocidade m�xima
%tf = sqrt(4*(qf-qi)/a)

%C�lculo do tempo de Fus�o
tc = tf/2-sqrt(((tf^2)*a-4*(qf-qi))/(4*a)) ;

for t = 0.01:0.01:tf;
    if  t>=0 & (t <= tc), 
            q = [q, qi + 0.5*a*t^2];
            qd = [qd, a*t];
            qdd = [qdd, a];
    end
    if  (t > tc) & t <=(tf - tc)
            q = [q,  qi + a*tc*(t-0.5*tc)];
            qd = [qd, a];
            qdd = [qdd, 0];
    end
    if (t > (tf - tc)) & (t <= tf)
            q = [q, qf - 0.5*a*(tf - t)^2];
            qd = [qd, a/tc*(tf-t)];
            qdd = [qdd, -a/tc];
    end
end

% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, q),  title 'Posi��o'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Acelera��o'

