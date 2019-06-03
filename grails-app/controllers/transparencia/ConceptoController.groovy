package transparencia

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.servlet.ModelAndView
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON

@Secured("ROLE_ENTIDAD")
@Transactional(readOnly = false)
class ConceptoController {
    def springSecurityService

    static allowedMethods = [
        index: "GET",
        seleccionarConceptos: "GET",
        guardar: "POST",
        modificar: ["GET", "POST"],
        eliminar: "GET"
    ]

    def index(Presupuesto presupuesto) {
        def usuario = springSecurityService.currentUser

        def presupuestos = Presupuesto.where {
            entidad.id == usuario.entidad.id
        }.list()

        [
            presupuesto: presupuesto
        ]
    }

    def seleccionarConceptos(Presupuesto presupuesto) {

    }

    def get(Concepto concepto) {
        render concepto as JSON
    }

    def guardar() {
        println("guardar ------------")

        def concepto = new Concepto(params)
        concepto.padre = Concepto.get(params.idPadre)
        if (!concepto.padre) {
            concepto.presupuesto = Presupuesto.get(params.idPresupuesto)
        }

        if (concepto.save(flush:true)) {
            response.status = 200
            render concepto as JSON
            return
        }

        println concepto.errors

        response.status = 204
    }

    def modificar(Concepto concepto) {
        if (request.method == "POST") {
            concepto.properties = params
            if (concepto.save(flush:true)) {
                println concepto
                println params
                redirect(action: "index", params: [id: params.presupuestoId])
                return
            }
        }

        [
            concepto: concepto,
            presupuestoId: params.presupuestoId
        ]
    }

    def eliminar(Concepto concepto) {
        if (concepto) {
            println(concepto.delete())

            redirect (action: "index", params: [id: params.presupuestoId])
            return
        }

        render(contentType: 'text/json') {
            error true
        }
    }
}
