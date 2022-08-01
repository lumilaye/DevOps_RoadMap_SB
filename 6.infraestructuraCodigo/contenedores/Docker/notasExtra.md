# Ejecutar un comando en segundo plano:
    <comando> & 

# Listar los jobs:
    - jobs

# Listar todos los procesos
    - ps -aux

# Traer un job a primer plano:
    - fg %[jobid]

# Reiniciar o hacer que continue un proceso o job
    - bg %[jobid]

# Terminar o matar un proceso en segundo plano
    - kill %[jobid]