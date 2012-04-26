package org.conversor
import org.springframework.transaction.annotation.Transactional


class RecetaService {

  static scope = "prototype" 
  
	
	@Transactional(readOnly = true)
       Receta convertirReceta (String nombre, BigDecimal rendimiento, def id){
	 def recetaOriginal = Receta.read(id)
		if (recetaOriginal != null){
			for(Ingrediente ing : recetaOriginal.ingredientes){
				ing.cantidad = ing.cantidad.multiply(rendimiento.divide(recetaOriginal.rendimiento)) 
				if (ing.unidadMedida.equals('gr') || ing.unidadMedida.equals('ml')){
					if(ing.cantidad/1000>=1){
						ing.cantidad = ing.cantidad/1000
						if(ing.unidadMedida == 'gr'){
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
