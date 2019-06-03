package transparencia

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Rol(authority: "ROLE_ADMIN")
                .save(failOnError: true)
        def entidadRole = new Rol(authority: "ROLE_ENTIDAD")
                .save(failOnError: true)

        def entidadObj = new Entidad(
            nombre: "Entidad de prueba",
            encargado: "Lino Alejandro",
            tipo: "Entidad pública",
            ambito: "Social",
            estado: "Oaxaca",
            correo: "correo@correo.com",
            isActivo: true,
            latitud: 0.0,
            longitud: 0.0
        ).save()

        def admin = new Usuario(
            username: "admin",
            password: "admin"
        ).save(failOnError: true)

        def entidad = new Usuario(
            username: "entidad",
            password: "entidad",
            entidad: entidadObj
        ).save(failOnError: true)

        def presupuesto = new Presupuesto(
            anio: 2018,
            monto: 50000,
            likes: 10,
            dislikes: 5,
            entidad: entidadObj
        ).save()

        def presupuesto2 = new Presupuesto(
            anio: 2017,
            monto: 30000,
            likes: 5,
            dislikes: 50,
            entidad: entidadObj
        ).save()


        def presupuesto3 = new Presupuesto(
            anio: 2017,
            monto: 300000,
            likes: 50,
            dislikes: 5,
            entidad: entidadObj
        ).save()

        def presupuesto4 = new Presupuesto(
            anio: 2016,
            monto: 1200000,
            likes: 12,
            dislikes: 12,
            entidad: entidadObj
        ).save()

        def presupuesto5 = new Presupuesto(
            anio: 2017,
            monto: 120000,
            likes: 1,
            dislikes: 12,
            entidad: entidadObj
        ).save()

        def presupuesto7 = new Presupuesto(
            anio: 2015,
            monto: 12000,
            likes: 10,
            dislikes: 1,
            entidad: entidadObj
        ).save()


        def concepto1 = new Concepto(
            descripcion: "Programa de entidades",
            monto: 150,
            fecha: new Date(),
            latitud: 0,
            longitud: 0
        ).save()


        def concepto2 = new Concepto(
            descripcion: "Donacion de comida",
            monto: 2000,
            fecha: new Date(),
            latitud: 0,
            longitud: 0
        ).save()

        def concepto3 = new Concepto(
            descripcion: "Donacion de agua",
            monto: 35,
            fecha: new Date(),
            latitud: 0,
            longitud: 0
        ).save()

        def concepto4 = new Concepto(
            descripcion: "Panes dulces",
            monto: 790,
            fecha: new Date(),
            latitud: 0,
            longitud: 0
        ).save()


        def concepto5 = new Concepto(
            descripcion: "Distribucion",
            monto: 280,
            fecha: new Date(),
            latitud: 0,
            longitud: 0
        ).save()

        def concepto6 = new Concepto(
            descripcion: "Utilerias varias",
            monto: 1040,
            fecha: new Date(),
            latitud: 0,
            longitud: 0
        ).save()

        UsuarioRol.create admin, adminRole
        UsuarioRol.create entidad, entidadRole

        presupuesto.addToConceptos(concepto1)

        presupuesto.save()

        concepto1.addToHijos(concepto2)
        concepto1.addToHijos(concepto3)
        concepto1.addToHijos(concepto4)

        concepto1.save()

        concepto4.addToHijos(concepto5)
        concepto4.addToHijos(concepto6)

        concepto4.save()

        println(entidad)
        println(entidadObj)
        println(admin)
        println(presupuesto)
        println(presupuesto.conceptos)

        println(concepto1)
        println(concepto2)
        println(concepto3)
        println(concepto4)
        println(concepto5)
        println(concepto6)

        println(concepto1.hijos)

        UsuarioRol.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
}
