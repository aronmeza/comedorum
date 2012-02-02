
<%@ page import="org.conversor.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
	</head>
	<body>

		<a href="#list-receta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-receta" class="content scaffold-list left" role="main" style="width:50%">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'receta.nombre.label', default: 'Nombre')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recetaInstanceList}" status="i" var="recetaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recetaInstance.id}">${fieldValue(bean: recetaInstance, field: "nombre")}</g:link></td>
					
											
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">

				<g:paginate total="${recetaInstanceTotal}" />

			</div>
		</div>
		<div class="right" style="width:50%">
		<br>
		<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
        	</fieldset>
        	      <g:actionSubmit class="button green" action="show"  value="${message(code: 'default.button.convertir', default:'Convertir')}" />
	</g:form> 
		</div>
	</body>
       <r:script>
  $(document).ready(function() {
    $("input#nombre").focus();
  });
</r:script>
</html>
