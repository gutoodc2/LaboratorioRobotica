clc; clear all; close all;

delete(instrfindall);
x=serial('COM5','BAUD', 9600);

tf_3 = 10;
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
 
 fopen(x);
 pause(2.0)
 fwrite(x,tf_3);
 for i=1:100
    %fwrite(x,theta_t(i));
    fwrite(x,v_t(i));
 end
 fclose(x);

