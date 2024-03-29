<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Iniciar sesión</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <asset:stylesheet src="bootstrap.min.css" />
    <!-- Font Awesome -->
    <asset:stylesheet src="font-awesome.min.css" />
    <!-- Ionicons -->
    <asset:stylesheet src="ionicons.min.css" />
    <!-- Theme style -->
    <asset:stylesheet src="AdminLTE.min.css" />
    <!-- iCheck -->
    <asset:stylesheet src="iCheck/square/blue.css" />
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${createLink(uri: '/')}"><strong>Sistema de transparencia</strong></a>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-warning"></i>No se pudo iniciar sesión</h4>
            ${flash.message}
        </div>
    </g:if>

    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Ingresa tus credenciales para iniciar sesión</p>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST">
            <div class="form-group has-feedback">
                <input type="text" name="${usernameParameter ?: 'username'}" id="username" class="form-control" placeholder="Usuario" autofocus>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="${passwordParameter ?: 'password'}" id="password" class="form-control" placeholder="Contraseña">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                            Recuérdame
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                <button type="submit" class="btn btn-primary btn-block btn-flat">Iniciar sesión</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <!--<a class="btn btn-default" href="${createLink(uri: '/register/forgotPassword')}">Olvidé mi contraseña</a>-->
        <br>
        <a class="btn btn-default" href="${createLink(uri: '/entidad/registrar')}">Registrar entidad</a>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<asset:javascript src="jquery.min.js" />
<!-- Bootstrap 3.3.7 -->
<asset:javascript src="bootstrap.min.js" />
<!-- iCheck -->
<asset:javascript src="icheck.min.js" />
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>
