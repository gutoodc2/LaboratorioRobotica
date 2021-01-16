% Trajetória trapezoidal
% Para simular, digite na área de trabalho:
% [q, qd,  qdd] = meuteste(30, 70, 5);

function [q, qd,  qdd] = meuteste(q0, qf, tf)
close all
q = 0; qd = 0; qdd = 0;
%Valores máximos
%qd_max = 2*(qf - q0) / tf %(4.9)
%qd_max = 10;
%qcdd = 10;
tc = (1/3)*tf
%tc = (q0-qf+qcdd*tf)/qcdd
qcdd = (q0-qf)/(tc-tf)
%Aceleração
%qcdd = 4 *(qf - q0) / ( tf ^ 2) + 3 % (4.7)
%tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-q0))/qcdd ) %(4.6)

for t = 0.01:0.01:tf;
    if  t  <= tc, 
            q = [q, q0 + (1/2)*qcdd*t^2];
            qd = [qd, qcdd*t];
            qdd = [qdd, qcdd];
    end
    if  (t > tc) & t <=(tf - tc)
            q = [q,  q0 + qcdd*(t-tc)];
            qd = [qd, qcdd];
            qdd = [qdd, 0];
    end
    if (t > (tf - tc)) & (t <= tf)
            %q = [q, qf - 1/2 * qcdd *(tf - t)^2];
            %qd = [qd, qcdd*(tf-t)];
            %qdd = [qdd, -qcdd];
            q = [q, qf - (qcdd/2*tc) *(tf - t)^2];
            qd = [qd, qcdd/tc*(tf-t)];
            qdd = [qdd, -qcdd/tc];
    end
end
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, q),  title 'Posição'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Aceleração'

