% Definir las coordenadas de los puntos
x = [-2, -1, 0, 0, 1, 1];
y = [0, 0, -1, 0, 1, 0];

% Crear una figura con gráfico
figure(1);
plot(x, y, 'o-'); % Dibuja los puntos y las líneas rectas
grid on; % Activa la cuadrícula
xlabel('Eje X'); % Etiqueta del eje X
ylabel('Eje Y'); % Etiqueta del eje Y
title('Conexión de Puntos con Líneas Rectas'); % Título del gráfico

% a. Evaluar la paridad de la función
if all(mod(x, 2) == 0)
    fprintf('La función es par.\n');
    parity = 'even';
else
    fprintf('La función es impar.\n');
    parity = 'odd';
end

% b. Con base en la paridad, obtener ao, ak y bk
if strcmp(parity, 'even')
    ao = mean(y);
    ak = 2 * mean(y.*cos(pi*x/2));
    bk = 0; % En funciones pares, los términos seno son cero
else
    ao = mean(y);
    ak = 0; % En funciones impares, los términos coseno son cero
    bk = 2 * mean(y.*sin(pi*x/2));
end

fprintf('ao = %.4f, ak = %.4f, bk = %.4f\n', ao, ak, bk);
% ... (código anterior)

% c. Mostrar la serie de Fourier trigonométrica con 5 armónicos DIFERENTES DE CERO
n_harmonics = 5;
x_values = linspace(min(x), max(x), 1000); % Valores para evaluar la serie

% Término constante
fourier_series = ao/2;

% Añadir cinco armónicos diferentes de cero
for n = 1:n_harmonics
    if n == 1 && strcmp(parity, 'even')
        % El primer armónico (n=1) es cero en funciones pares
        continue;
    end
    fourier_series = fourier_series + ak*cos(n*pi*x_values/2) + bk*sin(n*pi*x_values/2);
end

% Graficar la serie de Fourier
figure(2);
plot(x_values, fourier_series);
grid on;
xlabel('Eje X');
ylabel('Serie de Fourier');
title('Serie de Fourier con 5 armónicos diferentes de cero');


% d. Mostrar la gráfica de magnitud y fase de la serie obtenida
magnitude = abs(fourier_series);
phase = angle(fourier_series);


% e. Programa para sumar los armónicos obtenidos
num_armonicos_usuario = input('Ingrese el número de armónicos a graficar: ');

fourier_series_sum = ao/2; % Término constante

for n = 1:num_armonicos_usuario
    fourier_series_sum = fourier_series_sum + ak*cos(n*pi*x_values/2) + bk*sin(n*pi*x_values/2);
end

% Gráficas en una sola figura
figure;

subplot(3, 2, 1);
plot(x, y, 'o-');
grid on;
xlabel('Eje X');
ylabel('Eje Y');
title('Conexión de Puntos con Líneas Rectas');

subplot(3, 2, 2);
plot(x_values, fourier_series);
grid on;
xlabel('Eje X');
ylabel('Serie de Fourier');
title('Serie de Fourier con 5 armónicos');

subplot(3, 2, 3);
plot(x_values, magnitude);
grid on;
xlabel('Eje X');
ylabel('Magnitud');
title('Magnitud de la Serie de Fourier');

subplot(3, 2, 4);
plot(x_values, phase);
grid on;
xlabel('Eje X');
ylabel('Fase');
title('Fase de la Serie de Fourier');

subplot(3, 2, 5);
plot(x_values, fourier_series_sum);
grid on;
xlabel('Eje X');
ylabel('Serie de Fourier Sumada');
title(['Suma de ', num2str(num_armonicos_usuario), ' armónicos']);

subplot(3, 2, 6);
plot(x_values, fourier_series_sum, 'b-', x_values, fourier_series, 'r--');
grid on;
xlabel('Eje X');
ylabel('Función Original vs. Suma de Armónicos');
legend('Suma de Armónicos', 'Función Original');
title(['Comparación con ', num2str(num_armonicos_usuario), ' armónicos']);

%% codigo completo:
% Definir las coordenadas de los puntos
x = [-2, -1, 0, 0, 1, 1];
y = [0, 0, -1, 0, 1, 0];

% Crear una figura con gráfico
figure(2);
plot(x, y, 'o-'); % Dibuja los puntos y las líneas rectas
grid on; % Activa la cuadrícula
xlabel('Eje X'); % Etiqueta del eje X
ylabel('Eje Y'); % Etiqueta del eje Y
title('Conexión de Puntos con Líneas Rectas'); % Título del gráfico

% Evaluación de la paridad
if isequal(y, fliplr(y)) || isequal(y, -fliplr(y))
    disp('La función es PAR');
    a0 = 1/(2*pi) * trapz(x, y);  % Cálculo de a0 para función par
    ak = zeros(1,5);  % Inicialización de coeficientes ak para función par
    bk = zeros(1,5);  % Inicialización de coeficientes bk para función par
else
    disp('La función es IMPAR');
    a0 = 0;  % a0 es cero para función impar
    ak = zeros(1,5);  % Inicialización de coeficientes ak para función impar
    bk = zeros(1,5);  % Inicialización de coeficientes bk para función impar
end

% Cálculo de coeficientes ak y bk
for k = 1:5
    ak(k) = 2/pi * trapz(x, y .* cos(k*x));  % Coeficientes ak
    bk(k) = 2/pi * trapz(x, y .* sin(k*x));  % Coeficientes bk
end

% Construcción de la serie de Fourier con 5 armónicos diferentes de cero
fourier_series = a0/2;
for k = 1:5
    fourier_series = fourier_series + ak(k) * cos(k*x) + bk(k) * sin(k*x);
end

% Plot de la serie de Fourier
figure(3);
plot(x, fourier_series, 'r', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Serie de Fourier');
title('Serie de Fourier con 5 armónicos');

% Muestra de los coeficientes
disp(['a0 = ', num2str(a0)]);
disp(['ak = ', num2str(ak)]);
disp(['bk = ', num2str(bk)]);

% Sección d: Gráfica de magnitud y fase de la serie de Fourier
figure(4);
subplot(2, 1, 1);
plot(x, abs(fourier_series), 'g', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Magnitud');
title('Magnitud de la Serie de Fourier');

subplot(2, 1, 2);
plot(x, angle(fourier_series), 'm', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Fase');
title('Fase de la Serie de Fourier');

% Sección e: Suma de armónicos según elección del usuario
num_armonicos = input('Ingrese el número de armónicos a sumar: ');

suma_armonicos = a0/2;
for k = 1:num_armonicos
    suma_armonicos = suma_armonicos + ak(k) * cos(k*x) + bk(k) * sin(k*x);
end

% Plot de la suma de armónicos
figure(5);
plot(x, suma_armonicos, 'k', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Suma de Armónicos');
title(['Suma de ', num2str(num_armonicos), ' Armónicos']);

% Sección f: Comparación de la señal original con la suma de armónicos
correlation_coefficient = corrcoef(y, suma_armonicos);
disp(['Coeficiente de correlación: ', num2str(correlation_coefficient(1,2))]);

% Gráfica de comparación
figure(6);
subplot(2, 1, 1);
plot(x, y, 'b', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Eje Y');
title('Función Original');

subplot(2, 1, 2);
plot(x, y, 'b', 'LineWidth', 2, 'DisplayName', 'Original');
hold on;
plot(x, suma_armonicos, 'k', 'LineWidth', 2, 'DisplayName', 'Suma de Armónicos');
hold off;
grid on;
xlabel('Eje X');
ylabel('Amplitud');
title(['Comparación con Coeficiente de Correlación: ', num2str(correlation_coefficient(1,2))]);
legend('show');


