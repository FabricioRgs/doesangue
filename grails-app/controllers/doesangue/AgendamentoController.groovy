package doesangue

class AgendamentoController {

    def delete() {
      super.delete()
    }

    def index() {
      render Agendamento.getAll() as grails.converters.JSON
    }
    
    static scaffold = Agendamento
}
