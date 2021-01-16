% Trajetória trapezoidal
% Para simular, digite na área de trabalho:
% [q, qd,  qdd] = linear_parabolic(30, 70, 5);

function [q, qd,  qdd] = lspbJUNTO(qi, qf, tf, V)
    
    q = 0; qd = 0; qdd = 0;
    s = 0; sd = 0; sdd = 0;
    
if V == 0

%Aceleração
qcdd = 4 *(qf - qi) / ( tf ^ 2)+3;% (4.7)
tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-qi))/qcdd ); %(4.6)

for t = 0.01:0.01:tf;
    if  t  <= tc, 
            q = [q, qi + 1/2*qcdd*t^2];
            qd = [qd, qcdd*t];
            qdd = [qdd, qcdd];
    end
    if  (t > tc) & t <=(tf - tc)
            q = [q,  qi + qcdd*tc *(t - tc/2)];
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
  subplot(3,1,1), plot(t, q),  title 'Posição'
  subplot(3,1,2), plot(t, qd), title 'Velocidade'
  subplot(3,1,3), plot(t, qdd),title 'Aceleração'
end

if V ~= 0

    tb = (qi - qf + V*tf)/V;
    a = V/tb

    for  t = 0.01:0.01:tf;
        if t <= tb
            s =[s, qi + a/2*t^2];
            sd =[sd, a*t];
            sdd =[sdd, a];
        elseif t <= (tf-tb)
            s =[s, (qf+qi-V*tf)/2 + V*t];
            sd =[sd, V];
            sdd =[sdd, 0];
        else
            s =[s, qf - a/2*tf^2 + a*tf*t - a/2*t^2];
            sd =[sd, a*tf - a*t];
            sdd =[sdd, -a];
        end
    end
	
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, s),  title 'Posição'
  subplot(3,1,2), plot(t, sd), title 'Velocidade'
  subplot(3,1,3), plot(t, sdd),title 'Aceleração'
    
end