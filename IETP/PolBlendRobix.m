clc; clear all; close all;

delete(instrfindall);
x=serial('COM5','BAUD', 9600);

tf_l = 10;
w_l  = 50;
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

fopen(x);
pause(2.0)
fwrite(x,tf_l);
for i=1:100
    %fwrite(x,theta_t(i));
    fwrite(x,v_t(i));
end
fclose(x);

