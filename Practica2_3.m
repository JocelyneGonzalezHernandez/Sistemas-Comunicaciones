%PRÁCTICA 2 - EQUIPO 4
%EJERCICIO 3
%Este programa modifica 'x' para variar desde -5 a 40
% con incrementos de 5 unidades

load handel 
sound (y) 
for x=-5:5:40 
    yn=awgn(y,x); %donde x es la razón señal a ruido de la señal yn 
    d=corrcoef(y, yn)
    sound (yn) 
    x
end