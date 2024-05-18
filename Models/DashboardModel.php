<?php 
	class DashboardModel extends Mysql{
	
		public function __construct(){
			parent::__construct();
		}

		public function cantUsuarios(){
            $sql = "SELECT COUNT(*) as total FROM persona WHERE status != 0";
            $request = $this->select($sql);
            $total = $request['total'];
            return $total;
		}

        public function cantClientes(){
            $sql = "SELECT COUNT(*) as clientes FROM persona WHERE status != 0 AND rolid =".RCLIENTES;
            $request = $this->select($sql);
            $total = $request['clientes'];
            return $total;
        }

        public function cantProductos(){
            $sql = "SELECT COUNT(*) as totalProductos FROM producto WHERE status != 0";
            $request = $this->select($sql);
            $total = $request['totalProductos'];
            return $total;
        }

        public function cantPedidos(){
            $sql = "SELECT COUNT(*) as totalPedidos FROM pedido";
            $request = $this->select($sql);
            $total = $request['totalPedidos'];
            return $total;
        }

        public function lastOrders(){
            $sql = "SELECT 
                p.idpedido,
                CONCAT(pr.nombres,' ',pr.apellidos) as nombre,
                (
                    SELECT SUM(d.precio * d.cantidad)
                    FROM detalle_pedido d
                    WHERE d.pedidoid = p.idpedido
                ) as precio,
                tp.tipopago,
                p.status
            FROM 
                pedido p
            INNER JOIN 
                persona pr on p.personaid = pr.idpersona
            INNER JOIN 
                tipopago tp on p.tipopagoid = tp.idtipopago
            ORDER BY 
                p.idpedido DESC
            LIMIT 7";
        
            $request = $this->select_all($sql);
            return $request;
        }

        public function selectPagosMes(int $year, int $month){
            $sql = "SELECT
                p.tipopagoid, tp.tipopago, COUNT(p.idpedido) 
                AS cantidad_ventas, SUM(d.precio * d.cantidad) 
                AS total_ventas  
            FROM pedido p 
            INNER JOIN detalle_pedido d 
            ON p.idpedido = d.pedidoid 
            INNER JOIN tipopago tp
            ON p.tipopagoid = tp.idtipopago
            WHERE MONTH(p.fecha) = $month AND YEAR(p.fecha) = $year
            GROUP BY tipopagoid";

            $pagos = $this->select_all($sql);
            $meses = Meses();
            $arrData = array('year' => $year, 'month' => $meses[intval($month-1)], 'tipospago' =>$pagos);
            return $arrData;
        }

        public function selectVentasMes(int $year, int $month){
            $totalVentasMes = 0;
            $arrVentaDias = array();
            $dias = cal_days_in_month(CAL_GREGORIAN, $month, $year);
            $n_dia = 1;
            
            for ($i=0; $i < $dias; $i++) {
                $date= date_create($year.'-'.$month.'-'.$n_dia);
                $fechaVenta = date_format($date,"Y-m-d");

                $sql = "SELECT 
                    DAY(p.fecha) AS dia, 
                    COUNT(p.idpedido) AS cantidad, 
                    SUM(d.precio * d.cantidad) AS total
                FROM 
                    pedido p 
                INNER JOIN 
                    detalle_pedido d ON p.idpedido = d.pedidoid 
                WHERE DATE(p.fecha) = '$fechaVenta' AND status = 'Completo'";

                $ventaDia = $this->select($sql);
                $ventaDia['dia'] = $n_dia;
                $ventaDia['total'] = $ventaDia['total'] == "" ? 0 : $ventaDia['total'];
                $totalVentasMes += $ventaDia['total'];
                array_push($arrVentaDias, $ventaDia);
                $n_dia++;
            }
            $meses = Meses();
            $arrData = array('year' => $year, 'month' => $meses[intval($month-1)], 'total' => $totalVentasMes, 'ventas' =>$arrVentaDias);
            return $arrData;
        }

        public function selectVentasTotalMes(int $year, int $month){
            $totalVentasMes = 0;
            $arrVentaDias = array();
            $dias = cal_days_in_month(CAL_GREGORIAN, $month, $year);
            $n_dia = 1;
            
            for ($i=0; $i < $dias; $i++) {
                $date= date_create($year.'-'.$month.'-'.$n_dia);
                $fechaVenta = date_format($date,"Y-m-d");

                $sql = "SELECT 
                    DAY(p.fecha) AS dia, 
                    COUNT(p.idpedido) AS cantidad, 
                    SUM(d.precio * d.cantidad) AS total
                FROM 
                    pedido p 
                INNER JOIN 
                    detalle_pedido d ON p.idpedido = d.pedidoid 
                WHERE DATE(p.fecha) = '$fechaVenta'";

                $ventaDia = $this->select($sql);
                $ventaDia['dia'] = $n_dia;
                $ventaDia['total'] = $ventaDia['total'] == "" ? 0 : $ventaDia['total'];
                $totalVentasMes += $ventaDia['total'];
                array_push($arrVentaDias, $ventaDia);
                $n_dia++;
            }
            $meses = Meses();
            $arrData = array('year' => $year, 'month' => $meses[intval($month-1)], 'total' => $totalVentasMes, 'ventas' =>$arrVentaDias);
            return $arrData;
        }

        public function selectVentasYear(int $year){
            $arrMVentas = array();
            $arrMeses = Meses();
            $totalAnual = 0;
            for ($i=1; $i <= 12 ; $i++) { 
                $arrData = array(
                    'tyear'=> '', 
                    'noMes' => '',
                    'venta'=>''
                );
                $sql = "SELECT
                    $year AS tyear,
                    $i AS mes,
                    SUM(d.precio * d.cantidad) AS venta
                FROM pedido p
                INNER JOIN detalle_pedido d ON p.idpedido = d.pedidoid
                WHERE MONTH(p.fecha) = $i AND YEAR(p.fecha) = $year
                GROUP BY MONTH(p.fecha)";
                
                $ventaMes = $this->select($sql);
                $arrData['mes'] = $arrMeses[$i-1];
                if(empty($ventaMes)){
                    $arrData['tyear'] = $year;
                    $arrData['noMes'] = $i;
                    $arrData['venta'] = 0;
                }else{
                    $arrData['tyear'] = $ventaMes['tyear'];
                    $arrData['noMes'] = $ventaMes['mes'];
                    $arrData['venta'] = $ventaMes['venta'];
                    $totalAnual += $ventaMes['venta'];
                }
                array_push($arrMVentas, $arrData);
            }
            
            $arrVentas = array('year' => $year,'month' => $arrMVentas, 'total' => $totalAnual);
            return $arrVentas;
        }
        
	}
 ?>