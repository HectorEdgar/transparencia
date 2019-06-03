package transparencia
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ENTIDAD')
class EncargadoController {

    def springSecurityService

    def index() {
        def entidad = springSecurityService.currentUser.entidad

        if(!params.max) {
            params.max = 10
        }

        def encargados = Usuario.where {
            entidad.id == entidad.id
        }.list(params)

        def todosLosEncargados = Usuario.findAllByEntidad(entidad)
        [encargados:encargados, encargadosCount:todosLosEncargados.size()]
    }

    def create(Usuario user) {
        if(request.method == 'POST') {
            def encargado = springSecurityService.currentUser
            user.entidad = encargado.entidad
            if(user.save(flush:true)) {
                def rol = Rol.findByAuthority('ROLE_ENTIDAD')
                UsuarioRol.create user, rol
                UsuarioRol.withSession {
                    it.flush()
                    it.clear()
                }
                redirect action:'index', params:[offset:params.offset]
            }
        }
        [user:user]
    }

    def update(Usuario user) {
        if(request.method == 'POST') {
            user.properties = params
            if(user.save(flush:true)) {
                redirect action:'index', params:[offset:params.offset]
            }
        }
        [user:user, offset:params.offset]
    }

    def delete(Usuario usuario) {
        def userRole = UsuarioRol.findByUsuario(usuario)
        userRole.delete(flush:true)
        usuario.delete(flush:true)
        redirect action:'index', params:[offset:params.offset]
    }
}
