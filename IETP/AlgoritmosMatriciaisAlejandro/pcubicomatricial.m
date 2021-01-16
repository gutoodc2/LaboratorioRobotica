% Trajetória gerada pelo polinomio cubico
clear all, close all
qi=0; qf = pi/2; qd0 = 0; qdf = 0; tf = 10;
tic
% Coeficientes, segundo as equações (7.6) ----------------------
A = [1      tf      tf^2    tf^3;       %
     1      0       0          0;       %
     0      1      2*tf   3*tf^2;       %
     0      1       0          0];      %
%---------------------------------------------------------------      
C = inv(A) * [qf  qi  qdf  qd0]';
C0 = C(1); C1 = C(2); C2 = C(3); C3 = C(4); 

%Vetor tempo
t = [0: 0.1: tf];

% Trajetória, segundo equações p.149 (Saeed Niku)
q   =   C0 +   C1*t + C2*t.^2 + C3*t.^3;  %Posição
qd  =   C1 + 2*C2*t + 3*C3*t.^2;          %Velocidade
qdd = 2*C2 + 6*C3*t;                      %Aceleração
toc
%Figuras -------------------------------------------------
figure
subplot(3,1,1), plot(t, q),  title 'Posição'
subplot(3,1,2), plot(t, qd), title 'Velocidade'
subplot(3,1,3), plot(t, qdd),title 'Aceleração'