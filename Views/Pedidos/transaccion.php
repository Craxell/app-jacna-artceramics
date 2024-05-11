<?php headerAdmin($data); ?>
<div id="divModal">

</div>
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
          if(empty($data['objTransaccion'])){
            
        ?>
        <p>Datos no encontrados</p>
        <?php }else{
          
          $trs = $data['objTransaccion']->purchase_units[0];
          $idTransaccion = $trs->payments->captures[0]->id;
          $fecha = $trs->payments->captures[0]->create_time;
          $estado = $trs->payments->captures[0]->status;
          $monto = $trs->payments->captures[0]->amount->value;
          //$moneda = $trs->payments->captures[0]->amount->currency_code;
          $moneda = "COP";

          //Datos de cliente:
          $client = $data['objTransaccion']->payer;
          $nombreCliente = $client->name->given_name.' '.$client->name->surname;
          $emailCliente = $client->email_address;
          $celCliente = isset($client->phone) ? $client->phone->phone_number->national_number : "";
          $codigoPais = $client->address->country_code;
          $addressLine = $trs->shipping->address->address_line_1;
          $direccion1 = $trs->shipping->address->admin_area_1;
          $direccion2 = $trs->shipping->address->admin_area_2;
          $postalCode = $trs->shipping->address->postal_code;

          //Correo paypal tienda
          $emailTienda = $trs->payee->email_address;

          //Detalle compra
          $descripcion = $trs->description;
          $montoDetalle = $trs->amount->value;

          //Detalle monto transaccion
          $totalCompra = $trs->payments->captures[0]->seller_receivable_breakdown->gross_amount->value;
          $comision = $trs->payments->captures[0]->seller_receivable_breakdown->paypal_fee->value;
          $importeNeto = $trs->payments->captures[0]->seller_receivable_breakdown->net_amount->value;

          //Reembolsos
          $reembolso = false;
          if(isset($trs->payments->refunds)){
            $reembolso = true;
            $importeBruto = $trs->payments->refunds[0]->seller_payable_breakdown->gross_amount->value;
            $comisionPaypal = $trs->payments->refunds[0]->seller_payable_breakdown->paypal_fee->value;
            $importeNetoReembolso = $trs->payments->refunds[0]->seller_payable_breakdown->net_amount->value;
            $fechaReembolso = $trs->payments->refunds[0]->update_time;
          }
            
         ?>
        <section id="sPedido" class="invoice">
          <div class="row mb-4">
            <div class="col-6">
              <h2 class="page-header"><img src="<?= media(); ?>/images/img-paypal.jpg" ></h2>
            </div>
            <?php if(!$reembolso){ 
              if($_SESSION['permisosMod']['u'] and $_SESSION['userData']['idrol'] != RCLIENTES){
                
              
            ?>

            <div class="col-6 text-right">
              <button class="btn btn-outline-primary" onclick ="fntTransaccion('<?= $idTransaccion?>');"><i class="fa fa-reply-all" aria-hidden="true"></i>Reembolsar</button>
            </div>
            <?php } }?>
          </div>
          <div class="row invoice-info">
            <div class="col-4">
              <address><strong>Transacción: <?= $idTransaccion; ?></strong><br><br>
                Fecha: <?= $fecha; ?><br>
                Estado: <?= $estado; ?><br>
                Importe bruto: <?= $monto; ?><br>
                Moneda: <?= $moneda; ?><br>
              </address>
            </div>
            <div class="col-4">
              <address><strong>Enviado por:</strong><br><br>
                Nombre: <strong><?= $nombreCliente ?></strong><br>
                Telefono: <strong><?= $celCliente ?></strong><br>
                Direccion: <strong><?= $addressLine ?></strong><?= ' '.$direccion1.' '.$codigoPais.' '.$postalCode ?><br>
              </address>
            </div>
            <div class="col-4"><strong>Enviado a:</strong><br><br>
              Email: <strong><?= $emailTienda ?></strong><br>
            </div>
          </div>
          <div class="row">
            <div class="col-12 table-responsive">
              <?php if($reembolso){ ?>
              <table class="table table-sm">
                <thead class="thead-light">
                  <tr>
                    <th>Movimiento</th>
                    <th class="text-right">Importe bruto</th>
                    <th class="text-right">Comision</th>
                    <th class="text-right">Importe neto</th>
                  </tr>
                </thead>
                <tbody>
                  <?php if($_SESSION['userData']['idrol'] == RCLIENTES ){ ?>
                    <tr>
                      <td><?= $fechaReembolso.' Reembolso para: '.$nombreCliente ?></td>
                      <td class="text-right">- <?= $importeBruto.' '.$moneda?></td>
                      <td class="text-right">0.00</td>
                      <td class="text-right">- <?= $importeNeto.' '.$moneda?></td>
                    </tr>
                    <?php }else{ ?>

                    <tr>
                      <td><?= $fechaReembolso.' Reembolso para: '.$nombreCliente ?></td>
                      <td class="text-right">- <?= $importeBruto.' '.$moneda?></td>
                      <td class="text-right">- <?= $comisionPaypal.' '.$moneda?></td>
                      <td class="text-right">- <?= $importeNeto.' '.$moneda?></td>
                    </tr>


                    <tr>
                      <td><?= $fechaReembolso ?> Cancelacion de la comision de PayPal</td>
                      <td class="text-right"><?= $comisionPaypal.' '.$moneda ?></td>
                      <td class="text-right">0.00 <?= $moneda ?></td>
                      <td class="text-right"><?= $comisionPaypal.' '.$moneda ?></td>
                    </tr>
                  <?php } ?>
                </tbody>
              </table>
              <?php } ?>

              <table class="table table-sm">
                <thead class="thead-light">
                  <tr>
                    <th>Detalle de pedido</th>
                    <th class="text-right">Cantidad</th>
                    <th class="text-center">Precio</th>
                    <th class="text-right">Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                   
                  <tr>
                    <td><?= $descripcion ?></td>
                    <td class="text-right">1</td>
                    <td class="text-right"><?= $monto.' '.$moneda ?></td>
                    <td class="text-right"><?= $monto.' '.$moneda ?></td>
                  </tr>
                  
                </tbody>
                <tfoot>
                    <tr>
                      <th colspan="3" class="text-right">Total de la compra:</th>
                      <td class="text-right"><?= $monto.' '.$moneda ?></td>
                    </tr>
                </tfoot>
              </table>
              <?php if($_SESSION['userData']['idrol'] != RCLIENTES){?>
              <table class="table table-sm">
                <thead class="thead-light">
                  <tr>
                    <th colspan="2">Detalles de pago</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td width="250"><strong>Total de la compra </strong></td>
                    <td><?= $totalCompra.' '.$moneda ?></td>
                  </tr>
                  <tr>
                    <td><strong>Comision de paypal</strong></td>
                    <td>- <?= $comision.' '.$moneda ?></td>
                  </tr>
                  <tr>
                    <td><strong>Importe neto</strong></td>
                    <td><?= $importeNeto.' '.$moneda ?></td>
                  </tr>
                </tbody>
              </table>
              <?php } ?>

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