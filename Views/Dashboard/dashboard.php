<?php headerAdmin($data); ?>
<main class="app-content">
	<div class="app-title">
		<div>
			<h1><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/monitor.png"></i><?= $data['page_title'] ?></h1>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><img class="iconDashboard3" src="<?= media();?>/images/Icons/x512/home.png"></li>
			<li class="breadcrumb-item"><a href="<?= base_url(); ?>/dashboard">Dashboard</a></li>
		</ul>
	</div>
	<div class="row">
		<?php if(!empty($_SESSION['permisos'][MUSUARIOS]['r'])){?>
		<div class="col-md-6 col-lg-3">
			<a href="<?= base_url()?>/usuarios" class="linkw">
				<div class="widget-small primary coloured-icon">
					<img class="iconDashboard" src="<?= media();?>/images/Icons/x512/usuarios.png">
					<div class="info">
						<h4>Usuarios</h4>
						<p><b><?= $data['usuarios'] ?></b></p>
					</div>
				</div>
			</a>
		</div>
		<?php }?>
		<?php if(!empty($_SESSION['permisos'][MCLIENTES]['r'])){?>
		<div class="col-md-6 col-lg-3">
			<a href="<?= base_url()?>/clientes" class="linkw">
				<div class="widget-small info coloured-icon">
					<img class="iconDashboard" src="<?= media();?>/images/Icons/x512/apreton-de-manos.png">
					<div class="info">
						<h4>Clientes</h4>
						<p><b><?= $data['clientes'] ?></b></p>
					</div>
				</div>
			</a>
		</div>
		<?php }?>
		<?php if(!empty($_SESSION['permisos'][MPRODUCTOS]['r'])){?>
		<div class="col-md-6 col-lg-3">
			<a href="<?= base_url()?>/productos" class="linkw">
				<div class="widget-small warning coloured-icon">
					<img class="iconDashboard" src="<?= media();?>/images/Icons/x512/controlar.png">
					<div class="info">
						<h4>Productos</h4>
						<p><b><?= $data['totalProductos'] ?></b></p>
					</div>
				</div>
			</a>
		</div>
		<?php }?>
		<?php if(!empty($_SESSION['permisos'][MPEDIDOS]['r'])){?>
		<div class="col-md-6 col-lg-3">
			<a href="<?= base_url()?>/pedidos" class="linkw">
				<div class="widget-small danger coloured-icon">
					<img class="iconDashboard" src="<?= media();?>/images/Icons/x512/entrega-de-pedidos.png">
					<div class="info">
						<h4>Pedidos</h4>
						<p><b><?= $data['totalPedidos'] ?></b></p>
					</div>
				</div>
		</div>
		</a>
	</div>
	<?php }?>
	</div>
  <div class="row table-sm">
    <?php if(!empty($_SESSION['permisos'][MPEDIDOS]['r'])){?>
    <div class="col-md-6">
        <div class="tile">
            <h3 class="tile-title">Ultimos Pedidos</h3>
            <table class="table table-striped">
                <thead class="table-success bg-info">
                    <tr>
                        <th>#</th>
                        <th>Cliente</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Ver</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    if(count($data['lastOrders']) > 0){ 
                        foreach($data['lastOrders'] as $pedido){
                            // Determinar el color basado en el tipo de pago
                            $color = '';
                            switch ($pedido['tipopago']) {
                                case 'PayPal':
                                    $color = '#4caefe'; // Paypal
                                    break;
                                case 'Efectivo':
                                    $color = '#23e274'; // Efectivo
                                    break;
                                case 'Tarjeta':
                                    $color = '#9b20d9'; // Tarjeta
                                    break;
                                default:
                                    $color = '#ffffff'; // Color predeterminado
                                    break;
                            }
                    ?>
                    <tr style="background-color: <?= $color ?>">
                        <td><?= $pedido['idpedido'] ?></td>
                        <td><?= $pedido['nombre'] ?></td>
                        <td class="text-center"><?= $pedido['status'] ?></td>
                        <td class="text-center"><?= formatMoney($pedido['precio']) ?></td>
                        <td class="text-center">
                            <a href="<?= base_url() ?>/pedidos/orden/<?= $pedido['idpedido'] ?>" target="_blank">
                                <img class="iconDashboard2" src="<?= media(); ?>/images/Icons/x512/ver-lista.png">
                            </a>
                        </td>
                    </tr>
                    <?php } }?>
                </tbody>
            </table>
        </div>
    </div>
    <?php } ?>

    <div class="col-md-6">
      <div class="tile">
        <h3 class="tile-title">Tipo de pagos por mes</h3>
        <div id="pagosMesAnio"></div>
      </div>
	</div>
	</div>

	
	
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">Ventas en el mes</h3>
				<div id="graficaMes"></div>
			</div>
		</div>
	</div>

	<!-- <div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">Ventas por año</h3>
				<div id="graficaAnio"></div>
			</div>
		</div>
	</div> -->


</main>
<?php footerAdmin($data); ?>

<script>

Highcharts.chart('pagosMesAnio', {
  chart: {
    type: 'variablepie'
  },
  title: {
    text: '<?= $data['pagosMes']['month'].' '.$data['pagosMes']['year']; ?>',
    align: 'left'
  },
  tooltip: {
    headerFormat: '',
    pointFormatter: function () {
      return '<span style="color:' + this.color + '">\u25CF</span> <b> ' + this.name + '</b><br/>' +
        'Total (Ventas): <b>' + Highcharts.numberFormat(this.y, 0, ',', '.') + ' COP</b><br/>';
    }
  },
  series: [{
    minPointSize: 10,
    innerSize: '20%',
    zMin: 0,
    name: 'countries',
    borderRadius: 5,
    data: [
      <?php 
        $colorsForPaymentTypes = [
          'PayPal' => '#4caefe',
          'Efectivo' => '#23e274',
          'Tarjeta' => '#9b20d9',
          // Agregar más tipos de pago y sus colores según sea necesario
        ];

        foreach($data['pagosMes']['tipospago'] as $pagos):
          $nPago = $pagos['tipopago'];
          $totalP = $pagos['total_ventas'];
          // Obtener el color correspondiente al tipo de pago
          $color = isset($colorsForPaymentTypes[$nPago]) ? $colorsForPaymentTypes[$nPago] : '#ffffff'; // Color predeterminado si no se encuentra
      ?>
        {
          name: '<?= $nPago; ?>', 
          y: <?= $totalP; ?>, 
          z: 92,
          color: '<?= $color; ?>'
        },
      <?php endforeach; ?>
    ]
  }]
});

Highcharts.chart('graficaMes', {
  chart: {
    type: 'column'
  },
  title: {
    text: '<?= $data['ventasMDia']['month'].' '.$data['ventasMDia']['year']; ?>'
  },
  subtitle: {
    text: 'Total de ventas completadas en <?= NOMBRE_EMPRESA . ': ' . formatMoney($data['ventasMDia']['total']) ?>'
  },
  xAxis: {
    type: 'category',
    labels: {
      autoRotation: [-45, -90],
      style: {
        fontSize: '13px',
        fontFamily: 'Verdana, sans-serif'
      }
    }
  },
  yAxis: {
    min: 0,
    title: {
      text: ''
    }
  },
  legend: {
    enabled: false
  },
  tooltip: {
    pointFormat: 'Ventas del día: <b>{point.y:,.0f} COP</b>'
  },
  series: [{
    name: 'Ventas',
    colors: [  
          '#6225ed', '#5b30e7','#533be1', '#4c46db','#4551d5', 
          '#3e5ccf','#3667c9', '#2f72c3','#277dbd', '#1f88b7', 
          '#1693b1', '#0a9eaa','#03c69b',  '#00f194','#9b20d9', 
          '#9215ac'
        ],
        colorByPoint: true,
        groupPadding: 0,
    data: [
      <?php foreach($data['ventasMDia']['ventas'] as $dia) : ?>
        ['<?= "Día " . $dia['dia'] ?>', <?= $dia['total'] ?>],
      <?php endforeach; ?>
    ],
    dataLabels: {
      enabled: true,
      rotation: -90,
      color: '#FFFFFF',
      inside: true,
      verticalAlign: 'top',
      format: '{point.y:,.0f} COP', // Un decimal
      style: {
        fontSize: '13px',
        fontFamily: 'Verdana, sans-serif'
      }
    }
  }]
});

	
	
Highcharts.chart('graficaAnio', {
  chart: {
    type: 'area'
  },
  accessibility: {
    description: 'Image description: An area chart compares the nuclear stockpiles of the USA and the USSR/Russia between 1945 and 2017. The number of nuclear weapons is plotted on the Y-axis and the years on the X-axis. The chart is interactive, and the year-on-year stockpile levels can be traced for each country. The US has a stockpile of 6 nuclear weapons at the dawn of the nuclear age in 1945. This number has gradually increased to 369 by 1950 when the USSR enters the arms race with 6 weapons. At this point, the US starts to rapidly build its stockpile culminating in 32,040 warheads by 1966 compared to the USSR’s 7,089. From this peak in 1966, the US stockpile gradually decreases as the USSR’s stockpile expands. By 1978 the USSR has closed the nuclear gap at 25,393. The USSR stockpile continues to grow until it reaches a peak of 45,000 in 1986 compared to the US arsenal of 24,401. From 1986, the nuclear stockpiles of both countries start to fall. By 2000, the numbers have fallen to 10,577 and 21,000 for the US and Russia, respectively. The decreases continue until 2017 at which point the US holds 4,018 weapons compared to Russia’s 4,500.'
  },
  title: {
    text: 'US and USSR nuclear stockpiles'
  },
  subtitle: {
    text: 'Source: <a href="https://fas.org/issues/nuclear-weapons/status-world-nuclear-forces/" ' +
    'target="_blank">FAS</a>'
  },
  xAxis: {
    allowDecimals: false,
    accessibility: {
      rangeDescription: 'Range: 1940 to 2017.'
    }
  },
  yAxis: {
    title: {
      text: 'Nuclear weapon states'
    }
  },
  tooltip: {
    pointFormat: '{series.name} had stockpiled <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
  },
  plotOptions: {
    area: {
      pointStart: 1940,
      marker: {
        enabled: false,
        symbol: 'circle',
        radius: 2,
        states: {
          hover: {
            enabled: true
          }
        }
      }
    }
  },
  series: [{
    name: 'USA',
    data: [5113, 5066, 4897, 4881, 4804, 4717, 4571, 4018, 3822, 3785, 3805,3750, 3708, 3708]
      
  }],
});
	
</script>