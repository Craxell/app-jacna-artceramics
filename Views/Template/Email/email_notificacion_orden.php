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
                    <img class="logoEmail" src="https://lh3.googleusercontent.com/fife/ALs6j_F2-ue2ENkVxgwekznxKXBjSZInNnfn5-f6agMETAsGn_zpYvP7LR3gyl0EWvg2hiD7T7XPoH1KDufDd4DReRa_FEO53cHI8ejv8VNk7kvxNKeqWkQ88FnS1-sJYzyr3e1ptLVL7EpaA42SgMrGaPpvOHNnTFlR02udc2TwFPACJ9EgNSTcvatcngfBjRBGV0F2EgqDyUEiJzzbmLXkIL9-2hf5eJNPh_R9aCBgx9dDK2KZvKtlMYSUfxckUE1jIDwwu41TDP6cAw6eZ-ZU6XAWUTnEc4QKMAE073fPsrdrnCepx3AdKhPCnvi6hFVfnM259XwAYWYJ7w8YKXtogX_mfjrPVTuVEd-8BlGV3CfAsxqz0W4Y_uIyxQ9nYvMmHBuwRqom1vgNoMxPHr5-eEchTPtPaRJQU2qOkWzQTTg8KbDbLfgp-sIQ9U8zowWXntlklSUJyWDfjxyHUUm-AhMzJ3NyoVKc0Jbd54rORBt5SHJh0Zpy91scv1KVuUqXQdJSBeCGs4lV_Ls5J1kIKaaus6Q36TWh1XQ_XpIE_PDA8xikJzv5KEmlsgIu6gmS1VFEOCYIFZSYB4bKO4DYP-RkK7son-kSH0DOmt8JHqC80FlGPfsTe7s2cR_aEj8fGa9aGQetyZuSilTp_dBqd55GLAm_XFlT9dkTqq4i6_Bz6_bVnb5cfCbEJmQvTNlsaqHRlUII9-3wxx2pqBmQogx1bKMJ0dhQrJAvDoprcWCuwSmMHRVFfZ3TsbD5QSmwWcFPyQgF5PE1z0kqLmuiQAnGC8kY0s90HD83h8LWlCQPcnFsWbqUf6lZ4YBrWrvxvOa9KCsFxHGYHChWjbw3S_-XRRdU-Tq5BiNHhdsdGn7InSfiAIbH1_8Tp6SyDTPxbUOED2h771yT_Ofmu5mKWyO5le0_F0v6eg9Pf9Vs8kuI0MkGW7FNp4u2HjbNoAHtlFIQ3cIAUvRXRi2cd0fkjTa0SV1duaySJS3g4E3-mnPpYr9lGECMCfEdmZLLgIFl8aJR5WcFY_N6Lbq_FXhFkPcteXyzN49TemviJpM=w1920-h953" alt="Logo">
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
