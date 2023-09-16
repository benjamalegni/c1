program rep23;

const min = 1;
   max    = 10;
   blanc  = ' ';

type arrchar=array[min..max] of char;

var ml : arrchar;
   rep       : integer;

function cantrepe(ml : arrchar;letra:char):integer;
var i : integer;
begin
   cantrepe:=min;
   for i:=min to max do begin
      if ml[i]=letra then
         cantrepe:=cantrepe+1;
   end;
end;

procedure elimletra(var ml : arrchar;letra:char );
var i : integer;
begin
   for i:=min to max do begin
      if ml[i]=letra then
         ml[i]:=blanc;
   end;
end;

procedure borrarletra(var ml : arrchar;rep:integer );
var   i      : integer;
   begin
      for i:=min to max do begin
         if ml[i]<>blanc then begin
         if cantrepe(ml,ml[i])=rep then
            elimletra(ml,ml[i]);
         end;
      end;
   end;

function posocupada(ml : arrchar;posicion:integer ):integer;
begin

   while (posicion>=min) and (ml[posicion]=blanc) do begin
      posicion:=posicion-1;
   end;
   posocupada:=posicion;
end;

procedure correrblancos(var ml :arrchar );
var posicion,i : integer;
begin
   for i:=max to min do begin
      if ml[i]=blanc then begin
         posicion:=posocupada(ml,i);
         ml[i]:=ml[posicion];
         ml[posicion]:=blanc;
      end;
end;
end;

procedure cargar(var ml :arrchar );
var i : integer;

begin
   for i:=min to max do begin
      writeln('cargar pos',i);
      readln(ml[i]);
   end;
end;

procedure imprimir(ml :arrchar );
var i : integer;
begin
   for i:=min to max do begin
      writeln('el arreglo en pos:',i,'es:',ml[i]);
   end;
end;





begin
   cargar(ml);

   writeln('ingresar numero de repeticiones');
   readln(rep);

   borrarletra(ml,rep);
   correrblancos(ml);

   imprimir(ml);
end.
