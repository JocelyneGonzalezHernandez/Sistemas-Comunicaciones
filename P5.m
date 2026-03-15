amp = 1; % Amplitud unitaria
fase = 0; % Fase cero
frec_angular = 10*pi; % Frecuencia angular de 10pi rad/s
tInicio = 0; 
tFinal = 0.5;
noMuestras = 10000; % Número de muestras
frec_hz = frec_angular / (2*pi);

% Generar vector de tiempo
t = linspace(tInicio, tFinal, noMuestras);

% Generar señal senoidal
v = amp * sin(frec_angular * t + fase);

d=[0.5,0.4,0.3,0.2,0.1,0.05];
vs=pam(v,(3*frec_angular),d);
