<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Mi perfil</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menu/menu" />
</content>

<content tag="header">
    <h1>
        Mi perfil
        <small>Datos de usuario</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/perfil')}" class="active"><i class="fa fa-user"></i>Mi perfil</a></li>
    </ol>
</content>

<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>

<div class="row">
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body box-profile">
                <asset:image src="user.png" class="profile-user-img img-responsive img-circle" alt="imagen usuario" />

                <h3 class="profile-username text-center">${usuario.entidad?.nombre ?: usuario.username}</h3>

                <p class="text-muted text-center">${usuario.entidad ? usuario.entidad.tipo : ''}</p>

                <g:if test="${usuario.entidad}">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b>Código</b> <a class="pull-right">${usuario.entidad.id}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Desde</b> <a class="pull-right"><g:formatDate date="${usuario.entidad.dateCreated}" format="dd/MM/yyyy" /></a>
                        </li>
                    </ul>
                </g:if>

                <g:if test="${usuario.entidad}">
                    <a href="${createLink(uri: '/perfil/editar')}" class="btn btn-primary btn-block">Editar</a>
                </g:if>

            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <g:if test="${usuario.entidad}">
                    <li class="active">
                        <a href="#domicilio" data-toggle="tab" aria-expanded="false">Entidad</a>
                    </li>
                </g:if>
                <li class="${usuario.entidad ? '' : 'active'}">
                    <a href="#personal" data-toggle="tab" aria-expanded="true">Información de la cuenta</a>
                </li>

                <!--<li>
                    <a href="#cambiar" data-toggle="tab" aria-expanded="false">Cambiar contraseña</a>
                </li>-->
            </ul>
            <div class="tab-content">
                <g:if test="${usuario.entidad}">
                    <div class="tab-pane active" id="domicilio">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <b>Nombre</b> <a class="pull-right">${usuario.entidad.nombre}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Encargado</b> <a class="pull-right">${usuario.entidad.encargado ?: ''}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Tipo</b> <a class="pull-right">${usuario.entidad.tipo}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Descripción</b> <a class="pull-right">${usuario.entidad.descripcion}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Ámbito</b> <a class="pull-right">${usuario.entidad.ambito}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Estado</b> <a class="pull-right">${usuario.entidad.estado}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Correo electrónico</b> <a class="pull-right">${usuario.entidad.correo}</a>
                            </li>
                        </ul>
                    </div>
                </g:if>
                <div class="tab-pane ${usuario.entidad ? '' : 'active'}" id="personal">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b>Usuario</b> <a class="pull-right">${usuario.username}</a>
                        </li>
                    </ul>
                </div>
                <%--<div class="tab-pane" id="cambiar">
                    <g:set var="command" value="${new com.tecnosalle.PerfilCommand() }" />
                    <g:form action="actualizarPassword" method="post">
                        <f:with bean="command">
                            <f:field property="password" label="Contraseña"/>
                            <f:field property="newPassword" label="Nueva contraseña"/>
                            <f:field property="confirmPassword" label="Confirmar contraseña"/>
                        </f:with>
                        <input type="submit" class="btn btn-primary btn-flat btn-block" value="Guardar cambios" />
                    </g:form>
                </div>--%>
            </div>
        </div>
    </div>
</div>

<content tag="scripts">
</content>

</body>
</html>
