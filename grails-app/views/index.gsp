<!--doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><g:message code="default.comedor"/></title>
		<r:require module="jquery-ui"/>
	</head>
	<body>
	
	<div id="body" role="main">
	<h1><g:message code="default.welcome"/></h1>
	
	<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
        	</fieldset>     
        	<fieldset class="buttons">
        	        <g:actionSubmit class="convert" action="show"  value="${message(code: 'default.button.convertir')}" />
        	</fieldset> 
	</g:form>     
  <head>
    
    <title><g:message code="inicio.title" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</div>
       
       
	</body>
</html-->
          ${response.sendRedirect("receta/index")}
