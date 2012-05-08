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
        
    @Transactional(readOnly = true)    
    List<Ingrediente> sumaIngredientes(List<Ingrediente> ingrs, Long idReceta, BigDecimal rendimiento){
        println "=================> $ingrs"
        Map<Long,Ingrediente> suma=new HashMap<Integer, BigDecimal>()
        for(Ingrediente ing:ingrs){
        	if(ing.unidadMedida.equals('kg')||ing.unidadMedida.equals('l')){
                ing.cantidad=ing.cantidad.multiply(new BigDecimal("1000"))
                if(ing.unidadMedida.equals('kg')){
                    ing.unidadMedida='gr'
                }else{
                    ing.unidadMedida='ml'
                }
            }
            suma.put(ing.id,ing)
        }
        println "==SUMA===============> $suma"
        def receta=convertirReceta (null, rendimiento, idReceta)
        for(Ingrediente ingres:receta.ingredientes){
            if(ingres.unidadMedida.equals('kg')||ingres.unidadMedida.equals('l')){
                ingres.cantidad=ingres.cantidad.multiply(new BigDecimal("1000"))
                if(ingres.unidadMedida.equals('kg')){
                    ingres.unidadMedida='gr'
                }else{
                    ingres.unidadMedida='ml'
                }
                
                if(suma.containsKey(ingres.id)){
                println "											"
                println suma.getAt(ingres.id).cantidad.add(ingres.cantidad)
                println suma.getAt(ingres.id).cantidad
                println ingres.cantidad
                    ingres.cantidad=suma.getAt(ingres.id).cantidad.add(ingres.cantidad)
                    suma.put(ingres.id,ingres)
                }else{
                    suma.put(ingres.id,ingres)
                }
            }
            
        }
        List<Ingrediente> nueva=new ArrayList<Ingrediente>()
        def llaves=suma.keySet()
        def itera=llaves.iterator()
        while(itera.hasNext()){
            Long id=itera.next()
            Ingrediente ingreFinal=suma.getAt(id)
            if (ingreFinal.unidadMedida.equals('gr') || ing.unidadMedida.equals('ml')){
                    if(ingreFinal.cantidad/1000>=1){
                            ingreFinal.cantidad = ingreFinal.cantidad/1000
                            if(ingreFinal.unidadMedida == 'gr'){
                                    ingreFinal.unidadMedida = 'kg'
                            }else{
                                    ingreFinal.unidadMedidad = 'l'
                            }
                    }
            }
            nueva.add(ingreFinal)
        }
        println "																	"
        println ingrs
        return nueva
    }
}
