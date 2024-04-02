<?php

$orden = $data['pedido']['orden'];
$detalle = $data['pedido']['detalle'];

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orden</title>
    <style type="text/css">
        p{
            font-family: arial;
            letter-spacing: 1px;
            color: #7f7f7f;
            font-size: 12px;
        }
        hr{
            border:0;
            border-top: 1px solid #CCC; 
        }
        h4{
            font-family: arial;
            margin: 0;
        }
        table{
            width: 100%;
            max-width: 600px;
            margin: 10px auto;
            border: 1px solid #CCC;
            border-spacing: 0;

        }
        table tr td, table tr th{
            padding: 5px 10px;
            font-family: arial;
            font-size: 12px;
        }
        #detalleOrden tr td{
            border: 1px solid #CCC;
        }
        .table-active{
            background-color: #CCC;
        }
        .text-center{
            text-align: center;
        }
        .text-right{
            text-align: right;
        }
        .logoEmail{
            width: 90px;
            border-radius: 30%;
        
        }

        @media screen and (max-width: 470px) {
            .logoEmail{
                width: 90px;
                border-radius: 30%;
            
            }
            p, table tr td, table tr th {font-size: 9px;}
        }


    </style>
</head>
<body>
    <div>
        <br>
        <p class="text-center">Se há generado una orden, a continuación encontrará los detalles.</p>
        <br>
        <hr>
        <br>
        <table>
            <tr>
                <td width="33.33%">
                    <img class="logoEmail" src="https://i.ibb.co/DMsfF9c/Art-Ceramic-Shop-LOGO.png" alt="Logo">
                </td>
                <td>
                    <div class="text-center">
                        <h4><strong><?= NOMBRE_EMPRESA ?></strong></h4>
                        <p>
                            <?= DIRECCION ?> <br>
                            <?= CONTACTO ?> <br>
                            <?= EMAIL_EMPRESA ?>
                        </p>
                    </div>
                </td>
                <td width="33.33%">
                    <div class="text-right">
                        <p>
                            No. Orden: <strong><?= $orden['idpedido'];?></strong><br>
                            Fecha: <?= $orden['fecha'];?> <br>
                            <?php 
                                if($orden['tipopagoid'] == 1){
                            ?>
                            Metodo Pago: <?= $orden['tipopago']; ?><br>
                            Transaccion: <?= $orden ['idtransaccionpaypal']; ?>
                            <?php }else{ ?>
                                Metodo Pago: Pago contra entrega <br>
                                Tipo Pago: <?= $orden['tipopago']; ?>
                            <?php } ?>
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td width="140">Nombre:</td>
                <td><?= $_SESSION['userData']['nombres']. ' ' .$_SESSION['userData']['apellidos']; ?></td>
            </tr>
            <tr>
                <td>Telefono</td>
                <td><?= $_SESSION['userData']['telefono']; ?></td>
            </tr>
            <tr>
                <td>Direccion de envio:</td>
                <td><?= $orden['direccion_envio']; ?></td>
            </tr>
        </table>

        <table>
            <thead class ="table-active">
                <tr>
                    <th>Descripcion: </th>
                    <th class="text-right">Precio Unitario</th>
                    <th class="text-right">Cantidad</th>
                    <th class="text-right">Precio x Cant.</th>
                </tr>
            </thead>
            <tbody id="detalleOrden">
                <?php 
                    if(count($detalle) > 0){
                        $subtotal = 0;
                        foreach ($detalle as $producto) {
                            $precio = formatMoney($producto['precio']);
                            $importe = $producto['precio'] * $producto['cantidad'];
                            $subtotal += $importe;
                ?>
                <tr>
                <td><?= $producto['producto'] ?></td>
                <td class="text-right"><?= SMONEY.' '.$precio ?></td>
                <td class="text-center"><?= $producto['cantidad'] ?></td>
                <td class="text-right"><?= SMONEY.' '.formatMoney($importe); ?></td>
                </tr>
                <?php }
                    } ?>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="3" class="text-right">Subtotal:</th>
                    <td class="text-right"><?= SMONEY.' '.formatMoney($subtotal) ?></td>
                </tr>
                <tr>
                    <th colspan="3" class="text-right">Envio</th>
                    <td class="text-right"><?= SMONEY.' '.formatMoney($orden['costo_envio']) ?></td>
                </tr>
                <tr>
                    <th colspan="3" class="text-right">Total</th>
                    <td class="text-right"><?= SMONEY.' '.formatMoney($subtotal+$orden['costo_envio']) ?></td>
                </tr>
            </tfoot>
        </table>
        <div class="text-center">
            <p>Si tienes preguntas sobre tu pedido, <br> pongase en contacto con nombre, telefono y correo electronico</p>
            <h4>Gracias por tu compra!</h4>

        </div>
    </div>
    
</body>
</html>
