load('d_3','theta_t','theta1_t','theta2_t','theta3_t','theta4_t','theta5_t');
load('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
serialInfo = instrhwinfo('serial');
porta_s= serial(serialInfo.AvailableSerialPorts,'BaudRate',50000);
%porta_s= serial('COM2','BaudRate',57600);
fopen(porta_s);
for i=1:100
    theta_t(i)=round(((theta_t(i)+90)/180)*255);
    theta1_t(i)=round(((theta1_t(i)+90)/180)*255);
    theta2_t(i)=round(((theta2_t(i)+90)/180)*255);
    theta3_t(i)=round(((theta3_t(i)+90)/180)*255);
    theta4_t(i)=round(((theta4_t(i)+90)/180)*255);
    theta5_t(i)=round(((theta5_t(i)+90)/180)*255);
end
modo0 = 0;
fwrite(porta_s,modo0);
switch t_t
    case 0
        fwrite(porta_s,tf_3);
    case 1
        fwrite(porta_s,tf_5);
    case 2
        fwrite(porta_s,tf_l);
end

for i=1:100
    fwrite(porta_s,theta_t(i));
end
for i=1:100
    fwrite(porta_s,theta1_t(i));
end
for i=1:100
    fwrite(porta_s,theta2_t(i));
end
for i=1:100
    fwrite(porta_s,theta3_t(i));
end
for i=1:100
    fwrite(porta_s,theta4_t(i));
end
for i=1:100
    fwrite(porta_s,theta5_t(i));
end

fclose(porta_s);


