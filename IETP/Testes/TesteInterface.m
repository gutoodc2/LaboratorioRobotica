clear all; delete( get(0, 'Children') );
while 1,
 selection = menu('Geração de Trajetorias', ...
  'Polinomio Cubico', ...
    'Polinomio de 5 ordem', ... 
    'Trapezoidal', ...
  'Exit');
 switch selection,
    case 1,
        pcubico
    case 2,
        polinomio5
     case 3,
         [q, qd,  qdd] = linear_parabolic(0, pi/2, 10);
 case 4,
delete( get(0, 'Children') );
  break;
 end
end