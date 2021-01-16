clc; clear all; close all;

delete(instrfindall);
x=serial('COM3','BAUD', 9600);

tf_5 = 3;
vi_5 = 0;
vf_5 = 0;
ai_5 = 0;
af_5 = 0;
posi = [90 90];
posf = [180 180];

for i=1:2
    
    theta= [posi(i); vi_5;ai_5; posf(i); vf_5;af_5];
    a=[1 0 0 0 0 0; 0 1 0 0 0 0;0 0 2 0 0 0;1 tf_5 tf_5^2 tf_5^3 tf_5^4 tf_5^5;0 1 2*tf_5 3*tf_5^2 4*tf_5^3 5*tf_5^4;0 0 2 6*tf_5 12*tf_5^2 20*tf_5^3];
    c=inv(a)*theta;
    ta=tf_5/100;
    
    if i == 1
        
        for t=0:99
            theta1_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
            v1_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
            a1_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
        end
        
    end
    
    if i == 2
        
        for t=0:99
            theta2_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
            v2_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
            a2_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
        end
        
    end
    
end

for i=1:100
    theta1_t(i)=round(theta1_t(i));
    theta2_t(i)=round(theta2_t(i));
end

 figure(1)
 g=linspace(0,tf_5,100);
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
 g=linspace(0,tf_5,100);
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
 fwrite(x,tf_5);
 for i=1:100
    fwrite(x,theta1_t(i));
    fwrite(x,theta2_t(i));
 end
 fclose(x);
