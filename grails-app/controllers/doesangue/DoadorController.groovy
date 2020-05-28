package doesangue

class DoadorController {

    static scaffold = Doador

    def delete() {
      super.delete()
    }

    def index() {
      if (params.id > 0) {
        render Doador.get(params.id) as grails.converters.JSON
      }
      else {
        render Doador.getAll() as grails.converters.JSON
      }
    }

}
