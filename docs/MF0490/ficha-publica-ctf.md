# Skynet: Terminator Hunter — Ficha pública

**Tipo:** Boot2Root (CTF) · **Dificultad:** Fácil–Media · **Módulo:** MF0490_3

---

## Historia

> Skynet ha despertado. En dos horas, tres mil millones de personas han muerto y las máquinas controlan el planeta. La Resistencia ha localizado **SKYNET-COMM-WEST-01**, un servidor crítico que gobierna el centro de comunicaciones de una instalación militar subterránea. Si cae, la humanidad tiene una oportunidad.
>
> Tu misión: **infiltrarte en el servidor, tomar el control total y apagar el núcleo.**

## Objetivo

Es una máquina **Boot2Root**. Tienes que conseguir dos banderas:

- **`user.txt`** — en el directorio personal de un usuario del sistema.
- **`root.txt`** — en `/root/root.txt`, accesible solo tras obtener privilegios de root.

Ambas tienen el formato `THM{...}`.

## Conexión

- La máquina se ejecuta **exclusivamente en una red aislada de laboratorio**.
- Obtiene su IP de la red del laboratorio. Averíguala con un escaneo de red (p. ej. `nmap`, `netdiscover`).
- El reto responde al nombre **`SkynetFinal`**. Como ese nombre no viaja con la máquina, **añádelo a tu fichero hosts** apuntando a la IP de la máquina:
  - Linux/Kali: `echo "<IP> SkynetFinal" | sudo tee -a /etc/hosts`
  - Windows: añade `<IP> SkynetFinal` a `C:\Windows\System32\drivers\etc\hosts`
- Presenta un **certificado TLS de una CA de laboratorio**; tu navegador/herramientas mostrarán un aviso de certificado (es lo esperado).

## Qué necesitas saber

- **No** hace falta acceso a Internet para resolverlo.
- **No** necesitas conocer de antemano ninguna contraseña de administrador del sistema.
- El camino es una única ruta principal de dos etapas: conseguir un usuario limitado y, desde ahí, escalar a root.
- Herramientas típicas: un escáner de puertos, enumeración web y un diccionario de contraseñas conocido.

¡Buena suerte, y *hasta la vista*! 🤖
