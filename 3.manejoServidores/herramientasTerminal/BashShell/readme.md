# Learn to live in Terminal
***
# Bash Shell 
## Componentes de Linux, Tipos de Shell y Comandos de información 
<br>

SH: También conocida como Shell Bourne, es la primera shell creada para un sistema operativo linux, se puede utilizar actualmente, pero se perderían funcionalidades como autocompletar archivos o el historial de comandos.

KSH: Escriba por el programador David Korn. Intenta combinar las características de la CSH, TCSH y SH.

CSH: En una shell diseñada para que los usuarios puedan escribir programas de scripting de shell con una sintaxis muy simiar a la de C. En muchas sistemas como Red Hat, csh es tcsh, una versión mejorada de csh.

BASH: También conocida como Shell Bourne-Again, es una versión actualizada de SH creada por la Free Software Fundation. Es una de la shell más utilizada y conocida en el mundo. Incorpora alguna de las funcionalidades más avanzadas de KSH, CSH, SH y TCSH. Una de la funcionalidades más destacables de esta shell es la opción de ejecutar múltiples programas en segundo plano a la vez.

ZSH: Potente intérprete de comandos que puede funcionar como shell interactiva y como intérprete de lenguaje de scripting. aún siendo compatible con Bash.

Más info: https://www.taringa.net/+linux/tipos-de-shells_wpzwm

<br>

## ¿Qué es el bash scripting?
La idea básica de bash scripting o **programación en shell** es poder ejecutar múltiples comandos de forma secuencial para automatizar una tarea en específico.

Estos comandos son colocados en un archivo de texto simple y ejecutados en una terminal por el usuario.

<br>

## Configuración vim terminal 
.vimrc = vim resource configuration file. <br>Creando este archivo en nuestro directorio home podemos agregar caracteristiocas visuales que nos ayudaran a la hora de crear los scripts en bash.

En este enlace se puede crear .vimrc facilmente: https://vimconfig.com/

Ejemplo:

```sh
set number # Show line numbers
set linebreak # Break lines at word (requires Wrap lines)
set showbreak=+++ # Wrap-broken line prefix
set textwidth=100 # Line wrap (number of cols)
set showmatch # Highlight matching brace
set visualbell # Use visual bell (no beeping)
set hlsearch # Highlight all search results
set smartcase # Enable smart-case search
set ignorecase # Always case-insensitive
set incsearch # Searches for strings incrementally
set autoindent # Auto-indent new lines
set shiftwidth=4 # Number of auto-indent spaces
set smartindent # Enable smart-indent
set smarttab # Enable smart-tabs
set softtabstop=4 # Number of spaces per Tab
```

## Ejecutar script 

* Asignar permisos --> chmod =x nombredelarchivo.sh
* Ejecución
    * bash nombredelarchivo.sh
    * ./nombredelarchivo.sh
* Validar que el nombre del script no existe o se encuentra reservado
    * type: nos indica tipo y ubicación
    * type -a : todos los archivos encontrados
    * type -t : tipo de archivo

<br>

## Declaración de Variables y Alcance en Bash Shell

**Variables de entorno**:
Ayudan a obtener infromacion del sistema, almacenar informacion temporal y modificar su informacion. Existen 2 tipos:

*   Variables Globales: Son visibles desde el shell que lo creo o desde cuaquier hijo de esa shell.

*   Variables Locales: Son visibles solo desde el shell que la creo.

**Variable Persistente**: 
Para crear una de estas es necesario introducirla en el archivo /etc/profile pero en el caso de los derivados debian si revisamos un poco el script nos damos cuenta que llama a otro archivo llamado /etc/bash.bashrc en el cual podemos crear las variables de entorno persistentes.

Por eso no funciona llamar la variable declarada en /etc/profile desde un shell

<br>

**Variables de usuario**

Son las variables que se corren dentro de un script como en cualquier programa de computadora C, C++ o Java

**Variable global**: Se puede usar desde otro script siempre y cuando sea llamado desde el script que contiene la variable.

**Variable local**: Solo tiene alcance en el script que la creo.