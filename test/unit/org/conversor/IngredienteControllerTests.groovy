package org.conversor



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(IngredienteController)
@Mock(Ingrediente)
class IngredienteControllerTests {

    void testIndex() {
        controller.index()
        assert "/ingrediente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ingredienteInstanceList.size() == 0
        assert model.ingredienteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ingredienteInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.ingredienteInstance != null
        assert view == '/ingrediente/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/ingrediente/show/1'
        assert controller.flash.message != null
        assert Ingrediente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'


        def ingrediente = new Ingrediente()

        // TODO: populate domain properties

        assert ingrediente.save() != null

        params.id = ingrediente.id

        def model = controller.show()

        assert model.ingredienteInstance == ingrediente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'


        def ingrediente = new Ingrediente()

        // TODO: populate valid domain properties

        assert ingrediente.save() != null

        params.id = ingrediente.id

        def model = controller.edit()

        assert model.ingredienteInstance == ingrediente
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'

        response.reset()


        def ingrediente = new Ingrediente()

        // TODO: populate valid domain properties

        assert ingrediente.save() != null

        // test invalid parameters in update
        params.id = ingrediente.id

        controller.update()

        assert view == "/ingrediente/edit"
        assert model.ingredienteInstance != null

        ingrediente.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/ingrediente/show/$ingrediente.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ingrediente/list'

        response.reset()

        def ingrediente = new Ingrediente()

        // TODO: populate valid domain properties
        assert ingrediente.save() != null
        assert Ingrediente.count() == 1

        params.id = ingrediente.id

        controller.delete()

        assert Ingrediente.count() == 0
        assert Ingrediente.get(ingrediente.id) == null
        assert response.redirectedUrl == '/ingrediente/list'
    }
}
