package org.conversor



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(RecetaController)
@Mock(Receta)
class RecetaControllerTests {

    void testIndex() {
        controller.index()
        assert "/receta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.recetaInstanceList.size() == 0
        assert model.recetaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.recetaInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.recetaInstance != null
        assert view == '/receta/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/receta/show/1'
        assert controller.flash.message != null
        assert Receta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'


        def receta = new Receta()

        // TODO: populate domain properties

        assert receta.save() != null

        params.id = receta.id

        def model = controller.show()

        assert model.recetaInstance == receta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'


        def receta = new Receta()

        // TODO: populate valid domain properties

        assert receta.save() != null

        params.id = receta.id

        def model = controller.edit()

        assert model.recetaInstance == receta
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'

        response.reset()


        def receta = new Receta()

        // TODO: populate valid domain properties

        assert receta.save() != null

        // test invalid parameters in update
        params.id = receta.id

        controller.update()

        assert view == "/receta/edit"
        assert model.recetaInstance != null

        receta.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/receta/show/$receta.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/receta/list'

        response.reset()

        def receta = new Receta()

        // TODO: populate valid domain properties
        assert receta.save() != null
        assert Receta.count() == 1

        params.id = receta.id

        controller.delete()

        assert Receta.count() == 0
        assert Receta.get(receta.id) == null
        assert response.redirectedUrl == '/receta/list'
    }
}
