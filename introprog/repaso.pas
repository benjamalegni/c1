program repaso;

const min = 1;
   maxa   = 10;
   disc   = '-1';


type arrint=array[min..maxa] of integer;

var enteros,mayores:arrint;



function inicproxsec(enteros : arrint;pos:integer ):integer;
begin
   while (pos<=maxa) and (enteros[pos]=0)do begin
      pos:=pos+1;
   end;
   inicproxsec:=pos;
end;

function finalsec(enteros : arrint;pos:integer ):integer;
begin
   while (pos<=maxa) and (enteros[pos]<>0) do
      begin
         pos:=pos+1;
      end;
   finalsec:=pos-1;
end;

function elementomayorsec(enteros :arrint; inicproxsec,finalsec :integer ):integer;
var  mayor,i: integer;
begin
   mayor:=enteros[inicproxsec];
   i:=inicproxsec;
   while i<=finalsec do begin
      if enteros[i]>=mayor then
         mayor:=enteros[i];
   end;
   elementomayorsec:=mayor;
end;

procedure insertaralfinal(var mayores : arrint;elemento:integer );
var i                                 : integer;
begin
   while (mayores[i]<>disc) do begin
      i:=i+1;
   end;
   mayores[i]:=elemento;
end;


procedure cargarmayores(enteros : arrint;var mayores:arrint;
var inicio,final : integer;
begin
   inicio:=inicproxsec(enteros,min);
   while inicio<=maxa do begin
      final:=finalsec(enteros,inicio);
      insertaralfinal(mayores,elementomayorsec(enteros,inicio,final));
      inicio:=inicioproxsec(enteros,final+1);
   end;

end;





begin
end.
