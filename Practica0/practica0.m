% Programa que calcula la suma de los 100 primeros números.
suma=0; %ponemos el contador a 0
for i=1:100 %para i=1,...,100
suma=suma+i; %sumamos i al resultado anterior
end
%
%Otra forma de hacerlo.
suma=0; %ponemos el contador a 0
i=1; %i vale 1
while i<=100 %mientras i sea menor o igual que 100
suma=suma+i; %sumamos i al resultado anterior
i=i+1; %i se incrementa en 1
end
%
%Otra forma más.
x=[1:1:100]; %vector cuyas componentes son los números del 1 al 100
suma=0; %ponemos el contador a 0
for i=1:length(x) %desde el principio hasta el final de x
suma=suma+x(i); %sumamos al resultado anterior la componente
end %correspondiente de x
%
%Otra forma más rápida.
x=[1:1:100]; %vector cuyas componentes son los números del 1 al 100
suma=sum(x); %la función sum suma las componentes de un vector