<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="adminLte" />
    <title>Lista de encargado</title>
  </head>
  <body>
    <div class="content-wrapper">
      <section class="content-header">
        <h1>
          Lista de encargados
        </h1>
      </section>
      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="box">
              <div class="box-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <td>Username</td>
                      <td></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <g:each in="${encargados}">
                      <tr>
                        <td>${it.username}</td>
                        <td>
                          <g:link action="update" params="[id:it.id, offset:offset]">Actualizar</g:link>
                        </td>
                        <td>
                          <g:link action="delete" params="[id:it.id, offset:offset]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
            <!-- /.box-body -->
              <div class="box-footer clearfix">
                <div class="pull-left">
                  <g:link action="create" class="btn btn-primary">Crear nuevo</g:link>
                </div>
                <div class="pull-right">
                  <g:paginate next="Siguiente" prev="Previo"
                            maxsteps="10" controller="encargado"
                            action="index" total="${encargadosCount}"/>
                </div>
                <style media="screen">
                .pull-right a {
                  padding-left: 5px;
                  padding-right: 5px;
                }
                </style>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
