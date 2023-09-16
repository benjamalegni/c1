program ex8;

const min = 1;
   max    = 10;
   ast    = '*';

type arrchar=array[min..max] of char;

var frase,blanc:arrchar;

procedure detectarproxpalabra(frase : arrchar;var pos, inicio,final:integer );
begin
   while frase[pos]=blanc[pos] do
      pos:=pos+1;


if inicio<=max then begin
   inicio:=pos;

   while (frase[pos]<>blanc[pos]) do
      begin
         final:=final+1;
         pos:=pos+1;
      end;

end;

end;


function reversa(frase : arrchar;inicio,final:integer ):arrchar;
var i     : integer;

begin
   for i:=inicio to final do begin
      reversa[i]:=frase[final -i +1];
   end;
end;



function espalindroma(frase : arrchar; inicio,final:integer ):boolean;
var i                           : integer;
begin

   i:=inicio;

   espalindroma:=true;

   while i<=final do begin
      if frase[i] <> reversa(frase,inicio,final)[i] then
         begin
            espalindroma:=false;
            i:=999;
         end;
      i:=i+1;
   end;
end;

procedure llenarast(var frase : arrchar;inicio,final:integer );
var i : integer;
begin
   for i:=inicio to final do
      frase[i]:=ast;
end;

procedure darvuelta(var frase : arrchar;inicio,final:integer );
var ini,fin : integer;
   temp     : char;
begin
   ini:=inicio;
   fin:=final;

   while ini<fin do begin
      temp:=frase[ini];
      frase[ini]:=frase[fin];
      frase[fin]:=temp;
      ini:=ini+1;
      fin:=fin-1;
   end;


end;


procedure cargar(var frase :arrchar );
var i : integer;
   begin
      for i:=min to max do begin
         writeln('letra para pos:',i);
         readln(frase[i]);
      end;
   end;

procedure procesar(var frase :arrchar );
var inicio,final,pos :integer;

   begin
      inicio:=min;
      final:=min;
      detectarproxpalabra(frase,inicio,inicio,final);

      while final<=max do begin
         if espalindroma(frase,inicio,final)=true then
         begin
            pos:=final+1;
            llenarast(frase,inicio,final);
            detectarproxpalabra(frase,pos,inicio,final);
         end
      else
      begin
         pos:=final+1;
         darvuelta(frase,inicio,final);
         detectarproxpalabra(frase,pos,inicio,final);
      end;
      end;


   end;

procedure imprimir(frase :arrchar );
var i : integer;
   begin
      for i:=min to max do begin
         writeln('el arreglo en la pos:',i ,'es:',frase[i]);
      end;
   end;


begin
   writeln('cargar arreglo frase separando palabras con espacios');
   cargar(frase);
   procesar(frase);
   imprimir(frase);
end.
