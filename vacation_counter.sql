declare  
  
  ferias date := to_date('25/11/2016 17:00:00','dd/mm/yyyy hh24:mi:ss');
  atual  date := sysdate;
  dias number(10,0);
  horas number(10,0);
  minutos number(10,0);
  segundos number(10,0);
  texto varchar2(255);
  d number(1,0) := 0;
  h number(1,0) := 0;
  m number(1,0) := 0;
  s number(1,0) := 0;

begin

dias := trunc(ferias-atual);
horas := trunc(((ferias-atual)-dias)*24);
minutos := trunc((((ferias-atual)-dias)-(horas/24))*24*60);
segundos := trunc(((((ferias-atual)-dias)-(horas/24))-(minutos/(24*60)))*24*60*60);

if (dias > 0) then
d := 1;
end if;

if (horas > 0) then
h := 1;
end if;
if (minutos > 0) then
m := 1;
end if;
if (segundos > 0) then
s := 1;
end if;
  
texto := null;

if (dias > 0) then
if (dias = 1) then
texto := texto || dias || ' dia' ;
else
texto := texto || dias || ' dias' ;
end if;

if 
((h+m+s) > 1) then
texto := texto || ', ';
elsif
((h+m+s) = 1) then
texto := texto || ' e ';
end if;
end if;

if (horas > 0) then
if (horas = 1) then
texto := texto || horas || ' hora' ;
else
texto := texto || horas || ' horas' ;
end if;

if 
((m+s) > 1) then
texto := texto || ', ';
elsif
((m+s) = 1) then
texto := texto || ' e ';
end if;
end if;

if (minutos > 0) then
if (minutos = 1) then
texto := texto || minutos || ' minuto';
else
texto := texto || minutos || ' minutos';
end if;

if 
(s = 1) then
texto := texto || ' e ';
end if;
end if;

if (segundos > 0) then
if (segundos = 1) then
texto := texto || segundos || ' segundo' ;
else
texto := texto || segundos || ' segundos' ;
end if;
end if;

texto := '| Faltam ' || texto || ' para as Férias! |';
  
dbms_output.put_line(lpad('-',length(texto),'-'));
dbms_output.put_line(texto);
dbms_output.put_line(lpad('-',length(texto),'-'));

END;
/
