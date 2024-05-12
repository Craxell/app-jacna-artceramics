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
      
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon">
            <img class="iconDashboard" src="<?= media();?>/images/Icons/x512/usuarios.png">
            <!-- <i class="icon fa fa-users fa-3x"></i> -->
            <div class="info">
              <h4>Usuarios</h4>
              <p><b>5</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small info coloured-icon">
              <img class="iconDashboard" src="<?= media();?>/images/Icons/x512/apreton-de-manos.png">
              <!-- <i class="icon fa fa-user fa-3x"></i> -->
            <div class="info">
              <h4>Clientes</h4>
              <p><b>25</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon">
          <img class="iconDashboard" src="<?= media();?>/images/Icons/x512/controlar.png">
          <!-- <i class="icon fa fa-files-o fa-3x"></i> -->
            <div class="info">
              <h4>Productos</h4>
              <p><b>10</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon">
          <img class="iconDashboard" src="<?= media();?>/images/Icons/x512/entrega-de-pedidos.png">
            <div class="info">
              <h4>Pedidos</h4>
              <p><b>500</b></p>
            </div>
          </div>
        </div>
      </div>
    </main>
<?php footerAdmin($data); ?>
    