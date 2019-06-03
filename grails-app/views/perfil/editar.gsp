<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Editar perfil</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menu/menu" />
</content>

<content tag="header">
    <h1>
        Editar perfil
        <small>Editar datos de usuario</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/perfil')}"><i class="fa fa-user"></i>Mi perfil</a></li>
        <li><a href="${createLink(uri: '/perfil/editar')}" class="active"><i class="fa fa-edit"></i>Editar perfil</a></li>
    </ol>
</content>

<g:hasErrors bean="${this.usuario}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-warning"></i>Error al modificar entidad</h4>

        <g:eachError bean="${this.usuario}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </div>
</g:hasErrors>

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

            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">Modificar perfil</h3>
            </div>

            <div class="box-body">
                <g:form action="editar" method="post">

                    <input type="hidden" name="id" value="${usuario.id}" />
                    <f:with bean="usuario">
                        <f:field property="entidad.nombre" label="Nombre de entidad" />
                        <f:field property="entidad.encargado" label="Encargado" />
                        <f:field property="entidad.descripcion" label="Descripción" />
                        <f:field property="entidad.tipo"/>
                        <f:field property="entidad.ambito" label="Ámbito" />
                        <f:field property="entidad.estado"/>
                        <f:field property="entidad.correo" label="Correo electrónico" />
                        <f:field property="username" label="Usuario" />
                    </f:with>

                    <button type="submit" class="btn btn-primary btn-block btn-flat">Guardar entidad</button>
                </g:form>
            </div>
        </div>
    </div>
</div>




<content tag="scripts">

</content>
</body>
</html>
