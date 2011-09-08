package org.conversor



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(MateriaPrimaController)
@Mock(MateriaPrima)
class MateriaPrimaControllerTests {

    void testIndex() {
        controller.index()
        assert "/materiaPrima/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materiaPrimaInstanceList.size() == 0
        assert model.materiaPrimaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.materiaPrimaInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.materiaPrimaInstance != null
        assert view == '/materiaPrima/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/materiaPrima/show/1'
        assert controller.flash.message != null
        assert MateriaPrima.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'


        def materiaPrima = new MateriaPrima()

        // TODO: populate domain properties

        assert materiaPrima.save() != null

        params.id = materiaPrima.id

        def model = controller.show()

        assert model.materiaPrimaInstance == materiaPrima
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'


        def materiaPrima = new MateriaPrima()

        // TODO: populate valid domain properties

        assert materiaPrima.save() != null

        params.id = materiaPrima.id

        def model = controller.edit()

        assert model.materiaPrimaInstance == materiaPrima
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'

        response.reset()


        def materiaPrima = new MateriaPrima()

        // TODO: populate valid domain properties

        assert materiaPrima.save() != null

        // test invalid parameters in update
        params.id = materiaPrima.id

        controller.update()

        assert view == "/materiaPrima/edit"
        assert model.materiaPrimaInstance != null

        materiaPrima.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/materiaPrima/show/$materiaPrima.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/materiaPrima/list'

        response.reset()

        def materiaPrima = new MateriaPrima()

        // TODO: populate valid domain properties
        assert materiaPrima.save() != null
        assert MateriaPrima.count() == 1

        params.id = materiaPrima.id

        controller.delete()

        assert MateriaPrima.count() == 0
        assert MateriaPrima.get(materiaPrima.id) == null
        assert response.redirectedUrl == '/materiaPrima/list'
    }
}
