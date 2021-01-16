load('d_5','b','n_t');
load('d_1','posf','posi','X','Y','Z','x','y','z');
H=strfind(b(n_t,:),'MOVE');
G=strfind(b(n_t,:),'MOVES');
if H==1
    if G==1;
        w=1;
    else
        w=0;
    end
end


if w==0
    servo=[];
    servo2=[];
    servo3=[];
    servo4=[];
    servo5=[];
    servo6=[];
    aux=strfind(b(n_t,:),',');
    r=size(b);
    for i=strfind(b(n_t,:),'E')+1:aux(1)-1
        servo=[servo b(n_t,i)];
        
    end
    for i=aux(1)+1:aux(2)-1
        servo2=[servo2 b(n_t,i)];
    end
    for i=aux(2)+1:aux(3)-1
        servo3=[servo3 b(n_t,i)];
    end
    for i=aux(3)+1:aux(4)-1
        servo4=[servo4 b(n_t,i)];
    end
    for i=aux(4)+1:aux(5)-1
        servo5=[servo5 b(n_t,i)];
    end
    for i=aux(5)+1:r(2)
        
        servo6=[servo6 b(n_t,i)];
        
    end
    
    posf=[((str2double(servo)+90)/180) ((str2double(servo2)+90)/180) ((str2double(servo3)+90)/180) ((str2double(servo4)+90)/180) ((str2double(servo5)+90)/180) ((str2double(servo6)+90)/180)];
    save('d_1','posf','posi','X','Y','Z','x','y','z');
    g_traj;
end


if w==1
    x=[];
    y=[];
    z=[];
    r=size(b);
    for i=strfind(b(n_t,:),'X')+1:strfind(b(n_t,:),'Y')-1
        x=[x,b(n_t,i)];
    end
    for i=strfind(b(n_t,:),'Y')+1:strfind(b(n_t,:),'Z')-1
        y=[y,b(n_t,i)];
    end
    for i=strfind(b(n_t,:),'Z')+1:r(2)-1
        z=[z,b(n_t,i)];
    end
    x=str2double(x);
    y=str2double(y);
    z=str2double(z);
    save('d_1','posf','posi','X','Y','Z','x','y','z');
    c_i;
end

