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
        Map<Integer,BigDecimal> suma=new HashMap<Integer, BigDecimal>()
        for(Ingrediente ing:ingrs){
            suma.put(ing.id,ing.cantidad)
        }
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
                    ingres.cantidad=suma.get(ingres.id).add(ingres.cantidad)
                    suma.put(ingres.id,ingres.cantidad)
                }else{
                    suma.put(ingres.id,ingres.cantidad)
                }
            }
            
        }
        ingrs=null
        ingrs=new ArrayList<Ingrediente>()
        def llaves=suma.keySet()
        def itera=llaves.iterator()
        while(itera.hasNext()){
            Integer id=itera.next()
            println "$id"
            Ingrediente ingreFinal=new Ingrediente()
            Ingrediente tmp=Ingrediente.get(id)
            ingreFinal.cantidad=suma.get(id)
            ingreFinal.materia=tmp.materia
            ingrs.add(ingreFinal)
        }
        println "																	"
        println ingrs
        return ingrs
    }
}
