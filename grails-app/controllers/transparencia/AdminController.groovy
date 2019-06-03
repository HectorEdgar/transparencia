package transparencia
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN'])
class AdminController {

	def index() { 
	//Mostrar a todos los Usuarios de Rol Admin
		[administradores: Usuario.list()]
	}

	def create(){

	}

	@Transactional
    def save() {
        println params

        String nombreUsuario=params.user
        def usuarioExiste = Usuario.findByUsername(nombreUsuario)
        if(usuarioExiste!=null){
            println "usuario:" + usuarioExiste
            params.user =(int) (Math.random() * 1000000) + 1;
        }

          def usuario =new Usuario(username:params.user,password:params.contra).save(flush:true)
          params.usuario = usuario
          def rol = Rol.findByAuthority("ROLE_ADMIN")
          UsuarioRol.create usuario,rol
          UsuarioRol.withSession {
            it.flush()
            it.clear()
          }

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Administrador Registrado!"
        flash.message = "El Administrador ha sido registrado correctamente"
        redirect(action: "index")
    }


    @Transactional
    def editar(Usuario usuario) {
        println params
        if (usuario == null) {
            notFound()
            return
        }
        if (!request.post) {
            return [usuario: usuario]
        }
        if (usuario.hasErrors()) {
            return [usuario: usuario]
        }
        
        //obtener el usuario anterior
        String nombreUsuario=params.user2
        def usuarioAnterior = Usuario.findByUsername(nombreUsuario)
        println usuarioAnterior.properties
        
        usuarioAnterior.username =params.user
        usuarioAnterior.password =params.contra
        usuarioAnterior.save();
        usuario.save(flush: true)
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Administrador actualizado"
        flash.message = "Se ha actualizado el Administrador correctamente"
        redirect(action: "index")
    }


    @Transactional
    def eliminar(Usuario usuario){
        println params
        if (usuario == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        def usuarioRol = UsuarioRol.findByUsuario(usuario);
        usuarioRol.delete(flush:true);
        usuario.delete flush:true
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Administrador borrado"
        flash.message = "Se ha borrado el Administrador correctamente"
        redirect(controller:"admin", action: "index")
       
    }


}
