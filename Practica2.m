%Este programa sirve para hacer la práctica 2
%Esta parte sirve para resolver el ejercicio 2

%Función x(t)
figure(1); 
%Declaración del dominio
dom1= -2:0.01:2;
%Funcion
x=((dom1<0).*(-0.5*dom1-1))+((dom1>0).*(-0.5*dom1+1));
plot(dom1, x, 'b','LineWidth', 3)
grid on
xlabel('t')
ylabel('x(t)')
title('x(t), Gráfica 1'); 

%Función h(t)
figure(2); 
%Declaración del dominio
dom2= 1:0.01:3;
%Funcion
h=((dom2<2).*(2))+((dom2>2).*(-2));
plot(dom2, h, 'b','LineWidth', 3)
grid on
xlabel('t')
ylabel('h(t)')
title('h(t), Gráfica 2'); 

%Convolución h(t)*x(t)
figure(3); 
t=-1:0.01:5;
c=conv (h,x);
plot(t, c,  'b','LineWidth', 3);
grid on
title('Convolución h(t)*x(t)'); 

%Convolución x(t)*h(t)
figure(4); 
c=conv (x,h);
plot(t, c, 'b','LineWidth', 3);
grid on
title('Convolución x(t)*h(t)'); 

