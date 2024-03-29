
<%@ page import="org.conversor.MateriaPrima" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materiaPrima.label', default: 'MateriaPrima')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
	</head>
	<body>
		<a href="#show-materiaPrima" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		 
		<div id="show-materiaPrima" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materiaPrima">
			
				<g:if test="${materiaPrimaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="materiaPrima.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${materiaPrimaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaPrimaInstance?.unidadMedida}">
				<li class="fieldcontain">
					<span id="unidadMedida-label" class="property-label"><g:message code="materiaPrima.unidadMedida.label" default="Unidad Medida" /></span>
					
						<span class="property-value" aria-labelledby="unidadMedida-label"><g:fieldValue bean="${materiaPrimaInstance}" field="unidadMedida"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materiaPrimaInstance?.id}" />
					<g:link class="edit" action="edit" id="${materiaPrimaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
