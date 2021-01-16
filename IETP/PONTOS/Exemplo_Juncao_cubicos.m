% Trajetória gerada pelo polinomio cubico
close all; clear all; clc;

q1=0;  qd1=0;  qdd1=0;
q2=0;  qd2=0;  qdd2=0;
tf = 10;

q0 = 0;       % Ponto Inicial
qv = 50;      % Ponto de Passagem (Final primeiro segmento/Inicial segundo segmento)
qg = 100;     % Ponto Final

a10 = q0;
a11 = 0;
a12 = ((12*qv)-(3*qg)-(9*q0))/(4*tf^2);
a13 = ((-8*qv)+(3*qg)+(5*q0))/(4*tf^3);

% -- Primeiro Cúbico --
for t = 0.01:0.01:tf;
    
    q1   = [q1, a10+(a11*t)+(a12*t^2)+(a13*t^3)];
    qd1  = [qd1, a11+(2*a12*t)+(3*a13*t^2)];
    qdd1 = [qdd1, 2*a12+(6*a13*t)];
    
end

% -- Segundo Cúbico --
a20 = qv;
a21 = ((3*qg)-(3*q0))/(4*tf);
a22 = ((-12*qv)+(6*qg)+(6*q0))/(4*tf^2);
a23 = ((8*qv)-(5*qg)-(3*q0))/(4*tf^3);

for t = 0.01:0.01:tf;
    
    q2   = [q2, a20+(a21*t)+(a22*t^2)+(a23*t^3)];
    qd2  = [qd2, a21+(2*a22*t)+(3*a23*t^2)];
    qdd2 = [qdd2, 2*a22+(6*a23*t)];
    
end

% Plots
t = [0: 0.01: tf];

%t = [0: 0.01: tf*2];
subplot(2,1,1), plot(t,q1,t,qd1,t,qdd1) ; title('Primeiro Segmento'); grid on;
subplot(2,1,2), plot(t,q2,t,qd2,t,qdd2) ; title('Segundo Segmento'); grid on;




