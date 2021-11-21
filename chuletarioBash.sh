#!/bin/bash

#  ____ _           _      _             _       
# / ___| |__  _   _| | ___| |_ __ _ _ __(_) ___  
#| |   | '_ \| | | | |/ _ \ __/ _` | '__| |/ _ \ 
#| |___| | | | |_| | |  __/ || (_| | |  | | (_) |
# \____|_| |_|\__,_|_|\___|\__\__,_|_|  |_|\___/ 

# Operadores
= --> asignación
== --> igual
-eq --> igual
!= --> distinto
-ne --> distinto
< --> menor que
-lt --> menor que
<= --> menor o igual que
-le --> menor o igual que
> --> mayor que
-gt --> mayor que
-ge --> mayor o igual que 
>= --> mayor o igual que 
-z --> string null
-n --> string not null
-a --> and
&& --> and
-o --> or
|| --> or
+ --> suma
- --> resta
\* --> mutiplicación
/ --> división
% --> resto
** --> potencia
+= --> suma y asigna
-= --> resta y asigna
*= --> mutiplica y asigna
/= divide y asigna
%= resto y asigna

# Estructuras de control

# if [[ "$a" < "$b" ]]
# if [ "$a" \< "$b" ]
# if [ "$a" -lt "$b" ]
# (("$a" < "$b"))


# If, else
if [ ¿? ]; then
    ¿?
else
    ¿?
fi

# While / until
while [ ¿? ]
do
    ¿?
done

# For
for i in ¿?
do
    ##
done

# Case
case i in
  A) ¿? ;;
  B) ¿? ;;
  C) ¿? ;;
esac


# Imprime por pantalla el id de usuario, si es root será 0
id -u


# Devuelve 0 si el comando anterior se ejecutó correctamente
$?

# Devuelve la salida a /dev/null (a nada) y la salida de errores la redirige a stdoutput
echo "Hola" > /dev/null 2<&1

# Oculta el cursor
tput civis
# Muestra el cursor
tput cnorm

# Salto de línea
\n
# Salto de tabulación
\t

# -e se come las expresiones \ 
echo -e "\n${redColour}Hola"

# Trap ejecuta una funcion dependiendo de la señal con la que ha finalizado el proceso, en este caso interrupción (ctrl+c)
# (kill -l) --> INT, EXIT, TERM
trap control_c INT

# Ojo al declare y al declare -i parameter_counter=0; while getops :x:y: arg; do
while getopts "h:s:" arg; do
  case $arg in
    h)
      echo "usage" ;;
    s)
      strength=$OPTARG
      echo $strength ;;
  esac
done

# El comando find es muy potente, parámetros y todo lo que podemos hacer con find
find <directory_path> <search_parameter>

argumentos:
    -name, -iname
    -type --> f,d,l
    -size, -empty --> c, k, M, G, b (+/-100G)
    -ctime, -mtime, -atime (creación, modificación, acceso)
    -user, -group
    -perm --> 775
    -and
    -or
    -not
    -maxdepth (profundidad de recursión)
    -mindepth
    -exec (permite ejecutar comando al resultado del find)

    -ok (como el exec pero fuerza la confirmación interactiva del usuario)
# xargs va acompañado al paid(tuberia), recoje la salida del comando anterior y lo pasa como argumentos al comando definido.
find . -name archivo.txt | xargs cat


# cut, recorta la salida con el formato deseado.
cut <option> <file>
options:
    -f (fields)
    -c (characters)
    -d (delimiter)
# Corta y muestra la salida de el segundo field delimintado por ' '
cut -f2 -d ' ' <archivo>
# Muestra los caracteres definidos
cut -c 1-10 <archivo>
# El cut se puede utilizar a continuación de un paid para tratar la salida del comando anterior
echo "Hola mundo" | cut -c 1-3


# tr, remplazar los characters de la salida con el formato deseado. Se utiliza con paid para tratar la salida del comando anterior
# Noramlmente en OPTION hay dos opciones, que quieres remplazar y a que quieres remplazar
echo "Hola mundo!" | tr "[:lower:]" "[:upper:]"

-c (la negativa, "la que no sea...")
-d delete (elimina los caracteres del set1)
-s sustituye las secuencias de repetidas occurrencias

[:lower:] todas las mayusculas
[:upper:] todos las minusculas
[:digit:] todos los digitos
[:space:], [:blank:] todos los espacios en blanco horizontales
[:alpha:] todas las letras
[:alnum:] todas las letras y numeros

# Todas las minusculas a mayusculas
echo "Hola mundo!" | tr "[:lower:]" "[:upper:]"
# Todo lo que no contecga A me lo pones a t
echo "Abc123d56E" | tr -c 'A' 't'
# Las secuencias de ' ' me las sustituyes por un ' ' 
echo "GNU     \    Linux" | tr -s ' '


# sed; reemplazar el texto en un archivo sin acceder a este.
-s (sustitución, solo la primera aparición NO todas)
/ (delimitadores)
    primera posición del delimitador es el patrón de búsqueda
    segunda posición del delimitador es la cadena de remplazo
    tercera posición del delimitador es el numero de apariciones que actuará, en este caso 2. Utilizamos 'g' para todas las apariciones.
5 (podemos indicar que línea especifica debe acutar --> sed '5 s/Microsoft Windows/GNU Linux/2' fichero.txt)
5,10 (podemos indicar un rango de lineas donde debe acutar --> sed '5,10 s/Microsoft Windows/GNU Linux/2' fichero.txt)
5d (podemos eliminar una fila de un fichero --> sed '5d' fichero.txt)
5,10d (podemos eliminar un rango de filas de un fichero --> sed '5,10d' fichero.txt)

sed 's/Microsoft Windows/GNU Linux/2' fichero.txt


# Falta trabajar con awk