program parcial;

const min = 1;
   maxa = 15;

type arrchar=array[min..maxa] of char;

var frases,blanco : arrchar;
   long            : integer;

procedure proxpalabra(frases : arrchar;pos:integer;var inicio,final:integer);
begin
   while frases[pos]=blanco[pos] do pos:=pos+1;
   if pos<=maxa then
      begin
      inicio:=pos;
      while frases[pos]<>blanco[pos] do
         pos:=pos+1;
         final:=pos-1;
      end
   else
      final:=pos;
end;

procedure invertir(var frases : arrchar;inicio,final:integer );
var temp   : char;
   ini,fin : integer;
begin
   ini:=inicio;
   fin:=final;
   frases[ini]:=temp;
   frases[ini]:=frases[fin];
   frases[fin]:=temp;
   ini:=ini+1;
   fin:=fin-1;
end;

procedure procesarfrase(var frases : arrchar;long:integer );
var inicio,final : integer;
begin
   inicio:=min;
   final:=min;

   proxpalabra(frases,min,inicio,final);
   while final<=maxa do begin
      if (final-inicio+1)>long then
         begin
            invertir(frases,inicio,final);
         end;
      proxpalabra(frases,final+1,inicio,final);
      end;
end;

procedure cargar(var frases :arrchar );
var i : integer;
   begin
      for i:=min to maxa do
         begin
            writeln('inserte valor para pos:',i);
            readln(frases[i]);
         end;
   end;

procedure imprimir(frases :arrchar );
var i : integer;
begin
   for i:=min to maxa do begin
      writeln('el arreglo en la pos:',i,'es',frases[i]);
   end;
end;


begin
   writeln('insertar longitud');
   readln(long);
   cargar(frases);
   procesarfrase(frases,long);
   imprimir(frases);


end.
