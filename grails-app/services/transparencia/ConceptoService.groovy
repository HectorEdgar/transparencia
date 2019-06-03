package transparencia

import grails.gorm.services.Service

@Service(Concepto)
interface ConceptoService {

    Concepto get(Serializable id)

    List<Concepto> list(Map args)

    Long count()

    void delete(Serializable id)

    Concepto save(Concepto concepto)

}