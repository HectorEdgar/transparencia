<!doctype html>
<html>
<head>
    <title>Acceso denegado</title>
    <meta name="layout" content="adminLte">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
<div class="error-page">
    <h2 class="headline text-yellow"> 403</h2>
    <div class="error-content" style="padding-top: 10px;">
        <h3><i class="fa fa-warning text-yellow"></i> Ups! Acceso denegado</h3>
        <p>
            No tiene permisos para acceder a esta página. <br/>
            Mientras tanto, puede regresar a la<a href="${createLink(uri: '/')}"> página de inicio</a>.
        </p>
    </div>
    <!-- /.error-content -->
</div>
</body>
</html>
