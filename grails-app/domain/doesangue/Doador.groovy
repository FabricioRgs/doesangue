package doesangue

class Doador {
    String nome
    String cpf
    String email
    String endereco

    static hasMany = [agendamentos: Agendamento]

    static constraints = {
        nome nullable:true
        cpf nullable:true
        email email:true
    }
}
