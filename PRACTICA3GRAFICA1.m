%% CODIGO GRAFICA 1
% Función x(t)
figure(1);

% Declaración del dominio
dom = 0:0.001:(2*pi);

% Funcion
x = ((dom<=pi).*((1/pi).*dom+1)) + ((dom>=pi).*((1/pi).*dom-3));

% Plot de la función
plot(dom, x, 'b', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('x(t)');
title('x(t), Gráfica 1');

% Evaluación de la paridad
if isequal(x, fliplr(x)) || isequal(x, -fliplr(x))
    disp('La función es PAR');
    a0 = 1/(2*pi) * trapz(dom, x);  % Cálculo de a0 para función par
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
    ak(k) = 2/pi * trapz(dom, x .* cos(k*dom));  % Coeficientes ak
    bk(k) = 2/pi * trapz(dom, x .* sin(k*dom));  % Coeficientes bk
end

% Construcción de la serie de Fourier con 5 armónicos diferentes de cero
fourier_series = a0/2;
for k = 1:5
    fourier_series = fourier_series + ak(k) * cos(k*dom) + bk(k) * sin(k*dom);
end

% Plot de la serie de Fourier
figure(2);
plot(dom, fourier_series, 'r', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('Serie de Fourier');
title('Serie de Fourier con 5 armónicos');

% Muestra de los coeficientes
disp(['a0 = ', num2str(a0)]);
disp(['ak = ', num2str(ak)]);
disp(['bk = ', num2str(bk)]);

% Sección d: Gráfica de magnitud y fase de la serie de Fourier
figure(3);
subplot(2, 1, 1);
plot(dom, abs(fourier_series), 'g', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('Magnitud');
title('Magnitud de la Serie de Fourier');

subplot(2, 1, 2);
plot(dom, angle(fourier_series), 'm', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('Fase');
title('Fase de la Serie de Fourier');
% Sección e: Suma de armónicos según elección del usuario
num_armonicos = input('Ingrese el número de armónicos a sumar: ');

suma_armonicos = a0/2;
for k = 1:num_armonicos
    suma_armonicos = suma_armonicos + ak(k) * cos(k*dom) + bk(k) * sin(k*dom);
end

% Plot de la suma de armónicos
figure(4);
plot(dom, suma_armonicos, 'k', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('Suma de Armónicos');
title(['Suma de ', num2str(num_armonicos), ' Armónicos']);



% Sección f: Comparación de la señal original con la suma de armónicos
correlation_coefficient = corrcoef(x, suma_armonicos);
disp(['Coeficiente de correlación: ', num2str(correlation_coefficient(1,2))]);

% Gráfica de comparación
figure(6);
subplot(2, 1, 1);
plot(dom, x, 'b', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('x(t)');
title('Función Original');

subplot(2, 1, 2);
plot(dom, x, 'b', 'LineWidth', 2, 'DisplayName', 'Original');
hold on;
plot(dom, suma_armonicos, 'k', 'LineWidth', 2, 'DisplayName', 'Suma de Armónicos');
hold off;
grid on;
xlabel('t');
ylabel('Amplitud');
title(['Comparación con Coeficiente de Correlación: ', num2str(correlation_coefficient(1,2))]);
legend('show');


