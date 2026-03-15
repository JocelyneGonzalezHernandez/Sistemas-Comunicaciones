%Práctica 5 - Sistemas Lineales
%Equipo 5
%Parte 1 Filtro pasa bajas
%Nota: Correr el programa por secciones
    %           1
    %  H(w)=--------
    %       jw/100+1
    %       s=jw
    %       w=2pif
w=2;
num=[1];
den=[w/100 1];
w=2;
f=20/pi;
w=2*pi*f
 
t=0 :0.001 :2 ;
L=length(t) ;
Ts=1/1000 ;
 
x = 10*sin(2*pi*f*t) ;
func = tf(num,den) ;
[y,t] = lsim(func, x, t) ;
 
 
Fourier_x = fft(x) ;
Fourier_y = fft(y) ;
fs= 1/Ts ;
f_x=(0:length(Fourier_x)-1)*fs/length(Fourier_x);
f_y=(0:length(Fourier_y)-1)*fs/length(Fourier_y);
 
plot(t,x), title('Filtro pasa bajas de circuito RC Entrada-Salida')
hold on 
grid on
plot(t,y)
hold on
grid on
xlabel('Dominio en tiempo de la señal')
ylabel('Amplitud de la señal')

%%
subplot(2,1,1), plot(f_x,abs(Fourier_x)),title('Transformada de Fourier señal de entrada')
hold on
grid on
xlabel('Dominio en frecuencia de la señal')
ylabel('Amplitud de la señal')
subplot(2,1,2), plot(f_y,abs(Fourier_y)),title('Transformada de Fourier señal de salida')
hold on
grid on
xlabel('Dominio en frecuencia de la señal')
ylabel('Amplitud de la señal')
