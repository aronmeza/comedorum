	
Ext.onReady(function() {
	
	function procesar(btn, forma){

        if(btn == 'Grabar'){
        	var formaReceta = Ext.getCmp('formaReceta').getForm();
             if(!formaReceta.isValid()){                               
              Ext.Msg.alert("Error","Por favor capture los datos requeridos.");   
             }else{               
				
						
                 Ext.Ajax.request({
                        url:'/comedorum/receta/update',
                        params:{
       	         			id : formaReceta.findField('iid').getValue(),
               	        		nombre : formaReceta.findField('inombre').getValue(),
					rendimiento : formaReceta.findField('irendimiento').getValue(),
					procedimiento : formaReceta.findField('iprocedimiento').getValue(),
					temperatura : formaReceta.findField('itemperatura').getValue(),
					porcion : formaReceta.findField('iporcion').getValue(),
					textura : formaReceta.findField('itextura').getValue(),
					forma : formaReceta.findField('iforma').getValue(),
					color : formaReceta.findField('icolor').getValue(),
					sabor : formaReceta.findField('isabor').getValue(),
					calorias : formaReceta.findField('icalorias').getValue(),
					proteinas : formaReceta.findField('iproteinas').getValue(),
					grasa : formaReceta.findField('igrasa').getValue(),
					carbohidratos : formaReceta.findField('icarbohidratos').getValue(),
					colesterol : formaReceta.findField('icolesterol').getValue(),
					sodio : formaReceta.findField('isodio').getValue(),
					fibra : formaReceta.findField('ifibra').getValue(),
					tipoPlato : formaReceta.findField('itipoPlato').getValue()
              			},
			method:'GET',
                        success: function(result, request){
                            var obj = Ext.decode(result.responseText);
                            if(obj.success){
				Ext.Msg.alert('Guadado', 'La receta ha sido actualizado exitosamente.');
				window.location= '/comedorum/receta/show/'+formaReceta.findField('iid').getValue();
			    }else{
                                Ext.Msg.alert('error','Ha ocurrido un error al intentar grabar el aval\u00FAo.');   
                                Ext.getCmp("formaAvaluo").el.unmask();
                            }
                        },
                        failure: function(){
                            Ext.Msg.alert("alert","Ha ocurrido un error al intentar grabar el aval\u00FAo.");
                            Ext.getCmp("formaAvaluo").el.unmask();
                        },
                        before: function(){
                            Ext.getCmp("formaAvaluo").el.mask('Creando aval\u00FAo...', 'x-mask-Loading');
                        },
                        after: function(){
                            Ext.getCmp("formaAvaluo").el.unmask();
                        },
                        exception: function(){
                            Ext.getCmp("formaAvaluo").el.unmask();
                        }
                        });
             }
        }else if(btn == 'Cancelar'){           
             this.close();             
        }
    }
	
	var url= location.href.split('/');
	var length= url.length
    var idRecetaVar=url[length-1]
	
				 Ext.Ajax.request({
					url: '/comedorum/receta/getrecetaajax',
					params:{id:idRecetaVar},
					method:'GET',
					success: function ( result, request ) {
						var jsonData = Ext.util.JSON.decode(result.responseText);
						var fillForma =Ext.getCmp('formaReceta').getForm();
						
						fillForma.findField('iid').setValue(jsonData.id);
						fillForma.findField('inombre').setValue(jsonData.nombre);
						fillForma.findField('irendimiento').setValue(jsonData.rendimiento);
						fillForma.findField('iprocedimiento').setValue(jsonData.procedimiento);
						fillForma.findField('itemperatura').setValue(jsonData.temperatura);
						fillForma.findField('iporcion').setValue(jsonData.porcion);
						fillForma.findField('itextura').setValue(jsonData.textura);
						fillForma.findField('iforma').setValue(jsonData.forma);
						fillForma.findField('icolor').setValue(jsonData.color);
						fillForma.findField('isabor').setValue(jsonData.sabor);
						fillForma.findField('icalorias').setValue(jsonData.calorias);
						fillForma.findField('iproteinas').setValue(jsonData.proteinas);
						fillForma.findField('igrasa').setValue(jsonData.grasa);
						fillForma.findField('icarbohidratos').setValue(jsonData.carbohidratos);
						fillForma.findField('icolesterol').setValue(jsonData.colesterol);
						fillForma.findField('isodio').setValue(jsonData.sodio);
						fillForma.findField('ifibra').setValue(jsonData.fibra);
						fillForma.findField('itipoPlato').setValue(jsonData.tipoPlato);
						
						
						
						
						}								
				});
				var storeRecetaIngredientes= Ext.extend(Ext.data.JsonStore, {

											constructor: function(cfg) {

												Ext.apply(this, cfg || {});

												storeRecetaIngredientes.superclass.constructor.call(this, Ext.apply({

													storeId: 'storeRecetaIngredientes',

													proxy: new Ext.data.HttpProxy({url:'/comedorum/ingrediente/getByReceta?id='+idRecetaVar, method:'GET', timeout: 240000 }),

													fields: [
														{
														name: 'ingrediente', mapping: 'ingrediente.nombre'
														},
														{
														name: 'etapa', mapping: 'ingrediente.etapa'
														},
														{
														name: 'cantidad', mapping: 'ingrediente.cantidad'
														},
														{
														name: 'unidadMedida', mapping: 'ingrediente.unidadMedida'
														},
														{
														name: 'id', mapping: 'ingrediente.id'
														}

													]

												}, cfg));

											}

										});
			this.storeRecetaIngredientes =new storeRecetaIngredientes({ autoLoad:true});
							

        var textField = new Ext.form.TextField(); 

		var form= new Ext.FormPanel({
	border:true,
        id:'formaReceta',
        renderTo: Ext.Element.get('frame'),
        autoHeight:true,
        autoWidth:true,
		layout:'form',
		items:[
					{
							xtype:'textfield',
							name:'id',
							id:'iid',
							hidden:true
							
					},  
					{
							xtype:'textfield',
							fieldLabel:'Nombre',
							name:'nombre',
							id:"inombre"
					},
					{
							xtype:'numberfield',
							fieldLabel:'Rendimiento', 
							name:'rendimiento', 
							id:"irendimiento"
					},				
	                {
	                        xtype:'editorgrid',
	                        store: this.storeRecetaIngredientes,
	                        id:'iingredientes',
							height:300,
							autoScroll: true,
							border: false,
							stripeRows: true,
	                        columns: [
	                            {
	                                xtype: 'gridcolumn',
	                                hidden:true,
	                                dataIndex: 'id'
	                            },
	                            {
	                                xtype: 'gridcolumn',
	                                header: 'Ingrediente', 
	                                width: 120, 
	                                sortable: true, 
	                                dataIndex:'ingrediente',
									editor:textField
	                            },
	                            {
	                                
	                                header: 'Etapa', 
	                                width: 90, 
	                                sortable: true, 
	                                dataIndex: 'etapa',
									editor:new Ext.form.TextField()
	                            },
	                            {
	                                xtype: 'gridcolumn',
	                                header: 'Cantidad', 
	                                width: 90, 
	                                dataIndex: 'cantidad',
									editor:new Ext.form.NumberField()
	                            },
	                            {
	                                xtype: 'gridcolumn',
	                                header: 'Unidad de Medida', 
	                                width: 120, 
	                                dataIndex: 'unidadMedida',
									editor:new Ext.form.ComboBox({
														store: new Ext.data.ArrayStore({
															valueField:'id',
															displayField:'text',
															fields:
																[
																	'id',   
																	'text' 
																],
															data:
																[
																	['kg','kg'],
																	['gr','gr'],
																	['l','l'],
																	['ml','ml'],
																	['pza','pza']
																]
														})
														
														
													})
	                            }
	                            
	                        ],
	                        tbar: {
	                            xtype: 'toolbar',
								buttonAlign : 'left', 
								height:40,
	                            items: [
	                                    {
	                                        xtype: 'button',
	                                        text: 'Nuevo'
	                                    },
	                                    {
	                                        xtype: 'tbseparator',
											width: 50
	                                    },
	                                    {
	                                        xtype: 'button',
	                                        text: 'Eliminar'
	                                    }
	                                ]
	                            }
	                        },
				{
					fieldLabel: 'Description',  
					name: 'description',  
					value: 'bwah bwah',  
					anchor: '100%',  
					xtype: "htmleditor",  
					height: 400,  
					plugins: Ext.ux.form.HtmlEditor.plugins()  
				},
				{
	                                xtype:'textfield',
	                                fieldLabel:'Procedimiento',
	                                name:'procedimiento',
	                                id:'iprocedimiento'
	                        },{
	                                xtype:'textfield',
	                                fieldLabel:'Temperatura',
	                                name:'temperatura',
	                                id:'itemperatura'
	                        },{
	                                xtype:'textfield',
	                                fieldLabel:'Porcion',
	                                name:'porcion',
	                                id:'iporcion'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Textura',
	                                name:'textura',
	                                id:'itextura'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Forma',
	                                name:'forma',
	                                id:'iforma'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Color',
	                                name:'color',
	                                id:'icolor'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Sabor',
	                                name:'sabor',
	                                id:'isabor'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Calorias',
	                                name:'calorias',
	                                id:'icalorias'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Proteinas',
	                                name:'proteinas',
	                                id:'iproteinas'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Grasa',
	                                name:'grasa',
	                                id:'igrasa'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Carbohidratos',
	                                name:'carbohidratos',
	                                id:'icarbohidratos'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Colesterol',
	                                name:'colesterol',
	                                id:'icolesterol'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Sodio',
	                                name:'sodio',
	                                id:'isodio'
	                        },
	                        {
	                                xtype:'textfield',
	                                fieldLabel:'Fibra',
	                                name:'fibra',
	                                id:'ifibra'
	                        },
							{
									xtype:'label',
									text:'Tipo de Plato:'
							},
	                         {
	                                xtype:'combo',
	                                id: 'itipoPlato',
	                                name:'tipoPlato',
	                                typeAhead: true,
	                                triggerAction: 'all',
	                                lazyRender:true,
	                                mode: 'local',
	                                valueField: 'id',
	                                displayField: 'value',
	                                store: new Ext.data.ArrayStore({
	                                id:0,
	                                fields: [
	                                        'id',
	                                        'value'
	                                ],
	                                 data: [
	                                        ['Ensalada', 'Ensalada'], 
	                                        ['Sopa', 'Sopa'],
	                                        ['Acompañaniemto', 'Acompañaniemto'],
	                                        ['Salsa', 'Salsa'],
	                                        ['Plato Fuerte', 'Plato Fuerte'],
	                                        ['Frijol', 'Frijol'],
	                                        ['Almidon', 'Almidon'],
	                                        ['Bebida', 'Bebida'],
	                                        ['Postre', 'Postre'],
	                                        ['Aderezo', 'Aderezo'],
	                                        ['Tipo plato 1', 'Tipo plato 1'],
	                                        ['Tipo plato 2', 'Tipo plato 2'],
	                                        ['Tipo plato 3', 'Tipo plato 3']
	                                 ]
	                        })
	                        }
			],
			buttonAlign:'left',
			buttons : [
		                             {
		                                 iconCls: 'save',
		                                 text: 'Actualizar',                                
		                                 handler:procesar.createDelegate(this,['Grabar', form])
		                             },
		                             {
		                                 iconCls: 'cancel',
		                                 text: 'Cancelar',
		                                 handler:procesar.createDelegate(this,['Cancelar', form])
		                             }               
		             ]
});
		 
	 
    });
