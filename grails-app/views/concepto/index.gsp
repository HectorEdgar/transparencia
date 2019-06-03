<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminLte" />
        <title>Conceptos</title>

    </head>

    <body>
        <content tag="nav">
            <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
        </content>
        <h1>Conceptos</h1>


        <div class="row">

            <div class="col-md-4">

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Quick Example</h3>
                    </div>

                    <div class="box-body">
                        <div class="form-group">
                            <label>Descripcion</label>
                            <input type="text" class="form-control" id="descripcion" placeholder="Descripci&oacute;n">
                        </div>

                        <div class="form-group">
                            <label>Monto</label>
                            <input type="number" step="any" class="form-control" id="monto" placeholder="Monto">
                        </div>

                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="date" class="form-control" id="fecha" placeholder="Fecha">
                        </div>

                        <div class="col-md-12 col-sm-12" id="map-canvas" style="height:500px;"></div>

                        <div class="form-group">
                            <label>Latitud</label>
                            <input type="number" step="0.00000001" class="form-control" id="latitud" placeholder="Latitud">
                        </div>

                        <div class="form-group">
                            <label>Longitud</label>
                            <input type="number" step="0.00000001" class="form-control" id="longitud" placeholder="Longitud">
                        </div>

                        <div class="form-group">
                            <label>Padre</label>
                            <input type="text" class="form-control" id="nombrePadre" placeholder="Padre" disabled>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" onclick="limpiarPadre()">
                                Limpiar campo "padre"
                            </button>
                        </div>

                        <input type="hidden" id="idPadre" value="">
                    </div>

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary" onclick="crear()">
                            Submit
                        </button>
                    </div>
                </div>

            </div>

            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Conceptos</h3>
                    </div>

                    <div class="box-body">
                        <ul id="raiz" class="">
                            <g:each in="${presupuesto.conceptos}" var="c">
                                <g:render template="item" model="[c: c, presupuestoId: presupuesto.id]"/>
                            </g:each>
                        </ul>
                    </div>

                    <div class="box-footer">
                        &Aacute;rbol de conceptos
                    </div>
                </div>
            </div>
        </div>


        <script type="text/javascript">
            var descripcion = document.getElementById("descripcion");
            var monto = document.getElementById("monto");
            var fecha = document.getElementById("fecha");
            var latitud = document.getElementById("latitud");
            var longitud = document.getElementById("longitud");
            var nombrePadre = document.getElementById("nombrePadre");
            var idPadre = document.getElementById("idPadre");

            var raiz = document.getElementById("raiz");

            function crear() {
                var fechaValue = fecha.value;
                fechaValue = fechaValue ? fechaValue + " 00:00:00.0" : "" ;
                latitud = parseFloat(latitud.value).toFixed(7);
                longitud = parseFloat(longitud.value).toFixed(7);

                console.log(latitud, longitud);
                $.post("${createLink(action: 'guardar', controller: 'concepto')}",
                    {
                        descripcion: descripcion.value,
                        monto: monto.value,
                        fecha: fechaValue,
                        latitud: latitud == "NaN" ? undefined : latitud,
                        longitud: longitud == "NaN" ? undefined : longitud,
                        idPadre: idPadre.value,
                        idPresupuesto: '${presupuesto.id}'
                    }, function (data, status) {
                        console.log(data, status, {
                            descripcion: descripcion.value,
                            monto: monto.value,
                            fecha: fechaValue,
                            latitud: latitud,
                            longitud: longitud,
                            idPadre: idPadre.value,
                            idPresupuesto: '${presupuesto.id}'
                        });
                        var ul = document.createElement("ul");
                        ul.id = data.id + "ul";

                        var li = document.createElement("li");
                        li.innerHTML = "<a href='javascript: setHidden(" + data.id + ", \"" + data.descripcion + "\")'>" + data.descripcion + "</a>";
                        li.id = data.idea + "li";

                        var vinculoModificar = "${createLink(action: 'modificar', id: '@id')}";
                        console.log(vinculoModificar);

                        if (!data.padre) {
                            raiz.appendChild(li);
                            raiz.appendChild(ul);
                        } else {
                            var ulPadre = document.getElementById(data.padre.id + "ul");
                            ulPadre.appendChild(li);
                            ulPadre.appendChild(ul);
                        }
                    }
                );
            }

            function setHidden(id, desc) {
                idPadre.value = id;
                nombrePadre.value = desc;
            }

            var map;
            function initialize() {
            map = new google.maps.Map(document.getElementById('map-canvas'), {
                zoom: 3,
                center: {lat: -10, lng: -60}
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

            function limpiarPadre() {
                nombrePadre.value = ''
                idPadre.value = ''
            }
            google.maps.event.addDomListener(window, 'load', initialize);
    </script>

    </body>
</html>
