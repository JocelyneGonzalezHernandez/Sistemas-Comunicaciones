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
t_smod = abs(t_smod/N);
t_smod = t_smod(1:N/2+1);
t_smod(2:end-1) = 2*t_smod(2:end-1);
dom_frequencial= Fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Cancion 1 en frecuencia')

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
t_spor = abs(t_spor/N);
t_spor = t_spor(1:N/2+1);
t_spor(2:end-1) = 2*t_spor(2:end-1);
dom_frequencial= Fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Portadora 1 en frecuencia')

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
t_mod = abs(t_mod/N);
t_mod = t_mod(1:N/2+1);
t_mod(2:end-1) = 2*t_mod(2:end-1);
dom_frequencial= Fs*(0:(N/2))/N;
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
t_demo = abs(t_demo/N);
t_demo = t_demo(1:N/2+1);
t_demo(2:end-1) = 2*t_demo(2:end-1);
dom_frequencial= Fs*(0:(N/2))/N;
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
t_smod = abs(t_smod/N);
t_smod = t_smod(1:N/2+1);
t_smod(2:end-1) = 2*t_smod(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Cancion 2 en frecuencia')

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
t_spor = abs(t_spor/N);
t_spor = t_spor(1:N/2+1);
t_spor(2:end-1) = 2*t_spor(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Portadora 2 en frecuencia')

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
t_mod = abs(t_mod/N);
t_mod = t_mod(1:N/2+1);
t_mod(2:end-1) = 2*t_mod(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
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
t_demo = abs(t_demo/N);
t_demo = t_demo(1:N/2+1);
t_demo(2:end-1) = 2*t_demo(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
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
t_smod = abs(t_smod/N);
t_smod = t_smod(1:N/2+1);
t_smod(2:end-1) = 2*t_smod(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Cancion 3 en frecuencia')

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
t_spor = abs(t_spor/N);
t_spor = t_spor(1:N/2+1);
t_spor(2:end-1) = 2*t_spor(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Portadora 3 en frecuencia')

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
t_mod = abs(t_mod/N);
t_mod = t_mod(1:N/2+1);
t_mod(2:end-1) = 2*t_mod(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
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
t_demo = abs(t_demo/N);
t_demo = t_demo(1:N/2+1);
t_demo(2:end-1) = 2*t_demo(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_demo)
grid on
title('Señal Demodulada 3 en frecuencia')

%% Suma señales Moduladas
figure(13)
Suma_SModuladas=MOD+MOD2+MOD3;
%Gráfica en tiempo
subplot(2,1,1)
plot(x, Suma_SModuladas)
grid on
title('Suma Señales Moduladas en tiempo')
%Gráfica en Frecuencia
t_suma= fft(Suma_SModuladas); %Calculamos la transformada de Fourier
t_suma = abs(t_suma/N);
t_suma = t_suma(1:N/2+1);
t_suma(2:end-1) = 2*t_suma(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_suma)
grid on
title('Suma Señales Moduladas en frecuencia')

%% Filtro Pasa Bandas
%Canción 1
figure(14)
%[577386 582613]
bandpass(Suma_SModuladas, [580000 582613], fs);
filtro_pbUno=bandpass(Suma_SModuladas, [580000 582613], fs);
%plot(x, bandpass);
grid on

%% Filtro Pasa Bajas
prueba1=filtro_pbUno.*s_por';
cutoff_freq =  4600; % Cutoff frequency in Hz (set to the highest audible frequency, 20 kHz)
demodulada_filtered = lowpass(prueba1, cutoff_freq, Fs);
demodulada_filtered = lowpass(demodulada_filtered, cutoff_freq, Fs);

sound(demodulada_filtered, Fs);