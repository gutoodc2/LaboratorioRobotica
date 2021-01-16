q0 = 0;
q1 = 10;
tf = 5;
V = 50;
%fclose(instrfindall);
delete(instrfindall);
%global x;
x=serial('COM3','BAUD', 9600);
%serialInfo = instrhwinfo('serial');
%x = serial(serialInfo.AvailableSerialPorts,'BaudRate',9600);


    s = 0; sd = 0; sdd = 0;
    
    tb = (q0 - q1 + V*tf)/V;
    a = V/tb;

    for  t = 0.01:0.01:tf;
        if t <= tb
            % initial blend
            s =[s, q0 + a/2*t^2];
            sd =[sd, a*t];
            sdd =[sdd, a];
        elseif t <= (tf-tb)
            % linear motion
            s =[s, (q1+q0-V*tf)/2 + V*t];
            sd =[sd, V];
            sdd =[sdd, 0];
        else
            % final blend
            s =[s, q1 - a/2*tf^2 + a*tf*t - a/2*t^2];
            sd =[sd, a*tf - a*t];
            sdd =[sdd, -a];
        end
    end
	
% Plots
t = [0: 0.01: tf];
figure
  subplot(3,1,1), plot(t, s),  title 'Posição';
  subplot(3,1,2), plot(t, sd), title 'Velocidade';
  subplot(3,1,3), plot(t, sdd),title 'Aceleração';
  
  fopen(x);
  pause(2);
  fprintf(x,'%i',V);
  %pause(2);
  %fprintf(x,'%i',q1);
  fscanf(x)
  fclose(x);