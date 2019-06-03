<div class="box box-danger">
    <div class="box-header with-border">
        <h3 class="box-title">Presupuesto ${presupuesto.anio}</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>
    <div class="box-body chart-responsive text-center">
        <div class="chart" id="presupuesto-chart" style="width: 300px; height: 300px; position: relative;">

        </div>
    </div>
</div>

<content tag="scripts">
    <asset:javascript src="raphael.js" />
    <asset:javascript src="morris.js" />

    <script type="text/javascript">
        var datos = [];

        <g:each in="${presupuesto.conceptos}">
            datos.push({
                label: '${it.descripcion}',
                value: ${it.getTotal()}
            });
        </g:each>

        Morris.Donut({
            element: "presupuesto-chart",
            data: datos
        });
    </script>
</content>
