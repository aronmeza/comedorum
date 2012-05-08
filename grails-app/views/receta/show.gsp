
<%@ page import="org.conversor.Receta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
                <r:require module="jquery-ui"/>
      <style type="text/css">

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

		<div id="show-receta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list receta">
                          <table >
                          <div id="printFrame" />
                            <tr>
                            
                              <td>
                                <g:if test="${recetaInstance?.nombre}">
					<span id="nombre-label"><g:message code="receta.nombre.label" default="Nombre" /></span>
					
						<span  aria-labelledby="nombre-label"><g:fieldValue bean="${recetaInstance}" field="nombre"/></span>
					
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.rendimiento}">
					<span id="rendimiento-label" ><g:message code="receta.rendimiento.label" default="Rendimiento" /></span>
					
						<span  aria-labelledby="rendimiento-label"><g:fieldValue bean="${recetaInstance}" field="rendimiento"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>
                                <g:if test="${recetaInstance?.ingredientes}">
				<li>
					
                                        <table>
                                          <thead><td><g:message code="receta.ingredientes.label" default="Ingredientes" /></td></thead>
                                          <tbody>
                                       
                                        
						<g:each in="${recetaInstance.ingredientes}" var="i">
						<tr><td><span aria-labelledby="ingredientes-label">${i?.encodeAsHTML()}</span></td></tr>
						</g:each>
                                          </tbody>
					 </table>
				</li>
				</g:if>
                              </td>
<td colspan="2">
                                <g:if test="${recetaInstance?.procedimiento}">
					<span id="procedimiento-label" ><g:message code="receta.procedimiento.label" default="Procedimiento" /></span>
					
						<span aria-labelledby="procedimiento-label">${recetaInstance.procedimiento.decodeHTML()}</span>
					
				</g:if>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <g:if test="${recetaInstance?.temperatura}">
				<li  >
					<span id="temperatura-label"  ><g:message code="receta.temperatura.label" default="Temperatura" /></span>
					
						<span aria-labelledby="temperatura-label"><g:fieldValue bean="${recetaInstance}" field="temperatura"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.tiempo}">
				<li  >
					<span id="tiempo-label"  ><g:message code="receta.tiempo.label" default="Tiempo" /></span>
					
						<span   aria-labelledby="tiempo-label"><g:fieldValue bean="${recetaInstance}" field="tiempo"/></span>
					
				</li>
				</g:if>
                              </td>
                              
                              <td><g:if test="${recetaInstance?.porcion}">
				<li  >
					<span id="porcion-label"  ><g:message code="receta.porcion.label" default="Porcion" /></span>
					
						<span   aria-labelledby="porcion-label"><g:fieldValue bean="${recetaInstance}" field="porcion"/></span>
					
				</li>
				</g:if>
			</td>
                            </tr>
                            <tr>
                              <td>
                                
				<g:if test="${recetaInstance?.textura}">
				<li  >
					<span id="textura-label"  ><g:message code="receta.textura.label" default="Textura" /></span>
					
						<span   aria-labelledby="textura-label"><g:fieldValue bean="${recetaInstance}" field="textura"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.forma}">
				<li  >
					<span id="forma-label"  ><g:message code="receta.forma.label" default="Forma" /></span>
					
						<span   aria-labelledby="forma-label"><g:fieldValue bean="${recetaInstance}" field="forma"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td><g:if test="${recetaInstance?.color}">
				<li  >
					<span id="color-label"  ><g:message code="receta.color.label" default="Color" /></span>
					
						<span   aria-labelledby="color-label"><g:fieldValue bean="${recetaInstance}" field="color"/></span>
					
				</li>
				</g:if></td>
                            </tr>
                            <tr>
                              <td>
                                
				<g:if test="${recetaInstance?.sabor}">
				<li  >
					<span id="sabor-label"  ><g:message code="receta.sabor.label" default="Sabor" /></span>
					
						<span   aria-labelledby="sabor-label"><g:fieldValue bean="${recetaInstance}" field="sabor"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.calorias}">
				<li  >
					<span id="calorias-label"  ><g:message code="receta.calorias.label" default="Calorias" /></span>
					
						<span   aria-labelledby="calorias-label"><g:fieldValue bean="${recetaInstance}" field="calorias"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.proteinas}">
				<li  >
					<span id="proteinas-label"  ><g:message code="receta.proteinas.label" default="Proteinas" /></span>
					
						<span   aria-labelledby="proteinas-label"><g:fieldValue bean="${recetaInstance}" field="proteinas"/></span>
					
				</li>
				</g:if>
                              </td>
                            </tr>
                             <tr>
                              <td>
                                <g:if test="${recetaInstance?.grasa}">
				<li  >
					<span id="grasa-label"  ><g:message code="receta.grasa.label" default="Grasa" /></span>
					
						<span   aria-labelledby="grasa-label"><g:fieldValue bean="${recetaInstance}" field="grasa"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.carbohidratos}">
				<li  >
					<span id="carbohidratos-label"  ><g:message code="receta.carbohidratos.label" default="Carbohidratos" /></span>
					
						<span   aria-labelledby="carbohidratos-label"><g:fieldValue bean="${recetaInstance}" field="carbohidratos"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                
			
				<g:if test="${recetaInstance?.colesterol}">
				<li  >
					<span id="colesterol-label"  ><g:message code="receta.colesterol.label" default="Colesterol" /></span>
					
						<span   aria-labelledby="colesterol-label"><g:fieldValue bean="${recetaInstance}" field="colesterol"/></span>
					
				</li>
				</g:if>
			
                              </td>
                            </tr>
                             <tr>
                              <td>
                                				<g:if test="${recetaInstance?.sodio}">
				<li  >
					<span id="sodio-label"  ><g:message code="receta.sodio.label" default="Sodio" /></span>
					
						<span   aria-labelledby="sodio-label"><g:fieldValue bean="${recetaInstance}" field="sodio"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.fibra}">
				<li  >
					<span id="fibra-label"  ><g:message code="receta.fibra.label" default="Fibra" /></span>
					
						<span   aria-labelledby="fibra-label"><g:fieldValue bean="${recetaInstance}" field="fibra"/></span>
					
				</li>
				</g:if>
                              </td>
                              <td>
                                <g:if test="${recetaInstance?.tipoPlato}">
				<li  >
					<span id="tipoPlato-label"  ><g:message code="receta.tipoPlato.label" default="Tipo Plato" /></span>
					
						<span   aria-labelledby="tipoPlato-label"><g:fieldValue bean="${recetaInstance}" field="tipoPlato"/></span>
					
				</li>
				</g:if>
			
                              </td>
                            </tr>
                            
                          </table>
				

			
				
			
				
				
			
			</ol>
			<g:link controller="receta" action="edit" class="button green" id="${recetaInstance?.id}">Editar</g:link>


			
		</div>
</div>



<div id="printable">
  
  <h1><font style="text-transform: uppercase;"> <g:fieldValue bean="${recetaInstance}" field="nombre"/></font> </h1>
  <h5><g:fieldValue bean="${recetaInstance}" field="rendimiento"/> porciones; 
    <g:if test="${recetaInstance?.tiempo}">
        <g:fieldValue bean="${recetaInstance}" field="tiempo"/> horas.</g:if>
  </h5>
  <hr>
  <br/>
  <center><h2>INGREDIENTES</h2></center>
  <br/>
  <div id="wrapper">
    <ol>
  	<g:each in="${recetaInstance.ingredientes}" var="i">
          <li><h3><a><span aria-labelledby="ingredientes-label">${i?.encodeAsHTML()}</span></a></h3></li>        
        </g:each>
    </ol>
  </div>
  <br/>
  <br/>
  <div id="printProcedimiento">
    <br/>
    <center><h2>PROCEDIMIENTO</h2></center>
    <h3>${recetaInstance.procedimiento.decodeHTML()}</h3>
				
  </div>
  
                          
                            </div>
<script type="text/javascript">

</script>
	</body>
</html>
