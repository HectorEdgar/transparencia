<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registro</title>
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
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="${createLink(uri: "/")}"><b>Sistema de transparecnia</b></a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">Registro de entidad</p>

        <g:hasErrors bean="${this.usuario}">

            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-warning"></i>Error al registrar entidad</h4>

                <g:eachError bean="${this.usuario}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </div>
        </g:hasErrors>

        <g:form action="registrar" method="post">
            <f:with bean="usuario">
                <f:field property="entidad.nombre" label="Nombre de entidad" />
                <f:field property="entidad.encargado" label="Encargado" />
                <f:field property="entidad.descripcion" label="Descripción" />
                <f:field property="entidad.tipo"/>
                <f:field property="entidad.ambito" label="Ámbito" />
                <f:field property="entidad.estado"/>
                <f:field property="entidad.correo" label="Correo electrónico" />
                <f:field property="username" label="Usuario" />
                <f:field property="password" label="Contraseña" />
            </f:with>


            <button type="submit" class="btn btn-primary btn-block btn-flat">Registrar entidad</button>
        </g:form>
        <br>
        <g:link uri="/" class="text-center">Ya cuento con un usuario</g:link>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<asset:javascript src="jquery.min.js" />
<!-- Bootstrap 3.3.7 -->
<asset:javascript src="bootstrap.min.js" />
</body>
</html>
