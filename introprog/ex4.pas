program ex4;

const min = 1;
   max    = 23;


type arrchar=array[min..max] of char;
type arrint = array[min..10]of integer;


var palabras,palabranueva : arrchar;
   longpalabras                : arrint;
   pos                        : integer;


procedure cargararrc(var palabras : arrchar;longpalabras:arrint );
begin
   palabras[1]:='c';
   palabras[2]:='a';
   palabras[3]:='s';
   palabras[4]:='a';
   palabras[5]:='m';
   palabras[6]:='u';
   palabras[7]:='e';
   palabras[8]:='b';
   palabras[9]:='l';
   palabras[10]:='e';
   palabras[11]:='p';
   palabras[12]:='l';
   palabras[13]:='a';
   palabras[14]:='z';
   palabras[15]:='a';
   palabras[16]:='c';
   palabras[17]:='a';
   palabras[18]:='m';
   palabras[19]:='p';
   palabras[20]:='o';
end;

procedure cargarlp(var longpalabras :arrint );
begin
   longpalabras[1]:=4;
   longpalabras[2]:=6;
   longpalabras[3]:=5;
   longpalabras[4]:=5;
end;

procedure cargarpl(var palabranueva :arrchar );
var i : integer;
   begin
      for i:=min to 3 do begin
         writeln('cargar letra para pos:',i);
         readln(palabranueva[i]);
      end;
   end;

function posenletras(pos : integer;longpalabras:arrint ):integer;
var i,temp : integer;
begin
   temp:=longpalabras[min];
   i:=min+1;
   while (i<=pos) and (i<>min) do begin
      temp:=temp+longpalabras[i];
      i:=i+1;
   end;
   posenletras:=temp;
end;

procedure correrletras(var palabras : arrchar;pos:integer );
var i,j : integer;
begin
   j:=posenletras(pos,longpalabras);

   for i:=max downto j do begin
      palabras[i]:=palabras[i-3];
   end;
end;

procedure insertarpal(var palabras : arrchar;palabranueva:arrchar );
var i : integer;
   begin
      i:=posenletras(pos,longpalabras);

      while (i<=3) do begin
         palabras[i]:=palabranueva[i];
         i:=i+1;
      end;

   end;


procedure imprimir(palabras :arrchar );
var i : integer;
begin
   for i:=min to max do begin
      writeln('el arreglo en la pos:',i,'es',palabras[i]);
   end;
end;



begin
   cargarlp(longpalabras);
   cargararrc(palabras,longpalabras);


   writeln('insertar palabra a cargar');
   cargarpl(palabranueva);
   writeln('cargar pos');
   readln(pos);

   correrletras(palabras,pos);
   insertarpal(palabras,palabranueva);

   imprimir(palabras);
end.
