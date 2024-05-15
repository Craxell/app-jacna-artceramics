<?php
	class Dashboard extends Controllers{
		public function __construct(){
			parent::__construct();
			session_start();
			session_regenerate_id(true);
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(MDASHBOARD);
		}

		public function dashboard(){
			$data['page_id'] = 2;
			$data['page_tag'] = "Dashboard - ArtCeramics";
			$data['page_title'] = "Dashboard - ArtCeramics";
			$data['page_name'] = "dashboard";
			$data['page_functions_js'] = "functions_dashboard.js";

			$data['usuarios'] = $this->model->cantUsuarios();
			$data['clientes'] = $this->model->cantClientes();
			$data['totalProductos'] = $this->model->cantProductos();
			$data['totalPedidos'] = $this->model->cantPedidos();
			$data['lastOrders'] = $this->model->lastOrders();

			$year = date('Y');
			$month = date('m');
			$data['pagosMes'] = $this->model->selectPagosMes($year, $month);
			$data['ventasMDia'] = $this->model->selectVentasMes($year, $month);

			// dep($data['ventasMDia']);exit;


			$this->views->getView($this,"dashboard",$data);
		}
	}
 ?>