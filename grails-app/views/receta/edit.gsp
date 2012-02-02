<%@ page import="org.conversor.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
                 <ckeditor:resources />
	</head>
	<body>
		<a href="#edit-receta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		 
		<div id="edit-receta" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${recetaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${recetaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form  method="post" >
				<g:hiddenField name="id" value="${recetaInstance?.id}" />
				<g:hiddenField name="version" value="${recetaInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                                        <g:actionSubmit class="button green" action="update" value="${message(code: 'default.button.update.label', default: 'Actualizar')}" />
					<g:actionSubmit class="button green" action="delete"  value="${message(code: 'default.button.delete.label', default: 'Borrar')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</g:form>
		</div>
	</body>
</html>
