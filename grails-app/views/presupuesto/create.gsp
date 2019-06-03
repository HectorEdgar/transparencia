<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="adminLte" />
    <title>Crear presupuesto</title>
  </head>
  <body>

  <content tag="nav">
    <g:render template="/menu/menu" />
  </content>

  <div class="content-wrapper">
      <section class="content-header">
        <h1>
          Agregar un nuevo presupuesto
        </h1>
      </section>
      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">Lista de datos</h3>
              </div>
              <g:form name="form" action="create">
                <div class="box-body">
                  <div class="form-group">
                    <label for="username">Año</label>
                    <input type="number" name="anio" class="form-control" placeholder="yyyy" value="${presupuesto?.anio}">
                  </div>
                  <div class="form-group">
                    <label for="password">Monto</label>
                    <input type="number" name="monto" step='any' class="form-control" placeholder="0.0" value="${presupuesto?.monto}">
                  </div>
                </div>
                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">Crear</button>
                </div>
              </g:form>
            </div>
          </div>
        </div>
      </section>
      <g:if test="${this.presupuesto}">
        <section class="box box-danger">
          <g:eachError bean="${this.presupuesto}" var="error">
            <li class="d-block mx-auto text-center">
              <g:if test="${error in org.springframework.validation.FieldError}">
                "${error.field}"
              </g:if><g:message error="${error}"/>
            </li>
          </g:eachError>
        </section>
      </g:if>
    </div>
  </body>
</html>
