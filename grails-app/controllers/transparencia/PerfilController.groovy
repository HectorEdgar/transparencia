package transparencia

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ENTIDAD", "ROLE_ADMIN"])
class PerfilController {

    def springSecurityService

    def index() {
        [usuario: springSecurityService.currentUser]
    }

    def editar(Usuario usuario) {
        if (!request.post) {
            return [usuario: springSecurityService.currentUser]
        }

        if (usuario.hasErrors()) {
            return [usuario: usuario]
        }

        usuario.save(flush: true)

        redirect(view: "index")
    }
}
