<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
    <asset:stylesheet src="dataTables.bootstrap.min.css" />

</head>
<body>

        <content tag="nav">
            <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
        </content>
<div class="box box-danger">
    <div class="box-header with-border">
        <h3 class="box-title">
            Lista de Entidades
        </h3>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-empleados" class="table table-bordered">
                <thead>
                    <tr>
                        <th >Id</th>
                        <td scope="col">Nombre</td>
                        <td scope="col">Encargado</td>
                        <td scope="col">Tipo</td>
                        <td scope="col">Descripción</td>
                        <td scope="col">Ambito</td>
                        <td scope="col">Estado</td>
                        <td scope="col">Opciones</td>
                    </tr>
                </thead>
                <tbody>
                  <g:each in="${entidades}">
                        <tr>
                            <th scope="row">${it.id}</th>
                            <td>${it.nombre}</td>
                            <td>${it.encargado}</td>
                            <td>${it.tipo}</td>
                            <td>${it.descripcion}</td>
                            <td>${it.ambito}</td>
                            <td>${it.estado}</td>
                       		<td>
                            <g:link action="read" controller="entidad" params="[id:it.id]" class="btn btn-primary"><span class="fa fa-eye"></span> Ver Presupuesto
                            </g:link>

                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>




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
</body>
</html>
