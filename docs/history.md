[<< back](../index.md)

# Historia

`teuton-panel` es la idea para una nueva biblioteca (gema) en el ecosistema de Teuton.

Al principio sólo pensamos en ir añadiendo nuevas features a `teuton` pero después de algunas pruebas pensamos que lo más conveniente sería agrupar esas features y crear un proyecto independiente. `teuton` tiene como objetivo los test: lanzarlos, revisarlos, etc. Sin embargo las nuevas features que habíamos pensado tienen más que ver con añadir una capa de funcionalidades extras relacionadas con la forma de interactuar con el propio Teuton. Sería una especie de interfaz de Teuton con mejorar.

# 1. Contexto

* Historia de ebotas
* Ideas anteriores pendientes

# 2. Caso de uso Ebota

Primero comento con más detalle mi caso de uso, que es con lo que comparo el servidor que has hecho.
* Ahora mismo estoy enseñado uso básico del terminal. 
* Creación de carpetas, ficheros, , cp, rutas, filtros...los alumnos trabajan solo con el terminal. 
* Su cliente no tiene GUI (sí que tienen, pero los obligo a conectarse por terminal ssh)

## 2.1 Proceso de la sesión de clase Ebota

1. Enciendo mi cutreservidor
2. Pongo teuton run cada minuto (watch -n 60 teuton run test)
3. Muestro en el proyector (mitad de la pantalla) un navegador con la web /list que muestra todos los usuarios, y que se refresca cada 10 segundos (el refresco lo añadí después de pasaroslo)
4. Muestro en la otra mitad del proyector, el teuton run. Por suerte se ve la tabla de resultados al hacer un watch -n 60 teuton run test, y se va re ejecutando cada minuto.

Con esto yo puedo pasear por la clase e ir ayudando sin tener que preocuparme de nada en el servidor.
Miro en el proyector los que tienen una nota más baja para ayudarlos, y felicito a los que van terminando. E incluso puedo ver fácilmente quienes están en clase y aún no se han ni siquiera registrado en el servidor.

Si un alumno llega tarde, simplemente se añade al servidor, y en la siguiente ejecución del teuton run ya sale en el marcador. No tengo que hacer nada en el servidor.

