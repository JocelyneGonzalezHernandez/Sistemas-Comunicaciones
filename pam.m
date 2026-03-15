function vs=pam(v,fs,d)
    %v es el vector de la señal original
    %fs es la frecuencia de muestro
    %d es el ciclo de trabajo

    Ts = 1/fs; %Tasa de muestreo
    num = length(v); % Número de muestras
    
    % Generar vector de tiempo
    t = linspace(0, 0.5, num);
    
    figure;
    vs=zeros(6,length(t));
    for i = 1:length(d)
        % Generar tren de pulsos cuadrados 
        vc = square(2*pi*t/Ts, d(i)*100);
    
        %Multiplicación de señales
        vs(i,:)=v.*vc;

        %Graficar señal
        subplot(3, 2, i);
        plot(t, vs(i,:));
        title(strcat('d:',num2str(d(i))));
    end
    sgtitle('PAM de muestro natural')
    
    %Generar vector de frecuencia
    f = linspace(-num/2, num/2-1, num)/(0-0.5);

    figure;
    vf=zeros(6,length(t));
    for i = 1:length(d)
        %Generar espectro de la señal
        vf(i,:)=fft(vs(i,:));

        %Graficar señal
        subplot(3, 2, i);
        plot(f, abs(fftshift(vf(i,:))));
        title(strcat('d:',num2str(d(i))));
    end
    sgtitle('Espectros de magnitud')

    frec_hz = fs / (2*pi);
    fc=300;
    % Diseñar el filtro pasabajas
    [b, a] = butter(6, fc/(fs/2));
    
    % Aplicar el filtro a la señal
    vs_filtrada = filter(b, a, vs);
    figure;
    plot(t, vs, 'b', t, vs_filtrada, 'r');
    xlabel('Tiempo');
    ylabel('Amplitud');
    legend('Señal original', 'Señal filtrada');
end