function c = mapmodul (v,modo,modul)
   % Convertimos los valores a bytes, siendo estos binarios
    binarios = dec2bin(v);
    % Generamos una secuencia de bits
    %% Nos sirve como un método de transferencia de señales de audio codificadas en el formato de sonido envolvente de la fuente
    seqBits = convertCharsToStrings(binarios);
    % b) Generamos las tramas, mapeando los valores binarios a complejos
    if modul == 0
        tipoModul = 2; % QPSK
        % Recortamos la secuencia de bits cada n chars de lo que existe en la
        % modulación
        % En la secuencia lo que le regresa a bits está definido por el tipo de modulación.
        bits = regexp(seqBits, sprintf("\\d{%d})", tipoModul), 'match');
        c = qpskORqam(bits, modo, tipoModul)'; % ojo Hacemos una transpuesta
    else
        tipoModul = 4; % 16-QAM
        % Recortamos la secuencia de bits cada n chars de lo que existe en la
        % modulación
        % En la secuencia lo que le regresa a bits está definido por el tipo de modulación.
        bits = regexp(seqBits, sprintf('\\d{%d}', tipoModul), 'match');
        c = qpskORqam(bits, modo, tipoModul)'; % Hacemos una transpuesta
    end
end