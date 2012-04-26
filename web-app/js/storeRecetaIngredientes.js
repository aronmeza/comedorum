storeRecetaIngredientes= Ext.extend(Ext.data.JsonStore, {

    constructor: function(cfg) {

        Ext.apply(this, cfg || {});

        storeRecetaIngredientes.superclass.constructor.call(this, Ext.apply({

            storeId: 'storeRecetaIngredientes',

            proxy: new Ext.data.HttpProxy({url:'/comedorum/ingredientes/getByReceta', method:'GET', timeout: 240000 }),

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