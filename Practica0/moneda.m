%moneda.m
% Jazmin Villegas Hernández  216247-A
%Lucía López Tolsa Allende 224522-1
%Fernanda Nayeli Zamora Dominguez 225298-0
%Jocelyne González Hernádez 225369-5
%Programa que simula el resultado de lanzar 10 veces una moneda.
%
for i=1:10 %repetimos 10 veces
u=rand; %rand genera un número
%aleatorio entre 0 y 1
if u<= 0.5 %si es menor o igual que 0.5
disp('Cara') %escribimos en pantalla Cara
else %si no
disp('Cruz') %escribimos en pantalla Cruz
end
end
