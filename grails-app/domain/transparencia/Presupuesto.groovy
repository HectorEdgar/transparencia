package transparencia

class Presupuesto {

    Integer anio
    Double monto
    Integer likes
    Integer dislikes

    static belongsTo = [entidad: Entidad]
    static hasMany = [conceptos: Concepto]

    static constraints = {
        anio matches:'[0-9]{4}'
        monto validator: { val, obj ->
            def total = 0
            def conceptos = obj.conceptos
            conceptos.each {
                total += it.getTotal()
            }
            val >= total ? true : ['presupuesto.invalidMonto']
        }
    }

    private List obtenerHojas(conjunto) {
        def hojas = []

        for (i in conjunto) {
            if (i.hijos.size() > 0) {
                hojas.addAll(obtenerHojas(i.hijos))
            } else {
                hojas.add(i)
            }
        }

        return hojas
    }

    List obtenerHojasTotales() {
        return obtenerHojas(this.conceptos)
    }
}
