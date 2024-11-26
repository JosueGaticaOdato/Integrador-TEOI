# Trabajo practico Integrador - TEOI - Grupo 01

## Integrantes

- Josue Gatica Odato
- Franco Zoia
- Mateo Asenzo
- Lucas Latessa
- Enzo Bianchi

### Material:
- Lexico.flex: El archivo jflex con todas las expresiones regulares
- Sintactico.cup: El archivo sintactico con las reglas definidas
- prueba.txt: Archivo de pruebas generales para el analizador
- ts.txt: Tabla de simbolos construida
- AnalizadorLexico: Codigo fuente del proyecto

### Instrucciones:

- (Desde el eclipse) Agregar el jar "java-cup-11b-runtime" al build path del proyecto
- Ejecutar la aplicacion desde el eclipse, o tambien puede ejecutarse con el .jar en consola usando:

```
java -jar AnalizadorSintacticoGrupo01.jar
``` 

- Indicar el archivo de prueba que se quiere agregar al editor para compilar, caso contrario se puede utilizar la misma aplicacion como IDE
- Compilar el programa

### Cambios en Analizador Lexico:

Si se decide realizar algun cambio en el archivo lexico.java, es necesario realizar las modificaiones necesario en el archivo "Lexico.flex". Luego, compilar nuevamente el Jflex con el siguiente comando

```
java -jar jflex-full-1.7.0.kar Lexico.flex
``` 

El nuevo archivo Lexico.java se reemplaza por el viejo archivo en la carpeta del proyecto.

### Cambios en Analizador Sintactico:

Si se decide realizar algun cambio en los archivos parser.java y sym.java, es necesario realizar las modificaiones necesario en el archivo "Sintactico.cup". Luego, compilar nuevamente el java-cup con el siguiente comando

```
java -jar java-cup-11b.jar Sintactico.cup
``` 

Los nuevos archivos parser.java y sym.java se reemplazan por los viejos archivos en la carpeta del proyecto.
