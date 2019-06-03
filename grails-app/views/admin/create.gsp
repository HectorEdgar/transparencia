<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<content tag="nav">
    <g:render template="/menu/menu"/>
</content>
<h1>Crear nuevo Administrador</h1>

<g:form action="save" method="POST" controller="admin">
<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Ingrese los siguientes datos</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <label for="username">Nombre de Usuario</label>
                  <input type="text" class="form-control" id="user" name="user" placeholder="Nombre de Usuario ...">
                </div>
                <div class="form-group">
                  <label for="contra">Contraseña</label>
                  <input type="password" class="form-control" id="contra" name ="contra" placeholder="Password">
                </div>        
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
          </div>
        </div>

</g:form>

</html>