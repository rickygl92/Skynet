Proyecto final del curso de Seguridad en Sistemas Informaticos (Ironhack) con tematica de Terminator (Skynet) 

Nombre: Ricardo Garcia López 

Proyecto individual

Descripción de la maquina virtual:

S.O: Ubuntu 26.04 LTS (64 bits)
Kernel: Linux 7.0.0-27
Red: Bridge
IP: 192.168.1.125

Tecnologías:
─ SO:           Ubuntu 25.04 (64 bits)
├─ Virtualización: Docker + Docker Compose
├─ Web:          WordPress 6.4
├─ Base Datos:   MySQL 8.0
├─ Acceso:       OpenSSH 8.0 
├─ Seguridad:    Suricata IDS 
└─ Orquestación: 2 Contenedores 


Temática del CTF: "Skynet: Terminator Hunter"

Skynet despierta, 3 mil millones de personas mueren en 2 horas, las máquinas toman el control global, las humanidad se desmorona...
La resistencia ha localizado SKYNET-COMM-WEST-01 un servidor crítico de Skynet que controla el entro de comunicaciones principal en una instalación militar subterránea, si cae 
la humanidad tiene oportunidad de ganar.

Arquitectura:


                 "CLIENT"
                    │
                    ▼
              Ubuntu Server
                    │
       ┌────────────┼────────────┐
       │            │            │
      SSH       Suricata       Docker
                                  │
                         ┌────────┴────────┐
                         │                 │
                        WEB               DB

                        
    Conexion por:
        │
        ├── SSH :22
        │
        └── HTTP :80
                 │
                 ▼
         ┌─────────────────┐
         │    WordPress    │
         │                 │
         │ skynet_public   │
         │ skynet_private  │
         └────────┬────────┘
                  │
                  │ skynet_private
                  ▼
         ┌─────────────────┐
         │      MySQL      │
         │                 │
         │ skynet_private  │
         └────────┬────────┘
                  │
          skynet_mysql_data




                       "Networks"
                            │
                            │ HTTP :80
                            ▼
                 ┌─────────────────────┐
                 │      WordPress      │
                 │                     │
                 │  skynet_public      │
                 │  skynet_private     │
                 └─────────┬───────────┘
                           │
                           │ skynet_private
                           ▼
                 ┌─────────────────────┐
                 │        MySQL        │
                 │                     │
                 │  skynet_private     │
                 └─────────────────────┘

## Tabla informativa

| Servicio  | Puerto   | Expuesto | Función                    |
|-----------|----------|----------|----------------------------|
| SSH       | 22/TCP   | Sí       | Acceso remoto al servidor  |
| WordPress | 80/TCP   | Sí       | Aplicación web             |
| MySQL     | 3306/TCP | No       | Base de datos interna      |



## Servicios y puertos

| Servicio        | Tecnología            | Puerto   | Expuesto | Función |
|----------------|-----------------------|----------|----------|---------|
| SSH            | OpenSSH               | 22/TCP   | Sí       | Acceso remoto y administración del servidor |
| Web            | WordPress + Apache    | 80/TCP   | Sí       | Aplicación web accesible por los usuarios |
| Base de datos  | MySQL 8.0             | 3306/TCP | No       | Persistencia de datos de WordPress |
| Docker         | Docker Engine         | N/A      | No       | Ejecución y gestión de los contenedores |
| IDS            | Suricata              | N/A      | No       | Monitorización y detección de tráfico de red |
