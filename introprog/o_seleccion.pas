program o_seleccion;

const min = 1;
   max    = 10;

type arrint=array[min..max] of integer;

var a1:arrint;

function posmenor(a1 : arrint;pos:integer ):integer;
var menor,i : integer;
begin
   menor:=pos;
   for i:=pos+1 to max do
         if a1[i]<a1[menor] then
            menor:=i;
   posmenor:=menor;
end;

procedure intercambio(var a1 : arrint;pos,posmenor:integer );
var aux : integer;
   begin
      aux:=a1[pos];
      a1[pos]:=a1[posmenor];
      a1[posmenor]:=aux;
   end;

procedure ordenamiento(var a1 :arrint);
var pos : integer;
begin
   for pos:=min to max-1 do begin
      intercambio(a1,pos,posmenor(a1,pos));
   end;
end;

procedure cargararr(var a1 :arrint );
var i : integer;
   begin
      for i:=min to max do begin
         writeln('cargar pos',i);
         readln(a1[i]);
      end;
   end;

procedure mostrararr(a1 :arrint );
var i : integer;
   begin
      for i:=min to max do
         writeln('el arreglo en la pos',i,'es:',a1[i]);
   end;

begin
   cargararr(a1);
   ordenamiento(a1);
   mostrararr(a1);
end.

