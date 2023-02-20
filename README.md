# Descripción

Este repositorio contiene un programa que hace uso de las herramientas Terraform, Ansible, Jenkins y Docker. El objetivo de este programa es automatizar la creación y el despliegue de una aplicación web en una instancia EC2 de AWS.

## Herramientas utilizadas
* Terraform: herramienta de infraestructura como código que permite describir la infraestructura de la nube en archivos declarativos.
* Ansible: herramienta de automatización de TI que permite configurar y administrar servidores.
* Jenkins: herramienta de integración continua que permite automatizar el proceso de construcción, pruebas y despliegue de aplicaciones.
* Docker: plataforma de contenedores que permite empaquetar una aplicación junto con sus dependencias en un contenedor aislado. 
## Arquitectura
La arquitectura de la aplicación consiste en lo siguiente:

* Una instancia EC2 de AWS que ejecuta un servidor web Nginx.
* Un contenedor Docker que contiene la aplicación web.
## Uso
Para ejecutar el programa, se deben seguir los siguientes pasos:

1. Clonar este repositorio.
2. Descargar las herramientas a utilizar.
3. Configurar las credenciales de AWS en Terraform. Para ello, editar el archivo terraform/variables.tf y reemplazar los valores de las variables access_key y secret_key por las credenciales de su cuenta de AWS.
4. Ejecutar desde Jenkins.
