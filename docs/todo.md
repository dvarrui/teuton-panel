[<< back](../index.md)

# teuton-panel

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

# 3. Comentarios sobre tu servidor

## App: teuton server

**Problem**:

* Cuando el profesor está esperando las altas de los alumnos, no tiene una forma fácil de ver quién ya está y quién no. Si mira el directorio config.d verá solo las IP.
* **FEATURE**: Esto se puede solucionar permitiendo "get /list" para mostrar `tt_members` y `tt_source_ip` recopilados hasta el momento. Activar/desactivar según el profesor.

**Problem**:

* Cuando no existe el fichero config.yaml antes de levantar el servidor, el formulario del servidor no pide la IP (host_ip) y el fichero config.yaml no se crea hasta que no cierra el servidor. por lo tanto no puedo lanzar los tests hasta cerrar el servidor.
* PERO si antes de levantar el servidor creo el fichero con la propia salida de config, por ejemplo teuton config test/ > test/config.yaml. Y a continuación levanto el servidor el formulario pide los datos propuestos en el config (muy interesante esta aproximación a formulario dinámico!!)
* PERÒ, como el config propuesto, no incluía el include de los config, hasta que no pare el servidor, no puedo lanzar teuton.
* Una vez parado el servidor, este escribe el include en el config, y entonces se puede volver a levantar, y como ya tiene el include de config.d, los nuevos clientes se van añadiendo. Y, por lo tanto, puedo ir ejecutando teuton run
* Quizas la propuesta de fichero config debería incluir el include ¿?¿?
* Es más, quizás, si el servidor no encuentra config.yaml, que directamente lo cree con la propuesta basica y el include

 **FEATURE**: Esto se puede solucionar creando el fichero `config.yaml` nada más iniciar el servidor.

**Problem**

* los tt_members solo tienen source_ip y no tienen host_ip
* aparece un tt_members: anonymous ¿?
* con alumnos de primero es muy fácil que pongan mal su propia IP (me ha pasado a mí mismo haciendo pruebas :-D) Me gustaría alguna opción para que la IP, sí o sí, la cogiera de la conexión. Quizás pre-rellenando el formulario sería suficiente. El valor ya lo coges pq. ya lo escribes en el texto del formulario. Si campo host_ip := CLIENT_IP :-D
* Quizás un valor auto en el config.yaml podría hacer que el formulario lo prerellenara

* **FEATURE**: Esto se puede solucionar definiendo parámetros con `tt_include_params`.
```yaml
config:
  tt_include: config.d
  tt_include_params:
    tt_members: AS NAME
    tt_moodle_id: AS EMAIL
    host_ip: AUTO IP
cases: []
```

**DUDA**

- Y en los logs lo mismo. Quizás si en el log, después de cada submit mostrará todos los nombres o algo similar sería más cómodo.

**Problem**

* La petición, el submit del formulario, solo funciona con post, por lo tanto desde la línea de órdenes es un poco más complicado. Yo tengo algunos casos de uso en el que los alumnos solo disponen de un ubuntu server, sin gui, solo cli.
* He probado con el navegador lynx de terminal y funciona.
* Aunque con los alumnos me gusto esto de hacer cosas web desde terminal con curl solo empezar el curso. Les descoloca bastante y es una primera aproximación si mundo de las API web :-D
* **FEATURE**: aceptar http y curl

---
Vaya, que me gusta tu solución, sobre todo la parte dinámica.
Creo necesario que un usuario nuevo pueda usarlo directamente, sin tener que escribir nada en el config.yaml.
Básicamente incluyendo el include siempre en la propuesta, y quizás añadir algún comentario en el mismo fichero, para cuando ya son profesores más avanzados, indicando que si todos los alumnos tienen el mismo user y pass, puede definirlos en el apartado global y quitarlos del formulario.

Gracias por la integración!!!


# 4. Modo de uso

* Ejecutar el comando `teuton-panel`.
* Localizar "tests de teuton" disponibles.
    - Si no se encuentra ninguno no tiene sentido iniciar el "panel".
* Localizar el fichero de configuración `teuton-panel.yaml`.
    - Se crea si no existe.
* Para continuar:
    - Tenemos localizado un test de teuton sobre el que vamos a trabajar
    - Tenemos localizado el fichero de configuración del panel para guardar los ajustes.

Opciones disponibles en el panel

* tests: gestionar los tests
    - Ver listado de test disponibles (`/tests/list`)
    - Activar un test
        - Es necesario tener un fichero de configuración con `tt_include`, etc.
* cases: gestionar los cases del test activo
    - Activar/desactivar cases (`tt_skip: true/false`)
* run: Ejecutar el test seleccionado
    - Ejecutar una vez (`/run/once`)
    - Ejecutar varias veces (`/run/times/N`)
    - Ejecutar de forma periódica (`/run/every/N`)
        - Tiempo entre ejecuciones
        - Fecha/hora límite
    - Enable/disable remote "run" (`/run`)
* panel:
    - Enable/disable http y/o curl remote access
    - Enable/disable show cases list (`/cases/list`)
    - Enable/disable show readme (`/readme`)
    - Enable/disable remote config (`/config`)

Como resultado el alumno podrá tener acceso a:

* `/config`
* `/run`
* `/list`
* `/readme`

# 5. tt_include

```yaml
global:
  tt_include: config.d
  tt_params:
    tt_members: AS NAME
    tt_moodle_id: AS EMAIL
    host_ip: AUTO IP
```