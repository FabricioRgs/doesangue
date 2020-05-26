package doesangue

class DoadorController {

    def delete() {
      super.delete()
    }

    def index() {
      render Doador.getAll() as grails.converters.JSON
    }

    static scaffold = Doador

}
