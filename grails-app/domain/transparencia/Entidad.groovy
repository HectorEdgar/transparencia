package transparencia

class Entidad {

    String nombre
    String encargado
    String tipo
    String descripcion
    String ambito
    String estado
    String correo
    Date dateCreated

    boolean isActivo

    Double latitud
    Double longitud

    static hasMany = [usuarios: Usuario, presupuestos: Presupuesto]

    static constraints = {
        nombre size: 4..100
        tipo inList: ['Entidad pública', 'Institución', 'Dependencia', 'Organización', 'Persona física']
        encargado nullable: true
        correo email: true
        descripcion nullable: true
        latitud nullable: true //temp
        longitud nullable: true //temp
    }

    List obtenerHojasTotales() {
        def hojas = []
        for (i in presupuestos) {
            hojas.addAll(i.obtenerHojasTotales())
        }
    }
}
