function [wn,dmp]=omega_dmp(T_set, PO, final_perc)
    i = 0;
    e = 1;

    while e>0.001
        PO_i = 100*exp((-i*pi)/(sqrt(1-(i^2))));
        e = PO_i-PO;
        dmp = i;
        i = i+0.0001;
    end

    if final_perc == 2
        wn = 4/(T_set*dmp);
    else
        wn = 3/(T_set*dmp);
    end
end