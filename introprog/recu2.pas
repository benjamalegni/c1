program recu2;

const min = 1;
   max    = 10;
   ast    = '*';

type arrchar=array[min..max] of char;

var letras : arrchar;
   letra         : char;

procedure borrarchar(var letras : arrchar;letra:char );
var i                           : integer;
begin
   i:=min;
   while i<=max do begin
      if letras[i]=letra then
         letras[i]:=ast;
      i:=i+1;
   end;
end;


procedure corrimiento(var letras : arrchar ;pos:integer);
var i : integer;
begin
   for i:=pos downto min+1 do begin
      letras[i]:=letras[i-1];
   end;
end;

procedure proceso(var letras :arrchar );
var pos : integer;
begin
   for pos:=min+1 to max do begin
      if letras[pos]=ast then
         corrimiento(letras,pos);
   end;
   letras[min]:=ast;
end;

procedure cargar(var letras :arrchar );
var i : integer;

begin
   for i:=min to max do begin
      writeln('cargar pos',i);
      readln(letras[i]);
   end;
end;

procedure imprimir(letras :arrchar );
var i : integer;
begin
   for i:=min to max do begin
      writeln('el arreglo en pos:',i,'es:',letras[i]);
   end;
end;


begin


   writeln('ingrese char');
   readln(letra);
   cargar(letras);
   borrarchar(letras,letra);
   proceso(letras);
   imprimir(letras);
end.
