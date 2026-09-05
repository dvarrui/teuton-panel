[<< back](../index.md)

# teuton-panel

`teuton-panel` es la idea para una nueva biblioteca (gema) en el ecosistema de Teuton.

Al principio sólo pensamos en ir añadiendo nuevas features a `teuton` pero después de algunas pruebas pensamos que lo más conveniente sería agrupar esas features y crear un proyecto independiente. `teuton` tiene como objetivo los test: lanzarlos, revisarlos, etc. Sin embargo las nuevas features que habíamos pensado tienen más que ver con añadir una capa de funcionalidades extras relacionadas con la forma de interactuar con el propio Teuton. Sería una especie de interfaz de Teuton con mejorar.

# 1. Nueva gema teuton-panel (v2.0.0)

> Consultar en el repostorio `teuton-panel`. EN PROCESO!!!

Este TO-DO debería estar en el propio repo de la nueva gema.

* Crear nueva gema `teuton-panel` (v2) que sustituirá la versión obsoleta actual.
* Modificar/ampliar las funciones de `teuton config` para facilitar el trabajo a `teuton-panel`.
    * tt_include
    * tt_include_params
    * aplanar/desaplanar config file.
* En las pruebas hemos usado `sinatra` para implementarlo.

Funcionalidades del interfaz web:

* config cases: 
    * config/remote: 
      * accept-remote-config. activar/desactivar configuraciones remotas
      * Aceptar post formulario y vía get curl con ruta.
    * config/list: mostrar listado con info de alumnos
    * Elegir ubicación de almacenamiento de las configuraciones
* run:
    * Ejecutar por el profesor
        * Todos
        * Una selección de cases
        * every: repeticiones en bucle de I iteraciones, cada T tiempo.
    * El alumno solicita su propia ejecución vía curl
    * Elegir ubicación de almacenamiento de los informes
    * Al finalizar cada ejecución se muestre un listado con los resultados
* readme/doc:
    * activar auto "teuton doc" a página web para los alumnos.
* config panel:
    * panel/new: crear fichero de configuración del panel
    * panel/save: save configuración del panel

# 2. Modo de uso

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