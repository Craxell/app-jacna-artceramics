<?php
headerTienda($data);

?>
<br><br><br>
<hr>
    <!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="<?= base_url() ?>" class="stext-109 cl8 hov-cl1 trans-04">
				Inicio
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				<?= $data['page_title'] ?>
			</span>
		</div>
	</div>

<br>


<main role="main">
	<div>
		<div class="container">
		<h3>Que es <?= NOMBRE_EMPRESA ?></h3><br>

		<p style="text-align: justify;" >En <?= NOMBRE_EMPRESA ?>, somos una organización apasionada por la cerámica y la belleza que esta puede aportar a 
			cualquier espacio. Nos dedicamos a la creación y venta de cerámicas decorativas y macetas de cerámica 
			para plantas, cada una hecha a mano con dedicación y atención a los detalles. Nuestros productos no 
			son solo objetos decorativos; son piezas de arte que transforman y embellecen cada rincón que adornan. 
			Nuestra oferta incluye una variedad de diseños originales y personalizados, concebidos para satisfacer 
			los gustos más exigentes y diversos de nuestros clientes. Desde macetas elegantes y minimalistas hasta 
			piezas decorativas más elaboradas y vibrantes, cada creación de <?= NOMBRE_EMPRESA ?> es única y lleva consigo una 
			historia de creatividad y maestría artesanal. Valoramos profundamente la calidad y la autenticidad, y es 
			por eso que cada una de nuestras cerámicas es elaborada con materiales de primera y técnicas tradicionales 
			de cerámica. Además, nos esforzamos por ser responsables con el medio ambiente, ofreciendo productos que no 
			solo embellecen los espacios, sino que también respetan y cuidan nuestro planeta. En <?= NOMBRE_EMPRESA ?>, creemos que 
			la cerámica tiene el poder de transformar lo ordinario en extraordinario. Nuestro compromiso es con la excelencia, 
			la innovación constante y la satisfacción de nuestros clientes, creando piezas que no solo decoran, sino que también 
			inspiran y elevan los ambientes en los que se encuentran.
		</p><br><br>
		<img src="<?= media()  ?>/images/ArtCeramicShop-modified.png" class="iconNosotros" alt="" srcset=""><br><br>

		<h3>Misión: </h3><br>
		<p style="text-align: justify;" >En <?= NOMBRE_EMPRESA ?>, nuestra misión es embellecer los espacios de nuestros 
			clientes ofreciendo cerámicas artesanales de alta calidad con diseños originales y personalizados. 
			Creemos que cada pieza de cerámica tiene el poder de transformar un rincón ordinario en un lugar especial, 
			satisfaciendo así las necesidades y gustos de nuestros clientes. Nos esforzamos por promover el arte, la belleza 
			y el cuidado del medio ambiente a través de nuestros productos, brindando la opción de adquirir la cerámica sola 
			o con la planta incluida.
		</p><br><br>
		<h3>Visión: </h3><br>
		<p style="text-align: justify;">Nuestra visión es convertirnos en el referente principal en el mundo de la cerámica, 
			reconocidos por nuestra calidad, creatividad y compromiso con la belleza y la funcionalidad. Aspiramos a
			llegar a más clientes, tanto a nivel nacional como internacional, ofreciendo una experiencia única y memorable. 
			Nos comprometemos a seguir innovando, capacitándonos y mejorando nuestros procesos para garantizar la excelencia 
			de nuestros productos y servicios. Visualizamos un futuro en el que nuestras piezas adornen hogares, oficinas y 
			espacios públicos en todo el mundo, inspirando a las personas a apreciar la artesanía y la naturaleza.
		</p><br><br>


		
		
		</div>
	</div>

</main>

<?php
footerTienda($data);

?>
		