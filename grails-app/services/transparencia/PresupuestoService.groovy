package transparencia

import grails.gorm.services.Service

@Service(Presupuesto)
interface PresupuestoService {

    Presupuesto get(Serializable id)

    List<Presupuesto> list(Map args)

    Long count()

    void delete(Serializable id)

    Presupuesto save(Presupuesto presupuesto)

}