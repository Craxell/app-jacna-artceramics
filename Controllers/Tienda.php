<?php 
	require_once("Models/TCategoria.php");
	require_once("Models/TProducto.php");
	require_once("Models/TCliente.php");
	require_once("Models/LoginModel.php");

	class Tienda extends Controllers{
		use TCategoria, TProducto, TCliente;
		public $login;
		public function __construct()
		{
			parent::__construct();
			session_start();
			
			$this->login = new LoginModel();
		}

		public function tienda()
		{
			$data['page_tag'] = NOMBRE_EMPESA;
			$data['page_title'] = NOMBRE_EMPESA;
			$data['page_name'] = "tienda";
			$data['productos'] = $this->getProductosT();
			$this->views->getView($this,"tienda",$data);
		}

		public function categoria($params){
			if(empty($params)){
				header("Location:".base_url());
			}else{
				$categoria = strClean($params);
				$data['page_tag'] = NOMBRE_EMPESA." - ".$categoria;
				$data['page_title'] = $categoria;
				$data['page_name'] = "categoria";
				$data['productos'] = $this->getProductosCategoriaT($categoria);
				$this->views->getView($this,"categoria",$data);
			}
		}

		public function producto($params){
			if(empty($params)){
				header("Location:".base_url());
			}else{
				$producto = strClean($params);
				$arrProducto = $this->getProductoT($producto);
				$data['page_tag'] = NOMBRE_EMPESA." - ".$producto;
				$data['page_title'] = $producto;
				$data['page_name'] = "producto";
				$data['producto'] = $arrProducto;

				
				$data['productos'] = $this->getProductosRandom($arrProducto['categoriaid'],8,"r");
				$this->views->getView($this,"producto",$data);
			}
		}

		public function addCarrito(){
			if($_POST){
				//unset($_SESSION['arrCarrito']);exit;
				$arrCarrito = array();
				$cantCarrito = 0;
				$idproducto = openssl_decrypt($_POST['id'], METHODENCRYPT, KEY);
				$cantidad = $_POST['cant'];
				if(is_numeric($idproducto) and is_numeric ($cantidad)){
					$arrInfoProducto = $this->getProductoIDT($idproducto);
					if(!empty($arrInfoProducto)){
						$arrProducto = array(
							'idproducto' => $idproducto,
							'producto' => $arrInfoProducto['nombre'],
							'cantidad' => $cantidad,
							'precio' => $arrInfoProducto['precio'],
							'imagen' => $arrInfoProducto['images'][0]['url_image']
						);
						if(isset($_SESSION['arrCarrito'])){
							$on = true;
							$arrCarrito = $_SESSION['arrCarrito'];

							for ($pr=0; $pr < count($arrCarrito); $pr++) {
								if($arrCarrito[$pr]['idproducto'] == $idproducto){
									$arrCarrito[$pr]['cantidad'] += $cantidad;
									$on = false;
								}
							}
							if($on){
								array_push($arrCarrito, $arrProducto);
							}
							$_SESSION['arrCarrito'] = $arrCarrito;
						}else{
							array_push($arrCarrito, $arrProducto);
							$_SESSION['arrCarrito'] = $arrCarrito;
						}

						foreach($_SESSION['arrCarrito'] as $pro){
							$cantCarrito += $pro['cantidad'];
						}

						$htmlCarrito = getFile("Template/Modals/modalCarrito", $_SESSION['arrCarrito']);
						$arrResponse = array(
							"status" => true,
							"msg" => 'Se agrego al carrito!',
							"cantCarrito" => $cantCarrito,
							"htmlCarrito" => $htmlCarrito
						);


					}else{
						$arrResponse = array("status" => false, "msg" => 'Producto no existente.');
					}
				}else{
					$arrResponse = array("status" => false, "msg" => 'Dato incorrecto.');
				}
				echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);	
			}
			die();
		}

		public function delCarrito(){
			if($_POST){
				$arrCarrito = array();
				$cantCarrito = 0;
				$subtotal = 0;
				$idproducto = openssl_decrypt($_POST['id'], METHODENCRYPT, KEY);
				$option = $_POST['option'];
				if(is_numeric($idproducto) and ($option == 1 || $option == 2)){
					$arrCarrito = $_SESSION['arrCarrito'];
					for($pr=0; $pr < count($arrCarrito); $pr++){
						if($arrCarrito[$pr]['idproducto'] == $idproducto){
							unset($arrCarrito[$pr]);
						}
					}
					sort($arrCarrito);
					$_SESSION['arrCarrito'] = $arrCarrito;

					foreach($_SESSION['arrCarrito'] as $pro){
						$cantCarrito += $pro['cantidad'];
						$subtotal += $pro['cantidad'] * $pro['precio'];
					}

					$htmlCarrito = "";
					if($option == 1){
						$htmlCarrito = getFile("Template/Modals/modalCarrito", $_SESSION['arrCarrito']);
					}
					$arrResponse = array(
						"status" => true,
						"msg" => 'Producto eliminado!',
						"cantCarrito" => $cantCarrito,
						"htmlCarrito" => $htmlCarrito,
						"subTotal" => SMONEY.formatMoney($subtotal),
						"total" => SMONEY.formatMoney($subtotal+COSTOENVIO)
					);
				}else{
					$arrResponse = array("status" => false, "msg" => 'Dato incorrecto.');
				}
				echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);	
			}	
			die();
		}

		public function updCarrito(){
			if($_POST){

				$arrCarrito = array();
				$totalProducto = 0;
				$subtotal = 0;
				$total = 0;

				$idproducto = openssl_decrypt($_POST['id'], METHODENCRYPT, KEY);
				$cantidad = intval($_POST['cantidad']);

				if(is_numeric($idproducto) and $cantidad > 0 ){
					$arrCarrito = $_SESSION['arrCarrito'];
					for ($p=0; $p < count($arrCarrito); $p++ ){
						if($arrCarrito[$p]['idproducto'] == $idproducto){
							$arrCarrito[$p]['cantidad'] = $cantidad;
							$totalProducto = $arrCarrito[$p]['precio'] * $cantidad;
							break;
						}

					}

					$_SESSION['arrCarrito'] = $arrCarrito;

					foreach($_SESSION['arrCarrito'] as $pro){
						$subtotal += $pro['cantidad'] * $pro['precio'];
					}

					$arrResponse = array(
						"status" => true,
						"msg" => "Producto Actualizado!",
						"totalProducto" => SMONEY.formatMoney($totalProducto),
						"subTotal" => SMONEY.formatMoney($subtotal),
						"total" => SMONEY.formatMoney($subtotal+COSTOENVIO)
					);


				}else{
					$arrResponse = array("status" => false, "msg" => 'Dato incorrecto.');
				}
				echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function registro(){
			error_reporting(0);
			if($_POST){
				if(empty($_POST['txtNombre']) || empty($_POST['txtApellido']) || empty($_POST['txtTelefono']) || empty($_POST['txtEmailCliente'])){
					
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				}
				else{ 
					$strNombre = ucwords(strClean($_POST['txtNombre']));
					$strApellido = ucwords(strClean($_POST['txtApellido']));
					$intTelefono = intval(strClean($_POST['txtTelefono']));
					$strEmail = strtolower(strClean($_POST['txtEmailCliente']));

					$intTipoId = 7; //cambiar segun el id que sea el rol cliente en la base
					$request_user = "";

					$strPassword =  passGenerator(); //lo mando por correo
					$strPasswordEncript = hash("SHA256",$strPassword);
					
					$request_user = $this->insertCliente(
						$strNombre,
						$strApellido, 
						$intTelefono, 
						$strEmail,
						$strPasswordEncript,
						$intTipoId, 
					);

					if($request_user > 0 ){
						
						$arrResponse = array('status' => true, 'msg' => 'Datos guardados correctamente.');
						$nombreUsuario = $strNombre.' '.$strApellido;

						$dataUsuario = array(
							'nombreUsuario' => $nombreUsuario,
							'email' => $strEmail,
							'password' => $strPassword,
							'asunto' => 'Bienvenido a tu tienda en línea'
						);

						$_SESSION['idUser'] = $request_user;
						$_SESSION['login'] = true;
						$this->login->sessionLogin($request_user);
						//sendEmail($dataUsuario,'email_bienvenida');
						
					}else if($request_user == 'exist'){
						$arrResponse = array('status' => false, 'msg' => '¡Atención! el email ya existe, ingrese otro.');		
					}else{
						$arrResponse = array("status" => false, "msg" => 'No es posible almacenar los datos.');
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}
		
	}
 ?>
