%% Definición de variables
clc
close all

%% Definición de las variables
fpor_uno = 580000; % Frecuencia señal Portadora uno de: 580khz
fpor_dos = 800000; % Frecuencia señal Portadora dos de: 800khz
fpor_tres = 950000; % Frecuencia señal Portadora tres de: 950khz
fs = fpor_tres * 2; % Frecuencia de muestreo
T = 1/fs; % Periodo
N = fs * 2; % Número de muestras
x = (0:N-1) .* T; % Vector de muestras

%% Canción 1
% Definición de la canción
[s, Fs] = audioread('cancion1.wav'); % Canción 1
s_mod_cancion = s(1:N, 1);

% Gráficas en tiempo y frecuencia de la canción
figure(1) % Canción 1
% Tiempo
subplot(2,1,1)
plot(x, s_mod_cancion)
grid on
title('Señal Cancion 1 en tiempo')
% Frecuencia
t_smod = fft(s_mod_cancion); % Calculamos la transformada de Fourier
t_smod = abs(t_smod); % Espectro
dom_frequencial = (0:length(s_mod_cancion)-1)*(fs/length(s_mod_cancion));
subplot(2,1,2)
plot(dom_frequencial, t_smod)
grid on
title('Señal Canción 1 en frecuencia')

% Gráficas en tiempo y frecuencia de la señal portadora
figure(2) % Portadora 1
% Tiempo
t = (0:0.01/N:1/fpor_uno);
s_por_secundaria = 10 * cos(2*pi*fpor_uno.*t); % Señal Portadora
subplot(2,1,1)
plot(t, s_por_secundaria)
grid on
title('Señal Portadora 1 en tiempo')
% Frecuencia
s_por = 10 * cos(2*pi*fpor_uno.*x); % Señal Portadora
t_spor = fft(s_por); % Calculamos la transformada de Fourier
t_spor = abs(t_spor); % Espectro
dom_frequencial = (0:length(s_por)-1)*(fs/length(s_por)); 
subplot(2,1,2)
plot(dom_frequencial, t_spor)
grid on
title('Señal Protadora 1 en frecuencia')

% Modulación
figure(3) % Modulación canción 1
MOD = s_mod_cancion .* s_por';
subplot(2,1,1)
% Gráfica en Tiempo
plot(x, MOD)
grid on
title('Señal Modulada 1 en tiempo')
% Gráfica en Frecuencia
t_mod = fft(MOD); % Calculamos la transformada de Fourier
t_mod = abs(t_mod); % Espectro
dom_frequencial = (0:length(MOD)-1)*(fs/length(MOD));
subplot(2,1,2)
plot(dom_frequencial, t_mod)
grid on
title('Señal Modulada 1 en frecuencia')

% Demodulación
figure(4) % Demodulación Canción 1
DEMO = MOD .* s_por';
subplot(2,1,1)
% Gráfica en Tiempo
plot(x, DEMO)
grid on
title('Señal Demodulada 1 en tiempo')
% Gráfica en Frecuencia
t_demo = fft(DEMO); % Calculamos la transformada de Fourier
t_demo = abs(t_demo); % Espectro
dom_frequencial = (0:length(DEMO)-1)*(fs/length(DEMO)); 
subplot(2,1,2)
plot(dom_frequencial, t_demo)
grid on
title('Señal Demodulada 1 en frecuencia')

%% Filtro pasabanda
fcut_low = 600000; % Frecuencia de corte inferior
fcut_high = 900000; % Frecuencia de corte superior
order = 8; % Orden del filtro

% Diseño del filtro
[b, a] = butter(order, [fcut_low, fcut_high]/(fs/2), 'bandpass');

% Filtrado de la señal demodulada
filtered_signal = filter(b, a, DEMO);

% Gráficas de la señal demodulada filtrada
figure(5)
subplot(3,1,1)
plot(x, DEMO)
grid on
title('Señal Demodulada en tiempo')

subplot(3,1,2)
t_demo = fft(DEMO);
t_demo = abs(t_demo);
dom_frequencial = (0:length(DEMO)-1)*(fs/length(DEMO)); 
plot(dom_frequencial, t_demo)
grid on
title('Señal Demodulada en frecuencia')

subplot(3,1,3)
[h, w] = freqz(b, a, length(DEMO), fs);
plot(w, abs(h))
grid on
title('Respuesta en frecuencia del filtro')
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')

%% Comando de audio para comprobar la señal demodulada filtrada
soundsc(filtered_signal, fs);


