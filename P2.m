
%%PARTE 2  
% PRÁCTICA 2 - EQUIPO 4
%Este programa realiza convoluciones

% Ecuación x(t)
figure(1);
t=-2:0.01:2;
x= (t<0)*0.5.*(-t-2)+(-1)*(t>=0)*0.5.*(t-2);
plot(t,x,'r','LineWidth',3)
title('x(t)'); 
grid on;

%Ecuación h(t)
figure(2);
t2 = 1:0.01:3;
h=(t2<2).*(0.*t2+2)+(t2>=2).*(0.*t2-2);
%figure name 'señal dos h(t)'
plot(t2,h,'b','LineWidth',3);
title('h(t)'); 
grid on;

%Convolución de x(t)*h(t)
figure(3);
t3=-1:0.01:5;
f = conv (x,h);
plot(t3,f,'m','LineWidth',3);
title('Convolución x(t)*h(t)'); 
grid on;

%Convolución h(t)*x(t)
figure(4);
t4=-1:0.01:5;
g = conv (h,x);
plot(t4,g,'m','LineWidth',3)
title('Convolución h(t)*x(t)'); 
grid on;

