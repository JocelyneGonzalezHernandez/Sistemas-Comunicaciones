% "arch" es el nombre del archivo wav que contiene la señal digital de audio
% "modo" toma el valor de 0 si se desean generar 2,048 subportadoras (modo 2k) y 
% toma el valor de 1 si se desean generar 8,192 subportadoras (modo 8k), y 
% "modul" toma el valor de 0 si se desea utilizar una modulación QPSK para las 
% subportadoras o toma el valor de 1 si se desea utilizar una modulación 16-QAM. 
% La variable de salida "y" deberá contener un vector con el “equivalente”
% de la señal OFDM analógica.
modo=0;
modul=0;
[y, tramas] = ofdm("hola.wav", modo, modul);
if modul==0
    r=regreso(tramas);
end