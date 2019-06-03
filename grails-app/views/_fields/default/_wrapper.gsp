<div class="form-group ${invalid ? 'has-error' : ''}">
    <label for="${property}">${label} <span class="text-red">${required ? '*' : ''}</span></label>

    <div>
        <f:widget property="${property}" class="form-control"/>
        <g:if test="${errors}">
            <g:each in="${errors}" var="error">
                <span class="help-block"><g:message error="${error}"/></span>
            </g:each>
        </g:if>
    </div>
</div>