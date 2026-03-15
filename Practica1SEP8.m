%% EJERCICIO 1: DESARROLLAR UN PROGRAMA QUE GRÁFIQUE 
% LAS SIGUIENTES FUNCIONES

%% EJERCICIO 1 - INCISO A)
x = [0, 2, 4, 8];
y = [3, 5, 5, 3];
plot(x, y, 'o-'); 
grid on; 
xlabel('t');
ylabel('x(t)');
title('Gráfica 1, Inciso a)');

%% EJERCICIO 1 - INCISO B)
frecuencia = input('Introduce la frecuencia de la onda senoidal: ');
amplitud = input('Introduce la amplitud de la onda senoidal: ');
t = linspace(0, 10, 100);
y = amplitud * sin(2 * pi * frecuencia * t);
plot(t, y, 'b-');
grid on;
xlabel('Tiempo');
ylabel('Amplitud');
title('Gráfica 2. Inciso b)');

%% EJERCICIO 1 - INCISO C)
n = -3:2; 
x = [2, 5, 3, 6, 8, 4]; 
stem(n, x, 'o-'); 
grid on;
xlabel('n');
ylabel('x[n]');
title('Gráfica 3, Inciso c - x[n]');


%% EJERCICIO 2 hacer un programa que muestre cada una de 
% las operaciones siguientes (para cada inciso debes mostrar la gráfica original y la gráfica modificada).


%% INCISO a) y(t)= K*x(t) (para K entero)
x = [0, 2, 4, 8];
y = [3, 5, 5, 3];
subplot(2, 1, 1); 
plot(x, y, 'o-'); 
grid on; 
xlabel('t');
ylabel('x(t)');
title('Gráfica 1 - (x(t))');
K = input('Ingrese un valor entero para K: ');
y_modificado = K * x;
subplot(2, 1, 2);
plot(x, y_modificado, 'o-'); 
grid on; 
xlabel('t');
ylabel('y(t)');
title(['Gráfica Modificada (y(t) = ', num2str(K), ' * x(t))']);
spacing = 0.05;
subplotSpacing = 0.05;
set(gcf,'Position',[100,100,800,600])
set(gcf, 'DefaultAxesPosition', [0.1, 0.6, 0.8, 0.3])

%% INCISO a) y(t)= K*x(t) K para fraccionario

x = [0, 2, 4, 8];
y = [3, 5, 5, 3];

subplot(2, 1, 1); 
plot(x, y, 'o-'); 
grid on; 
xlabel('t');
ylabel('x(t)');
title('Gráfica Original (x(t))');
K = input('Introduce un valor fraccionario para K: ');
y_modificado = K * x;
subplot(2, 1, 2); 
plot(x, y_modificado, 'o-'); 
grid on; 
xlabel('t');
ylabel('y(t)');
title(['Gráfica Modificada (y(t) = ', num2str(K), ' * x(t))']);
spacing = 0.05;
subplotSpacing = 0.05;
set(gcf,'Position',[100,100,800,600])
set(gcf, 'DefaultAxesPosition', [0.1, 0.6, 0.8, 0.3])



%% INCISO B g(t)=x(-t)

x = [0, 2, 4, 8];
gt = fliplr(x);
t = -3:0;
plot(t, gt, 'o-');
grid on;
xlabel('t');
ylabel('g(t)');
title('Gráfica (g(t) = x(-t))');


%% INCISO C  p(t)=x(2t)

x = [0, 2, 4, 8];
tOriginal = 0:3;
t_comprimido = 0:1.5;
p_t = interp1(tOriginal, x, t_comprimido);
plot(t_comprimido, p_t, 'o-');
grid on;
xlabel('t');
ylabel('p(t)');
title('Gráfica (p(t) = x(2t))');

%% INCISO D h(t)=x(t+5)

x = [0, 2, 4, 8];
y = [3, 5, 5, 3];
subplot(2, 1, 1); 
grid on; 
xlabel('t');
ylabel('x(t)');
title('Gráfica Original (x(t))');
t_original = 0:3;
t_desplazado = t_original - 5;
h_t = interp1(t_original, y, t_desplazado, 'linear', 'extrap');

subplot(2, 1, 2); 
plot(t_desplazado, h_t, 'o-'); 
grid on; 
xlabel('t');
ylabel('h(t)');
title('Gráfica Modificada h(t) = x(t + 5)');
spacing = 0.05;
subplotSpacing = 0.05;
set(gcf,'Position',[100,100,800,600])
set(gcf, 'DefaultAxesPosition', [0.1, 0.6, 0.8, 0.3])

%% INCISO D s(t)= x(t-2)
x_original = [0, 2, 4, 8];
y_original = [3, 5, 5, 3];

t = 0:3;
t_desplazado = t + 2;

s_t = interp1(t, y_original, t_desplazado, 'linear', 'extrap');
plot(t, y_original, 'o-', t_desplazado, s_t, 'o-');
grid on;
xlabel('t');
ylabel('Amplitud');
legend('x(t) original', 's(t) = x(t - 2)');
title('Comparación entre x(t) y s(t)');

%% INCISO E

x = [0, 2, 4, 8];
y = [3, 5, 5, 3];
t_original = 0:3;
t_modificado = (4 - 2 * t_original);
z_t = interp1(t_original, y, t_modificado, 'linear', 'extrap');

subplot(2, 1, 1);
plot(t_original, y, 'o-'); 
grid on; 
xlabel('t');
ylabel('x(t)');
title('Gráfica Original (x(t))');
subplot(2, 1, 2); 
plot(t_modificado, z_t, 'o-'); 
grid on; 
xlabel('t');
ylabel('z(t)');
title('Gráfica Modificada (z(t) = x(4 - 2t))');


spacing = 0.05;
subplotSpacing = 0.05;
set(gcf,'Position',[100,100,800,600])
set(gcf, 'DefaultAxesPosition', [0.1, 0.6, 0.8, 0.3])

