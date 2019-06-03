<li class="${current == 'inicio' ? 'active' : ''}"><a href="${createLink(uri: '/')}"><span class="fa fa-home"></span> Inicio</a></li>

<sec:access expression="hasRole('ROLE_ADMIN')">
<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Administradores <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/admin/index')}"><span class="fa fa-eye"></span> Ver Administradores</a></li>
            <li><a href="${createLink(uri: '/admin/create')}"><span class="fa fa-user-plus"></span> Registrar administrador</a></li>
        </ul>
 </li>
 <li>
    <g:link controller="entidad" action="index" class="${current == 'entidades' ? 'active' : ''}"><span class="fa fa-building"></span> Entidades</g:link>
</li>
</sec:access>

<sec:access expression="hasRole('ROLE_ENTIDAD')">
<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Presupuestos <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/presupuesto/index')}"><span class="fa fa-eye"></span> Ver Presupuestos</a></li>
        </ul>
 </li>
 <li>
    <g:link controller="entidad" action="index" class="${current == 'entidades' ? 'active' : ''}"><span class="fa fa-building"></span> Entidades</g:link>
</li>
</sec:access>

<sec:access expression="hasRole('ROLE_ENTIDAD')">
</sec:access>

<li><a href="${createLink(uri: '/')}"><span class="fa fa-question-circle"></span> Acerca de</a></li>
