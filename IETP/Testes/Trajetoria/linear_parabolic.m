% Trajet�ria trapezoidal
% Para simular, digite na �rea de trabalho:
% [q, qd,  qdd] = linear_parabolic(30, 70, 10);

function [q, qd,  qdd] = linear_parabolic(q0, qf, w)
close all
q = 0; qd = 0; qdd = 0; 
tf=5;
%Valores m�ximos
%qd_max = 2*(qf - q0) / tf %(4.9)
%qd_max = 10;
%tc = (q0 - qf + qd_max*tf)/qd_max;

%Implementa��o na Velocidade->Introduction to Robotics - Saeed Niku Cap 5

tb = ((q0-qf)+(w*tf))/w;    %Tempo de Fus�o


%Acelera��o
%qcdd = 4 *(qf - q0) / ( tf ^ 2) + 3 % (4.7)
%tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-q0))/qcdd ) %(4.6)

for t = 0.01:0.01:tf;
    if  t  <= tb, 
            q = [q, q0 + 1/2*qdd*t^2];
            qd = [qd, qdd*t];
            qdd = [qdd];
    end
    if  (t > tb) & t <=(tf - tb)
            q = [q,  q0 + qdd*tb *(t - tb/2)];
            qd = [qd, qdd*tb*(1)];
            qdd = [qdd, 0];
    end
    if (t > (tf - tb)) & (t <= tf)
            q = [q, qf -(qdd/2*tb)*(tf - t)^2];
            qd = [qd, (qdd/tb)*(tf-t)];
            qdd = [qdd, -qdd/tb];
    end
end
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, q),  title 'Posi��o'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Acelera��o'





