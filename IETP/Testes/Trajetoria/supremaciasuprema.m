% Trajetória trapezoidal
% Para simular, digite na área de trabalho:
% [q, qd,  qdd] = linear_parabolic(30, 70, 5);

function [q, qd,  qdd] = supremaciasuprema(qi, qf, tf)
close all
q = 0; qd = 0; qdd = 0;
%Valores máximos
%a = (2*(qf - qi) / tf)%(4.9)
%qd_max = 10;
v = 10
tc = (qi - qf + v*tf)/v;

%Aceleração
%qcdd = 4 *(qf - q0) / ( tf ^ 2) + 3 % (4.7)
%tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-q0))/qcdd ) %(4.6)

for t = 0.01:0.01:tf;
    if  t  <= tc, 
            q = [q, qi + 0.5*v*t^2];
            qd = [qd, v*t];
            qdd = [qdd, v];
    end
    if  (t > tc) & t <=(tf - tc)
            q = [q,  qi + v*tc*(t-0.5*tc)];
            qd = [qd, v];
            qdd = [qdd, 0];
    end
    if (t > (tf - tc)) & (t <= tf)
            q = [q, qf - 0.5*v*(tf - t)^2];
            qd = [qd, v/tc*(tf-t)];
            qdd = [qdd, -v/tc];
    end
end
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, q),  title 'Posição'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Aceleração'





