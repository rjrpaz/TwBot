# TwBot
Twitter Bot

Este conjunto de scripts permite interactuar con un usuario de twitter.

Está compuesto por 3 scripts:

1) rm - script en python, que lee mensajes directos de una cuenta de twitter y completa los mensajes
leídos en una tabla de una base mysql
2) tw - script en python, que postea mensajes leídos de una tabla de mysql en una cuenta de twitter
3) tw.pl - script en perl que ejecuta los dos scripts anteriormente citados.

Además existen algunos scripts adicionales:
auth.py - script en python que permite obtener los tokens de autenticación en el paso inicial. Estos tokens serán
utilizados por los scripts en python anteriormente citados
cargar.pl - script en perl que permite cargar mensajes en la base de datos de manera directa.

Los scripts en python, que son los que interactúan con la cuenta de twitter, utilizan la librería "tweepy".

pip-python install tweepy

Algunos mensajes de error o warning durante el proceso de instalación pueden deberse a que es necesario
actualizar la librería ssl de python. También puede que deba actualizarse el mismo pip-python.

Una vez instalada la librería, debemos crear la cuenta de twitter que vayamos a utilizar. Luego debemos acceder
al enlace http://twitter.com/oauth_clients, y definimos las caraterísticas del nuevo programa cliente que va a
conectarse al twitter. Entre las características del nuevo cliente, debemos indicar que tiene permito de
lectura, escritura y mensaje directo.

La creación de la entrada correspondiente para este nuevo cliente nos provee de dos tokens iniciales:
CUSTOMER_KEY y CUSTOMER_SECRET. Estos tokens deben reemplazarse en el script auth.py, y debe ejecutarse

python auth.py

La ejecución del script provee de un enlace y nos pide un PIN. Si accedemos a ese enlace, nos provee del
valor del PIN que nos está solicitando el script. Cuando la ejecución finaliza correctamente, nos
devuelve dos tokens adicionales: ACCESS_KEY y ACCESS_SECRET. Estos dos tokens adicionales se deben
configurar (junto con los dos anteriores) en los scripts tw y rm.

Una vez que los tokens están debidamente configurados, los scripts en python pueden ser ejecutados
de la siguiente manera:

./tw "Mensaje de Prueba" (twittea el mensaje pasado como argumento)
./rm  (Lee los mensajes directos del usuario, y los borra)

El script en perl ejecuta los dos comando anteriores en secuencia, e interactúa con la base de datos.
Además espera un tiempo aleatorio entre 0 y 5 minutos antes de empezar la acción, de tal manera
que el bot delate menos su periodicidad.

Luego se puede ejecutar vía cron:

*/5 * * * * ~/TwBot/tw.pl

Referencias:  http://edvoncken.net/2011/08/twagios-2-0-nagios-notifications-revisited/
