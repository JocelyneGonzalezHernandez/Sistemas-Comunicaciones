% @file ProyectoFinal.m
% @brief Este progama realiza el proyecto final de sistemas Lineales
% @author Equipo 1: Luis Cortés Muñoz, Damián Muñoz Díaz, Sandra Lorena Quijada León, Jocelyne González Hernández
% @date 27/06/2023

%% Definicion de variables
clc
close all

%% Definicion de las variables
fpor_uno=580000; %Frecuencia señal Portadora uno de: 580khz
fpor_dos=800000; %Frecuencia señal Portadora dos de: 800khz
fpor_tres=950000; %Frecuencia señal Portadora tres de: 950khz
fs=fpor_tres*2; %Frecuencia de muestreo
T=1/fs; %Periodo
N=fs*2; %Número de muestras
x=(0:N-1).*T; %Vector de muestras

%% Cancion 1
% Definicion de la cancion
[s, Fs] = audioread('cancion1.wav'); %Canción 1
s_mod_cancion=s(1:N,1);

% Gráficas en tiempo y frecuencia de la cancion
figure(1) %Canción 1
%Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion)
grid on
title('Señal Cancion 1 en tiempo')
%Frecuencia
t_smod= fft(s_mod_cancion); %Calculamos la transformada de Fourier
t_smod=abs(t_smod); %Espectro
dom_frequencial= (0:length(s_mod_cancion)-1)*(fs/length(s_mod_cancion));
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Canción 1 en frecuencia')

% Gráficas en tiempo y frecuencia de la señal portadora
figure(2)%Portadora 1
%Tiempo
t=(0:0.01/N:1/fpor_uno);
s_por_secundaria=10*cos(2*pi*fpor_uno.*t); %Señal Portadora
subplot(2,1,1)
plot(t, s_por_secundaria)
grid on
title('Señal Portadora 1 en tiempo')
%Frecuencia
s_por=10*cos(2*pi*fpor_uno.*x); %Señal Portadora
t_spor= fft(s_por); %Calculamos la transformada de Fourier
t_spor=abs(t_spor); %Espectro
dom_frequencial= (0:length(s_por)-1)*(fs/length(s_por)); 
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Protadora 1 en frecuencia')

% Modulación
figure(3) %Modulación canción 1
MOD= s_mod_cancion.*s_por';
subplot(2,1,1)
%Gráfica en Tiempo
plot(x, MOD)
grid on
title('Señal Modulada 1 en tiempo')
%Gráfica en Frecuencia
t_mod= fft(MOD); %Calculamos la transformada de Fourier
t_mod=abs(t_mod); %Espectro
dom_frequencial= (0:length(MOD)-1)*(fs/length(MOD));
subplot(2,1,2)
plot(dom_frequencial, t_mod)
grid on
title('Señal Modulada 1 en frecuencia')

% Demodulación
figure(4) %Demodulación Canción 1
DEMO= MOD.*s_por';
subplot(2,1,1)
%Gráfica en Tiempo
plot(x, DEMO)
grid on
title('Señal Demodulada 1 en tiempo')
%Gráfica en Frecuencia
t_demo= fft(DEMO); %Calculamos la transformada de Fourier
t_demo=abs(t_demo); %Espectro
dom_frequencial= (0:length(DEMO)-1)*(fs/length(DEMO)); 
subplot(2,1,2)
plot(dom_frequencial, t_demo)
grid on
title('Señal Demodulada 1 en frecuencia')

%% Cancion 2
%Definicion de cancion
[s2, Fs2] = audioread('cancion2.wav'); %Canción 2
s_mod_cancion2=s2(1:N,1);

% Gráficas en tiempo y frecuencia de la cancion
figure(5) %Canción 2
%Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion2)
grid on
title('Señal Cancion 2 en tiempo')
%Frecuencia
t_smod= fft(s_mod_cancion2); %Calculamos la transformada de Fourier
t_smod=abs(t_smod); %Espectro
dom_frequencial= (0:length(s_mod_cancion2)-1)*(fs/length(s_mod_cancion2)); 
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Canción 2 en frecuencia')

% Gráficas en tiempo y frecuencia de la señal portadora
figure(6)%Portadora 2
%Tiempo
t=(0:0.01/N:1/fpor_dos);
s_por_secundaria=10*cos(2*pi*fpor_dos.*t); %Señal Portadora
subplot(2,1,1)
plot(t, s_por_secundaria)
grid on
title('Señal Portadora 2 en tiempo')
%Frecuencia
s_por2=10*cos(2*pi*fpor_dos.*x); %Señal Portadora
t_spor= fft(s_por2); %Calculamos la transformada de Fourier
t_spor=abs(t_spor); %Espectro
dom_frequencial= (0:length(s_por2)-1)*(fs/length(s_por2)); 
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Protadora 2 en frecuencia')

%Modulación
figure(7) %Modulación canción 2
MOD2= s_mod_cancion2.*s_por2';
subplot(2,1,1)
%Gráfica en Tiempo
plot(x, MOD2)
grid on
title('Señal Modulada 2 en tiempo')
%Gráfica en Frecuencia
t_mod= fft(MOD2); %Calculamos la transformada de Fourier
t_mod=abs(t_mod); %Espectro
dom_frequencial= (0:length(MOD2)-1)*(fs/length(MOD2)); 
subplot(2,1,2)
plot(dom_frequencial, t_mod)
grid on
title('Señal Modulada 2 en frecuencia')

% Demodulación
figure(8) %Demodulación Canción 2
DEMO2= MOD2.*s_por2';
subplot(2,1,1)
%Gráfica en Tiempo
plot(x, DEMO2)
grid on
title('Señal Demodulada 2 en tiempo')
%Gráfica en Frecuencia
t_demo= fft(DEMO2); %Calculamos la transformada de Fourier
t_demo=abs(t_demo); %Espectro
dom_frequencial= (0:length(DEMO2)-1)*(fs/length(DEMO2)); 
subplot(2,1,2)
plot(dom_frequencial, t_demo)
grid on
title('Señal Demodulada 2 en frecuencia')

%% Cancion 3
%Definicion de cancion
[s3, Fs3] = audioread('cancion3.wav'); %Canción 3
s_mod_cancion3=s3(1:N,1);

% Gráficas en tiempo y frecuencia de la cancion
figure(9) %Canción 3
%Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion3)
grid on
title('Señal Cancion 3 en tiempo')
%Frecuencia
t_smod= fft(s_mod_cancion3); %Calculamos la transformada de Fourier
t_smod=abs(t_smod); %Espectro
dom_frequencial= (0:length(s_mod_cancion3)-1)*(fs/length(s_mod_cancion3)); 
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Canción 3 en frecuencia')

% Gráficas en tiempo y frecuencia de la señal portadora
figure(10)%Portadora 3
%Tiempo
t=(0:0.01/N:1/fpor_tres);
s_por_secundaria=10*cos(2*pi*fpor_tres.*t); %Señal Portadora
subplot(2,1,1)
plot(t, s_por_secundaria)
grid on
title('Señal Portadora 3 en tiempo')
%Frecuencia
s_por3=10*cos(2*pi*fpor_tres.*x); %Señal Portadora
t_spor= fft(s_por3); %Calculamos la transformada de Fourier
t_spor=abs(t_spor); %Espectro
dom_frequencial= (0:length(s_por3)-1)*(fs/length(s_por3)); 
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Protadora 3 en frecuencia')

% Modulación
figure(11) %Modulación canción 3
MOD3= s_mod_cancion3.*s_por3';
subplot(2,1,1)
%Gráfica en Tiempo
plot(x, MOD3)
grid on
title('Señal Modulada 3 en tiempo')
%Gráfica en Frecuencia
t_mod= fft(MOD3); %Calculamos la transformada de Fourier
t_mod=abs(t_mod); %Espectro
dom_frequencial= (0:length(MOD3)-1)*(fs/length(MOD3));
subplot(2,1,2)
plot(dom_frequencial, t_mod)
grid on
title('Señal Modulada 3 en frecuencia')

% Demodulación
figure(12) %Demodulación Canción 3
DEMO3= MOD3.*s_por3';
subplot(2,1,1)
%Gráfica en Tiempo
plot(x, DEMO3)
grid on
title('Señal Demodulada 3 en tiempo')
%Gráfica en Frecuencia
t_demo= fft(DEMO3); %Calculamos la transformada de Fourier
t_demo=abs(t_demo); %Espectro
dom_frequencial= (0:length(DEMO3)-1)*(fs/length(DEMO3)); %Vector con puntos equidistantes
subplot(2,1,2)
plot(dom_frequencial, t_demo)
grid on
title('Señal Demodulada 3 en frecuencia')

%% Suma señales Moduladas
Suma_SModuladas=MOD+MOD2+MOD3;

%% Filtro Pasa Bandas

%% Filtro Pasa Bajas