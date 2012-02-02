<%@ page import="org.conversor.Receta" %>


<div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'nombre', 'error')} required ">
	<label for="nombre">
		<g:message code="receta.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="70" required="" value="${recetaInstance?.nombre}"/>
</div>
<div class="fieldcontaicentern ${hasErrors(bean: recetaInstance, field: 'rendimiento', 'error')} required ">
	<br>
	<label for="rendimiento">
		<g:message code="receta.rendimiento.label" default="Rendimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rendimiento" required="" value="${fieldValue(bean: recetaInstance, field: 'rendimiento')}"/>
</div>
