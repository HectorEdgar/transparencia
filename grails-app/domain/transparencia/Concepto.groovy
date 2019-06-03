package transparencia
import java.text.DecimalFormat

class Concepto {

    String descripcion
    Double monto
    Date fecha

    Double latitud
    Double longitud

    static belongsTo = [padre: Concepto, presupuesto: Presupuesto]
    static hasMany = [hijos: Concepto, evidencias: Evidencia]

    Double getTotal() {
        if (!this.hijos) {
            return this.monto ?: 0
        } else {
            def total = 0.0
            for (c in this.hijos) {
                total += c.getTotal()
            }
            return total
        }
    }

    static constraints = {
        monto nullable: true
        fecha nullable: true
        padre nullable: true
        presupuesto nullable: true
        latitud nullable: true
        longitud nullable: true
    }

    Double obtenerLatitud() {
        DecimalFormat twoDForm = new DecimalFormat("#.#######");
        return Double.valueOf(twoDForm.format(this.latitud));
    }

    Double obtenerLongitud() {
        DecimalFormat twoDForm = new DecimalFormat("#.#######");
        return Double.valueOf(twoDForm.format(this.longitud));
    }

    Boolean isHoja() {
        return hijos.size() == 0
    }

}
