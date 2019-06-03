package transparencia

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class EntidadServiceSpec extends Specification {

    EntidadService entidadService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Entidad(...).save(flush: true, failOnError: true)
        //new Entidad(...).save(flush: true, failOnError: true)
        //Entidad entidad = new Entidad(...).save(flush: true, failOnError: true)
        //new Entidad(...).save(flush: true, failOnError: true)
        //new Entidad(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //entidad.id
    }

    void "test get"() {
        setupData()

        expect:
        entidadService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Entidad> entidadList = entidadService.list(max: 2, offset: 2)

        then:
        entidadList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        entidadService.count() == 5
    }

    void "test delete"() {
        Long entidadId = setupData()

        expect:
        entidadService.count() == 5

        when:
        entidadService.delete(entidadId)
        sessionFactory.currentSession.flush()

        then:
        entidadService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Entidad entidad = new Entidad()
        entidadService.save(entidad)

        then:
        entidad.id != null
    }
}
