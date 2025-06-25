# Trabajo practico Integrador - Compiladores

## Integrantes

- Josue Gatica Odato
- Mateo Asenzo
- Lucas Latessa

### Descargar el repositorio:

- En el caso de tener Git instalado en su computadora, es posible descargar el proyecto realizando un clone del mismo. Abriendo una terminal en su computadora, ingrese el siguiente comando:

```
git clone https://github.com/JosueGaticaOdato/Integrador-TEOI.git
``` 

- En el caso de no tener Git, es posible descargar el ZIP del repositorio dando click en el siguiente enlace

``` 
https://github.com/JosueGaticaOdato/Integrador-TEOI/archive/refs/heads/main.zip
``` 

## Material:

- Analizadores/Lexico.flex: El archivo jflex con todas las expresiones regulares
- Analizadores/Sintactico.cup: El archivo sintactico con las reglas definidas
  
- Compilador/src: Codigo fuente del proyecto
- Compilaador/entrada.txt: Archivo entrada que recibira el compilador
- Compilaador/ts.txt: Tabla de simbolos construida
- Compilaador/arbo.png: Arbol construido luego de compilar
- Compilaador/ContarPrimos.asm: Assembler generado luego de compilar


## Instrucciones:

- (Desde el eclipse) Agregar el jar "java-cup-11b-runtime" al build path del proyecto
- Ejecutar la aplicacion desde el eclipse, o tambien puede ejecutarse con el .jar en consola usando:

```
java -jar Entregables/Compilador.jar
``` 

- Indicar el archivo de prueba que se quiere agregar al editor para compilar, caso contrario se puede utilizar la misma aplicacion como IDE
- Compilar el programa

### Cambios en Analizador Lexico:

Si se decide realizar algun cambio en el archivo lexico.java, es necesario realizar las modificaiones necesario en el archivo "Lexico.flex". Luego, compilar nuevamente el Jflex con el siguiente comando

```
java -jar jflex-full-1.7.0.jar Lexico.flex
``` 

El nuevo archivo Lexico.java se reemplaza por el viejo archivo en la carpeta del proyecto.

### Cambios en Analizador Sintactico:

Si se decide realizar algun cambio en los archivos parser.java y sym.java, es necesario realizar las modificaiones necesario en el archivo "Sintactico.cup". Luego, compilar nuevamente el java-cup con el siguiente comando

```
java -jar java-cup-11b.jar Sintactico.cup
``` 

Los nuevos archivos parser.java y sym.java se reemplazan por los viejos archivos en la carpeta del proyecto.