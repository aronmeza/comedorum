<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'button.css')}" type="text/css">
    <!--script type="text/javascript" src="${resource(dir:'js', file: 'ext-base.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js', file: 'ext-all.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js', file: 'formReceta.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Divider.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.FindAndReplace.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Font.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Heading.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.HR.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Image.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.IndentOutdent.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Link.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.MidasCommand.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Plugins.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.RemoveFormat.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.SpecialCharacters.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.SubSuperScript.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Table.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.UndoRedo.js')}"></script>
 <script type="text/javascript" src="${resource(dir:'js', file: 'Ext.ux.form.HtmlEditor.Word.js')}"></script-->
  <g:layoutHead/>
  <r:layoutResources/>	
  
  <style>

    label.dialog, input.dialog { display:block; }
    input.text.dialog { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset.dialog { padding:0; border:0; margin-top:25px; }
    h1.dialog { font-size: 1.2em; margin: .6em 0; }
    .ui-dialog .ui-state-error { padding: .3em; }
  </style>
</head>
<body>
  <div id="grailsLogo" role="banner"><a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'logoSaum.png')}" alt="SAUM"/></a></div>


  <div id="usuario" >
    <sec:ifLoggedIn>
      <g:message code="default.welcome"/> <sec:loggedInUserInfo field="username" /><br/>
      <g:link class="perfil" controller="logout" style="color:white;font-weight:normal;"><g:message code="default.logout" /></g:link>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn> 

      <g:link class="perfil" controller="login" style="color:white;font-weight:normal;"><g:message code="default.login"/></g:link>
    </sec:ifNotLoggedIn> 
  </div>

<g:render template="/common/header"/>	
<g:if test="${flash.message}">
  <div class="message" role="status">${flash.message}</div>
</g:if>
<g:layoutBody/>
<div class="footer" role="contentinfo">
  <g:render template="/common/footer"/>
</div>

<div id="dialog-form-receta" title="Agrear Receta">
  <p class="validateTips"></p>

  <form id="formrecetasend" action="/comedorum/receta/save"  method="POST" >
    <fieldset class="dialog">
      <label for="nombre" class="dialog"><g:message code="receta.nombre.label" default="Nombre"/></label>
      <input type="text" name="nombre" id="nombreform" class="text ui-widget-content ui-corner-all dialog" />
      <label for="rendimiento" class="dialog"><g:message code="receta.rendimiento.label" default="Rendimiento"/></label>
      <input type="text" name="rendimiento" id="rendimientoform" value="" class="text ui-widget-content ui-corner-all dialog" />
    </fieldset>

  </form>
</div>



<r:script>
  $(document).ready(function(){


  $( "#dialog-form-receta" ).dialog( "close" );	
  $( "#dialog:ui-dialog" ).dialog( "destroy" );

		var nombre = $( "#nombreform" ),
			rendimiento = $( "#rendimientoform" ),
			allFields = $( [] ).add( nombre ).add(rendimiento),
			tips = $( ".validateTips" );

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

		$( "#dialog-form-receta" ).dialog({
			autoOpen: false,
			height: 400,
			width: 650,
			modal: true,
			buttons: {
				"Agregar Receta": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );
					bValid = bValid && checkRegexp( $("#rendimientoform"), /^([0-9])+$/, "<g:message code="receta.rendimiento.error.numero"/>" );

					if ( bValid ) {
						$( "#rendimientoform" ).text( rendimiento.val());
						$( "#nombreform" ).text(nombre.val() ); 
						$( "#dialog-form-receta" ).dialog( "close" );
						window.location="/comedorum/receta/saveMin?nombre="+$( "#nombreform" ).text()+"&rendimiento="+$( "#rendimientoform" ).text()

					}
				},
				Cancelar: function() {
					$( "#dialog-form-receta" ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

		$( "#crear-receta" )	
			.click(function() {
$( "#dialog-form-receta" ).dialog( "open" );
});
});
</r:script>

<r:layoutResources/>		
<g:javascript library="application"/>

</body>
</html>
