<?php 
    $cliente = $data['cliente'];
    $orden = $data['orden'];
    $detalle = $data['detalle'];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Factura</title>
    <style>
        table{
            width: 100%;
        }
        table td, table th{
            font-size: 12px;
        }
        h4{
            margin-bottom: 0px;
        }
        .text-center{
            text-align: center;
        }
        .text-right{
            text-align: right;
        }
        .wd33{
            width: 33.33%;
        }
        .tbl-cliente{
            border: 1px solid #CCC;
            border-radius: 10px;
            padding: 5px;
        }
        .wd10{
            width: 10%;
        }
        .wd40{
            width: 40%;
        }
        .wd55{
            width: 55%;
        }
        .wd15{
            width: 15%;
        }
        .tbl-detalle{
            border-collapse: collapse;
        }
        .tbl-detalle thead th{
            padding: 5px;
            background-color: #690644;
            color: #FFF;
            
        }
        .tbl-detalle tbody td{
            border-bottom: 1px solid #CCC;
            padding: 5px;
        }

    </style>
</head>
<body>
    <table class="tbl-header">
        <tbody>
            <tr>
                <td class="wd33">
                    <img class="logo" src="<?= media() ?>/images/file.png" alt="Logo">
                </td>
                <td class="text-center wd33">
                    <h4><strong><?= NOMBRE_EMPRESA ?></strong></h4>
                    <p><?= DIRECCION ?> <br>
                    Telefono: <?= CONTACTO ?> <br>
                    Email: <?= EMAIL_EMPRESA ?> </p>
                </td>
                <td class="text-right wd33">
                    <p>No. Orden <strong><?= $data['orden']['idpedido']?></strong><br>
                        fecha: <?= $data['orden']['fecha']?> <br>
                        Metodo pago: <?= $data['orden']['tipopago']?> <br>
                        <?php
                            if($data['orden']['tipopagoid'] == 1){
                                ?>
                                Transaccion:  <?= $data['orden']['idtransaccionpaypal']?>
                            <?php }else{
                                ?>
                                Transaccion: <?= $data['orden']['referenciacobro']?>
                            <?php }?>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-cliente">
        <tbody>
            <tr>
                <td class="wd10">Identificacion:</td>
                <td class="wd40"><?= $data['cliente']['identificacion']?></td>
                <td class="wd10">Telefono</td>
                <td class="wd40"><?= $data['cliente']['telefono']?></td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><?= $data['cliente']['nombres'].' '.$data['cliente']['apellidos']?></td>
                <td>Direccion</td>
                <td><?= $data['orden']['direccion_envio']?></td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-detalle">
        <thead>
            <tr>
                <th class="wd55">Descripcion</th>
                <th class="wd15 text-right">Precio</th>
                <th class="wd15 text-center">Cantidad</th>
                <th class="wd15 text-right">Importe</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                $subtotal = 0;
                foreach($detalle as $producto){
                    $importe = $producto['precio'] * $producto['cantidad'];
                    $subtotal = $subtotal+$importe;
                ?>
            <tr>
                <td><?= $producto['producto']?></td>
                <td class="text-right"><?= SMONEY.' '.formatMoney($producto['precio'])?></td>
                <td class="text-center"><?= $producto['cantidad']?></td>
                <td class="text-right"><?= SMONEY.' '.formatMoney($importe)?></td>
            </tr>

            <?php }?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3" class="text-right">Subtotal:</td>
                <td class="text-right"><?= SMONEY.' '.formatMoney($subtotal)?></td>
            </tr>
            <tr>
                <td colspan="3" class="text-right">Envio:</td>
                <td class="text-right"><?= SMONEY.' '.formatMoney($orden['costo_envio'])?></td>
            </tr>
            <tr>
                <td colspan="3" class="text-right">Total:</td>
                <td class="text-right"><?= SMONEY.' '.formatMoney($subtotal+$orden['costo_envio'])?></td>
            </tr>
        </tfoot>
    </table>
    <br>
    <div class="text-center">
        <p>
            Si tienes preguntas sobre tu pedido, <br> pongase en contacto con nosotros mediante el correo o redes sociales.
        </p>
        <h4>Gracias por tu compra!</h4>
    </div>
</body>
</html>
