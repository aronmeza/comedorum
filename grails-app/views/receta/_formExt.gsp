<%@ page import="org.conversor.Receta" %>



<r:script>
Ext.ns('com.quizzpot.tutorial');

Ext.BLANK_IMAGE_URL = '../ext-3.0/resources/images/default/s.gif';

com.quizzpot.tutorial.FormTutorial = {
	init: function(){	
	
//creamos una instancia del textfield
var name = new Ext.form.TextField({
	fieldLabel:'Name',
	name:'txt-name',
	emptyText:'Your name...',
	id:"id-name"
}); 

//creamos un grupo de checkboxs
var checkboxs = new Ext.form.CheckboxGroup({
	fieldLabel:'Interests',
	columns:2,//mostrar dos columnas de checkboxes						
	items:[
		{boxLabel: 'JavaScript', name: 'cb-js', checked: true}, //campo marcado desde el principio
		{boxLabel: 'HTML', name: 'cb-html'},
		{boxLabel: 'CSS', name: 'cb-css'},
		{boxLabel: 'Otros', name: 'cb-otros'}
	]
});

//creamos un grupo de opciones con radiobuttons
var radios = new Ext.form.RadioGroup({
	fieldLabel: 'Favorite Framework',		                
     columns: 2, //muestra los radiobuttons en dos columnas
     items: [
          {boxLabel: 'Ext Js', name: 'framework', inputValue: 'Ext js', checked: true},
          {boxLabel: 'Dojo', name: 'framework', inputValue: 'Dojo'},
          {boxLabel: 'Mootools', name: 'framework', inputValue: 'Mootools'},
          {boxLabel: 'jQuery', name: 'framework', inputValue: 'jQUery'},
          {boxLabel: 'prototype', name: 'framework', inputValue: 'prototype'},
          {boxLabel: 'YIU', name: 'framework', inputValue: 'yui'}
     ]
});

//creamos un formulario
this.form= new Ext.FormPanel({
	border:false,
	defaults:{xtype:'textfield'},	//componente por default del formulario
	items:[
		name, // le asignamos la instancia que creamos anteriormente
		{
			fieldLabel:'Email', // creamos un campo
			name:'txt-email', // a partir de una
			value:'default@quizzpot.com', //configuraciÃ³n
			id:"id-email"
		},{
			xtype: 'checkbox', //definimos el tipo de componente
			fieldLabel: 'Active',// le asignamos un label
			name: 'chk-active',//y un "name" para que lo recojamos en el servidor...
			id: 'id-active'// ...cuando el formulario sea enviado
		},
		checkboxs, //grupo de checkboxs
		radios, // grupo de radios
		{
		    	xtype:'hidden',//campo oculto (hidden)
		    	name:'h-type', //el nombre con que se envia al servidor
		    	value:'developer'//el valor que contendrÃ¡
		}
	]
});

var win = new Ext.Window({
	title: 'New Developer',
	width:300,
	height:300,
	bodyStyle:'background-color:#fff;padding: 10px',
	items:this.form,
	buttonAlign: 'right', //botones alineados a la derecha
	buttons:[{text:'Save'},{text:'Cancel'}] //botones del formulario
});

win.show();
	}	
}

Ext.onReady(com.quizzpot.tutorial.FormTutorial.init,com.quizzpot.tutorial.FormTutorial);

</r:script>