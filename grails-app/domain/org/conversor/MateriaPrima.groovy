package org.conversor

class MateriaPrima {
	String unidadMedida
	String nombre
    static constraints = {
	nombre unique:true, maxSize:128, blank:false
	unidadMedida inList:['kg','gr','l','ml','pza'], blank:false
    }

    static namedQueries = {
	buscaPorNombre{ filtro ->
		filtro="${filtro.toUpperCase()}%"
		ilike 'nombre', filtro
		}
	}
}
