
	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<!-- <div class="col-sm-6 col-lg-4 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Categorías
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								#####
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								#####
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								#####
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								#####
							</a>
						</li>
					</ul>
				</div> -->

				<div class="col-sm-6 col-lg-4 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Contacto
					</h4>

					<p class="stext-107 cl7 size-201">
						<strong>Direccion:</strong> <?= DIRECCION ?> <br>
						<strong>Telefono: </strong> <?= CONTACTO ?><br>
						<strong>Correo: </strong><?= EMAIL_EMPRESA ?>
					</p>

					<div class="p-t-27">
						<ul>
							<li>
								<a href="<?= INSTAGRAM_EMPRESA?>" target="_blanck"  class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
									<i class="fa fa-instagram">  Instagram</i>
								</a>
							</li>
							<li>
								<a href="<?= WHATSAPP_EMPRESA?>" target = "_blanck" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
									<i class="fa fa-whatsapp">  WhatsApp</i>
								</a>

								

							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="p-t-40">
				<p class="stext-107 cl6 txt-center">
					<?= NOMBRE_EMPRESA; ?> | <?= WEB_EMPRESA; ?>  
				</p>
			</div>	
		</div>
	</footer>
	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	<script>
		const base_url = "<?= base_url(); ?>";
		const smoney = "<?= SMONEY; ?>";
	</script>


	<script src="<?= media() ?>/tienda/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/animsition/js/animsition.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/bootstrap/js/popper.js"></script>
	<script src="<?= media() ?>/tienda/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/select2/select2.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/daterangepicker/moment.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="<?= media() ?>/tienda/vendor/slick/slick.min.js"></script>
	<script src="<?= media() ?>/tienda/js/slick-custom.js"></script>
	<script src="<?= media() ?>/tienda/vendor/parallax100/parallax100.js"></script>
	<script src="<?= media() ?>/tienda/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/isotope/isotope.pkgd.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/sweetalert/sweetalert.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="<?= media() ?>/tienda/js/main2.js"></script>
	<script src="<?= media() ?>/tienda/js/functions_carrito.js"></script>
	<script src="<?= media() ?>/tienda/js/functions_tienda.js"></script>
	<script src="<?= media() ?>/js/functions_login.js"></script>
	<script src="<?= media() ?>/js/functions_admin.js"></script>
</body>
</html>