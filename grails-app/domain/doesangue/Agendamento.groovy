package doesangue

class Agendamento {
    Date dataAgendamento
    Doador doador
    String status

    static belongsTo = [doador: Doador]

    static constraints = {
    }
}
