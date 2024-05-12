<?php 

	class Dashboard extends Controllers{
		public function __construct()
		{
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

		public function dashboard()
		{
			$data['page_id'] = 2;
			$data['page_tag'] = "Dashboard - ArtCeramics";
			$data['page_title'] = "Dashboard - ArtCeramics";
			$data['page_name'] = "dashboard";
			$data['page_functions_js'] = "functions_dashboard.js";
			
			$data['usuarios'] = $this->model->cantUsuarios();
			$data['clientes'] = $this->model->cantClientes();
			$data['totalProductos'] = $this->model->cantProductos();
			$data['totalPedidos'] = $this->model->cantPedidos();

			$this->views->getView($this,"dashboard",$data);
		}

	}
 ?>