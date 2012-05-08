package org.conversor

class Ingrediente {
	BigDecimal cantidad
	String unidadMedida
	String presentacion
	String etapa
	static belongsTo=[receta:Receta,materia:MateriaPrima]	

    static constraints = {
	cantidad scale:2, precision:8, blank:false
	unidadMedida inList:['kg','gr','l','ml','pza']
	presentacion maxSize:40
	etapa maxSize:40, default:'General'
    }
    
    String toString(){
        return cantidad + " " + unidadMedida + " " + materia.nombre +" " +presentacion + " " + etapa
        
    }
}
