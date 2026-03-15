% Definir la ecuación diferencial
syms s t
eqn = s^2*y(s) + 101*s*y(s) + 100*y(s) == 100*s*x(s) + 10*s^2*x(s);

% Encontrar la función de transferencia
Ys = solve(eqn, y(s));
Hs = Ys/x(s);

% Simplificar la función de transferencia
Hs = simplify(Hs);

% Determinar el tipo de filtro
[num, den] = numden(Hs);
order = double(feval(symengine, 'numeric::order', den, s));
if order == 2
    disp('El sistema es un filtro pasa-bajos de segundo orden.');
else
    disp('El sistema no es un filtro pasa-bajos de segundo orden.');

    % Calcular las frecuencias de corte
w = solve(den == 0, s);
w1 = abs(eval(w(1))); % frecuencia de corte 1
w2 = abs(eval(w(2))); % frecuencia de corte 2

% Obtener las gráficas de bode
w_range = logspace(-3, 3, 1000);
[mag, phase] = bode(Hs, w_range);
mag_db = 20*log10(mag);
subplot(2,1,1);
semilogx(w_range, mag_db);
xlabel('Frecuencia (rad/s)');
ylabel('Magnitud (dB)');
title('Diagrama de Bode - Magnitud');
grid on;
subplot(2,1,2);
semilogx(w_range, phase);
xlabel('Frecuencia (rad/s)');
ylabel('Fase (grados)');
title('Diagrama de Bode - Fase');
grid on;

% Obtener la salida para las señales senoidales dadas
t_range = linspace(0, 10, 1000);
x1 = 2*sin(0.1*t_range + deg2rad(30));
x2 = 4*cos(10*t_range - deg2rad(10));
x3 = 3*sin(1000*t_range + deg2rad(20));
y1 = lsim(Hs, x1, t_range);
y2 = lsim(Hs, x2, t_range);
y3 = lsim(Hs, x3, t_range);

% Comprobar los resultados manualmente y con el método de aproximación asintótica
% Magnitud
w0 = sqrt(10000-5000^2); % frecuencia natural
Q = w0/101; % factor de calidad
Hjw = @(w) 100*1j*w./(w.^2 + 101*1j*w + 100); % función de transferencia
mag1 = abs(Hjw(0.1*exp(1j*(deg2rad(30)))));
mag2 = abs(Hjw(10*exp(1j*(-deg2rad(10)))));
mag3 = abs(Hjw(1000
