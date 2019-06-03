package transparencia

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class EntidadController {

    EntidadService entidadService
    def springSecurityService


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond entidadService.list(params), model:[entidadCount: entidadService.count()]
    }

    @Secured("permitAll")
    def registrar(Usuario usuario) {
        if (!request.post) {
            return [usuario: new Usuario()]
        }

        if (usuario.hasErrors()) {
            return [usuario: usuario]
        }

        usuario.entidad.save(flush: true)
        usuario.save(flush: true)


        def rolEntidad = Rol.findByAuthority("ROLE_ENTIDAD")
        UsuarioRol.create usuario, rolEntidad

        UsuarioRol.withSession {
            it.flush()
            it.clear()
        }

        redirect(uri: "/")
    }

    def show(Long id) {
        respond entidadService.get(id)
    }

    def create() {
        respond new Entidad(params)
    }

    def save(Entidad entidad) {
        if (entidad == null) {
            notFound()
            return
        }

        try {
            entidadService.save(entidad)
        } catch (ValidationException e) {
            respond entidad.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidad.id])
                redirect entidad
            }
            '*' { respond entidad, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond entidadService.get(id)
    }

    def update(Entidad entidad) {
        if (entidad == null) {
            notFound()
            return
        }

        try {
            entidadService.save(entidad)
        } catch (ValidationException e) {
            respond entidad.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidad.id])
                redirect entidad
            }
            '*'{ respond entidad, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        entidadService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'entidad.label', default: 'Entidad'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured("permitAll")
    def read(Entidad entidad) {
        def presupuestos = entidad.presupuestos
        def map = []
        presupuestos.each {
            def hojas = it.obtenerHojasTotales()
            def total = 0
            hojas.each {
                println it.monto
                total += it.monto ?: 0
                println total
            }
            def mapData = [presupuestoData:it, hojas:hojas, totalMonto:total]
            map.add(mapData)
        }

        [entidad:entidad, presupuestos:map]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidad.label', default: 'Entidad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
