<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminLte" />
        <title>Editar entidad</title>
    </head>
    <body>
    <content tag="nav">
        <g:render template="/menu/menu" model="${[current: 'entidades']}"/>
    </content>

    <content tag="header">
        <h1>
            ${entidad.nombre}
            <small>Editar entidad</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="${createLink(uri: '/entidades')}"><i class="fa fa-building"></i>Entidades</a></li>
        </ol>
    </content>

    <g:hasErrors bean="${this.usuario}">

        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-warning"></i>Error al registrar entidad</h4>

            <g:eachError bean="${this.usuario}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </div>
    </g:hasErrors>

    <div class="box">
        <div class="box-header">
            <h3 class="box-title">Editar entidad</h3>
        </div>
        <div class="box-body">
            <g:form action="update" method="post">
                <f:with bean="entidad">
                    <f:field property="nombre" label="Nombre de entidad" />
                    <f:field property="encargado" label="Encargado" />
                    <f:field property="descripcion" label="Descripción" />
                    <f:field property="tipo"/>
                    <f:field property="ambito" label="Ámbito" />
                    <f:field property="estado"/>
                    <f:field property="correo" label="Correo electrónico" />
                </f:with>

                <button type="submit" class="btn btn-primary btn-block btn-flat">Registrar entidad</button>
            </g:form>
        </div>
    </div>

    </body>
</html>
