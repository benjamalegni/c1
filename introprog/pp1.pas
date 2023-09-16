program pp1;

const minf = 1;
   maxf    = 4;
   disc    = '';

type t_frase=array[minf..maxf] of char;

var long : integer;
   frase   : t_frase;


procedure cargararr(frase :t_frase );
var i : integer;
   begin
      for i:=minf to maxf do begin
         writeln('cargar caracter en la posicion:',i);
         readln(frase[i]);
      end;
   end;

   procedure proxfrase(frase : t_frase;indice:integer;var inicial,final:integer);
      begin
         while (inicial<=maxf) and (frase[indice]=disc) do
            begin
               indice:=indice+1;
            end;

         if indice<=maxf then
            begin
               inicial:=indice;
               while (indice<=maxf) and (frase[indice]<>disc) do
                  begin
                     indice:=indice+1;
                  end;
               final:=indice-1;
            end
         else
            final:=indice;
         end;

   procedure invertir(var frase : t_frase;inicial,final:integer );
   var aux : char;

   begin

      while inicial<final do begin
      aux:=frase[inicial];
         frase[inicial]:=frase[final];
         inicial:=inicial+1;
         final:=final-1;
      end;
   end;

   procedure procesarfrase(var frase : t_frase;long:integer);
   var inicial,final : integer;
   begin
      inicial:=minf;
      final:=minf;

      proxfrase(frase,minf,inicial,final);

      while final<=maxf do begin
         if (final+inicial+1) > long then
            invertir(frase,inicial,final);
         proxfrase(frase,final+1,inicial,final);
      end;
   end;

   procedure mostrararr (frase :t_frase );
   var i : integer;
      begin
         for i:=minf to maxf do
            writeln('el char en la posicion:',i,'es:',frase[i]);
      end;

begin
   cargararr(frase);
   writeln('ingresar long');
   readln(long);
   procesarfrase(frase,long);
   mostrararr(frase);
end.
