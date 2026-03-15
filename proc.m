function [y, tramas] = proc(c,modo,modul)
    %Quitamos bits de modul y modo
    %if modul == 0
        %QSPK
        %c=c(9:end);
    %elseif modul == 1
        %16-QAM
        %c=c(5:end);
    %end

    %Establecer modo de transmisión
    if modo == 0
        N=2048;
    elseif modo == 1
        N=8192;
    end

    m=0;
    vect=zeros(round(length(c)/N),N);
    vect2=zeros(round(length(c)/N),N);
    for i = 1:N:length(c)
        if i+N-1>length(c)
            %Si N es mayor a las coordenadas restantes
            trama=c(i:end);
        else
            %Trama de tamaño N
            trama=c(i:i+N-1);
        end

        %IFFT
        trans=ifft(trama);

        %Generación de secuencia
        m=m+1;
        for n = 1:length(trama)
            vect(m,n)=vect(m,n)+real(trans(n))*cos(2*pi*n*(1/0.01)*m*(0.01/N))+imag(trans(n))*sin(2*pi*n*(1/0.01)*m*(0.01/N));
            vect2(m,n)=trans(n);
        end
    end
    y=vect;
    disp('despues de ifft')
    [rowsTramas,colTramas]=size(vect2)
    tramas=vect2;
    T=0.01;
    t=0:T:T*(length(y)-1);
    plot(t,y);
end