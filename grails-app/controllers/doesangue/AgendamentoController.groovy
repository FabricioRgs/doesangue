package doesangue

import grails.converters.JSON

class AgendamentoController {

    static scaffold = Agendamento

    def delete() {
      super.delete()
    }

    def index() {
      JSON.use('deep')
      
      if (params.id > 0) {
        render Agendamento.get(params.id) as grails.converters.JSON
      }
      else {
        render Agendamento.getAll() as grails.converters.JSON
      }
    }
    
    
}
