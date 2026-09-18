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


## Mapa de evidencias

| Acción | Dónde buscar |
|---|---|
| Login SSH correcto | sudo tail -n 5 `journalctl -u ssh` / `/var/log/auth.log` |
| Login SSH incorrecto | sudo tail -n 5 `journalctl -u ssh` / `/var/log/auth.log` |
| Petición HTTP válida | sudo tail -n 5 `docker logs skynet_wordpress` |
| Petición HTTP 404 / incorrecta | sudo tail -n 5 `docker logs skynet_wordpress` |
| Logs de WordPress | sudo tail -n 5 `docker logs skynet_wordpress` |
| Logs de MySQL | sudo tail -n 5 `docker logs skynet_mysq l` |
| Estado de contenedores | sudo tail -n 5 `docker ps` |
| Logs generales de Docker | sudo tail -n 5 `docker logs <nombre_contenedor>` |
| Eventos del sistema Linux | sudo tail -n 5 `journalctl` |
| Alertas de Suricata | sudo tail -n 5 `/var/log/suricata/fast.log` |
| Eventos detallados de Suricata | sudo tail -n 5 `/var/log/suricata/eve.json` |


## Suricata IDS

Suricata se encuentra instalado directamente sobre la máquina virtual
Ubuntu y se utiliza como sistema IDS para monitorizar el tráfico de red
del servidor SKYNET-COMM-WEST-01.

### Estado actual

| Parámetro | Configuración |
|---|---|
| IDS | Suricata |
| Instalación | Directamente sobre Ubuntu Server |
| Estado del servicio | Activo |
| Interfaz monitorizada | `enp0s3` |
| IP actual del servidor | `192.168.1.124` |
| HOME_NET | `192.168.1.124/32` |   comentario : mirar lo de las ips para que el atacante despues se pueda conectar (hacer bien la configuracion)
| Archivo de configuración | `/etc/suricata/suricata.yaml` |
| Reglas locales | `/var/lib/suricata/rules/local.rules` |
| Log de alertas | `/var/log/suricata/fast.log` |
| Log de eventos | `/var/log/suricata/eve.json` |

### Interfaz de red

La interfaz principal utilizada por Suricata es:

```text
enp0s3



## Línea base de detección

| Acción | Fuente | Detectada / registrada | Información obtenida |
|---|---|---|---|
| SSH correcto | `journalctl -u ssh` / `/var/log/auth.log` | Sí | Fecha/hora, IP origen, usuario y autenticación aceptada |
| SSH incorrecto | `journalctl -u ssh` / `/var/log/auth.log` | Sí | Fecha/hora, IP origen, usuario e intento de autenticación fallido |
| Web válida | `docker logs skynet_wordpress` | Sí | IP origen, fecha/hora, método HTTP, URL y código de respuesta |
| Web 404 | `docker logs skynet_wordpress` | Sí | IP origen, fecha/hora, URL solicitada y código HTTP `404` |
| Docker | `docker logs` / `docker ps` | Sí | Estado de contenedores, inicialización, actividad y errores |
| Ping | Suricata / `tcpdump` / `stats.log` | Parcial | Tráfico ICMP capturado y decodificado; alerta personalizada pendiente de validación |
| Nmap | Suricata / logs del sistema y servicios | Pendiente | Pendiente de realizar y documentar una prueba real |
