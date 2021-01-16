% Trajetória Polinomio de 5ª Ordem
% Para simular, digite na área de trabalho:
% [q, qd,  qdd] = Polinomio_5Ord(30, 70, 5);

function [q, qd,  qdd] = Polinomio_5Ord(q0, qf, tf, Ai)
close all

q=0; qd=0;  qdd=0;

c0 = q0;         
c1 = 0;      
c2 = 0.5*Ai;

syms c3 c4 c5
eqn1 = c0+(c1*tf)+(c2*(tf^2))+(c3*(tf^3))+(c4*(tf^4))+(c5*(tf^5)) == qf;
eqn2 = c1+(2*c2*tf)+(3*c3*(tf^2))+(4*c4*(tf^3))+(5*c5*(tf^4)) == 0;
eqn3 = 2*c2+(6*c3*tf)+(12*c4*(tf^2))+(20*c5*(tf^3)) == -0.5*Ai;

sol = solve([eqn1, eqn2, eqn3], [c3,c4,c5]);

c3 = sol.c3
c4 = sol.c4
c5 = sol.c5

%c3 = 1.6;        
%c4 = -0.58;        
%c5 = 0.0464;


for t = 0.01:0.01:tf;

    q = [q, c0+(c1*t)+(c2*t^2)+(c3*t^3)+(c4*(t^4))+(c5*(t^5))];
    qd = [qd, c1+(2*c2*t)+(3*c3*t^2)+(4*c4*(t^3))+(5*c5*(t^4))];
    qdd = [qdd, 2*c2+(6*c3*t)+(12*c4*(t^2))+(20*c5*(t^3))];
    
end

% Plots
t = [0: 0.01: tf];
plot(t, q,t,qd,t,qdd);
%figure
  %subplot(3,1,1), plot(t, q),  title 'Posição'
  %subplot(3,1,2), plot(t, qd), title 'Velocidade'
  %subplot(3,1,3), plot(t, qdd),title 'Aceleração'





