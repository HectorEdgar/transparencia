<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminLte" />
        <g:set var="entityName" value="${message(code: 'evidencia.label', default: 'Evidencia')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <asset:stylesheet src="dataTables.bootstrap.min.css"/>
    </head>
    <body>
        <g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>
        <content tag="nav">
            <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
        </content>

    <g:link class="btn btn-primary" style="max-width:14rem" action="create" controller="evidencia" params="[id: concepto.id]" data-toggle="tooltip" data-placement="top" title="Crear">Agregar Evidencia                                                        %{--<g:img file="dowload.png"/>--}%
    </g:link>



        <!--
        <div id="list-evidencia" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${evidenciaList}" />

            <div class="pagination">
                <g:paginate total="${evidenciaCount ?: 0}" />
            </div>
        </div>
        -->
    <div class="box box-warning">
        <div class="box-header with-border">
            <h3 class="box-title">
                Lista de evidencias
            </h3>
        </div>
        <div class="box-body">
            <div class="table-responsive">
                <table id="table-evidencia" class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Opciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${evidencias}">
                        <tr>
                            <td>${it.nombre}</td>
                            <td>${it.descripcion}</td>
                            <td>
                                <g:link class="btn btn-primary" style="max-width:11.5rem" action="descargarArchivo" controller="evidencia" params="[ubicacion: it.src]" data-toggle="tooltip" data-placement="top" title="Descargar">Descargar                                                        %{--<g:img file="dowload.png"/>--}%
                                </g:link>
                                <a class="btn btn-danger text-dark" data-toggle="modal" data-target="#modal${it.id}">
                                <span class="oi oi-circle-x text-info"></span>
                                Eliminar
                                </a>
                            </td>
                            <td>
                              <g:link action="index" controller="concepto" params="[id:session.presupuestoId]" class="btn btn-primary">Regresar</g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <g:each in="${evidencias}" var="item">
            <div class="modal fade" id="modal${item.id}" tabindex="-1"
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
                            "<strong> ${item.id} ${item.nombre}</strong>"?
                            <br />
                            <br />

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Cancelar</button>
                            <g:link action="delete" id="${item.id}" controller="evidencia"
                                params="['evidencia': item.id]"
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
                $('#table-evidencia').dataTable({
                    "lengthMenu": [[15, 30, -1], [15, 30, "Todos"]],
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

    </body>
</html>
