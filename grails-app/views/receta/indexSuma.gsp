
<%@ page import="org.conversor.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
                <r:require module="jquery-ui"/>
		
				
      <style type="text/css">
		.ui-button { margin-left: -1px; }
		.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
		.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
		
	    #printable { display: none; }
	
	    @media print
	    {
                #printable h2{ color: #48802c;}
                #printable h3{
                              font-weight: lighter;
                              font-size: .8em;
                              margin: 0.8em 0 0.3em 0;
                            } 
	    	.footer { display: none; }
	    	#usuario { display: none; }
	        #show-receta { display: none; }
	        #menu { display: none; }
	        #printable { display: block; }
                #grailsLogo{ float: right}
                .message{display:none;}
                ol{  width: 45em; }
                ol li{  float: left;  width: 15em; }
                br{  clear: left;}
                div.wrapper{  margin-bottom: 1em;}
                ol li a{  display: block;  width: 15em;  text-decoration: none;}

	    }
	    </style>
                
	</head>
	<body>

<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
                       <g:each  in="${listaIngredientes}" var="i" name="listaIngredientes">
                                          <li><h3><a><span aria-labelledby="ingredientes-label">${i?.encodeAsHTML()}</span></a></h3></li>        
                                </g:each>
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



<script type="text/javascript">

</script>
	</body>
</html>
