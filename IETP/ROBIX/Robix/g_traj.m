
load('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
load('d_1','posf','posi','X','Y','Z','x','y','z');
load('d_3','theta_t','theta1_t','theta2_t','theta3_t','theta4_t','theta5_t','v_t','v1_t','v2_t','v3_t','v4_t','v5_t','a_t','a1_t','a2_t','a3_t','a4_t','a5_t');
load ('d_6','aux2','aux3');
load('d_h','par');

switch t_t
    
    case 0 %polinomio terceiro grau
       g=linspace(0,tf_3,100); 
     for i=1:6   
theta= [-((posi(i)*180)-90); vi_3; -((posf(i)*180)-90); vf_3];
a=[1 0 0 0; 0 1 0 0;1 tf_3 tf_3^2 tf_3^3;0 1 2*tf_3 3*tf_3^2];
c=inv(a)*theta;
ta=tf_3/100;

if i==1
for t=0:99
theta_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3); 
v_t(t+1)=c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
a_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end
end
if i==2
for t=0:99
theta1_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3); 
v1_t(t+1)=c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
a1_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end
end
if i==3
for t=0:99
theta2_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3); 
v2_t(t+1)=c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
a2_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end
end
if i==4
for t=0:99
theta3_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3); 
v3_t(t+1)=c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
a3_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end
end
if i==5
for t=0:99
theta4_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3); 
v4_t(t+1)=c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
a4_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end
end
if i==6
for t=0:99
theta5_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3); 
v5_t(t+1)=c(2)+2*c(3)*(t*ta)+3*c(4)*(t*ta)^2;
a5_t(t+1)= 2*c(3)+6*c(4)*(t*ta);
end
end
       end
       


    case 1 %polinomio de quinto grau
        g=linspace(0,tf_5,100);
         for i=1:6   
theta= [(posi(i)*180)-90; vi_5;ai_5; (posf(i)*180)-90; vf_5;af_5];
a=[1 0 0 0 0 0; 0 1 0 0 0 0;0 0 2 0 0 0;1 tf_5 tf_5^2 tf_5^3 tf_5^4 tf_5^5;0 1 2*tf_5 3*tf_5^2 4*tf_5^3 5*tf_5^4;0 0 2 6*tf_5 12*tf_5^2 20*tf_5^3];
c=inv(a)*theta;
ta=tf_5/100;


if i==1
for t=0:99
theta_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5); 
v_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
a_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end
end
if i==2
for t=0:99
theta1_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5); 
v1_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
a1_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end
end
if i==3
for t=0:99
theta2_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
v2_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
a2_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end
end
if i==4
for t=0:99
theta3_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
v3_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
a3_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end
end
if i==5
for t=0:99
theta4_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
v4_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
a4_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end
end
if i==6
for t=0:99
theta5_t(t+1)= c(1)+c(2)*(t*ta)+c(3)*((t*ta)^2)+c(4)*((t*ta)^3)+ (c(5)*(t*ta)^4)+(c(6)*(t*ta)^5);
v5_t(t+1)=c(2)+2*c(3)*(t*ta)+(3*c(4)*(t*ta)^2)+(4*c(5)*(ta*t)^3)+(5*c(6)*(t*ta)^4);
a5_t(t+1)= 2*c(3)+6*c(4)*(t*ta)+(12*c(5)*(t*ta)^2)+(20*c(6)*(t*ta)^3);
end
end
         end
         
        
        
    case 2 %parábola fundida com segmentos lineares
      g=linspace(0,tf_l,100);
        for i=1:6
          
         d_theta=((posf(i)*180)-90) -((posi(i)*180)-90);
      if d_theta~=0
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
        if i==1
        for t=0:99
        if (t*ta)<=tb
        theta_t(t+1)=((posi(i)*180)-90)+u*(0.5*c2*(t*ta)^2);    
        v_t(t+1)=u*c2*t*ta;
        a_t(t+1)=u*c2;
        end
        if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta_t(t+1)=((((posi(i)*180)-90)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v_t(t+1)=u*w_l;
        a_t(t+1)=u*0;
        end
        if (t*ta)>(tf_l-tb)
        theta_t(t+1)=((posf(i)*180)-90)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a_t(t+1)=-u*w_l/tb;
        end 
        end
        end
        if i==2
        for t=0:99
        if (t*ta)<=tb
        theta1_t(t+1)=((posi(i)*180)-90)+u*(0.5*c2*(t*ta)^2);    
        v1_t(t+1)=u*c2*t*ta;
        a1_t(t+1)=u*c2;
        end
        if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta1_t(t+1)=((((posi(i)*180)-90)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v1_t(t+1)=u*w_l;
        a1_t(t+1)=u*0;
        end
        if (t*ta)>(tf_l-tb)
        theta1_t(t+1)=((posf(i)*180)-90)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v1_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a1_t(t+1)=-u*w_l/tb;
        end 
        end
        end
        if i==3
        for t=0:99
        if (t*ta)<=tb
        theta2_t(t+1)=((posi(i)*180)-90)+u*(0.5*c2*(t*ta)^2);    
        v2_t(t+1)=u*c2*t*ta;
        a2_t(t+1)=u*c2;
        end
        if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta2_t(t+1)=((((posi(i)*180)-90)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v2_t(t+1)=u*w_l;
        a2_t(t+1)=u*0;
        end
        if (t*ta)>(tf_l-tb)
        theta2_t(t+1)=((posf(i)*180)-90)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v2_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a2_t(t+1)=-u*w_l/tb;
        end 
        end
        end
        if i==4
        for t=0:99
        if (t*ta)<=tb
        theta3_t(t+1)=((posi(i)*180)-90)+u*(0.5*c2*(t*ta)^2);    
        v3_t(t+1)=u*c2*t*ta;
        a3_t(t+1)=u*c2;
        end
        if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta3_t(t+1)=((((posi(i)*180)-90)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v3_t(t+1)=u*w_l;
        a3_t(t+1)=u*0;
        end
        if (t*ta)>(tf_l-tb)
        theta3_t(t+1)=((posf(i)*180)-90)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v3_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a3_t(t+1)=-u*w_l/tb;
        end 
        end
        end
        if i==5
        for t=0:99
        if (t*ta)<=tb
        theta4_t(t+1)=((posi(i)*180)-90)+u*(0.5*c2*(t*ta)^2);    
        v4_t(t+1)=u*c2*t*ta;
        a4_t(t+1)=u*c2;
        end
        if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta4_t(t+1)=((((posi(i)*180)-90)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v4_t(t+1)=u*w_l;
        a4_t(t+1)=u*0;
        end
        if (t*ta)>(tf_l-tb)
        theta4_t(t+1)=((posf(i)*180)-90)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v4_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a4_t(t+1)=-u*w_l/tb;
        end 
        end
        end
        if i==6
        for t=0:99
        if (t*ta)<=tb
        theta5_t(t+1)=((posi(i)*180)-90)+u*(0.5*c2*(t*ta)^2);    
        v5_t(t+1)=u*c2*t*ta;
        a5_t(t+1)=u*c2;
        end
        if (t*ta)>tb && (t*ta)<= (tf_l-tb)
        theta5_t(t+1)=((((posi(i)*180)-90)+u*(0.5*c2*(tb)^2)))+u*(w_l*((t*ta)-tb));
        v5_t(t+1)=u*w_l;
        a5_t(t+1)=u*0;
        end
        if (t*ta)>(tf_l-tb)
        theta5_t(t+1)=((posf(i)*180)-90)-u*((w_l/(2*tb))*((tf_l-t*ta)^2));
        v5_t(t+1)=u*(w_l/tb)*(tf_l-(t*ta));
        a5_t(t+1)=-u*w_l/tb;
        end 
        end
        end
      else
       if i==1
           for t=0:99
        theta_t(t+1)=((posi(i)*180)-90);
        v_t(t+1)=0;
        a_t(t+1)=0;
           end
       end
         if i==2
           for t=0:99
        theta1_t(t+1)=((posi(i)*180)-90);
        v1_t(t+1)=0;
        a1_t(t+1)=0;
           end
       end  
       if i==3
           for t=0:99
        theta2_t(t+1)=((posi(i)*180)-90);
        v2_t(t+1)=0;
        a2_t(t+1)=0;
           end
       end
       if i==4
           for t=0:99
        theta3_t(t+1)=((posi(i)*180)-90);
        v3_t(t+1)=0;
        a3_t(t+1)=0;
           end
       end
       if i==5
           for t=0:99
        theta4_t(t+1)=((posi(i)*180)-90);
        v4_t(t+1)=0;
        a4_t(t+1)=0;
           end
       end
       if i==6
           for t=0:99
        theta5_t(t+1)=((posi(i)*180)-90);
        v5_t(t+1)=0;
        a5_t(t+1)=0;
           end
       end 
      end
      end
end 

if aux3==1

figure(1)
subplot(2,3,1);
plot(g,theta_t,g,v_t,g,a_t);
title('Servo 1')
subplot(2,3,2);
plot(g,theta1_t,g,v1_t,g,a1_t);
title('Servo 2')
subplot(2,3,3);
plot(g,theta2_t,g,v2_t,g,a2_t);
title('Servo 3')
subplot(2,3,4);
plot(g,theta3_t,g,v3_t,g,a3_t);
title('Servo 4')
subplot(2,3,5);
plot(g,theta4_t,g,v4_t,g,a4_t);
title('Servo 5')
subplot(2,3,6);
plot(g,theta5_t,g,v5_t,g,a5_t);
title('Servo 6')

[lin,col]=size(par);
%lin = 5;
    %            alpha         a        theta       d
if lin==1
    L{1} = link([par(1,3)   par(1,2)   par(1,1)  par(1,4)  0], 'standard');
end
if lin==2
    L{1} = link([par(1,3)   par(1,2)   par(1,1)  par(1,4)  0], 'standard');
    L{2} = link([par(2,3)   par(2,2)   par(2,1)	 par(2,4)  0], 'standard');
end
if lin==3
    L{1} = link([par(1,3)   par(1,2)   par(1,1)  par(1,4)  0], 'standard');
    L{2} = link([par(2,3)   par(2,2)   par(2,1)	 par(2,4)  0], 'standard');
    L{3} = link([par(3,3)   par(3,2)   par(3,1)	 par(3,4)  0], 'standard');
end
if lin==4
    L{1} = link([par(1,3)   par(1,2)   par(1,1)  par(1,4)  0], 'standard');
    L{2} = link([par(2,3)   par(2,2)   par(2,1)	 par(2,4)  0], 'standard');
    L{3} = link([par(3,3)   par(3,2)   par(3,1)	 par(3,4)  0], 'standard');
    L{4} = link([par(4,3)   par(4,2)   par(4,1)	 par(4,4)  0], 'standard');
end
if lin==5
    L{1} = link([par(1,3)*pi/180   par(1,2)   par(1,1)  par(1,4)  0], 'standard');
    L{2} = link([par(2,3)*pi/180   par(2,2)   par(2,1)	 par(2,4)  0], 'standard');
    L{3} = link([par(3,3)*pi/180   par(3,2)   par(3,1)	 par(3,4)  0], 'standard');
    L{4} = link([par(4,3)*pi/180   par(4,2)   par(4,1)	 par(4,4)  0], 'standard');
    L{5} = link([par(5,3)*pi/180  par(5,2)   par(5,1)	 par(5,4)  0], 'standard');
end
if lin==6
    L{1} = link([par(1,3)*pi/180   par(1,2)   par(1,1)  par(1,4)  0], 'standard');
    L{2} = link([par(2,3)*pi/180   par(2,2)   par(2,1)	 par(2,4)  0], 'standard');
    L{3} = link([par(3,3)*pi/180   par(3,2)   par(3,1)	 par(3,4)  0], 'standard');
    L{4} = link([par(4,3)*pi/180   par(4,2)   par(4,1)	 par(4,4)  0], 'standard');
    L{5} = link([par(5,3)*pi/180   par(5,2)   par(5,1)	 par(5,4)  0], 'standard');
    L{6} = link([par(6,3)*pi/180   par(6,2)   par(6,1)	 par(6,4)  0], 'standard');
end

robo = robot(L, 'Robot')

figure(2)
%plot(robo, [0, 0, 0, 0, 0, 0,]);

%robo = seriallink(L, 'Robot');
posi1=[posi(1)+pi/2 posi(2) posi(3) posi(4) posi(5) posi(6)];
posf1=[posf(1)+pi/2 posf(2) posf(3) posf(4) posf(5) posf(6)];


switch t_t
    case 0
        temp_jtraj=tf_3;
    case 1
        temp_jtraj=tf_5;
    case 2
        temp_jtraj=tf_l;
end

q = jtraj(((posi1*180)-90)*pi/180,((posf1*180)-90)*pi/180 , temp_jtraj*100);
close (2)
%plot(robo, [0, 0, 0, 0, 0, 0,]);
figure(2)
plot(robo, [q]);

end
posi=posf;


save ('d_1','posf','posi','X','Y','Z','x','y','z');
save('d_3','theta_t','theta1_t','theta2_t','theta3_t','theta4_t','theta5_t','v_t','v1_t','v2_t','v3_t','v4_t','v5_t','a_t','a1_t','a2_t','a3_t','a4_t','a5_t');

serial_print;