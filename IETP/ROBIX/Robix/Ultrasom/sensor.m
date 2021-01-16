
serialInfo = instrhwinfo('serial');
porta_s= serial(serialInfo.AvailableSerialPorts,'BaudRate',9600)
%porta_s= serial('COM14','BaudRate',500000);

while(1)
    fopen(porta_s);
    %a=fread(porta_s, 3);
    a=fscanf(porta_s)
      %c = fread(porta_s, 3, 'long=>char')
     %fprintf('%3f  %s %s \n',a);
fclose(porta_s);
end