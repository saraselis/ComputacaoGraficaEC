function output = parteB1(i0, j0, iF, jF)

    i0=round(i0); 
    iF=round(iF);
    j0=round(j0);
    jF=round(jF);

    % calculando deltas
    delta_i = iF - i0;
    delta_j = jF - j0;
    
    %modificando delta_j p/ a equaçao de reta, caso este seja menor q delta_i
    if delta_j < delta_i
        aui = delta_i;
        delta_i = delta_j;
        delta_j = aui; 
    end
    
    if delta_j == 0
        q=zeros(delta_i+1,1);
    else
        q=[0;diff(mod([floor(delta_i/2):-delta_j:-delta_j*delta_i+floor(delta_i/2)]',delta_i))>=0];
    end

    if delta_j < delta_i
        if j0<=jF
            j=ctranspose([j0:jF]);
            %j = round(j);
        else
            j=ctranspose([j0:-1:jF]);
            %j = round(j);
        end
        if i0<=iF
            i=i0+cumsum(q);
            %i = round(i);
        else
            i=i0-cumsum(q);
            %i = round(i);
        end
    else
        if i0<=iF
            i=ctranspose([i0:iF]);
            i = round(i);
        else
            i=ctranspose([i0:-1:iF]);
            i = round(i);
        end
        if j0<=jF
            j=j0+cumsum(q);
            %j = round(j);
        else
            j=j0-cumsum(q);
            %j = round(j);
        end
    end

    output = [i j];
    
    plot(output);

end