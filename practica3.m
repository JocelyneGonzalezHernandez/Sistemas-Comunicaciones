help conv; %Convolución
help awgn; %Agregan ruido a las señales
help corrcoef; %Coeficiente de corelación (comparación)

%% Ecuación x(t)
t=-2:0.001:2;
x= (t<0)*0.5.*(-t-2)+(-1)*(t>=0)*0.5.*(t-2);
figure Name 'señal uno x(t)'
plot(t,x)
grid on;

%Ecuación h(t)
t2 = 1:0.001:3;
h=(t2<2).*(0.*t2+2)+(t2>=2).*(0.*t2-2);
figure name 'señal dos h(t)'
plot(t2,h);
grid on;

%Convolución de x(t) en h(t)
t3=-1:0.001:5;
f = conv (x,h);
figure Name 'convolución x en h'
plot(t3,f);
grid on;

%Convolución h(t) en x(t)
t4=-1:0.001:5;
figure Name 'convolución h en x'
g = conv (h,x);
plot(t4,g);
grid on;


%% PARTE 3

load handel
sound (y)
x=40;
yn=awgn(y,x), %donde x es la razón señal a ruido de la señal yn
c=xcorr(y,yn);
d=corrcoef(y, yn)
sound (yn); 




