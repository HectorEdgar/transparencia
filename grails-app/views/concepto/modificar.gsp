<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminLte" />
        <title>Actualizar concepto</title>
    </head>
    <body>
        <content tag="nav">
            <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
        </content>
        <div class="content-wrapper">
            <section class="content-header">
                <h1>
                    Actualizar concepto
                </h1>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Datos de concepto</h3>
                        </div>
                            <g:form name="form" action="modificar">
                                <input type="hidden" name="presupuestoId" value="${presupuestoId}">
                                <input type="hidden" name="id" value="${concepto?.id}">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="username">Descripción</label>
                                        <input type="text" name="descripcion" class="form-control" placeholder="Descripción" value="${concepto.descripcion}">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Monto</label>
                                        <input type="number" name="monto" step='any' class="form-control" placeholder="0.0" value="${concepto.monto}">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Fecha</label>
                                        <input type="date" class="form-control" value="${concepto?.fecha?.format('yyyy-MM-dd')}" oninput="hiddenFecha.value=this.value + ' 00:00:00.0'">
                                        <input type="hidden" name="fecha" id="hiddenFecha" value="${(concepto.fecha ?: '')}">
                                    </div>
                                    <div class="col-md-12 col-sm-12" id="map-canvas" style="height:500px;"></div>
                                    <div class="form-group">
                                        <label for="username">Latitud</label>
                                        <input type="number" name="latitud" class="form-control" placeholder="Latitud" value="${concepto?.latitud}" id="latitud">
                                    </div>
                                    <div class="form-group">
                                        <label for="username">Longitud</label>
                                        <input type="number" name="longitud" class="form-control" placeholder="Longitud" value="${concepto?.longitud}" id="longitud">
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary">Actualizar</button>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </section>
            <g:if test="${this.concepto}">
                <section class="box box-danger">
                    <g:eachError bean="${this.concepto}" var="error">
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
            var hiddenFecha = document.getElementById("hiddenFecha");

            var map;
            function initialize() {
            map = new google.maps.Map(document.getElementById('map-canvas'), {
                zoom: 3,
                center: {lat: ${concepto?.latitud ?: -10}, lng: ${concepto?.latitud ?: -60}}
            });

            var marker=new google.maps.Marker({
                position:map.getCenter(),
                map:map,
                draggable:true
            });
                google.maps.event.addListener(marker,'dragend',function(event) {
                document.getElementById("latitud").value = this.getPosition().lat().toString();
                document.getElementById("longitud").value = this.getPosition().lng().toString();
            });
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </body>
</html>
