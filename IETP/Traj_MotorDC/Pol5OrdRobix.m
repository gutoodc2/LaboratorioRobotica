% 100 rpm = 10.471975511966 rads/s
% o tempo minimo para uma volta completa partindo de 0º para 360º
% respeitando a velocidade máxima do motor DC de 6v (10.5 rad/s) é de 35s
% (no código é necessário 64 segundos, verificar esse erro).
clc; clear all; close all;

delete(instrfindall);
x=serial('COM5','BAUD', 9600);

tf_5 = 56;
vi_5 = 0;
vf_5 = 0;
ai_5 = 0;
af_5 = 0;

theta= [0; vi_5;ai_5; 360; vf_5;af_5];
a=[1 0 0 0 0 0; 0 1 0 0 0 0;0 0 2 0 0 0;1 tf_5 tf_5^2 tf_5^3 tf_5^4 tf_5^5;0 1 2*tf_5 3*tf_5^2 4*tf_5^3 5*tf_5^4;0 0 2 6*tf_5 12*tf_5^2 20*tf_5^3];
c=inv(a)*theta;
ta=tf_5/100;

for t=0:99
    theta_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
    v_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
    a_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end

for i=1:100
    theta_t(i)=round(theta_t(i));
end

g=linspace(0,tf_5,100);
subplot(3,1,1);
plot(g,theta_t);
title('Posição');

subplot(3,1,2);
plot(g,v_t);
title('Velocidade');

subplot(3,1,3);
plot(g,a_t);
title('Aceleração');


period = [
    0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
10787.00
2082.00
1964.00
1948.00
1839.00
1858.00
1845.00
1840.00
1741.00
1758.00
1748.00
1745.00
1763.00
1698.00
1652.00
1663.00
1661.00
1702.00
1685.00
1671.00
1647.00
1667.00
1700.00
1692.00
1662.00
1669.00
1654.00
1714.00
1801.00
1776.00
1818.00
1768.00
1768.00
1854.00
1875.00
1837.00
1849.00
1938.00
1955.00
1952.00
1963.00
2070.00
2124.00
2288.00
2257.00
2311.00
2461.00
2474.00
2482.00
2826.00
2822.00
2900.00
3343.00
3472.00
4834.00
5365.00
5352.00
15425.00
18994.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00
0.00

    ]';

for i=1:100
    if period(i) == 0
        period(i) = 0;
    end
    if period(i) ~= 0
        period(i) = 1./period(i)*1000000*pi/180;
    end
end

figure(2)
subplot(2,1,1)
plot(g,period);
title('Período (retorno encoder)');
subplot(2,1,2);
plot(g,v_t);
title('Velocidade');

fopen(x);
pause(2.0)
fwrite(x,tf_5);
fwrite(x,max(v_t));
for i=1:100
    %fwrite(x,theta_t(i));
    fwrite(x,v_t(i));
end
fclose(x);
