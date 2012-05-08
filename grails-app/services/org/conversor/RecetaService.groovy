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
       Map<Long,Ingrediente> suma=new HashMap<Integer, BigDecimal>()
       for(Ingrediente ing:ingrs){
           ing=transformaUnidadMedida(ing,true)
           suma.put(ing.materia.id,ing)
       }
       def receta=convertirReceta (null, rendimiento, idReceta)
       for(Ingrediente ingres:receta.ingredientes){
           ingres=transformaUnidadMedida(ingres,true)
           if(suma.containsKey(ingres.materia.id)){
               ingres.cantidad=suma.getAt(ingres.materia.id).cantidad.add(ingres.cantidad)
               suma.put(ingres.materia.id,ingres)
           }else{
               suma.put(ingres.materia.id,ingres)
           }
       }
       
        List<Ingrediente> nueva=new ArrayList<Ingrediente>()
        def llaves=suma.keySet()
        def itera=llaves.iterator()
        while(itera.hasNext()){
            Long id=itera.next() 
            Ingrediente ingreFinal=suma.getAt(id)
            ingreFinal=transformaUnidadMedida(ingreFinal,false)
            nueva.add(ingreFinal)
        }
        
        return nueva        

    }
    Ingrediente transformaUnidadMedida(Ingrediente ingrediente, Boolean flag){
        if(flag){
          if(ingrediente.unidadMedida.equals('kg')||ingrediente.unidadMedida.equals('l')){
            ingrediente.cantidad=ingrediente.cantidad.multiply(new BigDecimal("1000"))
            if(ingrediente.unidadMedida.equals('kg')){
                ingrediente.unidadMedida='gr'
            }else{
                ingrediente.unidadMedida='ml'
            }
          }            
        }else{
            if (ingrediente.unidadMedida.equals('gr') || ingrediente.unidadMedida.equals('ml')){
                if(ingrediente.cantidad/1000>=1){
                    ingrediente.cantidad = ingrediente.cantidad/1000
                    if(ingrediente.unidadMedida == 'gr'){
                        ingrediente.unidadMedida = 'kg'
                    }else{
                        ingrediente.unidadMedida = 'l'
                    }
                }
            }            
        }
        return ingrediente
   }
}
