Proyecto final del curso de Seguridad en Sistemas Informaticos (Ironhack) con tematica de Terminator (Skynet) 

Nombre: Ricardo Garcia López 

Proyecto individual

Descripción de la maquina virtual:

S.O: UBUNTU 25.04 (64 bits) 
Kernel: Linux 6.14
Red: Bridge
IP: 192.168.1.125

Tecnologías:
─ SO:           Ubuntu 25.04 (64 bits)
├─ Virtualización: Docker + Docker Compose
├─ Web:          WordPress 6.4
├─ Base Datos:   MySQL 8.0
├─ Acceso:       OpenSSH 8.0 
├─ Seguridad:    Suricata IDS 
└─ Orquestación: 4 Contenedores independientes


Temática del CTF: "Skynet: Terminator Hunter"

Skynet despierta,3 mil millones de personas mueren en 2 horas las máquinas toman el control global, las humanidad se desmorona...
La resistencia ha localizado SKYNET-COMM-WEST-01 un servidor crítico de Skynet que controla el entro de comunicaciones principal en una instalación militar subterránea, si cae 
la humanidad tiene oportunidad de ganar.

Arquitectura:

Docker:
│
├── Aplicación web
│
└── Base de datos

Network:

Aplicación
    │
    │ Red Docker
    ▼
Base de datos




