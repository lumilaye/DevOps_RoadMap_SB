# Orquestacion de contenedores


# Kubernetes

## **Introducción a Kubernetes**

***Conceptos clave de contenedores:***

CGroups: Asignan a cada contenedor/proceso los recursos que va a utilizar (memoria, disco, cpu). Limitan el uso de recursos del sistema operativo para cada contenedor.

Chroot: Nos permite que nuestro proceso/container tenga visibilidad sobre archivos donde tiene que trabajar y no acceder a otros recursos del sistema.

Namespaces: (son 7, aqui los mas importantes):

Mount: Nos permite que nuestro proceso tenga una visibilidad reducida de los directorios. Esto permite que dos contenedores que trabajen sobre un sistema de archivos no se interfieran entre si.

Networking: Permite que cada contenedor tenga su dirección IP, su tabla de rutas, su interfaz de red, y que no interfiera con otros contenedores.

Concepto de POD: Entidad atomica scheduleable - Entidad sobre la cual kubernetes va a ejecutar los contenedores. (se verá en detalle más adelante).

PID o de proceso: si ejecutamos un ps cuando ejecutamos nuestro contenedor, vamos a ver que nuestro contenedor es el process id 1 y no vemos todo el resto de los procesos del SO. Esto es posible gracias al namespace de procesos. (se verá en detalle más adelante).


Link introduccion didactica: https://www.cncf.io/phippy/the-childrens-illustrated-guide-to-kubernetes/

<br>

![Recursos kubernetes](../../../assets/images/kuber_1.png)  