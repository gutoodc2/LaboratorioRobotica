% Primeira abordagem
% 100 rpm = 10.471975511966 rads/s
% o tempo minimo para uma volta completa partindo de 0º para 360º
% respeitando a velocidade máxima do motor DC de 6v (10.5 rad/s) é de 35s
% (no código é necessário 51 segundos, verificar esse erro).

% Segunda abordagem
% 100 rpm = 600ºs
% o tempo minimo para uma volta completa partindo de º para 360º
% respeitando a rpm maxima do motor é de 1,89s (2s)
%

clc; clear all; close all;

delete(instrfindall);
x=serial('COM5','BAUD', 9600);

tf_3 = 45;
vi_3 = 0;
vf_3 = 0;

theta = [0; vi_3; 360; vf_3];
a=[1 0 0 0; 0 1 0 0;1 tf_3 tf_3^2 tf_3^3;0 1 2*tf_3 3*tf_3^2];
c=inv(a)*theta;
ta=tf_3/100;

for t=0:99
    theta_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3);
    v_t(t+1)= c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
    a_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end

for i=1:100
    theta_t(i)=round(theta_t(i));
end

g=linspace(0,tf_3,100);
subplot(3,1,1);
plot(g,theta_t);
title('Posição');

subplot(3,1,2);
plot(g,v_t);
title('Velocidade');

subplot(3,1,3);
plot(g,a_t);
title('Aceleração');

period = [0.00
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
11600.00
2118.00
2026.00
1893.00
1891.00
1909.00
1868.00
1887.00
1793.00
1790.00
1822.00
1825.00
1795.00
1823.00
1820.00
1694.00
1718.00
1678.00
1681.00
1715.00
1664.00
1682.00
1710.00
1688.00
1704.00
1692.00
1719.00
1688.00
1684.00
1698.00
1698.00
1684.00
1682.00
1695.00
1665.00
1668.00
1787.00
1773.00
1779.00
1784.00
1821.00
1821.00
1813.00
1870.00
1908.00
1878.00
1866.00
1875.00
1974.00
1977.00
1974.00
2018.00
1996.00
2123.00
2123.00
2154.00
2359.00
2337.00
2348.00
2529.00
2530.00
2533.00
2852.00
2922.00
2952.00
3451.00
3582.00
3519.00
4900.00
5264.00
12545.00
30960.00
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
fwrite(x,tf_3);
fwrite(x,max(v_t));
for i=1:100
    %fwrite(x,theta_t(i));
    fwrite(x,v_t(i));
end
fclose(x);

