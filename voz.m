function y = voz(archivo)
    [y,fs]=audioread(archivo,'native');
    y=y(3200:7200);
    num=length(y);
    t = linspace(0,num/fs,num);
    plot(t,y);
end
