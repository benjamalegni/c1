program recu;

const min = 1;
   max    = 10;
   ast    = '*';

type arrchar=array[min..max] of char;

var letras  : arrchar;
   caracter : char;

procedure borrarcaracter(var letras : arrchar;caracter:char );
var i : integer;
begin
   for i:=min to max do begin
      if (letras[i]=caracter) then
         letras[i]:=ast;
   end;
end;

procedure correralfinal(var letras : arrchar;pos:integer );
var i : integer;
begin
   for i:=pos downto min+1 do begin
      letras[i]:=letras[i-1];
   end;
   letras[min]:=ast;
end;

procedure borrarblancos(var letras :arrchar );
var pos : integer;
begin
   for pos:=min to max do begin
      if (letras[pos]=ast) and (pos<>min) then
         correralfinal(letras,pos);
   end;
end;

procedure cargar(var letras:arrchar );
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
   writeln('ingrese el caracter');
   readln(caracter);
   cargar(letras);
   borrarcaracter(letras,caracter);
   borrarblancos(letras);
   imprimir(letras);
end.
