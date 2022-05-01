Usamos nuestro proyecto en el puerto 8000, para poder ejecutarlo se tiene que ejecutar 'php artisan serve' en un terminal, recomendamos el terminal 'PowerShell' y escribir en el navegador 'localhost:8000'.

En este proyecto hay 3 tipos de usuarios, OPERADOR, SUPERVISOR y ADMINISTRADOR. Hemos añadido 3 usuarios por defecto, uno de cada tipo para poder probar la aplicación:
	- Usuario OPERADOR -> CODI: op_1 | CONTRASSENYA: operador1
	- Usuario SUPERVISOR-> CODI: super_1 | CONTRASSENYA: supervisor1
	- Usuario ADMINISTRADOR-> CODI: admin_1 | CONTRASSENYA: administrador1

Los operadores solo pueden acceder a la carta de llamada, si entras como operador entrarás directamente a una carta de llamada, no hay menú por medio.
Los supervisores pueden gestionar expedientes y cartas de llamada, si entras como supervisor accederás a un menú en el cual puedes elegir una tarea a realizar.
Los administradores pueden gestionar expedientes, cartas de llamada, ver Big Data y gestionar usuarios, si entras como administrador accederás a un menú en el cual puedes elegir una tarea a realizar.
