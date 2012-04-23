<%@ page import="org.conversor.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
                
                <!--script type="text/javascript" src="${resource(dir:'js', file: 'ext-base.js')}"></script>
                
                <script type="text/javascript" src="${resource(dir:'js', file: 'ext-all.js')}"></script>
                <script type="text/javascript" src="${resource(dir:'js', file: 'form.js')}"></script-->
				<!--script type="text/javascript" src="${resource(dir:'js', file: 'storeRecetaIngredientes.js')}"></script-->
				
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'ext-all.css')}" type="text/css">
				
                
                <style type="text/css">
	.amarillo{	opacity:50;	background:#FFFF99 !important;}
	.verde{	opacity:50;	background:#CCFF99 !important;}
	
</style>
                
                 
	</head>
	<body>
          <!--g:render template="form"/-->
		<div id="frame"></div>
	</body>
</html>
