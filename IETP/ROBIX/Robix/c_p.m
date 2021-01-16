%Cálculo da posição x,y,z
load('d_h','par');
load('d_1','posf','posi','X','Y','Z','x','y','z');

aux=((180*posf)-90)*pi/180;

[m,n]=size(par);

for w=1:m

t=  [ cos(aux(w)+par(w,1))   -sin(aux(w)+par(w,1))*cos(par(w,3))   sin(aux(w)+par(w,1))*sin(par(w,3))   par(w,2)*cos(aux(w)+par(w,1))
      sin(aux(w)+par(w,1))    cos(aux(w)+par(w,1))*cos(par(w,3))   -cos(aux(w)+par(w,1))*sin(par(w,3))  par(w,2)*sin(aux(w)+par(w,1))
          0               sin(par(w,3))              cos(par(w,3))                 par(w,4)
          0                    0                          0                           1          ];
     
      if w==1
         j=t; 
      else
      j=j*t;
      end
end

X=j(1,4);
Y=j(2,4);
Z=j(3,4);

save('d_1','posf','posi','X','Y','Z','x','y','z');
