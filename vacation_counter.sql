DECLARE
    ferias   DATE := TO_DATE ( '25/11/2016 17:00:00', 'dd/mm/yyyy hh24:mi:ss' );
    atual    DATE := sysdate;
    dias     NUMBER(10, 0);
    horas    NUMBER(10, 0);
    minutos  NUMBER(10, 0);
    segundos NUMBER(10, 0);
    texto    VARCHAR2(255);
    d        NUMBER(1, 0) := 0;
    h        NUMBER(1, 0) := 0;
    m        NUMBER(1, 0) := 0;
    s        NUMBER(1, 0) := 0;
BEGIN
    dias := trunc(ferias - atual);
    horas := trunc(((ferias - atual) - dias) * 24);
    minutos := trunc((((ferias - atual) - dias) -(horas / 24)) * 24 * 60);

    segundos := trunc(((((ferias - atual) - dias) -(horas / 24)) -(minutos /(24 * 60))) * 24 * 60 * 60);

    IF ( dias > 0 ) THEN
        d := 1;
    END IF;
    IF ( horas > 0 ) THEN
        h := 1;
    END IF;
    IF ( minutos > 0 ) THEN
        m := 1;
    END IF;
    IF ( segundos > 0 ) THEN
        s := 1;
    END IF;
    texto := NULL;
    IF ( dias > 0 ) THEN
        IF ( dias = 1 ) THEN
            texto := texto
                     || dias
                     || ' dia';
        ELSE
            texto := texto
                     || dias
                     || ' dias';
        END IF;

        IF ( ( h + m + s ) > 1 ) THEN
            texto := texto || ', ';
        ELSIF ( ( h + m + s ) = 1 ) THEN
            texto := texto || ' e ';
        END IF;

    END IF;

    IF ( horas > 0 ) THEN
        IF ( horas = 1 ) THEN
            texto := texto
                     || horas
                     || ' hora';
        ELSE
            texto := texto
                     || horas
                     || ' horas';
        END IF;

        IF ( ( m + s ) > 1 ) THEN
            texto := texto || ', ';
        ELSIF ( ( m + s ) = 1 ) THEN
            texto := texto || ' e ';
        END IF;

    END IF;

    IF ( minutos > 0 ) THEN
        IF ( minutos = 1 ) THEN
            texto := texto
                     || minutos
                     || ' minuto';
        ELSE
            texto := texto
                     || minutos
                     || ' minutos';
        END IF;

        IF ( s = 1 ) THEN
            texto := texto || ' e ';
        END IF;
    END IF;

    IF ( segundos > 0 ) THEN
        IF ( segundos = 1 ) THEN
            texto := texto
                     || segundos
                     || ' segundo';
        ELSE
            texto := texto
                     || segundos
                     || ' segundos';
        END IF;
    END IF;

    texto := '| Faltam '
             || texto
             || ' para as Férias! |';
    dbms_output.put_line(lpad('-', length(texto), '-'));
    dbms_output.put_line(texto);
    dbms_output.put_line(lpad('-', length(texto), '-'));
END;
/
