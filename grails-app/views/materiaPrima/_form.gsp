<%@ page import="org.conversor.MateriaPrima" %>



<div class="fieldcontain ${hasErrors(bean: materiaPrimaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="materiaPrima.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="128" required="" value="${materiaPrimaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaPrimaInstance, field: 'unidadMedida', 'error')} required">
	<label for="unidadMedida">
		<g:message code="materiaPrima.unidadMedida.label" default="Unidad Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="unidadMedida" from="${materiaPrimaInstance.constraints.unidadMedida.inList}" required="" value="${materiaPrimaInstance?.unidadMedida}" valueMessagePrefix="materiaPrima.unidadMedida"/>
</div>

