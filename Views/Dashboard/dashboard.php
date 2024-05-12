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
    <div class="row table-sm ">
    <?php if(!empty($_SESSION['permisos'][MPEDIDOS]['r'])){?>
    <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Striped Table</h3>
            <table class="table table-striped ">
              <thead class="table-success">
                <tr>
                  <th>#</th>
                  <th>Cliente</th>
                  <th>Estado</th>
                  <th>Precio</th>
                  <th>Ver</th>
                </tr>
              </thead>
              <tbody class="table-info">
                <tr>
                  <td>1</td>
                  <td>Example</td>
                  <td>Example</td>
                  <td>Example</td> 
                  <td><a href="#"><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/ver-lista.png"></a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <?php }?>
    </div>
    </main>
<?php footerAdmin($data); ?>
    