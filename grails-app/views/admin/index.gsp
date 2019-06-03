 <!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
    <asset:stylesheet src="dataTables.bootstrap.min.css" />

</head>
<content tag="nav">
    <g:render template="/menu/menu"/>
</content>


<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>

<h1>Lista de Administradores</h1>

<div class="box box-danger">
    <div class="box-header with-border">
        <h3 class="box-title">
            Lista de Alumnos
        </h3>

          <div class="pull-right">
            <a class="btn btn-success" href="${createLink(uri: "/admin/create")}">Registrar Administrador</a>
        </div>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-empleados" class="table table-bordered">
                <thead>
                    <tr>
                        <th >Id</th>
                        <td scope="col">Nombre de Usuario</td>
                        <td scope="col">Entidad</td>
                        <td scope="col">Opciones</td>
                    </tr>
                </thead>
                <tbody>
                  <g:each in="${administradores}">
                        <tr>
                            <th scope="row">${it.id}</th>
                            <td>${it.username}</td>
                            <g:if test="${it.entidad !=null}">
                            <td>${it.entidad.nombre} <strong>(${it.entidad.estado})</strong></td>                                                 
                            </g:if>
                            <g:else>
                            <td>--------</td>
                            </g:else>
                            <td>
                            <g:link action="editar" id="${it.id}" class="btn btn-warning"><span class="fa fa-edit"></span> Editar
                            </g:link> 
                           
                            <a class="btn btn-danger text-dark"
                                data-toggle="modal" data-target="#modal${it.id}">
                                <span class="oi oi-circle-x text-info"></span>
                                Eliminar
                            </a>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>



<g:each in="${administradores}" var="admin">
            <div class="modal fade" id="modal${admin.id}" tabindex="-1"
                role="dialog" aria-labelledby="tituloModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="tituloModal">
                                <strong>Advertencia</strong>
                            </h5>
                            <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body text-center bg-danger text-white">
                            ¿Está seguro que desea Eliminar este registro?<br>
                            "<strong> ${admin.id} ${admin.username}</strong>"?
                            <br />
                            <br />
                        
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Cancelar</button>
                            <g:link action="eliminar" id="${admin.id}" controller="admin"
                                params="['admin': admin.id]"
                                class="btn btn-danger">
                                Eliminar
                            </g:link>
                        </div>

                    </div>
                </div>
            </div>
        </g:each>

<content tag="scripts">
    <asset:javascript src="jquery.dataTables.min.js" />
    <asset:javascript src="dataTables.bootstrap.min.js" />

    <script type="text/javascript">
        $(function () {
            $('#table-empleados').dataTable({
                "lengthMenu": [[50, 100, -1], [50, 100, "Todos"]],
                "autoWidth": false,
                "order": [[0, "desc"]],
                "language": {
                    "emptyTable": "Sin registros",
                    "info": "Registros _START_ a _END_. Total: _TOTAL_",
                    "infoEmpty": "Sin registros por mostrar",
                    "infoFiltered": "(_MAX_ registros filtrados)",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron resultados",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Fin",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                }
            });
        });
    </script>
</content>
</html>