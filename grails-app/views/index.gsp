<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<body>

<style>
.nav{
    margin-bottom: 10px;
    margin-top: 10px;
}

.jumbotron {
    height: 230px;
}

.jum-b{
    background-color: #1A5276;
}
.jumbotron h1 {
    color: #FFF;
    text-shadow: 1px 1px #000, 2px 2px #000;
    font-size: 3em;
}
.jumbotron p, small {
    color: #FFF;
}

em {
    color: #000000;
    text-shadow: 1px 1px #FFF, 2px 2px #FFF;
}

</style>

<content tag="nav">
        <g:render template="/menu/menu"/>
    </content>
<content tag="header">

<div class="jumbotron jum-b">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <asset:image src="uno.png" class=" text-center img-circle img-responsive" height="140px" width="140px"/>
            </div>
            <div class="col-md-6 text-center">
                <h1 class="hidden-xs hidden-sm">Sistema de <em>Transparencia </em>de Recursos Federales</h1>
                <h4 class="hidden-md hidden-lg">Sistema de <em>Transparencia </em>de Recursos Federales</h4>
            </div>
        </div>
    </div>
</div>
</content>
<p>
    <div class="callout bg-green-active color-palette" style="margin-bottom: 0!important;">
        <h4><i class="fa fa-info"></i> Importante:</h4>
            En esta sección encontraras la información relativa al detalle de los presupuestos asignados a la dependencia que tu elijas.Revisa y enterate en qué gastan su dinero los políticos, instituciones de gobierno así como los principales entes gubernamentales de tu estado en México.   
    </div>
</p>
<br>
<div class="row">
      <div class="col-xl-12 col-lg12 col-md-12 col-sm-12 col-xs-12">
        <div class="card text-white bg-info mb-3" style="background-color:#283747; color: white">
            <div class="card-header text-center"> 
                <br>
                <center><asset:image src="lugares.svg" class="text-center img-circle img-responsive" height="100" width="100"/></center>
                <div class="card-body">
                <h5 class="card-title text-center">Mapa de Conceptos</h5>
                <p class="card-text text-center">Conoce los principales conceptos del lugar que eligas</p>
                </div>
            </div>
            <div class="card-footer text-center" >
            <a href="${createLink(uri: '/principal/mapa')}" class="btn bg-primary btn-flat">Entrar</a><br><br>
          </div>
        </div>
    </div>
</div>
<br>
<div class="row">
      <div class="col-xl-6 col-lg6 col-md-6 col-sm-12 col-xs-12">
        <div class="card text-white bg-success mb-3" style="background-color:#D4AC0D; color: white">
            <div class="card-header text-center"> 
                <center><asset:image src="institucion.svg" class="text-center img-circle img-responsive" height="100" width="100"/></center>
                <div class="card-body">
                <h5 class="card-title text-center">Dependencias Gubernamentales</h5>
                <p class="card-text text-center">Conoce a las dependencias y conoce en que se ha gastado su presupuesto asignado</p>
                </div>
            </div>
            <div class="card-footer text-center" >
            <a href="${createLink(uri: '/principal/dependencias')}" class="btn bg-red btn-flat">Entrar</a><br><br>
          </div>
        </div>
    </div>

    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="card text-white mb-3" style="background-color:#CB4335; color: white">
            <div class="card-header text-center"> <br>
                <center><asset:image src="dos.png" class="text-center img-circle img-responsive" height="80px" width="110px"/></center>
                <div class="card-body">
                <h5 class="card-title text-center">Sitios de Interés</h5>
                <p class="card-text text-center">Conoce los sitios oficiales de las oficinas de gobierno federal</p>
                </div>
            </div>
            <div class="card-footer text-center" >
            <a href="${createLink(uri: '/principal/paginas')}" class="btn bg-green btn-flat">Entrar</a>
          </div><br>
        </div>
    </div>
  </div>

</body>
</html>
