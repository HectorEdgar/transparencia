<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>${entidad.nombre}</title>
</head>
<body>
    <content tag="nav">
        <g:render template="/menu/menu" model="${[current: "entidades"]}" />
    </content>


    <content tag="header">
        <h1>
            ${entidad.nombre}
            <small>Detalles de la entidad</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="${createLink(uri: '/perfil')}"><i class="fa fa-user"></i>Mi perfil</a></li>
            <li><a href="${createLink(uri: '/perfil/editar')}" class="active"><i class="fa fa-edit"></i>Editar perfil</a></li>
        </ol>
    </content>

<div class="row">
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body box-profile">
                <asset:image src="user.png" class="profile-user-img img-responsive img-circle" alt="imagen usuario" />

                <h3 class="profile-username text-center">${entidad.nombre}</h3>

                <p class="text-muted text-center">${entidad.correo}</p>

                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Código</b> <a class="pull-right">${entidad.id}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Desde</b> <a class="pull-right"><g:formatDate date="${entidad.dateCreated}" format="dd/MM/yyyy" /></a>
                    </li>
                </ul>
                <g:link action="edit" id="${entidad.id}" class="btn btn-primary btn-block"><i class="fa fa-edit"></i> Editar</g:link>
                <%--<button type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#modal-danger">
                    <i class="fa fa-trash-o"> Eliminar</i>
                </button>--%>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#entidad" data-toggle="tab" aria-expanded="false">Detalles de la entidad</a>
                </li>
                <li>
                    <a href="#presupuestos" data-toggle="tab" aria-expanded="true">Presupuestos</a>
                </li>

                <li>
                    <a href="#usuarios" data-toggle="tab" aria-expanded="false">Usuarios</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="entidad">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b>Nombre</b> <a class="pull-right">${entidad.nombre}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Encargado</b> <a class="pull-right">${entidad.encargado ?: ''}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Tipo</b> <a class="pull-right">${entidad.tipo}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Descripción</b> <a class="pull-right">${entidad.descripcion}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Ámbito</b> <a class="pull-right">${entidad.ambito}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Estado</b> <a class="pull-right">${entidad.estado}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Correo electrónico</b> <a class="pull-right">${entidad.correo}</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="presupuestos">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Año</th>
                                <th>Monto</th>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${entidad.presupuestos}">
                            <tr>
                                <td>${it.anio}</td>
                                <td>${it.monto}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane" id="usuarios">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Usuario</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${entidad.usuarios}">
                            <tr>
                                <td>${it.username}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <%--
    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">Datos de la entidad</h3>
            </div>

            <div class="box-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Nombre</b> <a class="pull-right">${entidad.nombre}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Encargado</b> <a class="pull-right">${entidad.encargado ?: ''}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Tipo</b> <a class="pull-right">${entidad.tipo}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Descripción</b> <a class="pull-right">${entidad.descripcion}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Ámbito</b> <a class="pull-right">${entidad.ambito}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Estado</b> <a class="pull-right">${entidad.estado}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Correo electrónico</b> <a class="pull-right">${entidad.correo}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    --%>
</div>


<div class="modal fade" id="modal-danger">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Eliminar entidad</h4>
            </div>
            <div class="modal-body">
                <p>¿Está seguro de eliminar esta entidad?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                <g:link action="delete" class="btn btn-danger" params="[id: entidad.id]">Eliminar</g:link>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>
