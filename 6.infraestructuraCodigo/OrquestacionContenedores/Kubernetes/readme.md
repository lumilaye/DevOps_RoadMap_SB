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

***Docker y Kubernetes***
* Docker se encarga principalmente de gestionar los contenedores
* Kubernetes es una evolución de los proyectos de Google Borg y Omega
* Todos los cloud providers ofrecen servicios de managed k8s utilizando docker como su container run time

***Kubernetes en la práctica***
* Permite correr varias replicas y asegura que todas se encuentren en funcionamiento
* Provee un balanceador de carga automaticamente
* Define diferentes mecanismos para hacer roll-outs de código
* Politicas de scalling automaticas
* Jobs batch

<br>

***Arquitectura de Kubernetes***

![Solution Overview](../../../assets/images/kuber_2.png)

Nodo Master

API Server: A lo que todo se conecta los agentes, el CLI, el dashboard etc. Cuando se cae un nodo master es lo que se pierde. Se usa el algoritmo de ruft para algoritmo de elección.

Scheduler: Cuando se deben crear un job, un pod en máquinas específicas, el scheduler se encarga de asignar las tareas y administrar los flujos de trabajos, revisando siempre las restricciones y los recursos disponibles.

Controller Manager: Es un proceso que está en un ciclo de reconciliación constante buscando llegar al estado deseado con base al modelo declarativo con el que se le dan instrucciones a K8s.

* Tipos de controller manager:
  
Reply manager

Deployment manager

Service manager

Etcd: Key value store que permite que el cluster este altamente disponible.

* Componentes muy importantes que viven en los nodos:

Kubelet: Agente de kubernetes, se conecta con el control play y le pregunta que recursos (pods, contenedores) debo correr al scheduler via API Server. Monitorea los pods constantemente para saber si están vivos, los recursos disponibles etc y le comunica constantemente al scheduler via API Server.

Kube-proxy: Se encarga de balancear el tráfico que corre en nuestros contenedores/servicios. Una vez llega una request se encarga de decidir a que pod y contenedor debe de ir.

Nodos == Minions

Todos los nodos y masters están conectados a una red física para poder hablarsen entre sí.

---
## Componentes principales de Kubernetes

**Node:** Servidor simp[le o maquina virtual.

**Pod:** 
* Componente basico o unidad mas pequeña de kubernetes
* Es la abstracción de un contenedor de docker
* Usualmente se usa un pod por cada aplicación
* Cada Pod recibe una dirección IP y cada pod puede comunicarse con los otros Pods usando esta dirección IP 
* Cuando un Pod muere y se vuelve a crear, se le asigna una dirección IP nueva
  
**Service:**
* Es una estatica o permanente dirección IP que se le puede asignar a los pods 
* El cilo de vida de los Pos y los Service no estan conectados y son independientes el uno del otro
* Load balancer integrado

**Ingress:**
* Se encarga de enrutar las solicitudes de cliente, la solicitud primero pasa por el ingress y este hace el reenvio al service

**Config Map:**
* Confioguración externa de las aplicaciones 
* ConfigMap es solo para uso de datos no confidenciales 

**Secret:**
* Es similar a configMap pero la diferencia esta en que  este se usa para datos privados o secretos, como credenciales

**Volume:**
* Vincula un almacenamiento fisico con un Pod
* El almacenamiento puede estar en una maquina local o en el mismo server nodo donde el pod esta corriendo

**Deployment:**
* Especifica cuantas replicas se crearan
* Define si se escala hacia arriba o haci abajo 
* Abstracción de los Pods que resulta mas convenientes para la interacción con las replicas y para hacer otras configuraciones
* Un template para crear Pods

**STATEFULSET:**
* Este componente esta destinado especificamente para aplicaciones como bases de datos 
* (las bases de datos son comunmente hosteadas fuera del cluster de kubernetes por que trabajarlo dentro del cluster resulta bastante tedioso)
  
---
## Configuración de Kubernetes

Cada archivo de configuración en Kubernetes tiene 3 partes:

1. Metadata - Nombre del componente y sus partes
2. Espoecificación - pones todos los tipos de configuración que deseas aplicar para tu componente 
3. Status - Generado y a'adido automaticamente por kubernetes, kubernetes siempre compara cual es el status deseado con el estado actual del componente, si estos estados son diferentes kubernetes sabe que debe arreglarlo 

```yaml
## Declaras que quieres crear
apiVersion: apps/v1
kind: Deployment

metadata:
    nginx-deployment
    labels: ...

spec:
    replicas: 2
    selector: ...
    template: ...

```

