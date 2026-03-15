%Funcion h(t)
figure(1); 
% Declaracion del dominio
dom = linspace(0,3,3000);
% Funcion
x =[dom(dom <= 1),zeros(1,1000),-(dom(dom>=2)-2)];
plot(dom, x, 'b', 'LineWidth', 2);
grid on
xlabel('t')
ylabel('h(t)')
title('h(t), Grafica 1');

% a. Evaluar la paridad de la funcion
dom_neg = -dom;  % Dominio negativo
x_neg = -x;      % Funcion reflejada en el eje y
ev = x - x_neg;  % Evaluar la paridad
if all(ev == 0)
    paridad = 'La funcion h(t): Tiene paridad PAR';
    a0 = 1/3 * trapz(dom, x);  % Coeficiente a0
elseif all(ev ~= 0)
    paridad = 'La funcion h(t): Tiene paridad IMPAR';
    a0 = 0; % Si no es par, a0 es 0
else
    paridad = 'La funcion h(t): No tiene paridad PAR, IMPAR ni de MEDIA ONDA';
end
disp(paridad);

% b. Coeficientes a_k y b_k
N = input('Ingrese el numero de armonicos: ');  % Numero de armonicos
a_k = zeros(1, N);
b_k = zeros(1, N);

% Coefientes para calcular la serie de Fourier
% trapz hace la aproximacion 
for k = 1:N
    a_k(k) = 1/3 * trapz(dom, x .* cos(k * dom));
    b_k(k) = 1/3 * trapz(dom, x .* sin(k * dom));
end

% c. Mostrar la serie de Fourier trigonometrica con N armonicos
t = linspace(0,3, 1000);  % Dominio para la serie
x_approx = a0 / 2;  % Termino constante

Ar = 5;
for k = 1:Ar
    x_approx = x_approx + a_k(k) * cos(k * t) + b_k(k) * sin(k * t);
    disp(['a' num2str(k) ' = ' num2str(a_k(k))]);
    disp(['b' num2str(k) ' = ' num2str(b_k(k))]);
end

%e. Mostrar la suma de la serie 
% con el inciso c ahi calculas la sintesis de la serie de Fourier y solo
% hago plot del x_aprox1:
% x_approx1 = x_approx1 + a_k(k) * cos(k * t1) + b_k(k1) * sin(k * t);
t1 = linspace(0,3, 1000);
x_approx1 = a0 / 2;

for k = 1:N
    x_approx1 = x_approx1 + a_k(k) * cos(k * t1) + b_k(k) * sin(k * t1);
end
figure(2);
plot(t, x_approx1, 'r', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('h(t)');
title(['Serie de Fourier Trigonometrica con ' num2str(N) ' Armonicos']);
% Calculo de la magnitud y fase de cada componente armonica
% Calculo de la magnitud y fase de cada componente armonica
magnitude = zeros(1, Ar);
phase = zeros(1, Ar);

for k = 1:Ar
    % Calcular la magnitud de bk
    magnitude(k) = abs(b_k(k));
    phase(k) = atan2(b_k(k), a_k(k)); % Calcular la fase de ak y bk
end

% Grafica de magnitud
figure;
stem(1:Ar, magnitude, 'g', 'LineWidth', 2);
grid on;
xlabel('Armonico');
ylabel('Magnitud (|bk|)');
title('Magnitud de Componentes Armonicas');

% Grafica la fase
figure;
stem(1:Ar, phase, 'm', 'LineWidth', 2);
grid on;
xlabel('Armonico');
ylabel('Fase (radianes)');
title('Fase de Componentes Armonicas');


% Parametro de precision deseado
precision_deseada = 0.999999999;

% Numero de armonicos iniciales es para que empiece desde el primer
% armonico
A = 1;
% Aproximacion inicial
x_approx = zeros(size(dom));
while true
    a_k1 = 1/pi * trapz(dom, x .* cos(A * dom));
    b_k2 = 1/pi * trapz(dom, x .* sin(A * dom));
    
    % Sirve para hacer una aproximacion acumulativa con los armonicos 
    x_approx = x_approx + a_k1 * cos(A * dom) + b_k2 * sin(A * dom);
    
    % Calcula la correlacion entre x y x_approx
    correlacion = corrcoef(x, x_approx);
    correlacion = correlacion(1, 2);
    
    % Muestra la correlacion actual
    % disp(['Correlacion con ' num2str(A) ' armonicos: ' num2str(correlacion)]);  
    % Si alcanzamos la precision deseada o la correlacion no mejora 
    % significativamente, detener el bucle
    if correlacion >= precision_deseada || correlacion < 0 || A > length(dom)/2
        break;
    end   
    % Incrementar el numero de armonicos
    A = A + 1;
end
% Mostrar el numero minimo de armonicos requeridos
disp(['El numero minimo de armonicos requeridos para una correlacion del ' ...
    num2str(precision_deseada*100) '% es: ' num2str(A)]);
% Graficar la senal original y la aproximada con el numero minimo de armonicos
figure;
plot(dom, x, 'b', 'LineWidth', 2);
hold on;
plot(dom, x_approx, 'r', 'LineWidth', 2);
grid on;
xlabel('t');
ylabel('h(t)');
legend('Señal Original', 'Señal Aproximada');
title(['Comparacion entre la Señal Original y la Aproximacion con ' num2str(A) ' Armonicos']);