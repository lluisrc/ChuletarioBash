# Chuletario

## Estructuras de control
### If, else
```
if [ ¿? ]; then
    echo "Soy true"
else
    echo "Soy false"
fi
```

### While / until
```
while [ ¿? ]
do
    ¿?
done
```

### For
```
for i in ¿?
do
    echo "$i"
done
```

### Case
```
case i in
  A) ¿? ;;
  B) ¿? ;;
  C) ¿? ;;
esac
```

## Operadores para las comparaciones
| Elemento | Descripción |
|:--------:|-------------|
| == | Igual (str) |
| -eq | Igual (int) |
| != | Distinto (str) |
| -ne | Distinto (int) |
| < | menor que |
| -lt | menor que (int) |
| <= | menor o igual que |
| -le | menor o igual que (int) |
| > | mayor que | |
| -gt | mayor que (int) |
| -ge | mayor o igual que (int) |
| >= | mayor o igual que |
| -z | string null |
| -n | string not null |
| -a, && | and |
| -o, \|\| | or |

## Operadores para los int
```
[user@serverlinux ~]$ echo "$((5 + 3))"
8
```
| Elemento | Descripción |
|:--------:|-------------|
| + | suma |
| - | resta |
| \\* | mutiplicación |
| / | división |
| % | resto |
| ** | potencia |
| += | suma y asigna |
| -= | resta y asigna |
| *= | mutiplica y asigna |
| \/= | divide y asigna |
| \%= | resto y asigna |

## Imprime por pantalla el id de usuario, si es root será 0
```
[root@serverlinux ~]# id -u
```

## Mantenimiento de usuarios
### Crear usuario
```
[root@serverlinux ~]# useradd lroca
```

### Crear grupo
```
[root@serverlinux ~]# groupadd docker
```

### Añadir usuario a grupo
```
[root@serverlinux ~]# usermod -aG docker lroca

-a, append (sin la -a, remplaza)
-G, define el grupo como secundario
-g, define el grupo como primario
```

## Grep
Imprime las lineas que contenga el argumento
| Argument | Description |
|:--------:| ----------- |
| -r | Busca recursivamente. |
| -i | Ignore case sensetive. |
| -v | Invert match. |
| -c | Output count of matching lines only. |
| -l | Output matching files only. |
| -n | Precede each matching line with a line number. |
| -b | A historical curiosity: precede each matching line with a block number. |
| -h | Output matching lines without preceding them by file names. |
| -s | Suppress error messages about nonexistent or unreadable files. |
| -f | file: Take regexes from a file. |
| -o | Output the matched parts of a matching line. |
| --help | Get help. |
| -V, --version | Show version. |
| --regexp=pattern | in addition to -e pattern. |
| --word-regexp | in addition to -w. |
| --line-regexp | in addition to -x. |
| -A num | num lines to show After grep line. |
| -B num | num lines to show Before grep line. |
| -C num | num lines to show Context(after and before) grep line. |
```
[user@serverlinux ~]$ grep error /var/log/app.log
```
Grep también puede ser complementado con la salida del comando anterior gracias al pipe "|"
```
[user@serverlinux ~]$ cat /var/log/app.log | grep error
```

## $?
Devuelve 0 si el comando anterior se ejecutó correctamente.
```
[user@serverlinux ~]$ mkdir test01
[user@serverlinux ~]$ echo "$?"
0

[user@serverlinux ~]$ ls /path/do/not/exist
[user@serverlinux ~]$ echo "$?"
1

[user@serverlinux ~]$ dfajsdlf (comando no existe)
[user@serverlinux ~]$ echo "$?"
127
```

## /dev/null
Devuelve la salida a /dev/null (a nada) y la salida de errores la redirige a stdoutput
```
[user@serverlinux ~]$ echo "Hola" > /dev/null 2<&1
```

## Mostrar/Ocultar el cursor
```
Muestra el cursor
tput cnorm

Ocultar el cursor
tput civis
```

## Formatear salida con echo
La salida la podemos imprimir con el comando echo
```
[root@serverlinux ~]# echo "Soy lroca"
```
### Parámetros
| Argument | Description |
|:--------:| ----------- |
| -e | Interpreta el carácter \\ como acción |
| -n | No hace un "intro" de después de imprimir |

### Formatos \¿?
| Argument | Description |
|:--------:| ----------- |
| \b | Quita los espacios en blanco |
| \n | Salto de línea |
| \t | Tabulación |
| \v | Sangría a la derecha |
| \r | Vuelve el cursor al principio de la linea |
| \c | El prompt continúa |
| \a | Alerta de sonido ¿? |
| \e\[0;31m | Color Rojo |


## Trap
Trap ejecuta una funcion dependiendo de la señal con la que ha finalizado el proceso, en este caso interrupción (ctrl+c)<br>
Para ver el listado de señales con los que puede finalizar un proceso: INT, EXIT, TERM...
```
[user@serverlinux ~]$ kill -l
```
INT es cuando se interrumpe un proceso (equivalente al típico ctrl+C)
```
trap control_c INT

control_c () {
        echo -e "\nAdioooos!!"
        exit 1
}

La función control_c se ejecuta cuando el script como proceso se detiene con señal INTerrumpida.
```

# getops
```
[user@serverlinux ~]$ ./script.sh -n lroca -c Mallorca
I am lroca
And I live in Mallorca
```
Code:
```
while getopts n:c: opt
do
    case "$opt" in
          n) name=$OPTARG;;
          c) country=$OPTARG
     esac
done

echo "I am $name";
echo  "And I live in $country";


$OPTARG captura los argumentos pasados en los parámetros
```

## find
```
[user@serverlinux ~]$ find <directory_path> <search_parameter>
```
| Argument | Description |
|:--------:| ----------- |
| -name, -iname | Quita los espacios en blanco |
| -type f/d/l | tipo de objeto file, dir, link |
| -empty, -size b, k, M, G | Tamaño del archivo (+100G) |
| -ctime, -mtime, -atime s,m,h,d,M | Tiempo de creación, modificación, acceso (+30d) |
| -user, -group | Usuarios y grupos especificos |
| -perm | Permisos especificos (775) |
| -and | Y |
| -or | O |
| -not | Inversa |
| -maxdepth | Máxima profundidad de recursión |
| -mindepth | Mínima profundidad de recursión |
| -exec | Ejecuta el -exec al resultado del find (como el xargs) |
| -ok | Lo mismo que -exec pero con confirmaci |

## xargs
La salida del comando anterior se utilizará como argumento en el parámetro de xargs
[user@serverlinux ~]$ find . -name archivo.txt | xargs cat
[user@serverlinux ~]$ ls kernel* | xargs rm -f


## cut
Recorta la salida con el formato deseado.
[user@serverlinux ~]$ echo "Hola-Mundo-Como-Estás" | cut -d "-" -f2
Mundo

| Argument | Description |
|:--------:| ----------- |
| -f | fields |
| -c | characters |
| -d | delimiter |

## tr
remplazar los characters de la salida con el formato deseado. Se utiliza con paid para tratar la salida del comando anterior
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

Si no le se añade parametro muestra la modificación en el output pero no se aplica en el archivo
sed 's/Microsoft Windows/GNU Linux/2' fichero.txt

-i se aplica los cambios en el archivo
sed -i 's/^que .*$/el contenido de la línea ha sido reemplazado/' sedexamples

Nota: La magia del último comando la realiza la expresión regular ^que .*$. La parte ^que hace referencia a todas las líneas que empiezan por la cadena de caracteres que. El punto . hace referencia a cualquier letra que aparezca las veces que aparezca * hasta el final de la línea$.

sin el -i te muestra por pantalla las modificaciones pero no aplica al archivo,
con el -i aplica las modificaicones en el archivo.
los comodines \ sirven para poner "/" como caracter --> \/


# tcpdump, este comando captura los paquetes que viajan por la red. Mas tarde, estos paquetes se pueden analizar con wireshark
tcpdump <argumentos>
# mas info en --> https://danielmiessler.com/study/tcpdump/
-w <output.pcap> --> donde output podemos poner el nombre/ubicación donde se guarda el archevo
host <host> --> analiza los paquetes (entrantes  y salientes) del host
port <nº puerto> --> filtra los paquetes y caputura solo los del puerto definido
-v / -vv --> muestra más detalle en la salida del comando
src --> solo captura los paquetes de origen en la comunicación
dest --> solo captura los paquetes de destinatario en la comunicación
-i --> para que escuche por una interfaz de red especifica


rlwrap --> hace un historico de comandos para utilizar las fechas de arriba y abajo y cambiar de comando mas rapido


# awk
Imprime la primera columna (por defecto el delimitador es el espacio)
ps | awk '{print $1}'

Imprime la primera columna pero NO la primera fila
ps | awk 'NR>1{print $2}'

Cambiar el delimitador
-F ":"
cat /etc/passwd | awk -F ":" '{print $1}'

Mostrar coincidencias (como un grep)
awk '/^tmpfs/ {print}'

Contar el numero de líneas (como un wc -l)
awk '{print NR}' /etc/shells

Imprimir la primera/rango linea
awk 'NR==1{print $0}'
awk 'NR>2{print $0}'
awk 'NR==2, NR==4 {print $0}'


# Como crear un servicio en linux.(link tuto tomcat service )


# Personalizar prompt
Se configura en ~/.bashrc con la variable PS1=""

Customizar el prompt:
\u : Nombre del usuario actual.
\h : Nombre del host hasta el primer punto (.), por ejemplo, orion del host orion.zeppelinux.es.
\H : Nombre del host completo.
\w : Path del directorio de trabajo actual.
\W : Nombre del directorio de trabajo actual.
\d : Fecha actual en formato (dia_semana mes día, lun jul 27.
\t : Hora actual en formato 24 horas (HH:MM:SS).
\T : Hora actual en formato 12 horas (HH:MM:SS).
\@ : Hora actual en formato 12 horas (am/pm).
\n : Nueva línea.
\r : Retorno de carro (enter/intro).
\s : Nombre de la shell.
\v : Versión de bash.
\V : Numero de la release de bash.
\! : Número en el historial del comando ejecutado.
\# : Número de comando de este comando.
\$ : Si se trada de un usuario normal, aparece un $. Si se trata del usuario root, aparece un #.
\\ : Barra diagonal.
\[ : Inicio de una secuencia de caracteres no imprimibles.
\] : Fin de una secuencia de caracteres no imprimibles.


Expresiones regulares (regexp)
https://www.tutorialspoint.com/unix/unix-regular-expressions.htm