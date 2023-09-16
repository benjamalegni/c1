program pref18;


const min = 1;
   max    = 10;
   blanc  = ' ';

type arrchar=array[min..max] of char;

var ml   : arrchar;
   letra : char;


procedure borrarletra(var ml : arrchar;letra:char );
var i : integer;
begin
   for i:=min to max do begin
      if ml[i]=letra then
         ml[i]:=blanc;
   end;
end;

function posocupada(ml : arrchar;posicion:integer ):integer;
begin
   while (posicion<=max) and (ml[posicion]=blanc) do begin
      posicion:=posicion+1;
   end;
   posocupada:=posicion;
end;

procedure correrblancos(var ml :arrchar );
var posicion,i : integer;
   begin
      for i:=min to max do begin
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
      writeln('cargar pos:',i);
      readln(ml[i]);
   end;
end;

procedure imprimir(ml :arrchar );
var i : integer;
begin
   for i:=min to max do begin
      writeln('el arr en pos',i,'es:',ml[i]);
   end;
end;

begin
   writeln('ingrese letra');
   readln(letra);
   cargar(ml);
   borrarletra(ml,letra);
   correrblancos(ml);
   imprimir(ml);

end.
