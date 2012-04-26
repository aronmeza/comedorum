package org.conversor

import org.springframework.dao.DataIntegrityViolationException
import org.conversor.Receta
import grails.converters.*
import org.codehaus.groovy.grails.web.json.*;
import grails.converters.deep.JSON

class IngredienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ingredienteInstanceList: Ingrediente.list(params), ingredienteInstanceTotal: Ingrediente.count()]
    }

    def create() {
        [ingredienteInstance: new Ingrediente(params)]
    }

    def save() {
        def ingredienteInstance = new Ingrediente(params)
        if (!ingredienteInstance.save(flush: true)) {
            render(view: "create", model: [ingredienteInstance: ingredienteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])
        redirect(action: "show", id: ingredienteInstance.id)
    }

    def show() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        [ingredienteInstance: ingredienteInstance]
    }

    def edit() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        [ingredienteInstance: ingredienteInstance ]
    }

    def update() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ingredienteInstance.version > version) {
                ingredienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ingrediente.label', default: 'Ingrediente')] as Object[],
                          "Another user has updated this Ingrediente while you were editing")
                render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
                return
            }
        }

        ingredienteInstance.properties = params

        if (!ingredienteInstance.save(flush: true)) {
            render(view: "edit", model: [ingredienteInstance: ingredienteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), ingredienteInstance.id])
        redirect(action: "show", id: ingredienteInstance.id)
    }

    def delete() {
        def ingredienteInstance = Ingrediente.get(params.id)
        if (!ingredienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ingredienteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ingrediente.label', default: 'Ingrediente'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    def agregarMin(){
        println "-------------------"+params
        MateriaPrima materiaPrima= MateriaPrima.findByNombre(params.ingNombre);
        if(materiaPrima == null ){
            materiaPrima = new MateriaPrima(
            unidadMedida: params.ingUnidadMedida,
            nombre:params.ingNombre
            ).save(flush:true)
        }
        Receta receta = Receta.findById(params.id)
        Ingrediente ingInstance= new Ingrediente(
            cantidad:new BigDecimal(params.ingCantidad),
            unidadMedida:params.ingUnidadMedida,
            presentacion:params.ingPresentacion,
            etapa:params.ingEtapa,
            receta:receta ,
            materia:materiaPrima	
        ).save(flush:true)
        
        render "<li>$materiaPrima.nombre <input id=\"$ingInstance.id\" value=\"$ingInstance.cantidad\" class=\"input-size-medium\"/> $ingInstance.unidadMedida <a href=\"#\" id=\"a$ingInstance.id\"  onclick=\"javascript:prueba($ingInstance.id)\">Actualizar</a> <a href=\"#\" id=\"a$ingInstance.id\"  onclick=\"javascript:pruebaB($ingInstance.id)\">Borrar</a><li>"
        
        
    }
	
	def getByReceta(){
		println "---------------------"+params
		def ingredientes = Ingrediente.executeQuery("from Ingrediente where receta.id="+params.id)

        def lista = []
        for(ingredienteV in ingredientes) {
            lista << [ ingrediente:[nombre:ingredienteV.materia.nombre, 
			etapa:ingredienteV.etapa,
			cantidad:ingredienteV.cantidad,
			id:ingredienteV.id,
			unidadMedida:ingredienteV.unidadMedida]]
        }
        render lista as JSON
        
	}
	
	def actualizarIngMin(){
		println "========== $params ========"
		
		def ingrediente = Ingrediente.get(params.ingId)
		ingrediente.cantidad = new BigDecimal(params.ingCantidad)
		if(!ingrediente.save(flush:true)){
			render "error"
			return
		}
		render params.ingCantidad
		return
	}
}
