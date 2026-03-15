%           jw
%  H(w)=--------
%       jw/100 + 1
%       s=jw
%       w=2pif


%          jw
%  H(w)=--------
%       100 + jw
%       s=jw
%       w=2pif

f=5; 
num=1; 
w=2*pi*f; 
%num= w;
den= [w/100 1];
%den=[w 100];
t=0:0.001:2; 
x=10*sin(2*pi*f*t); 
y=lsim(num,den,x,t);
figure(1)
plot(t,x) 
hold on  
plot(t,y) 
grid on



%Transformada señal inicial
figure(2)
X=fft(x);
t=-1:0.001:1;
plot(t, abs(X), 'LineWidth', 4)
grid on
ylabel('Magnitud')
xlabel('Frecuencia (Hz)')
title('Transformada señal de entrada');

%Transformada señal salida
figure(3)
Y=fft(y);
t=-1:0.001:1;
plot(t, abs(Y), 'r' ,'LineWidth', 4)
grid on
ylabel('Magnitud')
xlabel('Frecuencia (Hz)')
title('Transformada señal de salida');
