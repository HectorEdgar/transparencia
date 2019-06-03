package transparencia

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ConceptoServiceSpec extends Specification {

    ConceptoService conceptoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Concepto(...).save(flush: true, failOnError: true)
        //new Concepto(...).save(flush: true, failOnError: true)
        //Concepto concepto = new Concepto(...).save(flush: true, failOnError: true)
        //new Concepto(...).save(flush: true, failOnError: true)
        //new Concepto(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //concepto.id
    }

    void "test get"() {
        setupData()

        expect:
        conceptoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Concepto> conceptoList = conceptoService.list(max: 2, offset: 2)

        then:
        conceptoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        conceptoService.count() == 5
    }

    void "test delete"() {
        Long conceptoId = setupData()

        expect:
        conceptoService.count() == 5

        when:
        conceptoService.delete(conceptoId)
        sessionFactory.currentSession.flush()

        then:
        conceptoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Concepto concepto = new Concepto()
        conceptoService.save(concepto)

        then:
        concepto.id != null
    }
}
