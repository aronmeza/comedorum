
<%@ page import="org.conversor.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
		
				
      <style type="text/css">
		.ui-button { margin-left: -1px; }
		.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
		.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
		
                ol{  width: 45em; }
                ol li{  float: left;  width: 15em; }
                br{  clear: left;}
                div.wrapper{  margin-bottom: 1em;}
                ol li a{  display: block;  width: 15em;  text-decoration: none;}
	   

	    
	    </style>
                
	</head>
	<body>

<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
                       
        	</fieldset>     
        	        <g:actionSubmit class="button green" action="sumaReceta"  value="Suma Receta" />
                        
</g:form>    

	
 <div id="wrapper">
                        <ol>
                        <g:if  test="${listaIngredientes}">
                                    <g:each  in="${listaIngredientes}" var="i">
                                          <li><h3><a><span aria-labelledby="ingredientes-label">${i?.encodeAsHTML()}</span></a></h3></li>        
                                </g:each>
                            </g:if>
                        </ol>
                      </div>



	</body>
</html>
