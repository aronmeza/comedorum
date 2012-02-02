
<%@ page import="org.conversor.MateriaPrima" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materiaPrima.label', default: 'MateriaPrima')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
	</head>
	<body>
		<a href="#list-materiaPrima" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		 
		<div id="list-materiaPrima" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'materiaPrima.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="unidadMedida" title="${message(code: 'materiaPrima.unidadMedida.label', default: 'Unidad Medida')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materiaPrimaInstanceList}" status="i" var="materiaPrimaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materiaPrimaInstance.id}">${fieldValue(bean: materiaPrimaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: materiaPrimaInstance, field: "unidadMedida")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${materiaPrimaInstanceTotal}" />
                                
			</div>
                        <div class="boton-crear button"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></div>exit
                        
		</div>
	</body>
</html>
