%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trajetória trapezoidal                       %
% Para simular, digite na área de trabalho:    %
% [q, qd,  qdd] = meutestedois(30, 70, 5, 10); %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% SUMÁRIO %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% q0 -> Ponto Inicial                          %
% qf -> Ponto Final                            %
% tf -> Tempo Final                            %
% w  -> Velocidade Do Movimento                %    
% tc -> Tempo de Fusão                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parâmetros de entrada e retorno da função
function [q, qd,  qdd] = meutestedois(q0, qf, tf, w)
close all
q = 0; qd = 0; qdd = 0;

% Cálculo de valor máximo de velocidade
%w_max = 2*(qf - q0) / tf
% Cálculo do tempo de fusão tc
tc = (q0 - qf + w*tf)/w;

% Cálculo pela Aceleração (substituir todos os w por qcdd
%qcdd = 4 *(qf - q0) / ( tf ^ 2) + 3 % (4.7)
%tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-q0))/qcdd ) %(4.6)

for t = 0.01:0.01:tf;
    if  t  <= tc, 
            q = [q, q0 + 1/2*w*t^2];
            qd = [qd, w*t];
            qdd = [qdd, w];
    end
    if  (t > tc) & t <=(tf - tc)
            q = [q,  q0 + w*tc *(t - tc/2)];
            qd = [qd, w*tc*(1)];
            qdd = [qdd, 0];
    end
    if (t > (tf - tc)) & (t <= tf)
            %q = [q, qf - 1/2 * w *(tf - t)^2];             %aceleração
            %qd = [qd, w*(tf-t)];
            %qdd = [qdd, -w];
            q = [q, qf - (1/(2*tc)) * w *(tf - t)^2];
            qd = [qd, (w/tc)*(tf-t)];
            qdd = [qdd, -w/tc];
    end
end
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, q),  title 'Posição'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Aceleração'





