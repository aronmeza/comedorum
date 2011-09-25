package org.conversor

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils        

class RecetaController {
	
    def recetaService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [recetaInstanceList: Receta.list(params), recetaInstanceTotal: Receta.count()]
    }
	@Secured(['ROLE_COCINERO'])
    def create() {
        [recetaInstance: new Receta(params)]
    }
	@Secured(['ROLE_COCINERO'])
    def save() {
        def recetaInstance = new Receta(params)
        if (!recetaInstance.save(flush: true)) {
            render(view: "create", model: [recetaInstance: recetaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'receta.label', default: 'Receta'), recetaInstance.id])
        redirect(action: "show", id: recetaInstance.id)
    }

    def show() {
        def recetaInstance = Receta.get(params.id)
        if (!recetaInstance) {
		if(params.nombre != null){
		def id = Receta.findByNombre(params.nombre).id
		if(id!=null){
		def receta = recetaService.convertirReceta(params.nombre, new BigDecimal(params.rendimiento),id)
		render(view:"show", model: [recetaInstance:receta])
		return
		}else{
		       flash.message = message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.nombre])
                    redirect(action: "list")
                return

		}
		}else{
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])
	            redirect(action: "list")
            	return
		}
        }

        [recetaInstance: recetaInstance]
    }
	
	@Secured(['ROLE_COCINERO'])
    def edit() {
        def recetaInstance = Receta.get(params.id)
        if (!recetaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])
            redirect(action: "list")
            return
        }

        [recetaInstance: recetaInstance]
    }
	@Secured(['ROLE_COCINERO'])
    def update() {
        def recetaInstance = Receta.get(params.id)
        if (!recetaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (recetaInstance.version > version) {
                recetaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'receta.label', default: 'Receta')] as Object[],
                          "Another user has updated this Receta while you were editing")
                render(view: "edit", model: [recetaInstance: recetaInstance])
                return
            }
        }

        recetaInstance.properties = params

        if (!recetaInstance.save(flush: true)) {
            render(view: "edit", model: [recetaInstance: recetaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'receta.label', default: 'Receta'), recetaInstance.id])
        redirect(action: "show", id: recetaInstance.id)
    }
	@Secured(['ROLE_COCINERO'])
    def delete() {
        def recetaInstance = Receta.get(params.id)
        if (!recetaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])
            redirect(action: "list")
            return
        }

        try {
            recetaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
