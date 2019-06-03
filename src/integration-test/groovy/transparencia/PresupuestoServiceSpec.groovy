package transparencia

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PresupuestoServiceSpec extends Specification {

    PresupuestoService presupuestoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Presupuesto(...).save(flush: true, failOnError: true)
        //new Presupuesto(...).save(flush: true, failOnError: true)
        //Presupuesto presupuesto = new Presupuesto(...).save(flush: true, failOnError: true)
        //new Presupuesto(...).save(flush: true, failOnError: true)
        //new Presupuesto(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //presupuesto.id
    }

    void "test get"() {
        setupData()

        expect:
        presupuestoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Presupuesto> presupuestoList = presupuestoService.list(max: 2, offset: 2)

        then:
        presupuestoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        presupuestoService.count() == 5
    }

    void "test delete"() {
        Long presupuestoId = setupData()

        expect:
        presupuestoService.count() == 5

        when:
        presupuestoService.delete(presupuestoId)
        sessionFactory.currentSession.flush()

        then:
        presupuestoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Presupuesto presupuesto = new Presupuesto()
        presupuestoService.save(presupuesto)

        then:
        presupuesto.id != null
    }
}
