<?php 
	
    //const ROOT_URL ="http://192.168.0.28/"; 
	//Se usa este cuando se abre para los dispositivos locales, se pone la ip local del pc que hace de server

    const ROOT_URL="http://localhost/";

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
	const SMONEY = "COP ";

	//Costo de envio
	const COSTOENVIO = 10000;

	//Datos envio de correo
	const NOMBRE_REMITENTE = "ArtCeramics";
	const EMAIL_REMITENTE = "jacnasartceramics@gmail.com";
	const NOMBRE_EMPESA = "Art Ceramics";
	const WEB_EMPRESA = "Art Ceramics";



	//Tienda imagenes a mostrar
	const CAT_SLIDER = "10,9";
	const CAT_BANNER = "10,9";

	//Encrypt
	const KEY = 'artCeramics';
	const METHODENCRYPT = "AES-128-ECB";
 ?>
