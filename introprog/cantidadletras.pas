program cantidadletras;

const min = 1;
   max    = 10;


type arrchar=array[min..max] of char;

var arreglo,blanco : arrchar;
   cant     : integer;

function cantrepe(arreglo : arrchar;letra:char):integer;
var temp : char;
   i     : integer;
begin
   temp:=letra;
   cantrepe:=1;
   for i:=min to max do begin
      if arreglo[i]=temp then
         cantrepe:=cantrepe+1;
   end;
end;

procedure eliminarletra(var arreglo : arrchar;letra:char );
var i : integer;

begin
   i:=min;
   while i<=max do begin
      if arreglo[i]=letra then
         arreglo[i]:=blanco[i];
   end;
end;

procedure elimletrep(var arreglo : arrchar;cant:integer );
var indice : integer;
begin
   indice:=min;
   while indice<=max do begin
      if (arreglo[indice]<>blanco[indice]) then begin
         if (cant=cantrepe(arreglo,arreglo[indice])) then
            eliminarletra(arreglo,arreglo[indice]);
      end;
      indice:=indice+1;

   end;
end;

function posocupada(arreglo : arrchar;pos:integer):integer;
begin
   while (pos>=1) and (arreglo[pos]=blanco[pos]) do begin
      pos:=pos-1;
   end;
   posocupada:=pos;
   end;


procedure correrblancos(var arreglo :arrchar );
var posicion,i : integer;
begin
   for i:=max downto min do
      begin
         posicion:=posocupada(arreglo,i);
         arreglo[i]:=arreglo[posicion];
         arreglo[posicion]:=blanco[i];
      end;

   end;


procedure cargar(var arreglo :arrchar );
var i : integer;

begin
   for i:=min to max do begin
      writeln('cargar pos',i);
      readln(arreglo[i]);
   end;
end;

procedure imprimir(arreglo :arrchar );
var i : integer;
begin
   for i:=min to max do begin
      writeln('el arreglo en pos:',i,'es:',arreglo[i]);
   end;
end;


begin
   writeln('ingrese el numero que se repite la letra a borrar');
   readln(cant);
   cargar(arreglo);
   elimletrep(arreglo,cant);
   correrblancos(arreglo);
   imprimir(arreglo);
end.
