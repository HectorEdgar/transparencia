<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminLte" />
        <g:set var="entityName" value="${message(code: 'evidencia.label', default: 'Evidencia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <content tag="nav">
            <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
        </content>

        <!--
        <a href="#create-evidencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-evidencia" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.evidencia}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.evidencia}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.evidencia}" method="POST">
                <fieldset class="form">
                    <f:all bean="evidencia"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        -->
        <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Agregar Evidencia</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <g:form method="POST" role="form" enctype="multipart/form-data" action="save" controller="evidencia">
              <div class="box-body">
                <div class="form-group">
                  <label for="nombre">Nombre</label>
                  <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre...">
                </div>
                <div class="form-group">
                  <label for="descripcion">Descripción</label>
                  <textarea type="text-area" name="descripcion" class="form-control" id="descripcion" placeholder="Descripción..."></textarea>
                </div>
                <div class="form-group">
                  <label for="archivo">Archivo</label>
                 <g:field type="file" name="archivo" width="250px"/>
                </div>
                <input type="text" name="idConcepto" hidden="true" value="${concepto.id}">
              <!-- /.box-body -->
              <br>
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Agregar</button>
              </div>
            </g:form>
        </div>
    </div>
        
    </body>
</html>
