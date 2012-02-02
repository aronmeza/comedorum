<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><g:message code="default.comedor"/></title>
		<!--r:required module="jquery-ui"/>
                  <style>
	.ui-button { margin-left: -1px; }
	.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
	.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
	</style-->
        <meta name="layout" content="ext"/>
	</head>
	<body>
	
	<!--div id="body" role="main">
	<h1><g:message code="default.welcome"/></h1>
	
	<g:form method="POST" controller="receta" action="show">
		<fieldset class="form">                                                                        
        	        <g:render template="/receta/formConvert"/>
        	</fieldset>     
        	        <g:actionSubmit class="button green" action="show"  value="{message(code: 'default.button.convertir', default:'Convertir')}" />
	</g:form>     
    
    <!--meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</div-->
       

          <script type="text/javascript">
   

Ext.onReady(function(){
    var action = Ext.create('Ext.Action', {
        text: 'Action 1',
        iconCls: 'icon-add',
        handler: function(){
            Ext.example.msg('Click', 'You clicked on "Action 1".');
        }
    });
    
     var panel = Ext.create('Ext.panel.Panel', {
        title: 'Actions',
        renderTo: document.body,
        width: 600,
        height: 300,
        bodyPadding: 10,
        dockedItems: {
            itemId: 'toolbar',
            xtype: 'toolbar',
            items: [
                action, // Add the action directly to a toolbar
                {
                    text: 'Action menu',
                    menu: [action] // Add the action directly to a menu
                }
            ]
        },
        items: Ext.create('Ext.button.Button', action)       // Add the action as a button
    });
    
    /*
     * Add toolbar items dynamically after creation
     */
    var toolbar = panel.child('#toolbar');
    toolbar.add('->', {
        text: 'Disable',
        handler: function(){
            action.setDisabled(!action.isDisabled());
            this.setText(action.isDisabled() ? 'Enable' : 'Disable');
        }
    }
   /* , {
        text: 'Change Text',
        handler: function(){
            Ext.Msg.prompt('Enter Text', 'Enter new text for Action 1:', function(btn, text){
                if(btn == 'ok' && text){
                    action.setText(text);
                    action.setHandler(function(){
                        Ext.example.msg('Click','You clicked on "'+text+'".');
                    });
                }
            });
        }
    }, {
        text: 'Change Icon',
        handler: function(){
            action.setIconCls(action.getIconCls() == 'icon-add' ? 'icon-edit' : 'icon-add');
        }
    }*/
  );
});

  </script>
	</body>
        
        
      
	


        
</html>
