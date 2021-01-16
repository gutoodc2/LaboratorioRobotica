%Geração de trajetória polinomial de quinta ordem
q0=0;          qf=pi/2;
qd0 = 0;       qdd0 =0; %repouso
qdf = 0;       qddf =0; %repouso
N=100;
tf = 10;
t = [1/N:1/N:tf];

A = [    1      0         0         0        0         0;
         1     tf     tf^2      tf^3      tf^4      tf^5;
         0      1        0         0         0         0;
         0      1     2*tf    3*tf^2    4*tf^3    5*tf^4;
         0      0       2          0         0         0;
         0      0       2       6*tf   12*tf^2   20*tf^3];
     
C = inv(A)*[q0,    qf,    qd0,  qdf,     qdd0,  qddf ]';

q = C(1) + C(2)*t + C(3)*t.^2 + C(4)*t.^3 + C(5)*t.^4 + C(6) * t.^5 ;

qd = C(2) + 2*C(3)*t + 3*C(4)*t.^2 + 4*C(5)*t.^3 + 5*C(6)* t.^4 ;

qdd = 2*C(3) + 6*C(4)*t + 12*C(5)*t.^2 + 20*C(6)* t.^3 ;


%for i = 0: tf,
%    q = A(1) + A(2) * t(i) + A(3) * t(i) ^2 + ...
%end

% Curvas
figure(1)
subplot(3,1,1), plot(t, q),  title 'Posição'
subplot(3,1,2), plot(t, qd), title 'Velocidade'
subplot(3,1,3), plot(t, qdd),title 'Aceleração'







