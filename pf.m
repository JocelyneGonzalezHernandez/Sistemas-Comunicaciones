% @file ProyectoFinal.m
% @brief Este progama realiza el proyecto final de sistemas Lineales
% @author Equipo 1: Luis Cortés Muñoz, Damián Muñoz Díaz, Sandra Lorena Quijada León, Jocelyne González Hernández
% @date 27/06/2023

%% Definicion de variables
clc
close all

%% Definicion de las variables
%fmod=3000; %Frecuencia señal Moduladora 3khz
fpor_uno=530000; %Frecuencia señal Portadora uno de: 530khz
fpor_dos=950000; %Frecuencia señal Portadora dos de: 950khz
fpor_tres=1210000; %Frecuencia señal Portadora tres de: 1210khz
fs=fpor_tres*2; %Frecuencia de muestreo (2 veces la frecuencia maxima)
T=1/fs; %Periodo
N=fs*2; %Número de muestras
x=(0:fs*2-1).*T; %Vector de muestras
m=0.5; %Indice de modulación

%% Definicion de las canciones
[s, Fs] = audioread('cancion1.wav'); 
s_mod_cancion=s(1:fs*2,1);

[s2, Fs2] = audioread('cancion2.wav'); 
s_mod_cancion2=s2(1:fs*2,1);

[s3, Fs3] = audioread('cancion3.wav'); 
s_mod_cancion3=s3(1:fs*2,1);

%% Gráficas en tiempo y frecuencia de las canciones
figure(1) %Canción 1
%Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion)
grid on
title('Señal Cancion 1 en tiempo')
%Frecuencia
T1=length(s_mod_cancion);
nFFT=2; %Contador transformada de Fourier
while nFFT<T1
    nFFT=nFFT*32;
end
t_smod= fft(s_mod_cancion, nFFT); %Calculamos la transformada de Fourier
P1=abs(t_smod); %Espectro
f=linspace(0, fs, nFFT); %Vector con puntos equidistantes
subplot(2,1,2)
plot(f, P1)
grid on
title('Señal Cancion 1 en frecuencia')

figure(2) %Canción 2
%Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion2)
grid on
title('Señal Cancion 2 en tiempo')
%Frecuencia
T1=length(s_mod_cancion2);
nFFT=2; %Contador transformada de Fourier
while nFFT<T1
    nFFT=nFFT*32;
end
t_smod= fft(s_mod_cancion2, nFFT); %Calculamos la transformada de Fourier
P1=abs(t_smod); %Espectro
f=linspace(0, fs, nFFT); %Vector con puntos equidistantes
subplot(2,1,2)
plot(f, P1)
grid on
title('Señal Cancion 2 en frecuencia')

figure(3) %Canción 3
%Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion3)
grid on
title('Señal Cancion 3 en tiempo')
%Frecuencia
T1=length(s_mod_cancion3);
nFFT=2; %Contador transformada de Fourier
while nFFT<T1
    nFFT=nFFT*32;
end
t_smod= fft(s_mod_cancion3, nFFT); %Calculamos la transformada de Fourier
P1=abs(t_smod); %Espectro
f=linspace(0, fs, nFFT); %Vector con puntos equidistantes
subplot(2,1,2)
plot(f, P1)
grid on
title('Señal Cancion 3 en frecuencia')

%% Gráficas en tiempo y frecuencia de las señales portadoras
figure(4)%Portadora 1
%Tiempo
t=(0:0.01/N:1/fpor_uno);
s_porUno=10*cos(2*pi*fpor_uno.*t); %Señal Portadora
subplot(2,1,1)
plot(t, s_porUno)
grid on
title('Señal Portadora en tiempo')
%Frecuencia
s_porUno_inicial=10*cos(2*pi*fpor_uno.*x); 
T1=length(s_porUno_inicial);
nFFT=2; %Contador transformada de Fourier
while nFFT<T1
    nFFT=nFFT*32;
end
t_sporUno= fft(s_porUno_inicial, nFFT); %Calculamos la transformada de Fourier
P1=abs(t_sporUno); %Espectro
f=linspace(0, fs, nFFT);  %Vector con puntos equidistantes
subplot(2,1,2)
plot(f, P1)
grid on
title('Señal Portadora en frecuencia')
figure(5)%Portadora 2
%Tiempo
t=(0:0.01/N:1/fpor_dos);
s_porDos=10*cos(2*pi*fpor_dos.*t); %Señal Portadora
subplot(2,1,1)
plot(t, s_porDos)
grid on
title('Señal Portadora 1 en tiempo')
%Frecuencia
s_porDos_inicial=10*cos(2*pi*fpor_dos.*x); 
T1=length(s_porDos_inicial);
nFFT=2; %Contador transformada de Fourier
while nFFT<T1
    nFFT=nFFT*32;
end
t_sporDos= fft(s_porDos_inicial, nFFT); %Calculamos la transformada de Fourier
P1=abs(t_sporDos); %Espectro
f=linspace(0, fs, nFFT);  %Vector con puntos equidistantes
subplot(2,1,2)
plot(f, P1)
grid on
title('Señal Portadora 1 en frecuencia')

figure(6)%Portadora 3
%Tiempo
t=(0:0.01/N:1/fpor_tres);
s_porTres=10*cos(2*pi*fpor_tres.*t); %Señal Portadora
subplot(2,1,1)
plot(t, s_porTres)
grid on
title('Señal Portadora 3 en tiempo')
%Frecuencia
s_porTres_inicial=10*cos(2*pi*fpor_tres.*x); 
T1=length(s_porTres_inicial);
nFFT=2; %Contador transformada de Fourier
while nFFT<T1
    nFFT=nFFT*32;
end
t_sporTres= fft(s_porTres_inicial, nFFT); %Calculamos la transformada de Fourier
P1=abs(t_sporTres); %Espectro
f=linspace(0, fs, nFFT);  %Vector con puntos equidistantes
subplot(2,1,2)
plot(f, P1)
grid on
title('Señal Portadora 3 en frecuencia')
%% Modulación

%% Demodulación

%% Filtro Pasa Bandas

%% Filtro Pasa Bajas