<?php 
	
    const ROOT_URL ="http://192.168.0.28/"; 
	//Se usa este cuando se abre para los dispositivos locales, se pone la ip local del pc que hace de server

    //const ROOT_URL="http://localhost/";

    //Define  url base
    const BASE_URL = ROOT_URL."proyectoIngSoftware/";
    //Zona horaria
    date_default_timezone_set("America/Bogota");

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_PORT = "3307";
	const DB_NAME = "db_jacna";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "utf8";


	//Deliminadores decimal y millar Ej. 24,900.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const CURRENCY = "COP";
	const SMONEY = "$ ";


	//API paypal
	const IDCLIENTE_SANDBOX = "AZQFAp4GVbV165u81iL_A0mLPNp2magEwaeVJrp_YwqxwZx9SomjlGgI8z2Q3PuMnAWBgka7zsLBfS93";
	const URLPAYPAL_SANDBOX = "https://api-m.sandbox.paypal.com";
	const SECRETPAYPAL_SANDBOX = "ENXQIug8JbxFcT-2BiQI_-fzjAdQobzaK3WbNbxgIEC7jW1-hI5wSTlN6kdxYteWFOXrqXg7N4SrBCmL";

	

	//Costo de envio
	const COSTOENVIO = 2000; //2k envio

	//Datos envio de correo
	const ENVIROMENT = 0; //SendEmail de produccion 1, SendEmail localhost 0


	const NOMBRE_REMITENTE = "ArtCeramics";
	const EMAIL_REMITENTE = "jacnasartceramics@gmail.com";
	const NOMBRE_EMPRESA = "Art Ceramics";
	const WEB_EMPRESA = "Art Ceramics";


	//Datos empresa

	const DIRECCION = "La casa de juan eduardo";
	const CONTACTO = "(+57) 320 9255747";
	const EMAIL_EMPRESA = "jacnasartceramics@gmail.com";
	const EMAIL_PEDIDOS = "jacnasartceramics@gmail.com";



	//Tienda imagenes a mostrar
	const CAT_SLIDER = "10,9,12";
	const CAT_BANNER = "10,9,12";

	//Encrypt
	const KEY = 'artCeramics';
	const METHODENCRYPT = "AES-128-ECB";


	//Módulos Crear las constantes basados en la base para utilizarlas donde es requerido.
	const MCLIENTES = 3;
	const MPEDIDOS = 5;

	//Roles Crear las constantes basados en la base para utilizarlas donde es requerido.
	const RADMINISTRADOR = 1;
	const RCLIENTES = 7;

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado');
	
 ?>
