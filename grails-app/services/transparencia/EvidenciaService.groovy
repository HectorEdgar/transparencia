package transparencia

import grails.gorm.services.Service

@Service(Evidencia)
interface EvidenciaService {

    Evidencia get(Serializable id)

    List<Evidencia> list(Map args)

    Long count()

    void delete(Serializable id)

    Evidencia save(Evidencia evidencia)

}