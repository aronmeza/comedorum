<%@ page import="org.conversor.Ingrediente" %>



<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="ingrediente.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: ingredienteInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'unidadMedida', 'error')} ">
	<label for="unidadMedida">
		<g:message code="ingrediente.unidadMedida.label" default="Unidad Medida" />
		
	</label>
	<g:select name="unidadMedida" from="${ingredienteInstance.constraints.unidadMedida.inList}" value="${ingredienteInstance?.unidadMedida}" valueMessagePrefix="ingrediente.unidadMedida" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'presentacion', 'error')} ">
	<label for="presentacion">
		<g:message code="ingrediente.presentacion.label" default="Presentacion" />
		
	</label>
	<g:textField name="presentacion" maxlength="40" value="${ingredienteInstance?.presentacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'etapa', 'error')} ">
	<label for="etapa">
		<g:message code="ingrediente.etapa.label" default="Etapa" />
		
	</label>
	<g:textField name="etapa" maxlength="40" value="${ingredienteInstance?.etapa}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'materia', 'error')} required">
	<label for="materia">
		<g:message code="ingrediente.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materia" name="materia.id" from="${org.conversor.MateriaPrima.list()}" optionKey="id" required="" value="${ingredienteInstance?.materia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredienteInstance, field: 'receta', 'error')} required">
	<label for="receta">
		<g:message code="ingrediente.receta.label" default="Receta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receta" name="receta.id" from="${org.conversor.Receta.list()}" optionKey="id" required="" value="${ingredienteInstance?.receta?.id}" class="many-to-one"/>
</div>

