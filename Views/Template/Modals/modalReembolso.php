<?php
    $trs = $data->purchase_units[0];
    $client = $data->payer;
    $moneda = "COP";
    $idTransaccion = $trs->payments->captures[0]->id;
    //Datos de cliente:
    $nombreCliente = $client->name->given_name.' '.$client->name->surname;
    $emailCliente = $client->email_address;
    $celCliente = isset($client->phone) ? $client->phone->phone_number->national_number : "";
    $codigoPais = $client->address->country_code;
    //Detalle monto transaccion
    $totalCompra = $trs->payments->captures[0]->seller_receivable_breakdown->gross_amount->value;
    $comision = $trs->payments->captures[0]->seller_receivable_breakdown->paypal_fee->value;
    $importeNeto = $trs->payments->captures[0]->seller_receivable_breakdown->net_amount->value;
?>

<!-- Modal -->
<div class="modal fade" id="modalReembolso" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Realizar Reembolso</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
            <input type="hidden" id="idtransaccion" value="<?= $idTransaccion ?>">
          <tbody>
            <tr>
              <td>Transaccion:</td>
              <td><?= $idTransaccion ?></td>
            </tr>
            <tr>
              <td>Datos contacto:</td>
              <td><?= $nombreCliente ?> <br> <?= $emailCliente ?> <br> <?= $celCliente ?></td>
            </tr>
            <tr>
              <td>Importe total reembolso:</td>
              <td><?= $totalCompra. ' '.$moneda ?></td>
            </tr>
            <tr>
              <td>Importe neto reembolso:</td>
              <td><?= $importeNeto.' '.$moneda ?></td>
            </tr>
            <tr>
              <td>Comision reembolso por PayPal:</td>
              <td><?= $comision.' '.$moneda ?></td>
            </tr>
            <tr>
              <td>Observacion:</td>
              <td><textarea id="txtObservacion" class="form-control"></textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick= "fntReembolsar()"><i class="fa fa-reply-all" area-hidden="true"></i>Reembolsar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>