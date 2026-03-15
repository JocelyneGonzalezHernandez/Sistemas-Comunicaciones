%Este programa sirve para resolver los ejercicios de la práctica 3

%Función x(t)
figure(1); 
%Declaración del dominio
dom= 0:0.001:(2*pi);
%Funcion
x=((dom<=pi).*((1/pi).*dom+1))+((dom>=pi).*((1/pi).*dom-3));
plot(dom, x, 'b','LineWidth', 2)
grid on
xlabel('t')
ylabel('x(t)')
title('x(t), Gráfica 1');

%Función h(t)
figure(2); 
%Declaración del dominio
dom2= 1:0.001:4;
%Funcion
h=(((dom2>1)&(dom2<2)).*(5))+(((dom2>2)&(dom2<3)).*(10))+(((dom2>3)&(dom2<4)).*(5));
plot(dom2, h, 'b','LineWidth', 2)
grid on
xlabel('t')
ylabel('h(t)')
title('h(t), Gráfica 2');

%Función para saber si la funcion x(t) tiene paridad par
for i=0:0.001:(2*pi)
    dom=i;
    x=((dom<=pi).*((1/pi).*dom+1))+((dom>=pi).*((1/pi).*dom-3));
    dom=dom*-1;
    xinv=-1.*(((dom>=-pi).*((-1/pi).*dom+1))+((dom<=-pi).*((-1/pi).*dom-3)));
    ev=x-xinv;
    if(ev==0)
        paridad='La función x(t): Tiene paridad PAR';
        bk=0;
    end
    if(ev~=0)
        paridad='La función x(t): No tiene paridad PAR';
    end
end
disp(paridad);
%Función para saber si la funcion h(t) tiene paridad par
for i=1:0.001:4
    dom2=i;
    h=(((dom2>=1)&(dom2<=2)).*(5))+(((dom2>=2)&(dom2<=3)).*(10))+(((dom2>=3)&(dom2<=4)).*(5));
    dom2=dom2*-1;
    hinv=(((dom2<=-1)&(dom2>=-2)).*(5))+(((dom2<=-2)&(dom2>=-3)).*(10))+(((dom2<=-3)&(dom2>=-4)).*(5));
    ev=h-hinv;
    if(ev==0)
        paridad='La función h(t): Tiene paridad PAR';
        bk2=0;
    end
    if(ev~=0)
        paridad='La función h(t): No tiene paridad PAR';
    end
end
disp(paridad);

%Función para saber si la funcion x(t) tiene paridad impar
for i=0:0.001:(2*pi)
    dom=i;
    x=((dom<=pi).*((1/pi).*dom+1))+((dom>=pi).*((1/pi).*dom-3));
    dom=dom*-1;
    xinv=-1*(((dom>=-pi).*((-1/pi).*dom+1))+((dom<=-pi).*((-1/pi).*dom-3)));
    ev=x+xinv;
    if(ev==0)
        paridad='La función x(t): Tiene paridad IMPAR';
        ak=0;
    end
    if(ev~=0)
        paridad='La función x(t): No tiene paridad IMPAR';
    end
end
disp(paridad);
%Función para saber si la funcion h(t) tiene paridad impar
for i=1:0.001:4
    dom2=i;
    h=(((dom2>=1)&(dom2<=2)).*(5))+(((dom2>=2)&(dom2<=3)).*(10))+(((dom2>=3)&(dom2<=4)).*(5));
    dom2=dom2*-1;
    hinv=(((dom2<=-1)&(dom2>=-2)).*(5))+(((dom2<=-2)&(dom2>=-3)).*(10))+(((dom2<=-3)&(dom2>=-4)).*(5));
    ev=h+hinv;
    if(ev==0)
        paridad='La función h(t): Tiene paridad IMPAR';
        ak2=0;
    end
    if(ev~=0)
        paridad='La función h(t): No tiene paridad IMPAR';
    end
end
disp(paridad);

%Función para saber si la funcion x(t) tiene paridad de media onda
for i=pi:0.001:(2*pi)
    dom=i;
    x=((dom>=pi).*((1/pi).*dom-3));
    xinv=-1*((dom>=pi).*((1/pi).*dom));
    ev=x-xinv;
    if(ev==0)
        paridad='La función x(t): Tiene paridad de Media Onda';
    end
    if(ev~=0)
        paridad='La función x(t): No tiene paridad de Media Onda';
    end
end
disp(paridad);
%Función para saber si la funcion h(t) tiene paridad de media onda
for i=6:0.001:9
    dom2=i;
    h=(((dom2>=6)&(dom2<=7)).*(5))+(((dom2>=7)&(dom2<=8)).*(10))+(((dom2>=8)&(dom2<=9)).*(5));
    hinv=0;
    ev=h-hinv;
    if(ev==0)
        paridad='La función h(t): Tiene paridad de Media Onda';
    end
    if(ev~=0)
        paridad='La función h(t): No tiene paridad de Media Onda';
    end
end
disp(paridad);

