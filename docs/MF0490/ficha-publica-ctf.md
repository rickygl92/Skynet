# Skynet: Terminator Hunter — Ficha pública

**Tipo:** Boot2Root (CTF) · **Dificultad:** Fácil–Media · **Módulo:** MF0490_3

## Historia

Skynet ha despertado. En dos horas, tres mil millones de personas han muerto y las maquinas controlan el planeta. La Resistencia ha localizado SKYNET-COMM-WEST-01, un servidor critico que gobierna el centro de comunicaciones de una instalacion militar subterranea. Si cae, la humanidad tiene una oportunidad.

Tu mision: infiltrarte en el servidor, tomar el control total y apagar el nucleo.

## Objetivo

Maquina Boot2Root. Dos banderas:
- user.txt — en el directorio personal de un usuario del sistema.
- root.txt — en /root/root.txt, accesible solo tras obtener root.

Formato THM{...}.

## Conexion

- Solo en red aislada de laboratorio.
- Averigua la IP con un escaneo de red (nmap, netdiscover).
- El reto responde al nombre SkynetFinal. Anade "<IP> SkynetFinal" a tu fichero hosts.
- Presenta un certificado TLS de una CA de laboratorio (aviso de certificado esperado).

## Que necesitas saber

- No hace falta Internet ni contrasenas de administrador previas.
- Ruta unica de dos etapas: usuario limitado -> escalada a root.
- Herramientas tipicas: escaner de puertos, enumeracion web, diccionario de contrasenas.

Hasta la vista.
