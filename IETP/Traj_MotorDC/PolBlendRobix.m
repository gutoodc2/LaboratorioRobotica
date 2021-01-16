% 100 rpm = 10.471975511966 rads/s
% o tempo minimo para uma volta completa partindo de 0º para 360º 
% respeitando a velocidade máxima do motor DC de 6v (10.5 rad/s) é de 35s
% (no código é necessário 35 segundos,logo é o algoritmo que é mais responsivo).

clc; clear all; close all;

delete(instrfindall);
x=serial('COM5','BAUD', 9600);

tf_l = 36;
w_l  = 10.5;
posi = 0;
posf = 360;

d_theta=(posf-posi);

if d_theta>0
    d_theta=-d_theta;
    u=1;
else
    u=-1;
end

tb=(d_theta+(w_l*tf_l))/w_l

if tb>=(tf_l/2)
    box=errordlg('Erro!Tb >= Tf/2, reduzir W',['Servo' num2str(i)]);
end
if tb<=0
    box=errordlg('Erro! Tb <= 0, aumentar W ou Tf',['Servo' num2str(i)]);
end

ta=tf_l/100;
c2=w_l/tb;

for t=0:99
    if (t*ta)<=tb
        theta_t(t+1)=(posi)+u*(0.5*c2*(t*ta)^2);
        v_t(t+1)=u*c2*t*ta;
        a_t(t+1)=u*c2;
    end
    if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta_t(t+1)=(((posi)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v_t(t+1)=u*w_l;
        a_t(t+1)=u*0;
    end
    if (t*ta)>(tf_l-tb)
        theta_t(t+1)=(posf)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a_t(t+1)=-u*w_l/tb;
    end
end

for i=1:100
    theta_t(i)=round(theta_t(i));
end

g=linspace(0,tf_l,100);
subplot(3,1,1);
plot(g,theta_t);
title('Posição');

subplot(3,1,2);
plot(g,v_t);
title('Velocidade');

subplot(3,1,3);
plot(g,a_t);
title('Aceleração');

period_PID = [
0.00
0.00
0.00
0.00
0.00
9067.00
2087.00
2052.00
2356.00
12445.00
14184.00
1998.00
1736.00
2677.00
2769.00
3973.00
3157.00
2141.00
2162.00
2129.00
2155.00
2100.00
2109.00
2163.00
2105.00
2161.00
2110.00
2158.00
2106.00
2150.00
2105.00
2107.00
2153.00
2144.00
2146.00
2142.00
2108.00
2118.00
2103.00
2162.00
2103.00
2113.00
2145.00
2116.00
2116.00
2094.00
2095.00
2140.00
2135.00
2142.00
2134.00
2110.00
2097.00
2087.00
2107.00
2106.00
2095.00
2100.00
2098.00
2074.00
2097.00
2127.00
2128.00
2086.00
2094.00
2084.00
2118.00
2121.00
2084.00
2096.00
2070.00
2097.00
2075.00
2076.00
2127.00
2076.00
2125.00
2087.00
2124.00
2125.00
2068.00
2115.00
2091.00
2116.00
2085.00
2134.00
2931.00
3712.00
2674.00
2616.00
1670.00
1907.00
11230.00
13987.00
2359.00
2022.00
2025.00
7041.00
9040.00
9034.00

];

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
4703.00
2188.00
1934.00
1915.00
1807.00
1735.00
1663.00
1624.00
1622.00
1632.00
1635.00
1650.00
1623.00
1619.00
1669.00
1665.00
1642.00
1639.00
1647.00
1642.00
1642.00
1645.00
1641.00
1643.00
1646.00
1681.00
1677.00
1631.00
1648.00
1671.00
1646.00
1646.00
1653.00
1647.00
1675.00
1643.00
1650.00
1684.00
1642.00
1676.00
1658.00
1652.00
1681.00
1636.00
1647.00
1642.00
1651.00
1641.00
1641.00
1641.00
1639.00
1627.00
1628.00
1629.00
1661.00
1631.00
1626.00
1624.00
1659.00
1630.00
1622.00
1673.00
1631.00
1636.00
1643.00
1637.00
1636.00
1644.00
1642.00
1637.00
1649.00
1622.00
1653.00
1636.00
1630.00
1736.00
1846.00
1963.00
1973.00
2055.00
2232.00
2494.00
2517.00
2810.00
3336.00
3412.00
4744.00
12102.00
0.00
0.00

]';



for i=1:100
    if period_PID(i) == 0
        period_PID(i) = 0;
    end
    if period_PID(i) ~= 0
        period_PID(i) = 1./period_PID(i)*1000000*pi/180;
    end
end

for i=1:100
    if period(i) == 0
        period(i) = 0;
    end
    if period(i) ~= 0
        period(i) = 1./period(i)*1000000*pi/180;
    end
end

for i=1:100
    if v_t(i) == 0
        i_period(i) = 0
    end
    if v_t(i) ~= 0
        i_period(i) = 1./round(v_t(i))*1000000*pi/180
    end
end

figure(2)
subplot(2,1,1)
plot(g,period);
title('Periodo (Retorno Encoder)');
subplot(2,1,2);
plot(g,v_t);
title('Velocidade');
%plot(g,period_PID);
%title('Retorno velocidade com PID');

fopen(x);
pause(2.0)
fwrite(x,tf_l);
fwrite(x,max(v_t));
for i=1:100
    %fwrite(x,theta_t(i));
    fwrite(x,v_t(i));
end
fclose(x);

