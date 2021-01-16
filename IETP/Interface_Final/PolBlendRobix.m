clc; clear all; close all;

delete(instrfindall);
x=serial('COM3','BAUD', 9600);

tf_l = 20;
w_l  = 5;
posi = [90 90];
posf = [180 180];

for i=1:2
    
    d_theta(i)=(posf(i)-posi(i));
    
    if d_theta(i)>0
        d_theta(i)=-d_theta(i);
        u(i)=1;
    else
        u(i)=-1;
    end
    
    tb(i)=(d_theta(i)+(w_l*tf_l))/w_l
    
    if tb(i)>=(tf_l/2)
        box=errordlg('Erro!Tb >= Tf/2, reduzir W',['Servo' num2str(i)]);
    end
    if tb(i)<=0
        box=errordlg('Erro! Tb <= 0, aumentar W ou Tf',['Servo' num2str(i)]);
    end
    
    ta=tf_l/100;
    c2(i)=w_l/tb(i);
    
    if i == 1
        for t=0:99
            if (t*ta)<=tb(i)
                theta1_t(t+1)=(posi(i))+u(i)*(0.5*c2(i)*(t*ta)^2);
                v1_t(t+1)=u(i)*c2(i)*t*ta;
                a1_t(t+1)=u(i)*c2(i);
            end
            if (t*ta)>tb(i) && (t*ta)<= (tf_l-tb(i))
                theta1_t(t+1)=(((posi(i))+u(i)*(0.5*c2(i)*(tb(i))^2)))+u(i)*(w_l*((t*ta)-tb(i)));
                v1_t(t+1)=u(i)*w_l;
                a1_t(t+1)=u(i)*0;
            end
            if (t*ta)>(tf_l-tb(i))
                theta1_t(t+1)=(posf(i))-u(i)*((w_l/(2*tb(i)))*((tf_l-t*ta)^2));
                v1_t(t+1)=u(i)*(w_l/tb(i))*(tf_l-(t*ta));
                a1_t(t+1)=-u(i)*w_l/tb(i);
            end
        end
    end
    
    if i == 2
        for t=0:99
            if (t*ta)<=tb(i)
                theta2_t(t+1)=(posi(i))+u(i)*(0.5*c2(i)*(t*ta)^2);
                v2_t(t+1)=u(i)*c2(i)*t*ta;
                a2_t(t+1)=u(i)*c2(i);
            end
            if (t*ta)>tb(i) && (t*ta)<= (tf_l-tb(i))
                theta2_t(t+1)=(((posi(i))+u(i)*(0.5*c2(i)*(tb(i))^2)))+u(i)*(w_l*((t*ta)-tb(i)));
                v2_t(t+1)=u(i)*w_l;
                a2_t(t+1)=u(i)*0;
            end
            if (t*ta)>(tf_l-tb(i))
                theta2_t(t+1)=(posf(i))-u(i)*((w_l/(2*tb(i)))*((tf_l-t*ta)^2));
                v2_t(t+1)=u(i)*(w_l/tb(i))*(tf_l-(t*ta));
                a2_t(t+1)=-u(i)*w_l/tb(i);
            end
        end
    end
    
     
end



for i=1:100
    theta1_t(i)=round(theta1_t(i));
    theta2_t(i)=round(theta2_t(i));
end

figure(1)
 g=linspace(0,tf_l,100);
 subplot(3,1,1);
 plot(g,theta1_t);
 title('Posição Motor 1');
 
 subplot(3,1,2);
 plot(g,v1_t);
 title('Velocidade Motor 1');
 
 subplot(3,1,3);
 plot(g,a1_t);
 title('Aceleração Motor 1');
 
 figure(2)
 g=linspace(0,tf_l,100);
 subplot(3,1,1);
 plot(g,theta2_t);
 title('Posição Motor 2');
 
 subplot(3,1,2);
 plot(g,v2_t);
 title('Velocidade Motor 2');
 
 subplot(3,1,3);
 plot(g,a2_t);
 title('Aceleração Motor 2');

fopen(x);
pause(2.0)
fwrite(x,tf_l);
for i=1:100
    fwrite(x,theta1_t(i));
    fwrite(x,theta2_t(i));
end
fclose(x);

