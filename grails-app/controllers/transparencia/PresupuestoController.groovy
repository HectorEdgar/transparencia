package transparencia
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.*

@Secured('ROLE_ENTIDAD')
class PresupuestoController {

    def springSecurityService

    def index() {
        def entidad = springSecurityService.currentUser.entidad

        if(!params.max) {
            params.max = 10
        }

        def presupuestos = Presupuesto.where {
            entidad.id == entidad.id
        }.list(params)

        def todosLosPresupuestos = Presupuesto.findAllByEntidad(entidad)
        [presupuestos:presupuestos, presupuestoCount:todosLosPresupuestos.size()]
    }

    @Secured("permitAll")
    def verGrafica(Presupuesto presupuesto) {
        [presupuesto: presupuesto]
    }

    def create(Presupuesto presupuesto) {
        if(request.method == 'POST') {
            def entidad = springSecurityService.currentUser.entidad
            presupuesto.entidad = entidad
            presupuesto.likes = 0
            presupuesto.dislikes = 0
            if(params.monto && Double.parseDouble(params.monto) && Double.parseDouble(params.monto) > 0) {
                def presupuestos = Presupuesto.findAllByEntidadAndAnio(entidad, params.anio ?: null)
                if(!presupuestos.contains())
                if(presupuesto.save(flush:true)) {
                    redirect action:'index'
                }
            }
        }
        [presupuesto:presupuesto]
    }

    def update(Presupuesto presupuesto) {
      if(request.method == 'POST') {
          presupuesto.properties = params
          if(presupuesto.save(flush:true)) {
              redirect action:'index', params:[offset:params.offset]
          }
      }
      [presupuesto:presupuesto, offset:params.offset]
    }

    def delete(Presupuesto presupuesto) {
        presupuesto.delete(flush:true)
        redirect action:'index', params:[offset:params.offset]
    }

    def like() {
        def presupuesto = Presupuesto.get(params.idPresupuesto)
        if(presupuesto) {
            presupuesto.likes += 1
            presupuesto.save(flush:true)
            def map = [likes:presupuesto.likes]
            response.status = 200
            render map as JSON
        } else {
            response.status = 204
        }
    }

    def dislike() {
        def presupuesto = Presupuesto.get(params.idPresupuesto)
        if(presupuesto) {
            presupuesto.dislikes += 1
            presupuesto.save(flush:true)
            def map = [likes:presupuesto.dislikes]
            response.status = 200
            render map as JSON
        } else {
            response.status = 204
        }
    }
}
