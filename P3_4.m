%% CÓDIGO: ANÁLISIS DE LA SERIE DE FOURIER PARA PUNTOS ESPECÍFICOS CON CURVAS SUAVES

% Definir las coordenadas de los puntos
x = [-2, -1, 0, 0, 1, 1];
y = [0, 0, -1, 0, 1, 0];

% Eliminar valores duplicados en x
[x_unique, idx] = unique(x);
y_unique = y(idx);

% Crear una figura con el gráfico de los puntos y líneas curvas suaves
figure(2);
plot(x, y, 'o-');
hold on;

grid on;
xlabel('Eje X');
ylabel('Eje Y');

% Evaluar la paridad de la función
if isequal(y, fliplr(y)) || isequal(y, -fliplr(y))
    disp('La función es PAR');
    a0 = 1/(2*pi) * trapz(x_unique, y_unique);  % Cálculo de a0 para función par
    ak = zeros(1, 5);  % Inicialización de coeficientes ak para función par
    bk = zeros(1, 5);  % Inicialización de coeficientes bk para función par
else
    disp('La función es IMPAR');
    a0 = 0;  % a0 es cero para función impar
    ak = zeros(1, 5);  % Inicialización de coeficientes ak para función impar
    bk = zeros(1, 5);  % Inicialización de coeficientes bk para función impar
end

% Cálculo de coeficientes ak y bk
for k = 1:5
    ak(k) = 2/pi * trapz(x_unique, y_unique .* cos(k*pi*x_unique/2));  % Coeficientes ak
    bk(k) = 2/pi * trapz(x_unique, y_unique .* sin(k*pi*x_unique/2));  % Coeficientes bk
end

% Construcción de la serie de Fourier con 5 armónicos diferentes de cero
fourier_series = a0/2;
for k = 1:5
    fourier_series = fourier_series + ak(k) * cos(k*pi*xx/2) + bk(k) * sin(k*pi*xx/2);
end

% Gráfico de la serie de Fourier
figure(3);
plot(xx, fourier_series, 'r', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Serie de Fourier');
title('Serie de Fourier con 5 armónicos');

% Mostrar los coeficientes
disp(['a0 = ', num2str(a0)]);
disp(['ak = ', num2str(ak)]);
disp(['bk = ', num2str(bk)]);

% Sección d: Gráfico de magnitud y fase de la serie de Fourier
figure(4);
subplot(2, 1, 1);
plot(xx, abs(fourier_series), 'g', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Magnitud');
title('Magnitud de la Serie de Fourier');

subplot(2, 1, 2);
plot(xx, angle(fourier_series), 'm', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Fase');
title('Fase de la Serie de Fourier');

% Sección e: Suma de armónicos según elección del usuario
num_armonicos = input('Ingrese el número de armónicos a sumar: ');

suma_armonicos = a0/2;
for k = 1:num_armonicos
    suma_armonicos = suma_armonicos + ak(k) * cos(k*pi*xx/2) + bk(k) * sin(k*pi*xx/2);
end

% Gráfico de la suma de armónicos
figure(5);
plot(xx, suma_armonicos, 'k', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Suma de Armónicos');
title(['Suma de ', num2str(num_armonicos), ' Armónicos']);

% Sección f: Comparación de la señal original con la suma de armónicos
correlation_coefficient = corrcoef(yy_unique, suma_armonicos);
disp(['Coeficiente de correlación: ', num2str(correlation_coefficient(1,2))]);

% Gráfico de comparación
figure(6);
subplot(2, 1, 1);
plot(xx, yy_unique, 'b', 'LineWidth', 2);
grid on;
xlabel('Eje X');
ylabel('Eje Y');
title('Función Original');

subplot(2, 1, 2);
plot(xx, yy_unique, 'b', 'LineWidth', 2, 'DisplayName', 'Original');
hold on;
plot(xx, suma_armonicos, 'k', 'LineWidth', 2, 'DisplayName', 'Suma de Armónicos');
hold off;
grid on;
xlabel('Eje X');
ylabel('Amplitud');
title(['Comparación con Coeficiente de Correlación: ', num2str(correlation_coefficient(1,2))]);
legend('show');

