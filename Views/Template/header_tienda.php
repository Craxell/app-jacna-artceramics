<?php
$cantCarrito = 0;
if(isset($_SESSION['arrCarrito']) and count($_SESSION['arrCarrito']) > 0 ){
	foreach($_SESSION['arrCarrito'] as $product){
		$cantCarrito += $product['cantidad'];
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title><?= $data['page_tag']; ?></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content = "IE=edge" />
	<link rel="icon" type="image/png" href="<?= media() ?>/images/Favicons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/fonts/linearicons-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/MagnificPopup/magnific-popup.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/css/util.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/css/main.css">
	<link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">

</head>
<body class="animsition">
	<div id="divLoading">
		<div>
			<img src="<?=media(); ?>/images/loading.svg" alt="Loading">
		</div>
	</div>

	
	
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">

				<div class="left-top-bar">

					<?php
						if(isset($_SESSION['userData']) && isset($_SESSION['userData']['nombres'])) {
							echo "Bienvenido " . $_SESSION['userData']['nombres'];
						} else {
							echo "Cuenta de Invitado"; 
						}
					?>
				</div>


					<div class="right-top-bar flex-w h-full">
						<a href="<?= base_url(); ?>/login" class="flex-c-m trans-04 p-lr-25">
							Mi cuenta
						</a>

						<a href="<?= base_url(); ?>/LogoutShop" class="flex-c-m trans-04 p-lr-25">
							Salir
						</a>
						
					</div>
				</div>
			</div>
			

			<div class="wrap-menu-desktop">
				
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="<?= base_url(); ?>/" class="logo">
						<!-- <img src="<?= media() ?>/images/ArtCeramicShop.png" alt="Tienda Virtual" class = "logoImage"> -->
						<h3>Art Ceramics Tienda Online</h3>
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">

							<li class="">
								<a href="<?= base_url(); ?>">Inicio</a>
							</li>

							<li>
								<a href="<?= base_url(); ?>/tienda">Tienda</a>
							</li>

							<li>
								<a href="<?= base_url(); ?>/carrito">Carrito</a>
							</li>

							<li>
								<a href="<?= base_url(); ?>/nosotros">Nosotros</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						

						<?php if($data['page_name'] != "carrito" and $data['page_name'] != "procesarpago") { ?>

						<div class="cantCarrito icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="<?= $cantCarrito; ?>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>
						<?php }?>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			
			<a href="<?= base_url(); ?>" class="logoHeader">
				<img src="<?= media() ?>/images/ArtCeramicShop.png" alt="Tienda Virtual" class = "logoHeader">
				<!-- <h3>Art Ceramics</h3> -->
			</a>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				
				<?php if($data['page_name'] != "carrito" and $data['page_name'] != "procesarpago") { ?>
					<div class="cantCarrito icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="<?= $cantCarrito; ?>">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				<?php }?>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						<?php
							if(isset($_SESSION['userData']) && isset($_SESSION['userData']['nombres'])) {
								echo "Bienvenido " . $_SESSION['userData']['nombres'];
							} else {
								echo "Cuenta de Invitado"; 
							}
						?>
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">

						<a href="<?= base_url(); ?>/login"" class="flex-c-m p-lr-10 trans-04">
							Mi cuenta
						</a>

						<a href="<?= base_url(); ?>/LogoutShop" class="flex-c-m trans-04 p-lr-25">
							Salir
						</a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="<?= base_url(); ?>">Inicio</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/tienda">Tienda</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/carrito">Carrito</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/nosotros">Nosotros</a>
				</li>
			</ul>
		</div>

		
	</header>


	<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
	<div class="s-full js-hide-cart"></div>
 
	<div class="header-cart flex-col-l p-l-65 p-r-25">
		<div class="header-cart-title flex-w flex-sb-m p-b-8">
			<span class="mtext-103 cl2">
				Tu carrito
			</span>

			<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>
		
		<div id="productosCarrito" class="header-cart-content flex-w js-pscroll">
			<?php getModal('modalCarrito', $data); ?>

		</div>
	</div>
</div>
