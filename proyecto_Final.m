% Este programa realiza la práctica 4
clc
close all

%% Primero se realiza la definicón de las variables
fmod=3000; %Frecuencia señal de Información 3khz
fpor=580000; %Frecuencia señal Portadora 580khz
fs=fpor*2; %Frecuencia de muestreo (2 veces la frecuencia maxima)
T=1/fs; %Periodco
N=fs*2; %Número de muestras
x=(0:N-1).*T; %Vector de muestras

%% Señal Moduladora: mensaje
Amod=5;
t=(0:0.01/N:1/fmod);
s_mod=Amod*sin(2*pi*fmod.*t); %Señal de Información

%% Señal Portadora
Apor=10;
t=(0:0.01/N:1/fpor);
s_por=Apor*cos(2*pi*fpor.*t); %Señal Portadora

%% Señales iniciales
s_mod_inicial=Amod*sin(2*pi*fmod.*x); %Señal de Información
s_por_inicial=Apor*cos(2*pi*fpor.*x); %Señal Portadora

%% Gráficas en tiempo y frecuencia señal de Información
figure(1)
%Gráfica en Tiempo
t=(0:0.01/N:1/fmod);
subplot(2,1,1)
plot(t, s_mod)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title('Señal de Información en tiempo')
%Gráfica en Frecuencia
t_smod= fft(s_mod_inicial); %Calculamos la transformada de Fourier
t_smod = abs(t_smod/N);
t_smod = t_smod(1:N/2+1);
t_smod(2:end-1) = 2*t_smod(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
xlabel('Frecuencia en Hz')
ylabel('Voltaje (V)')
title('Señal Información en frecuencia')

%% Gráficas en tiempo y frecuencia señal Portadora
figure(2)
%Gráfica en Tiempo
t=(0:0.01/N:1/fpor);
subplot(2,1,1)
plot(t, s_por)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title('Señal Portadora en tiempo')
%Gráfica en Frecuencia
t_spor= fft(s_por_inicial); %Calculamos la transformada de Fourier
t_spor = abs(t_spor/N);
t_spor = t_spor(1:N/2+1);
t_spor(2:end-1) = 2*t_spor(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
xlabel('Frecuencia en Hz')
ylabel('Voltaje (V)')
title('Señal Portadora en frecuencia')

%% Modulación
figure(3)
t=(0:0.01/N:1/fmod);
s_mod=Amod*sin(2*pi*fmod.*t); %Señal Moduladora
s_por=Apor*cos(2*pi*fpor.*t); %Señal Portadora
MOD= s_mod.*s_por;
subplot(2,1,1)
%Gráfica en Tiempo
plot(t, MOD)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title('Señal Modulada en tiempo')
%Gráfica en Frecuencia
MOD2=s_mod_inicial.*s_por_inicial;
t_MOD= fft(MOD2); %Calculamos la transformada de Fourier
t_MOD=abs(t_MOD); %Espectro
dom_frequencial= (0:length(MOD2)-1)*(fs/length(MOD2));
subplot(2,1,2)
plot(dom_frequencial, t_MOD)
grid on
xlabel('Frecuencia en Hz')
ylabel('Voltaje (V)')
title('Señal Modulada en frecuencia')

%% Demoduladión
figure(4)
t=(0:0.01/N:1/fmod);
s_por=Apor*cos(2*pi*fpor.*t); %Señal Portadora
DEMO= MOD.*s_por;
subplot(2,1,1)
%Gráfica en Tiempo
plot(t, DEMO)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title('Señal Demodulada en tiempo')
%Gráfica en Frecuencia
DEMO2=MOD2.*s_por_inicial;
t_DEMO= fft(DEMO2); %Calculamos la transformada de Fourier
t_DEMO = abs(t_DEMO/N);
t_DEMO = t_DEMO(1:N/2+1);
t_DEMO(2:end-1) = 2*t_DEMO(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_DEMO)
grid on
xlabel('Frecuencia en Hz')
ylabel('Voltaje (V)')
title('Señal Demodulada en frecuencia')

%% Filtro Pasa Bajas
figure (5);
%Circuito 1
%                1 
%  H(w)= ------------------ 
%         (7.957u)jw + 1

num=1;
den=[((7.987)*10^(-6)) 1];
Ht=tf(num, den); %Funcion de transferencia
sFiltrada_secundaria=lsim(Ht,DEMO,t);
sFiltrada=lsim(Ht,DEMO2, x);
%Gráficas en Tiepo
subplot(2,1,1)
plot(t, sFiltrada_secundaria)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title("Salida del filtro pasa bajas en tiempo")
%Gráficas en frecuencia
t_sFiltrada=fft(sFiltrada);
t_sFiltrada = abs(t_sFiltrada/N);
t_sFiltrada = t_sFiltrada(1:N/2+1);
t_sFiltrada(2:end-1) = 2*t_sFiltrada(2:end-1);
dom_frequencial= fs*(0:(N/2))/N;
subplot(2,1,2)
plot(dom_frequencial, t_sFiltrada)
grid on
xlabel('Frecuencia en Hz')
ylabel('Voltaje (V)')
title("Salida del filtro pasa bajas en frecuencia")

%% En esta parte gráficamos las 4 señales para compararlas
figure (6);
%Señal original
subplot(2,2,1)
plot(t, s_mod)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title("Señal original")
%Señal modulada
subplot(2,2,2)
plot(t, MOD)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title("Señal modulada")
%Señal demodulada
subplot(2,2,3)
plot(t, DEMO)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title("Señal demodulada")
%Señal filtro pasa bajas
subplot(2,2,4)
plot(t, sFiltrada_secundaria)
grid on
xlabel('Frecuencia en tiempo')
ylabel('Voltaje (V)')
title("Señal filtro pasa bajas")