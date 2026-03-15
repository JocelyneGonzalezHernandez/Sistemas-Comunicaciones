%Programa para obtener parte par e impar de la función
t=[0 2 4 8];
x=[3 5 5 3];
m=0.5;
grafica=x*m;
%Parte par
figure(1)
hold on
plot(t,grafica,'b');
plot(-t,grafica, 'b');
title('Parte par');
grid on
%Parte impar
figure(2)
hold on
plot(-t,-grafica, 'r');
plot(t,grafica,'r');
title('Parte impar')
grid on
%Suma de parte par e impar
figure(3)
plot(t, grafica + grafica, 'g');
xlabel('t');
ylabel('x(t)');
title('Suma de par e impar (Original)')
grid on