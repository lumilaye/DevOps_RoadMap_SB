# Correr un contenedor
  
    - docker run <image-name> 
    -> docker run hello-world
    
    - docker run --name <new-name> <image-name> (correr un contenedor y ponerle un nombre en especifico)
    -> docker run --name hi-world hello-world

    Nota: no podemos tener dos contenedores con el mismo nombre

## Correr un contenedor en modo iterativo:
    - docker run -it <image-name> 
    -> docker run -it ubuntu

## Correr un contenedor un modo separado(detached) o en backgorund: 
    - docker run -d <imagen-name> 
    -> docker run -d ubuntu

## Correr un contenedor y a continuación ejecutar un comando en especifico:
    - docker run <image-name> <comando-en-especifico> -> docker run ubuntu tail -f /dev/null

## Correr un contenedor con un limite de memoria:
    - docker run --memory <capacidad-memoria> <image-name> 
    -> docker run --memory 1g platziapp

## Exponer un contenedor en un puerto especifico de mi maquina:
    - docker run -p <puerto maquina anfitriona>:<puerto contenedor> <image-name>
    -> docker run -p 8080:80 nginx
## Enviar una variable de entorno al contenedor
    - docker run --env <NAME_VAR_ENV>=<var_env_value> <image-name>
    -> docker run --env MONGO_URL=mongodb://db:27017/test platziapp



# Ver los logs de un contenedor:
    - docker logs <container-id or container-name> 
    -> docker logs proxy
    
    - docker logs -f <container-id or container-name> 
    -> docker logs -f proxy
    
    - docker logs --tail <numero de las ultimas lineas> <container-id or container-name> +
    -> docker --tail 10 logs proxy (ver las ultimas 10 lineas de los logs de proxy)


# Renombrar un contenedor:
    - docker rename <old-name> <new-name> 
    -> docker rename hello-world hola-mundo


# Ver estadísticas de los contenedores:
    - docker stats

# Listar los contenedores:
    - docker ps (contenedores activos)
  
    - docker ps -a (listar todos los procesos incluso los que hayan terminado)
    
    - docker ps -aq(listar todos el id de todos los contenedores, incluso los que han terminado)

# Inspeccionar o ver toda la información de un contenedor:
    - docker inspect <container-id> 
    -> docker inspect 43c73e1e92dd

    - docker inspect <container-name> 
    -> docker inspect crazy_shirley

## Inspeccionar información filtrada de un contenedor:
    - docker inspect --format '<filtro de busqueta>' <container-name or container-id>(recordar que es un formato json)
    -> docker inspect --format '{{.State.Pid}}' miubuntu (obtener el pid del proceso principal del contenedor ubuntu)


# Parar un contenedor:
    - docker stop <container-id or container-name> 
    -> docker stop miubuntu

    - kill -9 <pid del proceso principal del contenedor>


# Eliminar todos los contenedores (incluso los que han terminado):
    - docker rm -f $(docker ps -aq)
  
# Eliminar un contenedor:
    - docker rm <container-name or container-id> 
    -> docker rm hi-platzi
    -> docker rm 415add2bc6fb

## Eliminar todos los archivos cuando un contenedor se detenga:
    - docker run --rm <docker-image>

# Eliminar TODO lo que no se esta usando en el sistema:
    - docker system prune
  
# Eliminar todos los contenedores que estan parados:
    - docker container prune
    - docker container prune -f (forzarlo para que no se haga la pregunta de confirmacion)


# Ejecutar un comando en un contenedor que esta corriendo:
    - docker exec -it <container-name or container-id> <comando> 
    -> docker exec -it alwaysup bash (ejecutar un bash dentro de alwaysup(contenedor de ubuntu))



# Bind mounts

    atar o conectar un directorio del contenedor en la maquina anfitriona:
    - docker run -v <ruta-local>:<ruta-contenedor> mongo
        -> docker run -v /home/daniel/Cursos/Docker/dockerdata/mongodata:/data/db mongo



# Volumenes
    
## listar Volumenes existentes:
    - docker volume ls

## Crear un nuevo volumen:
    - docker volume create <volume-name> 
    -> docker volume create dbdata

## Montar un volume en un contenedor:
    - docker run --mount src=<volume-name>,dst=<ruta-contenedor> <docker-image>
    -> docker run --mount src=dbdata,dst=/data/db mongo (en caso de que el volumen no exista docker lo crea por nosotros)

# Copiar y pegar archivos de la maquina anfitriona hacia el contenedor:
    -docker cp <archivos> <container-name>:<destino-contenedor>
        -> docker cp prueba.txt copytest:/testing/test.txt

# Copiar y pegar archivos del contenedor hacia la maquina anfitriona:
    -docker cp <container-name>:<archivos> <nuevonombre-en-maquina-anfitriona> 
        ->docker cp copytest:/testing/test.txt localtesting.txt


# Imagenes

## Listar las imagenes disponibles en mi maquina:
    - docker image ls 
    - docker imagenes
    
## Descargar una imagen del repositorio local o docker hub:
    - docker pull <image-name> 
    -> docker pull ubuntu

## Buildiar una imagen:
    - docker build <directorio> (esto quiere decir que el proceso build tiene acceso a la ruta del directorio)
    -> docker build . 
    -> docker build -t ubuntu:platzi . (podemos agregarle nuestro propio tag)
    -> docker build -f <ruta-del-dockerfile> . (esto quiere decir que el dockerfile esta en otra ubicación)
    -> docker build -f build/production.Dockerfile .

## Retagear o crear un nuevo tag para una imagen
    - docker tag <nombre:imagen>:<tag:actual> <nuevonombre>
    -> docker tag ubuntu:platzi ubuntu:platzi2
    -> docker tag ubuntu:platzi danielmej25/ubuntu:platzi (para dockerhub)

## Ver el historial de capas de una imagen
    - docker history <image-name:tag> 
    -> docker history ubuntu:platzi


            
# Docker hub

## Log in o ingresar:
    - docker login
## subir una imagen a mi repositorio:
    - docker push <image-name> -> docker push danielmej25/ubuntu:platzi
    
# Network

## Listar las redes disponibles:
    - docker network ls
    
## Crear mi propia Network
    - docker network create <network-name> 
    -> docker network create platzinet
    -> docker network create --attachable platzinet (acoplable o permitir que los contenedores usen la red)

## Inspeccionar o ver mas información sobre una network
    - docker network inspect <network-name or network-id>

## Conectar un contenedor a una network
    - docker network contenedor <network-name> <container-name or container-id>
    -> docker network connect platzinet db





# Docker Compose
  
## Subir o ejecutar un docker compose(tiene que existir el docker-compose.yml):
    - docker compose up
    - docker compose up -d (ejecutar pero en modo detached)
    
# Buildiar o construir las imagenes en caso de que exista un Dockerfile para uno o varios servicios en nuestro archivo docker compose
    - docker compose build (en caso de que haya una imagen en algun servicio este se omite)
    - docker compose build <service-name> (build a un servicio en especifico)
    -> docker compose build app (build del servicio app)
    
## Listar los contenedores ejecutados(activos) con docker compose:
    - docker compose ps
    - docker compose ps -a (lista todos incluso los que se apagaron)
    
## Ver logs de los contenedores creados cond docker compose
    - docker compose logs 
    - docker compose logs <service-name or container-name> (ver los logs de un contenedor en especifico)
    -> docker compose logs app 

## Ejecutar un comando en un servicio o contenedor (no hace falta poner la bandera -it para el modo iterativo)
    - docker compose exec <service-name or container-name> <comando a ejecutar>
    -> docker compose exec app bash

## Bajar o destruir lo creado con docker compose
    - docker compose down 

## Escalar o haceer dos instancias o contenedores de un servicio
    - docker compose up --scale <service-name>=<numero-de-contenedores> (tener en cuenta el rango de puertos disponibles en el docker compose)
    -> docker compose up --scale app=2

    

            