package transparencia

import grails.gorm.services.Service

@Service(Entidad)
interface EntidadService {

    Entidad get(Serializable id)

    List<Entidad> list(Map args)

    Long count()

    void delete(Serializable id)

    Entidad save(Entidad entidad)

}