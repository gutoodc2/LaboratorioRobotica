% Trajet�ria trapezoidal
% Para simular, digite na �rea de trabalho:
% [q, qd,  qdd] = linear_parabolic(30, 70, 5);

function [q, qd,  qdd] = lspbACE(q0, qf, tf)
close all
q = 0; qd = 0; qdd = 0;

%Acelera��o
qcdd = 4 *(qf - q0) / ( tf ^ 2)+3% (4.7)

tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-q0))/qcdd ) %(4.6)

for t = 0.01:0.01:tf;
    if  t  <= tc, 
            q = [q, q0 + 1/2*qcdd*t^2];
            qd = [qd, qcdd*t];
            qdd = [qdd, qcdd];
    end
    if  (t > tc) & t <=(tf - tc)
            q = [q,  q0 + qcdd*tc *(t - tc/2)];
            qd = [qd, qcdd*tc*(1)];
            qdd = [qdd, 0];
    end
    if (t > (tf - tc)) & (t <= tf)
            q = [q, qf - 1/2 * qcdd *(tf - t)^2];
            qd = [qd, qcdd*(tf-t)];
            qdd = [qdd, -qcdd];
    end
end
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, q),  title 'Posi��o'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Acelera��o'





