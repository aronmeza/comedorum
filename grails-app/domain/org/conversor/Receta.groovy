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
        procedimiento maxSize:10000
        rendimiento blank:false, matches:"[0-9]+"
        temperatura maxSize:40
        tiempo maxSize:40
        porcion maxSize:40
        textura maxSize:40
        forma maxSize:40
        color maxSize:40
        sabor maxSize:40
        calorias maxSize:40
        proteinas maxSize:40
        grasa maxSize:40
        carbohidratos maxSize:40
        colesterol maxSize:40
        sodio maxSize:40
        fibra maxSize:40
	tipoPlato inList:['Ensalada','Sopa','Acompañaniemto','Salsa','Plato Fuerte','Frijol','Almidon','Bebida','Postre','Aderezo']
	}
}
