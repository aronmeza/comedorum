class BootStrap {

    def init = { servletContext ->
	log.info("Inicializando Aplicacion")
	log.info("Validando roles")
	def rolAdmin = general.Rol.findByAuthority('ROLE_ADMIN')
	if(general.Rol.count()!=2){
		if(!rolAdmin){
		rolAdmin = new general.Rol(authority:'ROLE_ADMIN').save(flush:true)
		}

		def rolCocinero = general.Rol.findByAuthority('ROLE_COCINERO')
		if(!rolCocinero){
		rolCocinero = new general.Rol(authority:'ROLE_COCINERO').save(flush:true)
		}
	}
	
	log.info "validando usuarios"
	def admin = general.UsuarioRol.findByRol(rolAdmin)
	if(!admin){
		admin=new general.Usuario(
		username:'admin',
		password:'admin',
		
		)
		admin.save(flush:true)
		general.UsuarioRol.create(admin,rolAdmin,true)
	}
	log.info "Aplicacion Inicializada"
    }
    def destroy = {
    }
}
