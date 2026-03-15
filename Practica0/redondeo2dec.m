%redondeo2dec.m
% Jazmin Villegas Hernández  216247-A
%Lucía López Tolsa Allende 224522-1
%Fernanda Nayeli Zamora Dominguez 225298-0
%Jocelyne González Hernádez 225369-5
%
function y=redondeo2dc(x);
%función que redondea un número a
%dos decimales.
%
x=x*100;
y=round(x)/100; %round es una función
%que redondea un número
%al entero más próximo
