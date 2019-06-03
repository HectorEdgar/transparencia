<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<content tag="nav">
    <g:render template="/menu/menu"/>
</content>
<h1>Editar Administrador</h1>
<h4><strong>Id:(${usuario.id})</strong> ${usuario.username}</h4>

<g:form action="editar" method="POST" controller="admin">
<div class="box box-primary">
      <input type="hidden" class="form-control" id="id" name="id" placeholder="" value="${usuario.id}">
          <input type="hidden" class="form-control" id="user2" name="user2"value="${usuario.username}">

            <div class="box-header with-border">
              <h3 class="box-title">Edite los siguientes datos del Administrador</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <label for="username">Nombre de Usuario</label>
                  <input type="text" class="form-control" id="user" name="user" 
                  placeholder="Nombre de Usuario ..." value="${usuario.username}">
                </div>
                <div class="form-group">
                  <label for="contra">Contraseña</label>
                  <input type="password" class="form-control" id="contra" name ="contra" placeholder="Password">
                </div>        
              <div class="box-footer">
                <button type="submit" class="btn btn-success">Submit</button>
              </div>
          </div>
        </div>

</g:form>

</html>