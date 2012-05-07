<%@ page import="org.conversor.Receta" %>



<table  id="forma-receta">
  <tr>
    <td class="td-left" align="left"><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'nombre', 'error')} required ">
        <label for="nombre">
          <g:message code="receta.nombre.label" default="Nombre" />
          <span class="required-indicator">*</span>
        </label>
        <g:field type="text" name="nombre" maxlength="70" required="" value="${recetaInstance?.nombre}"/>
      </div></td>
    <td><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'rendimiento', 'error')} required ">
        <label for="rendimiento">
          <g:message code="receta.rendimiento.label" default="Rendimiento" />
          <span class="required-indicator">*</span>
        </label>
        <g:field type="number" name="rendimiento" class="input-size-medium" required="" value="${recetaInstance?.rendimiento}"/>
        <g:message code="receta.personas" default="personas" />
      </div></td>
  </tr>
  <tr>
    <td>
      <a id="crear-ing" href="#"><g:message code="default.ingrediente.new" default="Agregar Ingrediente"/></a>
      <div id="dialog-form-ing" title="Agrear Receta">
        <p class="validateTips2"></p>
        <form id="formingsend"   method="POST" >
          <fieldset class="dialog">
            <table>
              <tr>
                <td><label for="ingNombre" class="dialog"><g:message code="receta.ing.nombre" default="Ingrediente"/></label>
                  <input type="text" name="ingNombre" id="ingNombre"  /></td>
                <td><label for="ingCantidad" class="dialog"><g:message code="receta.ing.cantidad" default="Cantidad"/></label>
                  <input type="text" name="ingCantidad" id="ingCantidad" value="" /></td>
              </tr>
              <tr>
                <td><label for="ingPresentacion" class="dialog"><g:message code="receta.ing.presentacion" default="Presentacion"/></label>
                  <input type="text" name="ingPresentacion" id="ingPresentacion" value="" /></td>
                <td><label for="ingEtapa" class="dialog"><g:message code="receta.ing.etapa" default="Etapa"/></label>
                  <input type="text" name="ingEtapa" id="ingEtapa" value="General" /></td>
              </tr>
              <tr>
                <td colspan="2"><label for="ingUnidadMedida" class="dialog"><g:message code="receta.ing.unidadMedida" default="Unidad de Medida"/></label>
                  <select id="ingUnidadMedida">
                    <option value="kg">Kilogramos</option>
                    <option value="gr">Gramos</option>
                    <option value="l">Litros</option>
                    <option value="ml">Mililitros</option>
                    <option value="pza">Pieza</option>
                  </select></td>
              </tr>
            </table>
             	</fieldset>

        </form>
      </div>

    </td>
    <td>
        <h4>Ingredientes</h4>
      <div id="despues">

        
        <g:each in="${recetaInstance?.ingredientes?}" var="i">
          <li>${i?.materia.nombre} <input id="${i?.id}" value="${i?.cantidad}" class="input-size-medium"/> ${i?.unidadMedida} <a href="#" id="a${i?.id}"  onclick="javascript:prueba(${i?.id})">Actualizar</a> <a href="#" id="a${i?.id}"  onclick="javascript:pruebaB(${i?.id})">Borrar</a><li>
        </g:each>
        
      </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">
  <ckeditor:editor name="procedimiento" height="400px" width="85%" toolbar="custom">
${recetaInstance?.procedimiento}
  </ckeditor:editor>
</td>
</tr>
<tr>
  <td class="td-left" align="left"><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'temperatura', 'error')} ">
      <label for="temperatura">
        <g:message code="receta.temperatura.label" default="Temperatura" />

      </label>
      <g:textField name="temperatura" class="input-size-small" maxlength="40" value="${recetaInstance?.temperatura}"/> <g:message code="receta.tiempo.label" default="°C" />
    </div></td>
  <td><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'tiempo', 'error')} ">
      <label for="tiempo">
        <g:message code="receta.tiempo.label" default="Tiempo" />

      </label>
      <g:textField name="tiempo" class="input-size-small" maxlength="40" value="${recetaInstance?.tiempo}"/>
      <g:message code="receta.horas" default="horas" /></div></td>

</tr>
<tr>
  <td align="left"><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'porcion', 'error')}  ">
      <label for="porcion">
        <g:message code="receta.porcion.label" default="Porcion" />

      </label>
      <g:textField name="porcion" class="input-size-medium" maxlength="40" value="${recetaInstance?.porcion}"/>
    </div>

  </td>
  <td ><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'textura', 'error')}   ">
      <label for="textura">
        <g:message code="receta.textura.label" default="Textura" />

      </label>
      <g:textField name="textura" class="input-size-medium" maxlength="40" value="${recetaInstance?.textura}"/>
    </div></td>
</tr>
<tr>
  <td class="td-left" align="left"><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'forma', 'error')}  ">
      <label for="forma">
        <g:message code="receta.forma.label" default="Forma" />

      </label>
      <g:textField name="forma" class="input-size-medium" maxlength="40" value="${recetaInstance?.forma}"/>
    </div>
  </td>
  <td>
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'color', 'error')}  ">
      <label for="color">
        <g:message code="receta.color.label" default="Color" />

      </label>
      <g:textField name="color" class="input-size-medium" maxlength="40" value="${recetaInstance?.color}"/>
    </div></td>
</tr>
<tr>
  <td class="td-left" align="left"><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'sabor', 'error')}  ">
      <label for="sabor">
        <g:message code="receta.sabor.label" default="Sabor" />

      </label>
      <g:textField name="sabor" class="input-size-medium" maxlength="40" value="${recetaInstance?.sabor}"/>
    </div>

  </td>
  <td><div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'calorias', 'error')}  ">
      <label for="calorias">
        <g:message code="receta.calorias.label" default="Calorias" />

      </label>
      <g:textField name="calorias" class="input-size-small" maxlength="40" value="${recetaInstance?.calorias}"/>
    </div></td>
</tr>
<tr>
  <td class="td-left" align="left">
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'proteinas', 'error')}  ">
      <label for="proteinas">
        <g:message code="receta.proteinas.label" default="Proteinas" />

      </label>
      <g:textField name="proteinas" class="input-size-small" maxlength="40" value="${recetaInstance?.proteinas}"/>
    </div></td>
  <td>
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'grasa', 'error')}  ">
      <label for="grasa">
        <g:message code="receta.grasa.label" default="Grasa" />

      </label>
      <g:textField name="grasa" class="input-size-small" maxlength="40" value="${recetaInstance?.grasa}"/>
    </div>
  </td>
</tr>
<tr>
  <td class="td-left" align="left">
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'carbohidratos', 'error')}  ">
      <label for="carbohidratos">
        <g:message code="receta.carbohidratos.label" default="Carbohidratos" />

      </label>
      <g:textField name="carbohidratos" class="input-size-small" maxlength="40" value="${recetaInstance?.carbohidratos}"/>
    </div>
  </td>
  <td>
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'colesterol', 'error')}   ">
      <label for="colesterol">
        <g:message code="receta.colesterol.label" default="Colesterol" />

      </label>
      <g:textField name="colesterol" class="input-size-small" maxlength="40" value="${recetaInstance?.colesterol}"/>
    </div>
  </td>
</tr>
<tr>
  <td class="td-left" align="left">
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'sodio', 'error')}  ">
      <label for="sodio">
        <g:message code="receta.sodio.label" default="Sodio" />

      </label>
      <g:textField name="sodio" class="input-size-small" maxlength="40" value="${recetaInstance?.sodio}"/>
    </div>
  </td>
  <td>
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'fibra', 'error')}  ">
      <label for="fibra">
        <g:message code="receta.fibra.label" default="Fibra" />

      </label>
      <g:textField name="fibra" class="input-size-small" maxlength="40" value="${recetaInstance?.fibra}"/>
    </div>
  </td>
</tr>
<tr>
  <td class="td-left" align="left">
    <div class="fieldcontain ${hasErrors(bean: recetaInstance, field: 'tipoPlato', 'error')}  ">
      <label for="tipoPlato">
        <g:message code="receta.tipoPlato.label" default="Tipo Plato" />

      </label>
      <g:select name="tipoPlato" from="${recetaInstance.constraints.tipoPlato.inList}" value="${recetaInstance?.tipoPlato}" valueMessagePrefix="receta.tipoPlato" noSelection="['': '']"/>
    </div>
  </td>

</tr>

</table>


<r:script>
  
/*Ext.onReady(function() {

var editorGridIngredientes = Ext.get('editorGridIngredientes');
  var myReader = new Ext.data.ArrayReader({}, [
          {name: 'company'},
          {name: 'price', type: 'float'},
          {name: 'change', type: 'float'},
          {name: 'pctChange', type: 'float'},
          {name: 'lastChange', type: 'date', dateFormat: 'n/j h:ia'}
  ]);
  
    var myData = [
          ['Apple',29.89,0.24,0.81,'9/1 12:00am'],
          ['Ext',83.81,0.28,0.34,'9/12 12:00am'],
          ['Google',71.72,0.02,0.03,'10/1 12:00am'],
          ['Microsoft',52.55,0.01,0.02,'7/4 12:00am'],
          ['Yahoo!',29.01,0.42,1.47,'5/22 12:00am']
    ];
  
  var grid = new Ext.grid.GridPanel({
    store: new Ext.data.Store({
      data: myData,
      reader: myReader}),
      renderTo    : Ext.getBody(), 
    columns: [
      {
        header: 'Compañia', 
        width: 120, 
        sortable: true, 
        dataIndex: 
        'company'
      },
      {
        header: 'Precio', 
        width: 90, 
        sortable: true, 
        dataIndex: 'price'
      },
      {
        header: 'Cambio', 
        width: 90, 
        sortable: true, 
        dataIndex: 'change'
      },
      {
        header: '% Cambio', 
        width: 90, 
        sortable: true, 
        dataIndex: 'pctChange'
      },
      {
        header: 'Último cambio', 
        width: 120, 
        sortable: true,
        renderer: Ext.util.Format.dateRenderer('m/d/Y'),dataIndex: 'lastChange'
      }
    ],
    viewConfig: {
    forceFit: true
      },
    renderTo: Ext.Element.get('editorGridIngredientes'),
    title: 'Titulo de la tabla',
    width: 500,
    frame: true
});





});  
  
  
  */
  
  
  
  
  
  
  
  
  function prueba(s){
  $.post("${createLink(action:'actualizarIngMin', controller:'Ingrediente')}",{ingId:s,ingCantidad:$("#"+s).val(),id:${recetaInstance.id}},
  function(data){
  if(data=="error.guardado"||data=="error.datos"||data=="error.seguridad"){
  $("#a"+s).after( " Error en la operación.");
  }else{
  $("#"+s).val( data);
  $("#a"+s).after( " Éxito al actualizar.");
  }
  }
  );  
  }
function pruebaB(s){
  $.post("${createLink(action:'delete', controller:'Ingrediente')}",{id:s},
  function(data){
  if(data=="error.guardado"||data=="error.datos"||data=="error.seguridad"){
  $("#a"+s).after( " Error en la operación.");
  }else{
  $("#"+s).val();
  $("#a"+s).after( " Éxito al borrar.");
  }
  }
  );  
  }
  $(document).ready(function(){

  $("input#ingNombre").autocomplete({
       		   source: '${createLink(action:'buscaMateriaPrima', controller:'MateriaPrima')}'
     		   });


  $( "#dialog-form-ing" ).dialog( "close" );	
  $( "#dialog:ui-dialog" ).dialog( "destroy" );

		var ingNombre = $( "#ingNombre" ),
			ingCantidad = $( "#ingCantidad" ),
  ingPresentacion = $( "#ingPresentacion" ),
  ingEtapa = $( "#ingEtapa" ),
  ingUnidadMedida = $( "#ingUnidadMedida option:selected").val(),
			allFields = $( [] ).add( ingNombre ).add(ingCantidad).add(ingPresentacion).add(ingEtapa).add(ingUnidadMedida),
			tips = $( ".validateTips2" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}


  function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}

		$( "#dialog-form-ing" ).dialog({
                  autoOpen: false,
                  height: 500,
                  width: 650,
                  modal: true,
                  buttons: {
                    "Agregar Ingrediente": function() {
                      var bValid = true;
                      allFields.removeClass( "ui-state-error" );
                      bValid = bValid && checkRegexp( $("#ingCantidad"), /^([0-9])+(\.([0-9])*)?$/, "<g:message code="receta.ing.receta.error.numero" default="Debe ser un numero sin espacios"/>" );
                      bValid = bValid && checkRegexp( $("#ingNombre"), /^(.)+$/, "<g:message code="receta.ing.receta.error.vacio" default="No debe de ser vacio"/>" );
                      if(${recetaInstance.id}==null){
                        bValid = false;
                      }
                      if ( bValid ) {
                        $( "#ingCantidad" ).text( ingCantidad.val());
                        $( "#ingNombre" ).text(ingNombre.val() );
                        $( "#ingPresentacion" ).text(ingPresentacion.val() );
                        $( "#ingEtapa" ).text(ingEtapa.val() ); 
                        $.post("${createLink(action:'agregarMin', controller:'Ingrediente')}",
                          {ingCantidad:$("#ingCantidad").text(),ingNombre:$("#ingNombre").text(),id:${recetaInstance.id},
                          ingEtapa:$( "#ingEtapa" ).text(),ingUnidadMedida: $( "#ingUnidadMedida option:selected" ).val(),ingPresentacion:$( "#ingPresentacion" ).text()},
                            function(response){
                              if(response=="error.guardado"||response=="error.datos"||response=="error.seguridad"){
                                alert("error")
                              }else{
                                $("#despues").append(response);
                                $( "#dialog-form-ing" ).dialog( "close" );
                              }
                           });
                         }
                      },
                      Cancelar: function() {
                        $( "#dialog-form-ing" ).dialog( "close" );
                      }
                    },
                    close: function() {
                      allFields.val( "" ).removeClass( "ui-state-error" );
                    }
		});

		$( "#crear-ing" )	
			.click(function() {
$( "#dialog-form-ing" ).dialog( "open" );
});
});
</r:script>
