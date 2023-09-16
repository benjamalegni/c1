program ex3;
const min    = 1;
   maxa      = 15;

type arrchar=array[min..maxa] of char;

var inicio,final : integer;
   separador,mensajein     : arrchar;

procedure encontrarsec(mensajein :arrchar );
var i : integer;
begin
   for i:=min to maxa do begin
      if mensajein[i]='(' then
         inicio:=i;
      if mensajein[i]=')' then
         final:=i;
   end;
end;


procedure invertirsec(var mensajein:arrchar;inicio,final:integer);
var i ,f : integer;//indices de inicio y final
   aux   : char;
begin
   i:=inicio;
   f:=final;

   while i<f do begin
      aux:=mensajein[i];
      mensajein[i]:=mensajein[f];
      mensajein[f]:=aux;
      i:=i+1;
      f:=f-1;
   end;
end;


procedure parentesisporblancos(var mensajein : arrchar;inicio,final:integer );
   begin
      mensajein[inicio]:=separador[min];
      mensajein[final]:=separador[min];
   end;

procedure cargar(var mensajein :arrchar );
var i : integer;

   begin
      for i:=min to maxa do begin
         writeln('cargar pos',i);
         readln(mensajein[i]);
      end;
   end;

procedure imprimir(mensajein :arrchar );
var i : integer;
   begin
      for i:=min to maxa do begin
         writeln('el arreglo en pos:',i,'es:',mensajein[i]);
      end;
   end;

procedure decodificacion(var mensajein :arrchar );
begin
   encontrarsec(mensajein);
   invertirsec(mensajein,inicio,final);
   parentesisporblancos(mensajein,inicio,final);
end;
begin
   cargar(mensajein);
   decodificacion(mensajein);
   imprimir(mensajein);
end.
