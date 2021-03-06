clc; clear all; close all;

delete(instrfindall);
x=serial('COM5','BAUD', 9600);

tf_5 = 10;
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
 title('Posi��o');
 
 subplot(3,1,2);
 plot(g,v_t);
 title('Velocidade');
 
 subplot(3,1,3);
 plot(g,a_t);
 title('Acelera��o');       
        
 fopen(x);
 pause(2.0)
 fwrite(x,tf_5);
 for i=1:100
    %fwrite(x,theta_t(i));
    fwrite(x,v_t(i));
 end
 fclose(x);
