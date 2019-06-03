<li id="${c.id}li" class="" style="padding-bottom:1em">
    <a class="btn btn-success btn-xs" href="javascript: setHidden(${c.id}, '${c.descripcion}')" >
        ${c.descripcion}
    </a>
    ${c.getTotal()}
    <g:link action="modificar" params="[id: c.id, presupuestoId: presupuestoId]" class="pull-right btn btn-primary btn-xs">Modificar</g:link>
    <g:link action="eliminar" params="[id: c.id, presupuestoId: presupuestoId]" class="pull-right btn btn-danger btn-xs">Eliminar</g:link>
    <g:link action="index" controller="evidencia" params="[id: c.id,presupuestoId: presupuestoId]" class="pull-right btn btn-success btn-xs">Agregar evidencias</g:link>
</li>
<ul id="${c.id}ul" class="">
    <g:if test="${c.hijos.size() > 0}">
        <g:each var="c1" in="${c.hijos}">
            <g:render template="item" model="[c: c1, presupuestoId: presupuestoId]"/>
        </g:each>
    </g:if>
</ul>
