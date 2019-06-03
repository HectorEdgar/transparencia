<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<body>
  <content tag="nav">
            <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
        </content>
	<h1 class="text-center">Busqueda de Presupuestos</h1>
<div class="row text-center">
  <div class="col-md-4">
      <select class="selectpicker" data-live-search="true" id="sestados" name="estados">
        <option data-tokens="" value="">Todos los estados</option>
        <g:each in="${estados}">
          <option data-tokens="${it}">${it}</option>
        </g:each>
      </select>
  </div>
  <div class="col-md-4">
      <select class="selectpicker" data-live-search="true" id="sambito" name="ambito">
        <option data-tokens="" value="">Todos los ambitos</option>
        <g:each in="${ambito}">
          <option data-tokens="${it}">${it}</option>
        </g:each>
      </select>
  </div>
  <div class="col-md-4">
      <select class="selectpicker" data-live-search="true" id="sanio" name="anio">
        <option data-tokens="" value="">Todos los años</option>
      <g:each in="${anio}">
          <option data-tokens="${it}">${it}</option>
        </g:each>
      </select>
  </div>
  <input class="btn btn-primary" value="Buscar" type="button" name="submit" onclick="obtenerAjax()"/>
</div>
<br><br>
<div class="col-md-12 col-sm-12" id="map-canvas" style="height:500px;"></div>

<script>
    var selectEstado = document.getElementById("sestados");
    var selectAmbito = document.getElementById("sambito");
    var selectAnio = document.getElementById("sanio");

    var map;
        function initialize() {
        map = new google.maps.Map(document.getElementById('map-canvas'), {
            zoom: 3,
            center: {lat: -10, lng: -60}
        });
        
        /*
        var marker=new google.maps.Marker({
            position:map.getCenter(), 
            map:map, 
            draggable:true
        });
            google.maps.event.addListener(marker,'dragend',function(event) {
            document.getElementById("latitud").value = this.getPosition().lat().toString();
            document.getElementById("longitud").value = this.getPosition().lng().toString();
        });
        
          var contentString = '<div id="content">'+
              '<div id="siteNotice">'+
              '</div>'+
              '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
              '<div id="bodyContent">'+
              '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
              'sandstone rock formation in the southern part of the '+
              'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
              'south west of the nearest large town, Alice Springs; 450&#160;km '+
              '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
              'features of the Uluru - Kata Tjuta National Park. Uluru is '+
              'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
              'Aboriginal people of the area. It has many springs, waterholes, '+
              'rock caves and ancient paintings. Uluru is listed as a World '+
              'Heritage Site.</p>'+
              '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
              'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
              '(last visited June 22, 2009).</p>'+
              '</div>'+
              '</div>';

          var infowindow = new google.maps.InfoWindow({
            content: contentString
          });

          var marker = new google.maps.Marker({
            position: {lat: -10, lng: -60},
            map: map,
            title: 'Uluru (Ayers Rock)'
          });
          marker.addListener('click', function() {
            infowindow.open(map, marker);
          });*/
        }
        google.maps.event.addDomListener(window, 'load', initialize);


        function obtenerAjax() {
          var datos = {
            estado: selectEstado.value,
            ambito: selectAmbito.value,
            anio: selectAnio.value
          };

          $.get("${createLink(action: 'getPuntajes', controller: 'principal')}", datos, function(datos) {
            for (dato in datos) {
              var datoJson = datos[dato];
              console.log(datoJson);
              if(datoJson.latitud == 0 && datoJson.longitud == 0)
                continue;

              var contentString = '<div id="content">'+
                '<div id="siteNotice">'+
                '</div>'+
                '<h1 id="firstHeading" class="firstHeading">' + datoJson.descripcion + '</h1>'+
                '<div id="bodyContent">'+
                '<p><b>Egreso $' + datoJson.monto + '</b></p>'+
                '<p>Ver las evidencias, <a href="${request.contextPath}/evidencia/index?id=' + datoJson.id +'">'+
                'aquí</a></p>'+
                '</div>'+
                '</div>';

              var infowindow = new google.maps.InfoWindow({
                content: contentString
              });

              var marker = new google.maps.Marker({
                position: {lat: datoJson.latitud, lng: datoJson.longitud},
                map: map,
                title: datoJson.descripcion
              });
              marker.addListener('click', function() {
                infowindow.open(map, marker);
              });
            }
          });
        }
    </script>

</body>
</html>