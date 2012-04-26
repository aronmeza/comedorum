package org.conversor

class Receta {
	String nombre
	String procedimiento
	static hasMany=[ingredientes:Ingrediente]
	BigDecimal rendimiento
//detalles generales
	String tipoPlato
        String temperatura
        String tiempo
        String porcion
        String textura
        String forma
        String color
        String sabor
//detalles de valor nutrimental por porcion
        String calorias
        String proteinas
        String grasa
        String carbohidratos
        String colesterol
        String sodio
        String fibra
    
    static constraints = {
  	nombre unique:true, blank:false, maxSize:70
        procedimiento maxSize:10000, nullable:true
        rendimiento blank:false, matches:"[0-9]+"
        temperatura maxSize:40, nullable:true
        tiempo maxSize:40, nullable:true
        porcion maxSize:40, nullable:true
        textura maxSize:40, nullable:true
        forma maxSize:40, nullable:true
        color maxSize:40, nullable:true
        sabor maxSize:40, nullable:true
        calorias maxSize:40, nullable:true
        proteinas maxSize:40, nullable:true
        grasa maxSize:40, nullable:true
        carbohidratos maxSize:40, nullable:true
        colesterol maxSize:40, nullable:true
        sodio maxSize:40, nullable:true
        fibra maxSize:40, nullable:true
	tipoPlato nullable:true ,inList:['Ensalada','Sopa','Acompañaniemto','Salsa','Plato Fuerte','Frijol','Almidon','Bebida','Postre','Aderezo','Tipo plato 1','Tipo plato 2','Tipo plato 3']
	}
}
