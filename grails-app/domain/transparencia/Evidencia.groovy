package transparencia

class Evidencia {

    String src
    String extension
    String nombre
    String descripcion

    static belongsTo = [concepto: Concepto]

    static constraints = {
    	src nullable: true
    	extension nullable: true
    	concepto nullable:true
    }
}
