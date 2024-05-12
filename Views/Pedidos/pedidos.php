<?php 
    headerAdmin($data); 
    //getModal('modalProductos',$data);
?>
    <div id="divModal"></div>
    <main class="app-content">
      <div class="app-title">
        <div>
            <h1><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/entrega-de-pedidos.png"> <?= $data['page_title'] ?></h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><img class="iconDashboard3" src="<?= media();?>/images/Icons/x512/home.png"></li>
          <li class="breadcrumb-item"><a href="<?= base_url(); ?>/pedidos"><?= $data['page_title'] ?></a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="tablePedidos">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Ref. / Transacción</th>
                          <th>Fecha</th>
                          <th>Precio</th>
                          <th>Tipo pago</th>
                          <th>Estado</th>
                          <th>Acciones</th>
                        </tr>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    