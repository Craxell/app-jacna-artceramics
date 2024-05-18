    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<?= media();?>/images/avatar2.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><?= $_SESSION['userData']['nombres']; ?></p>
          <p class="app-sidebar__user-name"><?= $_SESSION['userData']['apellidos']; ?></p>
          <p class="app-sidebar__user-designation"><?= $_SESSION['userData']['nombrerol']; ?></p>
        </div>
      </div>
      <ul class="app-menu">
        <?php if(!empty($_SESSION['permisos'][MDASHBOARD]['r'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/dashboard">
                <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/monitor.png">
                <span class="app-menu__label">Dashboard</span>
            </a>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][MUSUARIOS]['r'])){ ?>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/usuarios.png">
                <span class="app-menu__label" id="al2">Usuarios</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
                
            </a>
            <div">
                <ul class="treeview-menu">
                    <a class="treeview-item c2" href="<?= base_url(); ?>/usuarios"><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/usuarios.png"></i> Usuarios</a>
                    <a class="treeview-item c2" href="<?= base_url(); ?>/roles"><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/permisos.png"> Roles</a>
                </ul>
            </div>
            
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][MCLIENTES]['r'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/clientes">
            <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/apreton-de-manos.png">
                <span class="app-menu__label">Clientes</span>
            </a>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][MPRODUCTOS]['r']) || !empty($_SESSION['permisos'][MCATEGORIAS]['r'])){ ?>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/bolsa.png">
                <span class="app-menu__label">Tienda</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <?php if(!empty($_SESSION['permisos'][MPRODUCTOS]['r'])){ ?>
                <a class="treeview-item c2" href="<?= base_url(); ?>/productos"><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/inventario.png"> Productos</a>
                <?php } ?>
                <?php if(!empty($_SESSION['permisos'][MCATEGORIAS]['r'])){ ?>
                <a class="treeview-item c2" href="<?= base_url(); ?>/categorias"><img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/categorias.png"> Categorías</a>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][MPEDIDOS]['r'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/pedidos">
            <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/entrega-de-pedidos.png">
                <span class="app-menu__label">Pedidos</span>
            </a>
        </li>
         <?php } ?>
        
         <li>
            <a class="app-menu__item" href="<?= base_url(); ?>">
            <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/mercado.png">
                <span class="app-menu__label">Art Ceramics</span>
            </a>
        </li>

        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/logout">
            <img class="iconDashboard2" src="<?= media();?>/images/Icons/x512/salida.png">
                <span class="app-menu__label">Logout</span>
            </a>
        </li>
      </ul>
    </aside>