function r = regreso(original)
    [numRows,numCols]=size(original)
    N=numCols;
    m=0;
    vect=zeros(numRows,numCols);
    
    for j= 1:numRows
        trama=original(j,:);
        %sizeTrama=size(trama)
        %FFT
        trans=fft(trama);
    
        %Vector transformado
        m=m+1;
        for n = 1:length(trama)
            vect(m,n)=trans(n);
        end
    end

    disp('despues de fft')
    [numRows,numCols]=size(vect)

    %Desintegrar tramas
    m=1;
    for i = 1:numRows
        for j = 1:numCols
            vect2(m)=vect(i,j);
            m=m+1;
        end
    end

    
    disp('Sin tramas')
    [numRows,numCols]=size(vect2)

    m=1;
    cont=1;
    recv=zeros((length(vect2)/4),8);
    db=zeros(1,8);
    for j = 1:numCols
        if real(vect2(j)) < 0
            %-1,*
            if imag(vect2(j)) < 0
                %-1,-1
                db(cont)='0';
                db(cont+1)='1';
            elseif imag(vect2(j)) > 0
                %-1,1
                db(1,cont)='1';
                db(1,cont+1)='0';
            end
        elseif real(vect2(j)) > 0
           %1,*
           if imag(vect2(j)) < 0
               %1,-1
               db(1,cont)='0';
               db(1,cont+1)='0';
           elseif imag(vect2(j)) > 0
                %1,1
                db(1,cont)='1';
                db(1,cont+1)='1';
           end
        end
        if cont == 7
            cont=1;
            %disp(db);
            for i = 1:8
                recv(m,i)=db(1,i);
            end
            m=m+1;
        end
        cont=cont+2;
    end
    
    tam=length(recv)
    recv=char(recv);
    r=bin2dec(recv);

    %sound(r);
end