<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>404NotFound</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
</head>
<body>
    <div
        class="page-error">
        <h1><i class="fa fa-exclamation-circle"></i> Error 404: Página no encontrada</h1>
        <p>No fué posible encontrar la página que buscabas.</p>
        <p><a class="btn btn-primary" href="javascript:window.history.back();">Regresar</a></p>
    </div>

    <footer>
        <script src="<?= media(); ?>/js/popper.min.js"></script>
        <script src="<?= media(); ?>/js/plugins/sweetalert.min.js"></script>
    </footer>
    
</body>
</html>

