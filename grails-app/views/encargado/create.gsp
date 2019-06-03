<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="adminLte" />
    <title>Crear encargado</title>
  </head>
  <body>
    <div class="content-wrapper">
      <section class="content-header">
        <h1>
          Crear un encargado
        </h1>
      </section>
      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">Datos básicos</h3>
              </div>
              <g:form name="form" action="create">
                <div class="box-body">
                  <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" class="form-control" placeholder="Username" value="${user?.username}">
                  </div>
                  <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input name="password" type="password" class="form-control"  placeholder="Contraseña" id="pass">
                  </div>
                  <div class="form-group">
                    <label for="">Verificación de Contraseña</label>
                    <input type="password" class="form-control" placeholder="Contraseña" id="passVerify">
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
      <g:if test="${this.user}">
        <section class="box box-danger">
          <g:eachError bean="${this.user}" var="error">
            <li class="d-block mx-auto text-center">
              <g:if test="${error in org.springframework.validation.FieldError}">
                "${error.field}"
              </g:if><g:message error="${error}"/>
            </li>
          </g:eachError>
        </section>
      </g:if>
    </div>
    <script type="text/javascript">
        var form = document.getElementById('form')
        var pass = document.getElementById('pass')
        var passVerify = document.getElementById('passVerify')
        form.addEventListener('submit', function() {
            if(pass.value != passVerify.value) {
                event.preventDefault()
            }
        })
    </script>
  </body>
</html>
