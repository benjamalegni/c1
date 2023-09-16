program ex9;

const min = 1;
   max    = 10;

type arrchar=array[min..max] of char;

var secuencias,blanc:arrchar;

procedure cargar(var secuencias :arrchar );
var i : integer;
begin
   for i:=min to max do begin
      writeln('cargar arreglo en pos:',i);
      readln(secuencias[i]);
   end;
end;

function longsec(secuencias : arrchar;pos:integer ):integer;
var inicio,final : integer;
   begin
      while secuencias[pos]=blanc[pos] do pos:=pos+1;

if pos<=max then begin
   inicio:=pos;
      while secuencias[pos]<>blanc[pos] do begin
         pos:=pos+1;
      end;
      final:=pos-1;
   end
      else
         final:=pos;
      longsec:=(final-inicio+1);
   end;

procedure ubicarlongsec(var secuencias : arrchar; posicion,inicio,final:integer);

begin

end;

begin
end;

begin
   cargar(secuencias);
end.
