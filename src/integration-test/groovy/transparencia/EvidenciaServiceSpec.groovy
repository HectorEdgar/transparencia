package transparencia

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class EvidenciaServiceSpec extends Specification {

    EvidenciaService evidenciaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Evidencia(...).save(flush: true, failOnError: true)
        //new Evidencia(...).save(flush: true, failOnError: true)
        //Evidencia evidencia = new Evidencia(...).save(flush: true, failOnError: true)
        //new Evidencia(...).save(flush: true, failOnError: true)
        //new Evidencia(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //evidencia.id
    }

    void "test get"() {
        setupData()

        expect:
        evidenciaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Evidencia> evidenciaList = evidenciaService.list(max: 2, offset: 2)

        then:
        evidenciaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        evidenciaService.count() == 5
    }

    void "test delete"() {
        Long evidenciaId = setupData()

        expect:
        evidenciaService.count() == 5

        when:
        evidenciaService.delete(evidenciaId)
        sessionFactory.currentSession.flush()

        then:
        evidenciaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Evidencia evidencia = new Evidencia()
        evidenciaService.save(evidencia)

        then:
        evidencia.id != null
    }
}
