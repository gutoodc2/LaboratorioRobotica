% ** Linear Segments with Parabolic Blends (PSPB) **
clear all;
% intial time, joint value and joint velocity
to = 0; qo = 30;
% final time, joint value and joint velocity
tf = 5; qf = 70;
% constant velocity and blend time
V = 10; tb = (qo - qf + V*tf)/V;
% check that V is within limits
Vmin = (qf - qo)/tf;
if (V > Vmin || V < 2*Vmin) % this check assumes V negative
    display(['V = ',num2str(V), ' is not within limits',...
            '(',num2str(Vmin),', ',num2str(2*Vmin),')']);
    display('LSPB will not be correct!');
end;
a(1) = qo; a(2) = 0; a(3) = V/(2*tb);
b(1) = qf - (V*tf^2)/(2*tb); b(2) = V*tf/tb; b(3) = -V/(2*tb);

% ** Linear Segments with Parabolic Blends (PSPB) **
% Begin with unshifted version on t = [0, 7].
t = to:(tf-to)/500:tf;
q = (a(1) + a(2)*t + a(3)*t.^2).*(t<=tb) + ...
    ((qf + qo - V*tf)/2 + V*t).*((t>tb)-(t>=(tf-tb))) + ...
    (b(1) + b(2)*t + b(3)*t.^2).*(t>(tf-tb));
qdot = (a(2) + 2*a(3)*t).*(t<=tb) + ...
       V.*((t>tb)-(t>=(tf-tb))) + ...
       (b(2) + 2*b(3)*t).*(t>(tf-tb));
qddot = 2*a(3)*(t<=tb) + ...
        0*((t>tb)-(t>=(tf-tb))) + ...
        2*b(3)*(t>(tf-tb));
subplot(2,2,3);
plot(t,q,'b-',t,qdot,'g--',t,qddot,'r-.','LineWidth',2);
legend('q','dq/dt','d^2q/dt^2');
xlabel('time (sec)'); ylabel('Joint Trajectory');
title('(Unshifted) Trajectory using LSPB');
