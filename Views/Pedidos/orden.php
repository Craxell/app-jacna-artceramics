<?php headerAdmin($data); ?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-file-text-o"></i> <?= $data['page_title'] ?></h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/pedidos"> Pedidos</a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <?php
          if(empty($data['arrPedido'])){
        ?>
        <p>Datos no encontrados</p>
        
        <?php }else{
            $cliente = $data['arrPedido']['cliente']; 
            $orden = $data['arrPedido']['orden'];
            $detalle = $data['arrPedido']['detalle'];
            $transaccion = $orden['idtransaccionpaypal'] != "" ? 
                           $orden['idtransaccionpaypal'] : 
                           $orden['referenciacobro'];
         ?>
        <section id="sPedido" class="invoice">
          <div class="row mb-4">
            <div class="col-6">
                <style type="text/css">
                    
                    img{
                        width: 90px;
                        border-radius: 30%;
                    
                    }
                
                </style>
              <h2 class="page-header"><img src="<?= media(); ?>/images/ArtCeramicShop.png" ></h2>
            </div>
            <div class="col-6">
              <h5 class="text-right">Fecha: <?= $orden['fecha'] ?></h5>
            </div>
          </div>
          <div class="row invoice-info">
            <div class="col-4">
              <address><strong><?= NOMBRE_EMPRESA; ?></strong><br>
                <?= DIRECCION ?><br>
                <?= CONTACTO ?><br>
                <?= EMAIL_EMPRESA ?><br>
                <?= WEB_EMPRESA ?>
              </address>
            </div>
            <div class="col-4">
              <address><strong><?= $cliente['nombres'].' '.$cliente['apellidos'] ?></strong><br>
                Envío: <?= $orden['direccion_envio']; ?><br>
                Tel: <?= $cliente['telefono'] ?><br>
                Email: <?= $cliente['email_user'] ?>
               </address>
            </div>
            <div class="col-4"><b>Orden #<?= $orden['idpedido'] ?></b> 
                <b>Pago: </b><?= $orden['tipopago'] ?><br>
                <b>Transacción:</b> <?= $transaccion ?> <br>
                <b>Estado:</b> <?= $orden['status'] ?> <br>
                <b>Total:</b> <?= SMONEY.' '. formatMoney($orden['total_pedido']) ?>
            </div>
          </div>
          <div class="row">
            <div class="col-12 table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Descripción</th>
                    <th class="text-right">Precio</th>
                    <th class="text-center">Cantidad</th>
                    <th class="text-right">Precio X Cant.</th>
                  </tr>
                </thead>
                <tbody>
                    <?php 
                        $subtotal = 0;
                        if(count($detalle) > 0){
                            foreach ($detalle as $producto) {
                                $subtotal += $producto['cantidad'] * $producto['precio'];
                     ?>
                  <tr>
                    <td><?= $producto['producto'] ?></td>
                    <td class="text-right"><?= SMONEY.' '. formatMoney($producto['precio']) ?></td>
                    <td class="text-center"><?= $producto['cantidad'] ?></td>
                    <td class="text-right"><?= SMONEY.' '. formatMoney($producto['cantidad'] * $producto['precio']) ?></td>
                  </tr>
                  <?php 
                            }
                        }
                   ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3" class="text-right">Sub-Total:</th>
                        <td class="text-right"><?= SMONEY.' '. formatMoney($subtotal) ?></td>
                    </tr>
                    <tr>
                        <th colspan="3" class="text-right">Envío:</th>
                        <td class="text-right"><?= SMONEY.' '. formatMoney($orden['costo_envio']) ?></td>
                    </tr>
                    <tr>
                        <th colspan="3" class="text-right">Total:</th>
                        <td class="text-right"><?= SMONEY.' '. formatMoney($subtotal+$orden['costo_envio']) ?></td>
                    </tr>
                </tfoot>
              </table>
            </div>
          </div>
          <div class="row d-print-none mt-2">
            <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print('#sPedido');" ><i class="fa fa-print"></i> Imprimir</a></div>
          </div>
        </section>
        <?php } ?>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>