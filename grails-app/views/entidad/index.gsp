<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Entidades</title>

    <asset:stylesheet src="dataTables.bootstrap.min.css"/>
</head>
<body>
    <content tag="nav">
        <g:render template="/menu/menu" model="${[current: 'entidades']}"/>
    </content>

    <content tag="header">
        <h1>
            Entidades
            <small>Entidades transparentes</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="${createLink(uri: '/entidades')}"><i class="fa fa-building"></i>Entidades</a></li>
        </ol>
    </content>

    <div class="box box-danger">
        <div class="box-header with-border">
            <h3 class="box-title">Entidades</h3>
            <div class="pull-right">
                <g:link action="registrar" class="btn btn-primary"><i class="fa fa-plus"></i> Agregar entidad</g:link>
            </div>
        </div>
        <div class="box-body">
            <div class="table-responsive">
                <table id="table-entidades" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Ámbito</th>
                            <th>Estado</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${entidadList}">
                        <tr>
                            <td>${it.nombre}</td>
                            <td>${it.tipo}</td>
                            <td>${it.ambito}</td>
                            <td>${it.estado}</td>
                            <td>
                                <g:link action="show" class="btn" id="${it.id}"><i class="fa fa-eye"></i></g:link>
                                <g:link action="edit" class="btn" id="${it.id}"><i class="fa fa-edit"></i></g:link>
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
            $('#table-entidades').dataTable({
                "lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                "lengthChange": true,
                "paging": false,
                "searching": false,
                "length": false,
                "autoWidth": false,
                "order": [[0, "asc"]],
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