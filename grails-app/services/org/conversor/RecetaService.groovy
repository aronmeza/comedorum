package org.conversor
import org.springframework.transaction.annotation.Transactional


class RecetaService {

  static scope = "prototype" 
  
	
	@Transactional(readOnly = true)
       Receta convertirReceta (String nombre, BigDecimal rendimiento, def id){
println '----------------------------1'
	 def recetaOriginal = Receta.read(id)
		if (recetaOriginal != null){
println '--------------------------------2'
			for(Ingrediente ing : recetaOriginal.ingredientes){
println '------'+ing.cantidad+'---------'+rendimiento.divide(recetaOriginal.rendimiento)+'-----------------------3'
				ing.cantidad = ing.cantidad.multiply(rendimiento.divide(recetaOriginal.rendimiento)) 
println '--------------'+ing.cantidad+'----------'
				if (ing.unidadMedida.equals('gr') || ing.unidadMedida.equals('ml')){
println '------------------------------4'
					if(ing.cantidad/1000>=1){
println '------------------------------5'
						ing.cantidad = ing.cantidad/1000
						if(ing.unidadMedida == 'gr'){
println '-----------------------------6'
							ing.unidadMedida = 'kg'
						}else{
							ing.unidadMedidad = 'l'
						}
					}
				}
				
					
			}
		}
	recetaOriginal.rendimiento = rendimiento
	return recetaOriginal
	}

}
