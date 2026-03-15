function [y, tramas] = ofdm(arch, modo, modul)
    v=voz(arch);
    c=mapmodul(v,modo,modul);
    [y, tramas]=proc(c,modo,modul);
end