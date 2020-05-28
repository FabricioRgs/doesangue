package doesangue

import grails.converters.JSON

class AgendamentoController {

    def delete() {
      super.delete()
    }

    def index() {
      JSON.use('deep')
      render Agendamento.getAll() as grails.converters.JSON
    }
    
    static scaffold = Agendamento
}
