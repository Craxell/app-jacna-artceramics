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
	}
 ?>