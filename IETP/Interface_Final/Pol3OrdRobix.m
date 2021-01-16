clc; clear all; close all;

delete(instrfindall);
x=serial('COM3','BAUD', 9600);

tf_3 = 15;
vi_3 = 0;
vf_3 = 0;
posi = [180 180];
posf = [90 90];

for i=1:2
    
    theta = [posi(i); vi_3; posf(i); vf_3];
    a=[1 0 0 0; 0 1 0 0;1 tf_3 tf_3^2 tf_3^3;0 1 2*tf_3 3*tf_3^2];
    c=inv(a)*theta;
    ta=tf_3/100;
    
    if i == 1
        for t=0:99
            theta1_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3);
            v1_t(t+1)= c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
            a1_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
        end
    end
    
    if i == 2
        for t=0:99
            theta2_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3);
            v2_t(t+1)= c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
            a2_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
        end
    end
    
end

for i=1:100
    theta1_t(i)=round(theta1_t(i));
    theta2_t(i)=round(theta2_t(i));
end
    
 figure(1)
 g=linspace(0,tf_3,100);
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
 g=linspace(0,tf_3,100);
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
 fwrite(x,tf_3);
 for i=1:100
    fwrite(x,theta1_t(i));
 end
  for i=1:100
    fwrite(x,theta2_t(i));
 end
 fclose(x);

