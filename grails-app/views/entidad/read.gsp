<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="adminLte" />
    <title>Lista de presupuestos de la entidad</title>
  </head>
  <body>
    <div class="content-wrapper">
      <section class="content-header">
        <h1>
          ${entidad.nombre}
          <small>${entidad.descripcion}</small>
        </h1>
      </section>
      <section class="content">
        <div class="row">
          <div class="col-md-4">
            <div class="box box-defult">
              <div class="box-header with-border">
                <h3 class="box-title">Datos Básicos</h3>
              </div>
              <dl class="dl-horizontal">
                <dt>Encargado</dt>
                <dd>${entidad.encargado}</dd>

                <dt>Tipo</dt>
                <dd>${entidad.tipo}</dd>

                <dt>Ámbito</dt>
                <dd>${entidad.ambito}</d>

                <dt>Estado</dt>
                <dd>${entidad.estado}</dd>

                <dt>Correo</dt>
                <dd>${entidad.correo}</dd>

                <dt>Estado</dt>
                <dd>${entidad.estado}</dd>

                <dt>Fecha de incorporación</dt>
                <dd>${entidad.dateCreated.format('yyyy-MM-dd')}</dd>
              </dl>
            </div>
          </div>
          <div class="col-md-8">
            <div class="box box-defult">
              <div class="box-header with-border">
                <h3 class="box-title">Gastos y presupuestos</h3>
              </div>
            </div>
          </div>
          <g:each in="${presupuestos}">
            <div class="col-md-8">
              <div class="box box-defult">
                <div class="box-header with-border">
                  <h3 class="box-title">${it.presupuestoData.anio}</h3>
                </div>
                <div class="box-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="box box-defult">
                        <div class="box-header">
                          <h3>Presupuesto disponible</h3>
                        </div>
                        <div class="box-body">
                          <h3>
                            $${it.presupuestoData.monto}
                          </h3>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="box box-defult">
                        <div class="box-header">
                          <h3>Presupuesto utilizado</h3>
                        </div>
                        <div class="box-body">
                          <ul class="list-group">
                            <g:each var="hoja" in="${it.hojas}">
                              <li class="list-item">
                                ${hoja.descripcion} - $${hoja.monto}
                              </li>
                            </g:each>
                          </ul>
                        </div>
                        <div class="box-footer">
                          Total de gastos $${it.totalMonto}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <g:render template="/presupuesto/grafica" model="[presupuesto: it.presupuestoData]" />
            </div>
          </g:each>
        </div>
      </section>
    </div>
  </body>
</html>
