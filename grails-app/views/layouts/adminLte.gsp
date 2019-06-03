<!DOCTYPE html>
<html style="height: auto; min-height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle /></title>
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

    <asset:stylesheet src="bootstrap-select.css" />
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCkZRcQ_Uu4KSbgM6j-8Pe-SYt2zWzZQU"></script>

    <asset:stylesheet src="morris.css" />

    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <asset:stylesheet src="admin-lte/skins/_all-skins.min.css" />
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <g:layoutHead />
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="layout-top-nav skin-black" style="height: auto; min-height: 100%;">

<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils" %>
<g:set var="springSecurityService" bean="springSecurityService" />
<div class="wrapper" style="height: auto; min-height: 100%;">
    <header class="main-header">
        <nav class="navbar navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="${createLink(uri: '/')}" class="navbar-brand"><b>Transparencia</b></a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>

                <sec:ifNotLoggedIn>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">

                        <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="fa fa-users"></span> Dependencias<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="${createLink(uri: '/principal/dependencias')}"><span class="fa fa-eye"></span> Ver Dependencias</a></li>
                                </ul>
                         </li>
                            <li class="dropdown user user-menu">
                                <g:link class="btn text-blue" uri="/login/auth">Iniciar sesión</g:link>
                            </li>
                        </ul>
                    </div>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <g:pageProperty name="page.nav" />
                        </ul>
                    </div>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <asset:image src="user.png" class="user-image" alt="Imagen usuario" />
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">${springSecurityService.currentUser.username ?: 'Usuario'}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <asset:image src="user.png" class="img-circle" alt="Imagen usuario" />
                                        <p>
                                            ${springSecurityService.currentUser.username ?: 'Usuario'}
                                            <small>
                                                ${springSecurityService.currentUser.entidad?.correo ?: springSecurityService.currentUser.username }
                                            </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <sec:access url="/perfil">
                                            <div class="pull-left">
                                                <a href="${createLink(uri: '/perfil')}" class="btn btn-default btn-flat">
                                                    &nbsp;&nbsp;&nbsp;Mi perfil&nbsp;&nbsp;&nbsp;
                                                </a>
                                            </div>
                                        </sec:access>

                                        <div>
                                            <g:form controller="logout">
                                                <button type="submit" name="logout" class="btn-danger btn btn-flat">
                                                    Cerrar sesión
                                                </button>
                                            </g:form>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-custom-menu -->
                </sec:ifLoggedIn>
            </div>
            <!-- /.container-fluid -->
        </nav>
    </header>
    <!-- Full Width Column -->
    <div class="content-wrapper" style="min-height: 595px;">
        <div class="container">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <g:pageProperty name="page.header" />
            </section>

            <!-- Main content -->
            <section class="content">
                <g:layoutBody />
            </section>
            <!-- /.content -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="container">
            <div class="pull-right hidden-xs">
                <b>Powered by </b> <strong><a href="https://adminlte.io">Almsaeed Studio</a>.</strong>
            </div>
            <strong>Copyright &copy; ${Calendar.getInstance().get(Calendar.YEAR)} <span class="text-primary">Pous</span>.</strong>
            Todos los derechos reservados
        </div>
        <!-- /.container -->
    </footer>
</div>
<!-- ./wrapper -->
<!-- jQuery 3 -->
<asset:javascript src="jquery.min.js" />
<!-- Bootstrap 3.3.7 -->
<asset:javascript src="bootstrap.min.js" />
<!-- SlimScroll -->
<asset:javascript src="jquery.slimscroll.min.js" />
<!-- FastClick -->
<asset:javascript src="fastclick.js" />
<!-- AdminLTE App -->
<asset:javascript src="adminlte.min.js" />
<asset:javascript src="bootstrap-select.js" />


<g:pageProperty name="page.scripts" />
</body>
</html>
