%Proyecto Final
%Sistemas Lineales
%Procedimiento:
%   1. Extraer canciones, siendo las señales moduladoras.
%   2. Graficar canciones en tiempo y frecuencia.
%   3. Generar las señales portadoras.
%   4. Graficar las señales portadoras en tiempo y frecuencia.
%   5. Modular canciones.
%   6. Graficar modulaciones en tiempo y frecuencia.
%   7. Sumar las modulaciones.
%   8. Graficar el resultado en tiempo y frecuencia.
%   9. Preguntar al usuario qué frecuencia quiere escuchar.
%   10. Demodular la canción escogida por el usuario.
%   11. Graficar el resultado en tiempo y frecuencia.
%   12. Aplicar un filtro pasa bajas.
%   13. Graficar el resultado en tiempo y frecuencia.

clear; clc;
close all;

fprintf('Proyecto Final')
fprintf('\nSistemas Lineales')
fprintf('\n"Modulación en amplitud"')
fprintf('\n\nEquipo 5')
fprintf('\nThalía Isabel Bravo Pimentel')
fprintf('\nDaniela Escalante Sánchez')
fprintf('\nJazmín Villegas Hernández')
n=3;
pause(n)
fprintf('\n\nSeñales de radio disponibles: ')
fprintf('\n1. 710k Hz con "Summer Days" - Martin Garrix')
fprintf('\n2. 610k Hz con "Phone Numbers" - Dominic Fike')
fprintf('\n3. 950k Hz con "3 Nights" - Dominic Fike\n')
fprintf('\nGraficando...\n')
pause(n)

%---------------------------------------------------------------------------------------------
%   1. Extraer canciones, siendo las señales moduladoras.

[song1,Fs] = audioread("cancion2.wav");
samples = [1,15*Fs];
[x1,~] = audioread('cancion2.wav',samples);
%sound(x1,Fs); %Prueba de sonido

[x2,~] = audioread('cancion1.wav',samples);
%sound(x2,Fs); %Prueba de sonido

[x3,~] = audioread('cancion3.wav',samples);
%sound(x3,Fs); %Prueba de sonido

%---------------------------------------------------------------------------------------------
%   2. Graficar canciones en tiempo y frecuencia.

T = 1/Fs;
t = (1/Fs)*(1:length(x1));

xt1 = x1.';
Xf1 = fft(xt1);
f1 = (0:length(Xf1)-1)*(1/0.001)/length(Xf1);

xt2 = x2.';
Xf2 = fft(xt2);
f2 = (0:length(Xf2)-1)*(1/0.001)/length(Xf2);

xt3 = x3.';
Xf3 = fft(xt3);
f3 = (0:length(Xf3)-1)*(1/0.001)/length(Xf3);

figure(1);
subplot(3,2,1);
plot(t,xt1,'c');
title('Canción 1 "Summer Days" en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(3,2,2);
plot(f1,real(Xf1),'c');
title('Canción 1 "Summer Days" en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

subplot(3,2,3);
plot(t,xt2,'g');
title('Canción 2 "Phone Numbers" en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(3,2,4);
plot(f2,real(Xf2),'g');
title('Canción 2 "Phone Numbers" en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

subplot(3,2,5);
plot(t,xt3,'m');
title('Canción 3 "3 Nights" en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(3,2,6);
plot(f3,real(Xf3),'m');
title('Canción 3 "3 Nights" en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

%---------------------------------------------------------------------------------------------
%   3. Generar las señales portadoras.

fradio1 = 710*1000;
yport1 = sin(2*pi*fradio1*t);
Yport1 = fft(yport1);
fport1 = (0:length(Yport1)-1)*(1/0.001)/length(Yport1);

fradio2 = 610*1000;
yport2 = sin(2*pi*fradio2*t);
Yport2 = fft(yport2);
fport2 = (0:length(Yport2)-1)*(1/0.001)/length(Yport2);

fradio3 = 950*1000;
yport3 = sin(2*pi*fradio3*t);
Yport3 = fft(yport3);
fport3 = (0:length(Yport3)-1)*(1/0.001)/length(Yport3);

%---------------------------------------------------------------------------------------------
%   4. Graficar las señales portadoras en tiempo y frecuencia.

figure(2);
subplot(3,2,1);
plot(t,yport1,'c');
title('Señal portadora 1 de 710k Hz en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
xlim([0 0.01]);
ylim([-1 1]);
grid on;
subplot(3,2,2);
plot(fport1,real(Yport1),'c');
title('Señal portadora 1 de 710k Hz en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

subplot(3,2,3);
plot(t,yport2,'g');
title('Señal portadora 2 de 610k Hz en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
xlim([0 0.005]);
ylim([-1 1]);
grid on;
subplot(3,2,4);
plot(fport2,real(Yport2),'g');
title('Señal portadora 2 de 610k Hz en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

subplot(3,2,5);
plot(t,yport3,'m');
title('Señal portadora 3 de 950k Hz en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
xlim([0 0.01]);
ylim([-1 1]);
grid on;
subplot(3,2,6);
plot(fport3,real(Yport3),'m');
title('Señal portadora 3 de 950k Hz en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

%---------------------------------------------------------------------------------------------
%   5. Modular canciones.

z1 = xt1.*yport1;
Z1 = fft(z1);
fZ1 = (0:length(Z1)-1)*(1/0.001)/length(Z1);


z2 = xt2.*yport2;
Z2 = fft(z2);
fZ2 = (0:length(Z2)-1)*(1/0.001)/length(Z2);

z3 = xt3.*yport3;
Z3 = fft(z3);
fZ3 = (0:length(Z3)-1)*(1/0.001)/length(Z3);

%---------------------------------------------------------------------------------------------
%   6. Graficar modulaciones en tiempo y frecuencia.
figure(3);
subplot(3,2,1);
plot(t,z1,'c');
title('Modulación AM de"Summer Days" en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(3,2,2);
plot(fZ1,real(Z1),'c');
title('Modulación AM de "Summer Days" en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

subplot(3,2,3);
plot(t,z2,'g');
title('Modulación AM de "Phone Numbers" en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(3,2,4);
plot(fport2,real(Z2),'g');
title('Modulación AM de "Phone Numbers" en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

subplot(3,2,5);
plot(t,z3,'m');
title('Modulación AM de "3 Nights" en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(3,2,6);
plot(fport3,real(Z3),'m');
title('Modulación AM de "3 Nights" en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

%---------------------------------------------------------------------------------------------
%   7. Sumar las modulaciones.

modTotalt = z1+z2+z3;

modTotalf = fft(modTotalt);
fmodTotalf = (0:length(modTotalf)-1)*(1/0.001)/length(modTotalf);

%---------------------------------------------------------------------------------------------
%   8. Graficar el resultado en tiempo y frecuencia.

figure(4);
subplot(2,1,1);
plot(t,modTotalt,'r');
title('Suma de las tres modulaciones AM en tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
subplot(2,1,2);
plot(fmodTotalf,real(modTotalf),'r');
title('Suma de las tres modulaciones AM en frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;

%---------------------------------------------------------------------------------------------
%   9. Preguntar al usuario qué frecuencia quiere escuchar.
%   10. Demodular la frecuencia escogida por el usuario.
%   11. Graficar el resultado en tiempo y frecuencia.
%   12. Aplicar un filtro pasa bajas.
%   13. Graficar el resultado en tiempo y frecuencia.

n=5;
pause(n)
fprintf('\nA continuación se mostrarán las gráficas generales en el siguiente orden:')
fprintf('\n1. Figure 1 - Canciones (señales moduladoras)')
fprintf('\n2. Figure 2 - Frecuencias de radio (señales portadoras)')
fprintf('\n3. Figure 3 - Etapa de modulación')
fprintf('\n4. Figure 4 - Suma de modulaciones (multiplexor)')
fprintf('\n\nDespués usted podrá elegir una de las tres frecuencias disponibles.')
fprintf('\nDe igual manera se graficará lo siguiente:')
fprintf('\nFigure 5 - Etapa de demodulación (demultiplexor)')
fprintf('\nFigure 6 - Comparación entre la señal filtrada y la señal original.\n')
pause(n)
fprintf('\n\nSeñales de radio disponibles: ')
fprintf('\n1. 710k Hz con "Summer Days" - Martin Garrix')
fprintf('\n2. 610k Hz con "Phone Numbers" - Dominic Fike')
fprintf('\n3. 950k Hz con "3 Nights" - Dominic Fike\n')
fprintf('\n¿Cúal desea escuchar?')
fprintf('\n¿710000, 610000 o 950000?\n')
opc=input('');
if opc==710000
    %Demodulación
    demod1t = z1.*yport1;
    demod1f = fft(demod1t);
    fdemod1f = (0:length(demod1f)-1)*(1/0.001)/length(demod1f);
    %sound(demod1t,Fs)

    figure(5);
    subplot(2,1,1);
    plot(t,demod1t,'c');
    title('Demodulación AM de "Summer Days" en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,1,2);
    plot(fdemod1f,real(demod1f),'c');
    title('Demodulación AM de "Summer Days" en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;

    %Filtro pasa-bajas
    [num,den]=butter(4,Fs/fradio1,'low');
    g1 = filter(num,den,demod1t);
    g1 = 10.*g1;
    G1 = fft(g1);
    fg1 = (0:length(g1)-1)*(1/0.001)/length(g1);
    sound(g1,Fs)

    figure(6);
    subplot(2,2,1);
    plot(t,g1,'c');
    title('"Summer Days" filtrada en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,2);
    plot(fg1,real(G1),'c');
    title('"Summer Days" filtrada en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,3);
    plot(t,xt1,'c');
    title('Señal original de "Summer Days" en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,4);
    plot(f1,real(Xf1),'c');
    title('Señal original de "Summer Days" en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;
    fprintf('Fin del programa.\n')

elseif opc==610000
    %Demodulación
    demod2t = z2.*yport2;
    demod2f = fft(demod2t);
    fdemod2f = (0:length(demod2f)-1)*(1/0.001)/length(demod2f);
    %sound(demod2t,Fs)

    figure(5);
    subplot(2,1,1);
    plot(t,demod2t,'g');
    title('Demodulación AM de "Phone Numbers" en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,1,2);
    plot(fdemod2f,real(demod2f),'g');
    title('Demodulación AM de "Phone Numbers" en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;

    %Filtro pasa-bajas
    [num,den]=butter(2,Fs/fradio2,'low'); %Filtro pasa-bajas
    g2 = filter(num,den,demod2t);
    g2 = 10.*g2;
    G2 = fft(g2);
    fg2 = (0:length(g2)-1)*(1/0.001)/length(g2);
    sound(g2,Fs)

    figure(6);
    subplot(2,2,1);
    plot(t,g2,'g');
    title('"Phone Numbers" filtrada en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,2);
    plot(fg2,real(G2),'g');
    title('"Phone Numbers" filtrada en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,3);
    plot(t,xt2,'g');
    title('Señal original de "Phone Numbers" en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,4);
    plot(f2,real(Xf2),'g');
    title('Señal original de "Phone Numbers" en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;
    fprintf('Fin del programa.\n')

elseif opc==950000
    %Demodulación
    demod3t = z3.*yport3;
    demod3f = fft(demod3t);
    fdemod3f = (0:length(demod3f)-1)*(1/0.001)/length(demod3f);
    %sound(demod2t,Fs)
   
    figure(5);
    subplot(2,1,1);
    plot(t,demod3t,'m');
    title('Demodulación AM de "3 Nights" en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,1,2);
    plot(fdemod3f,real(demod3f),'m');
    title('Demodulación AM de "3 Nights" en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;

    %Filtro pasa-bajas
    [num,den]=butter(2,Fs/fradio3,'low');
    g3 = filter(num,den,demod3t);
    g3 = 10.*g3;
    G3 = fft(g3);
    fg3 = (0:length(g3)-1)*(1/0.001)/length(g3);
    sound(g3,Fs)

    figure(6);
    subplot(2,2,1);
    plot(t,xt3,'m');
    title('"3 Nights" filtrada en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,2);
    plot(fg3,real(G3),'m');
    title('"3 Nights" filtrada en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,3);
    plot(t,xt3,'m');
    title('Señal original de "3 Nights" en tiempo');
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    grid on;
    subplot(2,2,4);
    plot(f3,real(Xf3),'m');
    title('Señal original de "3 Nights" en frecuencia');
    xlabel('Frecuencia (Hz)');
    ylabel('Amplitud');
    grid on;
    fprintf('Fin del programa.\n')
else
    fprintf('\nOpción inválida, corra nuevamente el programa.\n')
end