load('d_h','par');
load('d_1','posf','posi','X','Y','Z','x','y','z');
tol=0.5;%Define uma tolerância para o resultado
d_te=0.05;%define um intervalo de integração

%-----------------------------------------------------------------------------------------------------
% cálculo do jacobiano
syms t_1 t_2 t_3 t_4 t_5 t_6
[m,n]=size(par);
for pont=1:m 
if pont==1
t=  [ cos(t_1+par(pont,1))   -sin(t_1+par(pont,1))*cos(par(pont,3))   sin(t_1+par(pont,1))*sin(par(pont,3))   par(pont,2)*cos(t_1+par(pont,1))
      sin(t_1+par(pont,1))    cos(t_1+par(pont,1))*cos(par(pont,3))   -cos(t_1+par(pont,1))*sin(par(pont,3))  par(pont,2)*sin(t_1+par(pont,1))
          0               sin(par(pont,3))              cos(par(pont,3))                 par(pont,4)
          0                    0                          0                           1          ];
      j=t;
end
if pont==2
t=  [ cos(t_2+par(pont,1))   -sin(t_2+par(pont,1))*cos(par(pont,3))   sin(t_2+par(pont,1))*sin(par(pont,3))   par(pont,2)*cos(t_2+par(pont,1))
      sin(t_2+par(pont,1))    cos(t_2+par(pont,1))*cos(par(pont,3))   -cos(t_2+par(pont,1))*sin(par(pont,3))  par(pont,2)*sin(t_2+par(pont,1))
          0               sin(par(pont,3))              cos(par(pont,3))                 par(pont,4)
          0                    0                          0                           1          ];
j=j*t;
end
if pont==3
t=  [ cos(t_3+par(pont,1))   -sin(t_3+par(pont,1))*cos(par(pont,3))   sin(t_3+par(pont,1))*sin(par(pont,3))   par(pont,2)*cos(t_3+par(pont,1))
      sin(t_3+par(pont,1))    cos(t_3+par(pont,1))*cos(par(pont,3))   -cos(t_3+par(pont,1))*sin(par(pont,3))  par(pont,2)*sin(t_3+par(pont,1))
          0               sin(par(pont,3))              cos(par(pont,3))                 par(pont,4)
          0                    0                          0                           1          ];
j=j*t;
end
if pont==4
t=  [ cos(t_4+par(pont,1))   -sin(t_4+par(pont,1))*cos(par(pont,3))   sin(t_4+par(pont,1))*sin(par(pont,3))   par(pont,2)*cos(t_4+par(pont,1))
      sin(t_4+par(pont,1))    cos(t_4+par(pont,1))*cos(par(pont,3))   -cos(t_4+par(pont,1))*sin(par(pont,3))  par(pont,2)*sin(t_4+par(pont,1))
          0               sin(par(pont,3))              cos(par(pont,3))                 par(pont,4)
          0                    0                          0                           1          ];
j=j*t;
end
if pont==5
t=  [ cos(t_5+par(pont,1))   -sin(t_5+par(pont,1))*cos(par(pont,3))   sin(t_5+par(pont,1))*sin(par(pont,3))   par(pont,2)*cos(t_5+par(pont,1))
      sin(t_5+par(pont,1))    cos(t_5+par(pont,1))*cos(par(pont,3))   -cos(t_5+par(pont,1))*sin(par(pont,3))  par(pont,2)*sin(t_5+par(pont,1))
          0               sin(par(pont,3))              cos(par(pont,3))                 par(pont,4)
          0                    0                          0                           1          ];
j=j*t;
end
if pont==6
t=  [ cos(t_6+par(pont,1))   -sin(t_6+par(pont,1))*cos(par(pont,3))   sin(t_6+par(pont,1))*sin(par(pont,3))   par(pont,2)*cos(t_6+par(pont,1))
      sin(t_6+par(pont,1))    cos(t_6+par(pont,1))*cos(par(pont,3))   -cos(t_6+par(pont,1))*sin(par(pont,3))  par(pont,2)*sin(t_6+par(pont,1))
          0               sin(par(pont,3))              cos(par(pont,3))                 par(pont,4)
          0                    0                          0                           1          ];
j=j*t;
end
      
end
if m==2
j=[j(1,4);j(2,4)];
jac=jacobian(j,[t_1, t_2]);
end
if m==3
j=[j(1,4);j(2,4);j(3,4)];
jac=jacobian(j,[t_1, t_2 ,t_3]);
end    
if m==4
j=[j(1,4);j(2,4);j(3,4);j(3,2)];
jac=jacobian(j,[t_1, t_2 ,t_3, t_4]);
end
if m==5
j=[j(1,4);j(2,4);j(3,4);j(3,2);j(1,3)];
jac=jacobian(j,[t_1, t_2 ,t_3, t_4, t_5]);
end 
if m==6
j=[j(1,4);j(2,4);j(3,4);j(3,2);j(1,3);j(2,1)];
jac=jacobian(j,[t_1, t_2 ,t_3, t_4, t_5,t_6]);
end 


%-----------------------------------------------------------------------------------------------------------





%-----------------------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------------------
%Inicio dos cálculos da cinemática inversa






if m==2
%--------------------------------------------------------------------------
%define os ângulos iniciais e o coloca em uma variável auxiliar para o
%cálculo cinemático direto      
aux=((180*posf)-90)*pi/180;
t_1i=aux(1);
t_2i=aux(2);



     
%-------------------------------------------------------------------------- 

%--------
%auxiliares para obrigar a entrada no laço de repetição
dx=tol+1;
dy=tol+1;

%--------

while abs(dx)>=tol || abs(dy)>=tol
    
%------------------------------------------------------------------------------------------------
%Cálculo cinemático direto
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
%------------------------------------------------------------------------------------------------

%---------------------------------------------------------
%Atualiza novos delta x e coloca-os em um vetor d_x
dx=x-j(1,4);
dy=y-j(2,4);
d_x=[dx;dy];
%---------------------------------------------------------

%Define a matriz jacobiana numérica do manipulador, substituindo os valores
%simbólicos

B=subs(jac,[t_1 t_2],[t_1i t_2i]); 

if abs(det(B))<=0.0001
    
   box=errordlg('Erro!! Configuração singular');
 
  break;  
end
%multiplica o inverso do jacobiano pela matriz delta x e pelo intervalo de
%integração
B=(B\d_x)*d_te; %d_te= intervalo de integração;


%------------------------------------------------------------------------
%soma o valor de delta teta ao teta inicial para obter os novos 
%valores de teta
t_1f=t_1i+B(1);
t_2f=t_2i+B(2);

%-----------------------------------------------------------------------

%-----------------------------------------------------------------------
%Atualiza os novos valores de teta inicial e os coloca em uma variável
%auxiliar para o cálculo cinemático direto.
t_1i=t_1f;
t_2i=t_2f;
aux=[t_1i  t_2i]; 
%-----------------------------------------------------------------------
end

end

if m==3
%--------------------------------------------------------------------------
%define os ângulos iniciais e o coloca em uma variável auxiliar para o
%cálculo cinemático direto      
aux=((180*posf)-90)*pi/180;
t_1i=aux(1);
t_2i=aux(2);
t_3i=aux(3);
     
%-------------------------------------------------------------------------- 

%--------
%auxiliares para obrigar a entrada no laço de repetição
dx=tol+1;
dy=tol+1;
dz=tol+1;
%--------

while abs(dx)>=tol || abs(dy)>=tol || abs(dz)>=tol
    
%------------------------------------------------------------------------------------------------
%Cálculo cinemático direto
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
%------------------------------------------------------------------------------------------------

%---------------------------------------------------------
%Atualiza novos delta x e coloca-os em um vetor d_x
dx=x-j(1,4);
dy=y-j(2,4);
dz=z-j(3,4);
d_x=[dx;dy;dz];
%---------------------------------------------------------

%Define a matriz jacobiana numérica do manipulador, substituindo os valores
%simbólicos

B=subs(jac,[t_1 t_2 t_3],[t_1i t_2i t_3i]); 
if abs(det(B))<=0.0001
    
   box=errordlg('Erro!! Configuração singular');
 
  break;  
end
%multiplica o inverso do jacobiano pela matriz delta x e pelo intervalo de
%integração
B=(B\d_x)*d_te; %d_te= intervalo de integração;


%------------------------------------------------------------------------
%soma o valor de delta teta ao teta inicial para obter os novos 
%valores de teta
t_1f=t_1i+B(1);
t_2f=t_2i+B(2);
t_3f=t_3i+B(3);
%-----------------------------------------------------------------------

%-----------------------------------------------------------------------
%Atualiza os novos valores de teta inicial e os coloca em uma variável
%auxiliar para o cálculo cinemático direto.
t_1i=t_1f;
t_2i=t_2f;
t_3i=t_3f;
aux=[t_1i  t_2i t_3i]; 
%-----------------------------------------------------------------------
end

end
if m==4
%--------------------------------------------------------------------------
%define os ângulos iniciais e o coloca em uma variável auxiliar para o
%cálculo cinemático direto      
aux=((180*posf)-90)*pi/180;
t_1i=aux(1);
t_2i=aux(2);
t_3i=aux(3);
t_4i=aux(4);
    
%-------------------------------------------------------------------------- 

%--------
%auxiliares para obrigar a entrada no laço de repetição
dx=tol+1;
dy=tol+1;
dz=tol+1;
%--------

while abs(dx)>=tol || abs(dy)>=tol || abs(dz)>=tol
    
%------------------------------------------------------------------------------------------------
%Cálculo cinemático direto
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
%------------------------------------------------------------------------------------------------

%---------------------------------------------------------
%Atualiza novos delta x e coloca-os em um vetor d_x
dx=x-j(1,4);
dy=y-j(2,4);
dz=z-j(3,4);
d_x=[dx;dy;dz;0];
%---------------------------------------------------------

%Define a matriz jacobiana numérica do manipulador, substituindo os valores
%simbólicos

B=subs(jac,[t_1 t_2 t_3 t_4],[t_1i t_2i t_3i t_4i]); 
if abs(det(B))<=0.0001
    
   box=errordlg('Erro!! Configuração singular');
 
  break;  
end
%multiplica o inverso do jacobiano pela matriz delta x e pelo intervalo de
%integração
B=(B\d_x)*d_te; %d_te= intervalo de integração;

%------------------------------------------------------------------------
%soma o valor de delta teta ao teta inicial para obter os novos 
%valores de teta
t_1f=t_1i+B(1);
t_2f=t_2i+B(2);
t_3f=t_3i+B(3);
t_4f=t_4i+B(4);
%-----------------------------------------------------------------------

%-----------------------------------------------------------------------
%Atualiza os novos valores de teta inicial e os coloca em uma variável
%auxiliar para o cálculo cinemático direto.
t_1i=t_1f;
t_2i=t_2f;
t_3i=t_3f;
t_4i=t_4f;
aux=[t_1i  t_2i t_3i t_4i]; 
%-----------------------------------------------------------------------
end

end




if m==5
%--------------------------------------------------------------------------
%define os ângulos iniciais e o coloca em uma variável auxiliar para o
%cálculo cinemático direto      
aux=((180*posf)-90)*pi/180;
t_1i=aux(1);
t_2i=aux(2);
t_3i=aux(3);
t_4i=aux(4);
t_5i=aux(5);
     
%-------------------------------------------------------------------------- 

%--------
%auxiliares para obrigar a entrada no laço de repetição
dx=tol+1;
dy=tol+1;
dz=tol+1;
%--------

while abs(dx)>=tol || abs(dy)>=tol || abs(dz)>=tol
    
%------------------------------------------------------------------------------------------------
%Cálculo cinemático direto
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
%------------------------------------------------------------------------------------------------

%---------------------------------------------------------
%Atualiza novos delta x e coloca-os em um vetor d_x
dx=x-j(1,4);
dy=y-j(2,4);
dz=z-j(3,4);
d_x=[dx;dy;dz;0;0];
%---------------------------------------------------------

%Define a matriz jacobiana numérica do manipulador, substituindo os valores
%simbólicos

B=subs(jac,[t_1 t_2 t_3 t_4 t_5 ],[t_1i t_2i t_3i t_4i t_5i ]); 

if abs(det(B))<=0.0001
    
   box=errordlg('Erro!! Configuração singular');
 
  break;  
end
%multiplica o inverso do jacobiano pela matriz delta x e pelo intervalo de
%integração

B=(B\d_x)*d_te; %d_te= intervalo de integração;


%------------------------------------------------------------------------
%soma o valor de delta teta ao teta inicial para obter os novos 
%valores de teta
t_1f=t_1i+B(1);
t_2f=t_2i+B(2);
t_3f=t_3i+B(3);
t_4f=t_4i+B(4);
t_5f=t_5i+B(5);

%-----------------------------------------------------------------------

%-----------------------------------------------------------------------
%Atualiza os novos valores de teta inicial e os coloca em uma variável
%auxiliar para o cálculo cinemático direto.
t_1i=t_1f;
t_2i=t_2f;
t_3i=t_3f;
t_4i=t_4f;
t_5i=t_5f;

aux=[t_1i  t_2i t_3i t_4i t_5i ]; 
%-----------------------------------------------------------------------
end

end

if m==6
%--------------------------------------------------------------------------
%define os ângulos iniciais e o coloca em uma variável auxiliar para o
%cálculo cinemático direto      
aux=((180*posf)-90)*pi/180;
t_1i=aux(1);
t_2i=aux(2);
t_3i=aux(3);
t_4i=aux(4);
t_5i=aux(5);
t_6i=aux(6);

%-------------------------------------------------------------------------- 

%--------
%auxiliares para obrigar a entrada no laço de repetição
dx=tol+1;
dy=tol+1;
dz=tol+1;
%--------

while abs(dx)>=tol || abs(dy)>=tol || abs(dz)>=tol
    
%------------------------------------------------------------------------------------------------
%Cálculo cinemático direto
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
%------------------------------------------------------------------------------------------------

%---------------------------------------------------------
%Atualiza novos delta x e coloca-os em um vetor d_x
dx=x-j(1,4);
dy=y-j(2,4);
dz=z-j(3,4);
d_x=[dx;dy;dz;0;0;0];
%---------------------------------------------------------

%Define a matriz jacobiana numérica do manipulador, substituindo os valores
%simbólicos

B=subs(jac,[t_1 t_2 t_3 t_4 t_5 t_6],[t_1i t_2i t_3i t_4i t_5i t_6i]); 


if abs(det(B))<=0.0001
    
   box=errordlg('Erro!! Configuração singular');
 
  break;  
end
%multiplica o inverso do jacobiano pela matriz delta x e pelo intervalo de
%integração
B=(B\d_x)*d_te; %d_te= intervalo de integração;
%a=inv(B)*d_x

%------------------------------------------------------------------------
%soma o valor de delta teta ao teta inicial para obter os novos 
%valores de teta
t_1f=t_1i+B(1);
t_2f=t_2i+B(2);
t_3f=t_3i+B(3);
t_4f=t_4i+B(4);
t_5f=t_5i+B(5);
t_6f=t_6i+B(6);
%-----------------------------------------------------------------------

%-----------------------------------------------------------------------
%Atualiza os novos valores de teta inicial e os coloca em uma variável
%auxiliar para o cálculo cinemático direto.
t_1i=t_1f;
t_2i=t_2f;
t_3i=t_3f;
t_4i=t_4f;
t_5i=t_5f;
t_6i=t_6f;
aux=[t_1i  t_2i t_3i t_4i t_5i t_6i]; 
%-----------------------------------------------------------------------
end

end


[m, n]=size(aux);
for i=1:n
posf(i)=((aux(i)*180/pi)+90)/180;
if posf(i)>1 ||posf(i)<0
  box=errordlg('Erro!! Servo fora de Range',['Servo' num2str(i)]);     
end
end 


save('d_1','posf','posi','X','Y','Z','x','y','z');
g_traj;



