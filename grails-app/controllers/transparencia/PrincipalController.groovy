package transparencia
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import grails.converters.JSON

@Secured(['permitAll'])
class PrincipalController {

    def index() {

    }

    def dependencias(){
    	def entidades = Entidad.findAll();
    	def usuarios = Usuario.findAll();
    	[entidades:entidades]
    }

    def paginas(){

    }

    def getPuntajes() {
        def ambito = params.ambito
        def estado = params.estados
        def anio = params.anio

        //println ambito+"ambito"
        //println estado+"estado"
        //println anio+"anio"


        def query = Concepto.where {
            id > 0
        }

        if (ambito) {
            query.where {
                presupuesto.entidad.ambito == ambito
            }
        }

        if (estado) {
            query.where {
                presupuesto.entidad.estado == estado
            }
        }

        if (anio) {
            query.where {
                presupuesto.anio == anio
            }
        }

        def conceptos = query.list()

        render conceptos as JSON
    }

    def mapa(){
        def conceptos=params.conceptos
        println "conceptos=":conceptos

        def estados = Entidad.withCriteria{
            projections{
                groupProperty('estado')   
            }
        }

        def ambito = Entidad.withCriteria{
            projections{
                groupProperty('ambito')   
            }
        }

        def anio = Presupuesto.withCriteria{
            projections{
                groupProperty('anio')   
            }
        }


        println estados.size()
        println(estados)
        return [estados:estados,ambito:ambito,anio:anio,conceptos:conceptos]
    }
}
