function c = mapmodul (v,modo,modul)
    v=dec2bin(v)

    disp('original')
    numRows=length(v)
    if modul == 0
        %QSPK
        if modo == 1
            vect(1:7)=0;
            vect(8)=1;
        end
        r=9;
        for i = 1:numRows
            bt=v(i,1:8);
            for k = 1:2:8
                b=bt(k:k+1);
                switch b
                    case '00'
                        vect(r)=1-j;
                    case '01'
                        vect(r)=-1-j;
                    case '10'
                        vect(r)=-1+j;
                    case '11'
                        vect(r)=1+j;
                end
                r=r+1;
            end
        end
    elseif modul == 1
        %16-QAM
        vect(1)=0;
        vect(2)=1;
        if modo == 1
            vect(3)=0;
            vect(4)=1;
        end
        r=5;
        for i = 1:numRows
            bt=v(i,1:8);
            for k = 1:4:8
                b=bt(k:k+3);
                switch b
                    case '0000'
                        vect(r)=-3+3*j;
                    case '0001'
                        vect(r)=-1+3*j;
                    case '0010'
                        vect(r)=1+3*j;
                    case '0011'
                        vect(r)=3+3*j;
                    case '0100'
                        vect(r)=-3+1*j;
                    case '0101'
                        vect(r)=-1+1*j;
                    case '0110'
                        vect(r)=1+1*j;
                    case '0111'
                        vect(r)=3+1*j;
                    case '1000'
                        vect(r)=-3-1*j;
                    case '1001'
                        vect(r)=-1-1*j;
                    case '1010'
                        vect(r)=1-1*j;
                    case '1011'
                        vect(r)=3-1*j;
                    case '1100'
                        vect(r)=-3-3*j;
                    case '1101'
                        vect(r)=-1-3*j;
                    case '1110'
                        vect(r)=1-3*j;
                    case '1111'
                        vect(r)=3-3*j;
                end
                r=r+1;
            end
        end
    end
    c=vect;
    disp('C')
    [rows,col]=size(c)
end